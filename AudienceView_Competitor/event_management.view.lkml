view: event_management {
  sql_table_name: `fivetran-ovation-tix-warehouse.competitor.event_management`
    ;;

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

  dimension: ability_to_copy_event {
    type: number
    sql: ${TABLE}.ability_to_copy_event ;;
  }

  dimension: competitor_name {
    type: string
    sql: ${TABLE}.competitor_name ;;
  }

  dimension: create_multi_day_events {
    type: number
    sql: ${TABLE}.create_multi_day_events ;;
  }

  dimension: create_recurring_patterns_similar_to_gcal_ {
    type: number
    sql: ${TABLE}.create_recurring_patterns_similar_to_gcal_ ;;
  }

  dimension: customizable_fees {
    type: number
    sql: ${TABLE}.customizable_fees ;;
  }

  dimension: designated_ada_seating {
    type: number
    sql: ${TABLE}.designated_ada_seating ;;
  }

  dimension: dynamic_pricing_based_on_tiers_and_availability {
    type: number
    sql: ${TABLE}.dynamic_pricing_based_on_tiers_and_availability ;;
  }

  dimension: flex_seating {
    type: number
    sql: ${TABLE}.flex_seating ;;
  }

  dimension: ga_holds {
    type: number
    sql: ${TABLE}.ga_holds ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: multiple_dates_within_one_event {
    type: number
    sql: ${TABLE}.multiple_dates_within_one_event ;;
  }

  dimension: pricing_matrices {
    type: number
    sql: ${TABLE}.pricing_matrices ;;
  }

  dimension: reserved_seating {
    type: number
    sql: ${TABLE}.reserved_seating ;;
  }

  dimension: ticket_types {
    type: number
    sql: ${TABLE}.ticket_types ;;
  }

  measure: count {
    type: count
    drill_fields: [competitor_name]
  }
}
