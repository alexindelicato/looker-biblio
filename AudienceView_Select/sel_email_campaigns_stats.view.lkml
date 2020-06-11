view: sel_email_campaigns_stats {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.email_campaigns_stats`
    ;;

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

  dimension: bounce_count {
    type: number
    sql: ${TABLE}.bounce_count ;;
  }

  dimension: campaignid {
    type: number
    value_format_name: id
    sql: ${TABLE}.campaignid ;;
  }

  dimension: click_count_total {
    type: number
    sql: ${TABLE}.click_count_total ;;
  }

  dimension: click_count_unique {
    type: number
    sql: ${TABLE}.click_count_unique ;;
  }

  dimension_group: created {
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
    sql: CAST(${TABLE}.created AS TIMESTAMP) ;;
  }

  dimension_group: last_click {
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
    sql: CAST(${TABLE}.last_click_date AS TIMESTAMP) ;;
  }

  dimension_group: last_open {
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
    sql: CAST(${TABLE}.last_open_date AS TIMESTAMP) ;;
  }

  dimension_group: last_purchase {
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
    sql: CAST(${TABLE}.last_purchase_date AS TIMESTAMP) ;;
  }

  dimension_group: last_sent {
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
    sql: CAST(${TABLE}.last_sent_date AS TIMESTAMP) ;;
  }

  dimension: open_count_total {
    type: number
    sql: ${TABLE}.open_count_total ;;
  }

  dimension: open_count_unique {
    type: number
    sql: ${TABLE}.open_count_unique ;;
  }

  dimension: opt_out_count {
    type: number
    sql: ${TABLE}.opt_out_count ;;
  }

  dimension: purchase_amount_total {
    type: number
    sql: ${TABLE}.purchase_amount_total ;;
  }

  dimension: purchase_count_total {
    type: number
    sql: ${TABLE}.purchase_count_total ;;
  }

  dimension: purchase_count_unique {
    type: number
    sql: ${TABLE}.purchase_count_unique ;;
  }

  dimension: sent_count {
    type: number
    sql: ${TABLE}.sent_count ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
