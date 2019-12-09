view: ot_performance_stats_total {
  sql_table_name: trs_trs.performance_stats_total ;;


  dimension: performance_stats_total_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.performance_stats_total_id ;;
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

  dimension: total_seat_count {
    type: number
    sql: ${TABLE}.total_seat_count ;;
  }

  measure: measure_total_seat_count {
    type: median
    sql: ${TABLE}.total_seat_count ;;
  }

  measure: total_venue_capacity {
    type: sum_distinct
    sql: ${TABLE}.total_seat_count ;;
  }

  measure: count {
    type: count
    drill_fields: [performance_stats_total_id, price_level.price_level_id, price_level.name]
  }
}
