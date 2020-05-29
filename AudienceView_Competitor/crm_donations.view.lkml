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
    type: number
    sql: ${TABLE}.activity_manager ;;
  }

  dimension: assigning_staff_to_individual_patrons {
    type: number
    sql: ${TABLE}.assigning_staff_to_individual_patrons ;;
  }

  dimension: competitor_name {
    type: string
    sql: ${TABLE}.competitor_name ;;
  }

  dimension: donation_campaigns_and_templates {
    type: number
    sql: ${TABLE}.donation_campaigns_and_templates ;;
  }

  dimension: donations_campaigns {
    type: number
    sql: ${TABLE}.donations_campaigns ;;
  }

  dimension: joint_donations_ticket_database {
    type: number
    sql: ${TABLE}.joint_donations_ticket_database ;;
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
    type: number
    sql: ${TABLE}.mobile_patron_crm ;;
  }

  dimension: offer_ability_to_donate_at_checkout {
    type: number
    sql: ${TABLE}.offer_ability_to_donate_at_checkout ;;
  }

  dimension: patron_crm {
    type: number
    sql: ${TABLE}.patron_crm ;;
  }

  dimension: recurring_donations {
    type: number
    sql: ${TABLE}.recurring_donations ;;
  }

  dimension: stats_view_to_show_all_patron_transactions {
    type: number
    sql: ${TABLE}.stats_view_to_show_all_patron_transactions ;;
  }

  measure: count {
    type: count
    drill_fields: [competitor_name]
  }
}
