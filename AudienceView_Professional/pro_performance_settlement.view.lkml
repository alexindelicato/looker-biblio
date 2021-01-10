view: pro_performance_settlement {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.performance_settlement`
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

  dimension_group: last_update {
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
    sql: CAST(${TABLE}.last_update AS TIMESTAMP) ;;
  }

  dimension: performance_id {
    type: number
    sql: ${TABLE}.performance_id ;;
  }

  dimension: performance_status_id {
    type: number
    sql: ${TABLE}.performance_status_id ;;
  }

  dimension: settlement_status_id {
    type: number
    sql: ${TABLE}.settlement_status_id ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
