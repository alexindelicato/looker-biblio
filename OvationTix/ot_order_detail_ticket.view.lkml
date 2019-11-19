view: order_detail_ticket {
  sql_table_name: trs_trs.order_detail_ticket ;;

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

  dimension: client_rebate {
    type: number
    sql: ${TABLE}.client_rebate ;;
  }

  dimension: consumer_id {
    type: number
    sql: ${TABLE}.consumer_id ;;
  }

  dimension: facility_fee {
    type: number
    sql: ${TABLE}.facility_fee ;;
  }

  dimension: facility_fee_id {
    type: number
    sql: ${TABLE}.facility_fee_id ;;
  }

  dimension: orderdetail_id {
    type: number
    sql: ${TABLE}.orderdetail_id ;;
  }

  dimension: performance_entry_time_id {
    type: number
    sql: ${TABLE}.performance_entry_time_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
