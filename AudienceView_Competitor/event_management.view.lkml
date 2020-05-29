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
    type: string
    sql: case when ${TABLE}.ability_to_copy_event = 1 then "Yes" Else NULL END ;;
  }

  dimension: competitor_name {
    type: string
    sql:${TABLE}.competitor_name ;;
  }

  dimension: create_multi_day_events {
    type: string
    sql:case when  ${TABLE}.create_multi_day_events = 1 then "Yes" Else NULL END ;;
  }

  dimension: create_recurring_patterns_similar_to_gcal_ {
    type: string
    sql: case when  ${TABLE}.create_recurring_patterns_similar_to_gcal_ = 1 then "Yes" Else NULL END ;;
  }

  dimension: customizable_fees {
    type: string
    sql:case when  ${TABLE}.customizable_fees = 1 then "Yes" Else NULL END;;
  }

  dimension: designated_ada_seating {
    type: string
    sql:case when  ${TABLE}.designated_ada_seating = 1 then "Yes" Else NULL END;;
  }

  dimension: dynamic_pricing_based_on_tiers_and_availability {
    type: string
    sql:case when  ${TABLE}.dynamic_pricing_based_on_tiers_and_availability = 1 then "Yes" Else NULL END;;
  }

  dimension: flex_seating {
    type: string
    sql: case when ${TABLE}.flex_seating = 1 then "Yes" Else NULL END;;
  }

  dimension: ga_holds {
    type: string
    sql:case when  ${TABLE}.ga_holds= 1 then "Yes" Else NULL END ;;
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
    type: string
    sql:case when  ${TABLE}.multiple_dates_within_one_event = 1 then "Yes" Else NULL END;;
  }

  dimension: pricing_matrices {
    type: string
    sql:case when  ${TABLE}.pricing_matrices = 1 then "Yes" Else NULL END;;
  }

  dimension: reserved_seating {
    type: string
    sql:case when  ${TABLE}.reserved_seating = 1 then "Yes" Else NULL END;;
  }

  dimension: ticket_types {
    type: string
    sql:case when  ${TABLE}.ticket_types = 1 then "Yes" Else NULL END;;
  }

  measure: count {
    type: count
    drill_fields: [competitor_name]
  }
}
