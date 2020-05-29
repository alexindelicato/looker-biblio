view: crm_donations {
  sql_table_name: `fivetran-ovation-tix-warehouse.competitor.crm_donations`
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

  dimension: activity_manager {
    type: string
    sql: case when ${TABLE}.activity_manager = 1 then "Yes" Else NULL END ;;
  }

  dimension: assigning_staff_to_individual_patrons {
    type: string
    sql: case when ${TABLE}.assigning_staff_to_individual_patrons = 1 then "Yes" Else NULL END  ;;
  }

  dimension: competitor_name {
    type: string
    sql: ${TABLE}.competitor_name ;;
  }

  dimension: donation_campaigns_and_templates {
    type: string
    sql: case when ${TABLE}.donation_campaigns_and_templates = 1 then "Yes" Else NULL END  ;;
  }

  dimension: donations_campaigns {
    type: string
    sql: case when ${TABLE}.donations_campaigns = 1 then "Yes" Else NULL END  ;;
  }

  dimension: joint_donations_ticket_database {
    type: string
    sql: case when ${TABLE}.joint_donations_ticket_database = 1 then "Yes" Else NULL END  ;;
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

  dimension: mobile_patron_crm {
    type: string
    sql: case when ${TABLE}.mobile_patron_crm = 1 then "Yes" Else NULL END  ;;
  }

  dimension: offer_ability_to_donate_at_checkout {
    type: string
    sql: case when ${TABLE}.offer_ability_to_donate_at_checkout = 1 then "Yes" Else NULL END  ;;
  }

  dimension: patron_crm {
    type: string
    sql:case when  ${TABLE}.patron_crm  = 1 then "Yes" Else NULL END ;;
  }

  dimension: recurring_donations {
    type: string
    sql: case when ${TABLE}.recurring_donations = 1 then "Yes" Else NULL END  ;;
  }

  dimension: stats_view_to_show_all_patron_transactions {
    type: string
    sql: case when ${TABLE}.stats_view_to_show_all_patron_transactions = 1 then "Yes" Else NULL END  ;;
  }

  measure: count {
    type: count
    drill_fields: [competitor_name]
  }
}
