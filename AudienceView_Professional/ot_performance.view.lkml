view: ot_performance {
  sql_table_name: trs_trs.performance ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  measure: count_performance_id {
    type: count_distinct
    sql: ${TABLE}.id ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: before_shutoff {
    type: string
    sql: ${TABLE}.before_shutoff ;;
  }

  dimension: bo_available {
    type: string
    sql: ${TABLE}.bo_available ;;
  }

  dimension: bo_display {
    type: string
    sql: ${TABLE}.bo_display ;;
  }

  dimension: bo_message {
    type: string
    sql: ${TABLE}.bo_message ;;
  }

  dimension: books_locked {
    type: number
    sql: ${TABLE}.books_locked ;;
  }

  dimension: deep_available {
    type: string
    sql: ${TABLE}.deep_available ;;
  }

  dimension: event_type_all_day {
    type: string
    sql: ${TABLE}.event_type_all_day ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension_group: perf_end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.perf_end ;;
  }

  dimension_group: perf_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.perf_start ;;
  }

  dimension_group: current_time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      quarter_of_year,
      week_of_year,
      year
    ]
    sql: CURRENT_TIMESTAMP() ;;
  }

  dimension: settled_status {
    type: string
    sql: case when ${current_time_week_of_year} > ${perf_start_week_of_year} then "Settled"
         else "Unsettled" End;;
  }

  dimension: perf_start_settlement {
    type: string
    sql: case when ${perf_start_week_of_year} = 10 then "March 2nd to March 8th"
         when ${perf_start_week_of_year} = 11 then "March 9th to March 15th"
         when ${perf_start_week_of_year} = 12 then "March 16th to March 22nd"
         when ${perf_start_week_of_year} = 13 then "March 23rd to March 29th"
         when ${perf_start_week_of_year} = 14 then "March 30th to April 5th"
         when ${perf_start_week_of_year} = 15 then "April 6th to April 12th"
         when ${perf_start_week_of_year} = 16 then "April 13th to April 19th"
         when ${perf_start_week_of_year} = 17 then "April 20th to April 26th"
         when ${perf_start_week_of_year} = 18 then "April 27th to May 3rd"
    else "Research" End;;
  }

  measure: count_perf_start_time {
    type: count_distinct
    sql: ${TABLE}.perf_start ;;
  }

  measure: min_perf_date {
    type: date
    sql: MIN(${perf_start_raw}) ;;
  }

  measure: max_perf_date {
    type: date
    sql: MAX(${perf_start_raw}) ;;
  }

  dimension: on_sale_time {
      type: yesno
      sql: ${perf_start_raw} >= ${ot_production.hidden_until_raw} ;;
      }

   dimension: sale_period_length {
    label: "Sale Period Length"
     type: number
    sql:date_diff(${perf_start_date},${ot_production.hidden_until_date}, day);;
    html:  {% if value >= 100 %}
    <b><p style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
    {% elsif value < 100 %}
    <b><p style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
    {% else %}
    <b><p style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
    {% endif %};;
   }

  dimension: days_since_onsale {
    label: "Days Since On-Sale"
    type: number
    sql:date_diff(current_date,${ot_production.hidden_until_date}, day);;
    html:  {% if value >= 100 %}
    <b><p style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
    {% elsif value < 100 %}
    <b><p style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
    {% else %}
    <b><p style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
    {% endif %};;
  }

  dimension: days_left_performance {
    label: "Days Left For Performance"
    type: number
    sql:date_diff(${perf_start_date}, current_date, day);;
    html:  {% if value >= 31 %}
          <b><p style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
          {% elsif value <= 30 %}
          <b><p style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
          {% elsif value >= 100 %}
          <b><p style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
          {% endif %};;
  }

  dimension: consumed_on_sale {
    label: "Consumed On-Sale"
    type: number
    value_format_name: percent_2
    sql:case when ${days_left_performance} > 0 and ${sale_period_length}> 0 then (${days_since_onsale}/${sale_period_length})*1
        Else 1 End;;
    html:  {% if value >= 0.100 %}
    <b><p style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p></b>
    {% elsif value < 0.100 %}
    <b><p style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p></b>
    {% else %}
    <b><p style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p></b>
    {% endif %};;
  }

  measure: consumed_on_sale_max {
    label: "Consumed On-Sale Max"
    type: max
    hidden: yes
    value_format_name: percent_2
    sql:case when ${days_left_performance} > 0 and ${sale_period_length}> 0 then (${days_since_onsale}/${sale_period_length})*1
      Else 1 End;;
  }

  measure: sales_guidance {
    label: "Sale guidance (linear) Compares Sold Cap with Consumed Time"
    type:  number
    value_format_name: percent_2
    sql:${ot_performance_stats_consumed.total_sold_capacity_percent}-${consumed_on_sale_max} ;;
    html:  {% if value >= 0.50 %}
    <b><p style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p></b>
    {% elsif value < 0.50 %}
    <b><p style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p></b>
    {% else %}
    <b><p style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p></b>
    {% endif %};;
  }



  dimension: phone_available {
    type: string
    sql: ${TABLE}.phone_available ;;
  }

  dimension: phone_display {
    type: string
    sql: ${TABLE}.phone_display ;;
  }

  dimension: phone_message {
    type: string
    sql: ${TABLE}.phone_message ;;
  }

  dimension: production_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.production_id ;;
  }

  dimension: shutoff_hour {
    type: number
    sql: ${TABLE}.shutoff_hour ;;
  }

  dimension: simple_price_map {
    type: number
    sql: ${TABLE}.simple_price_map ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subtitle {
    type: string
    sql: ${TABLE}.subtitle ;;
  }

  dimension: supertitle {
    type: string
    sql: ${TABLE}.supertitle ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: web_available {
    type: string
    sql: ${TABLE}.web_available ;;
  }

  dimension: web_display {
    type: string
    sql: ${TABLE}.web_display ;;
  }

  dimension: web_display_label {
    type: string
    sql: case when ${TABLE}.web_display ="T" then "Normal"
        when ${TABLE}.web_display ="S" then "Sold Out"
        when ${TABLE}.web_display ="C" then "Cancelled"
        when ${TABLE}.web_display ="I" then "Invisible"
        when ${TABLE}.web_display ="M" then "Custom Message"
        END ;;
  }

  dimension: web_message {
    type: string
    sql: ${TABLE}.web_message ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      production.production_id,
      production.logo_file_name,
      production.image_file_name,
      production.per_order_fee_name,
      production.venue_name,
      production.prod_name,
      order_detail.count
    ]
  }
}
