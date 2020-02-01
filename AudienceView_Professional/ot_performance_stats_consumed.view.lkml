view: ot_performance_stats_consumed {
  sql_table_name: trs_trs.performance_stats_consumed ;;


  dimension: performance_stats_consumed_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.performance_stats_consumed_id ;;
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
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  measure: total_sold_seats {
    type: sum_distinct
    sql: ${TABLE}.count ;;

    filters: {
        field: ticket_status
        value: "SOLD" }
    }

measure: total_sold_capacity_percent {
  label: "Sold Capacity"
  type: number
  value_format_name: percent_2
  sql: case when ${ot_performance_stats_consumed.total_sold_seats} > 0 then (${ot_performance_stats_total.total_venue_capacity}/${ot_performance_stats_consumed.total_sold_seats})*1
       else 0 End;;
  html:  {% if value <= 0.25 %}
  <b><p style="color: black; background-color: #00ff00; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p></b>
  {% elsif value <= 0.26 or value <=0.79 %}
  <b><p style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p></b>
  {% elsif value >= 0.80  %}
  <b><p style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p></b>
  {% endif %};;
}

  dimension: performance_id {
    type: number
    sql: ${TABLE}.performance_id ;;
  }

  dimension: price_level_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.price_level_id ;;
  }

  dimension: section_id {
    type: number
    sql: ${TABLE}.section_id ;;
  }

  dimension: ticket_status {
    type: string
    sql: ${TABLE}.ticket_status ;;
  }

  measure: looker_count {
    type: count
    drill_fields: [performance_stats_consumed_id, price_level.price_level_id, price_level.name]
  }

}
