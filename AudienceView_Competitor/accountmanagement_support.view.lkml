view: accountmanagement_support {
  sql_table_name: `fivetran-ovation-tix-warehouse.competitor.accountmanagement_support`
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

  dimension: competitor_name {
    type: string
    sql: ${TABLE}.competitor_name ;;
  }

  dimension: customer_conference {
    type: number
    sql: ${TABLE}.customer_conference ;;
  }

  dimension: included_24_x_7_support {
    type: number
    sql: ${TABLE}.included_24_x_7_support ;;
  }

  dimension: knowledge_base {
    type: number
    sql: ${TABLE}.knowledge_base ;;
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

  dimension: no_cost_for_additional_users {
    type: number
    sql: ${TABLE}.no_cost_for_additional_users ;;
  }

  dimension: ongoing_live_training_via_web {
    type: number
    sql: ${TABLE}.ongoing_live_training_via_web ;;
  }

  dimension: onsite_support_available {
    type: number
    sql: ${TABLE}.onsite_support_available ;;
  }

  dimension: patron_box_office_support {
    type: number
    sql: ${TABLE}.patron_box_office_support ;;
  }

  dimension: requires_didicated_it_staff {
    type: number
    sql: ${TABLE}.requires_didicated_it_staff ;;
  }

  dimension: self_service_video_tutorials {
    type: number
    sql: ${TABLE}.self_service_video_tutorials ;;
  }

  dimension: sub_accounts {
    type: number
    sql: ${TABLE}.sub_accounts ;;
  }

  dimension: unique_permissions_by_users {
    type: number
    sql: ${TABLE}.unique_permissions_by_users ;;
  }

  dimension: unlimited_users_permitted {
    type: number
    sql: ${TABLE}.unlimited_users_permitted ;;
  }

  measure: count {
    type: count
    drill_fields: [competitor_name]
  }
}
