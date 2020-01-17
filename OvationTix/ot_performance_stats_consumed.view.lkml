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

measure: total_unsold_capcity_percent {
  type: number
  value_format_name: percent_2
  sql: (${ot_performance_stats_consumed.total_sold_seats}/${ot_performance_stats_total.total_venue_capacity})*1 ;;
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
