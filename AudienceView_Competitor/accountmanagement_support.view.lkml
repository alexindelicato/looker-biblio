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
    type: string
    sql: case when ${TABLE}.customer_conference = 1 then "Yes" Else NULL END ;;
  }

  dimension: included_24_x_7_support {
    type: string
    sql: case when ${TABLE}.included_24_x_7_support = 1 then "Yes" Else NULL END ;;
  }

  dimension: knowledge_base {
    type: string
    sql: case when ${TABLE}.knowledge_base = 1 then "Yes" Else Null END ;;
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
    type: string
    sql: case when ${TABLE}.no_cost_for_additional_users = 1 then "Yes" Else NULL END ;;
  }

  dimension: ongoing_live_training_via_web {
    type: string
    sql: case when ${TABLE}.ongoing_live_training_via_web = 1 then "Yes" ELSE NULL ENd ;;
  }

  dimension: onsite_support_available {
    type: string
    sql: case when ${TABLE}.onsite_support_available = 1 then "Yes" Else Null End ;;
  }

  dimension: patron_box_office_support {
    type: string
    sql: case when ${TABLE}.patron_box_office_support = 1 then "Yes" Else NULL END ;;
  }

  dimension: requires_didicated_it_staff {
    type: string
    sql: case when ${TABLE}.requires_didicated_it_staff = 1 then "Yes" ELse NULL END ;;
  }

  dimension: self_service_video_tutorials {
    type: string
    sql: case when ${TABLE}.self_service_video_tutorials = 1 then "Yes" ELse NULL END ;;
  }

  dimension: sub_accounts {
    type: string
    sql: case when ${TABLE}.sub_accounts= 1 then "Yes" ELse NULL END  ;;
  }

  dimension: unique_permissions_by_users {
    type: string
    sql: case when ${TABLE}.unique_permissions_by_users= 1 then "Yes" ELse NULL END  ;;
  }

  dimension: unlimited_users_permitted {
    type: string
    sql: case when ${TABLE}.unlimited_users_permitted = 1 then "Yes" else NULL End;;
  }

  measure: count {
    type: count
    drill_fields: [competitor_name]
  }
}
