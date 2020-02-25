view: sf_campaign {
  sql_table_name: fivetran-ovation-tix-warehouse.new_salesforce.campaign ;;
  drill_fields: [pi_pardot_campaign_id_c]

  dimension: pi_pardot_campaign_id_c {
    primary_key: yes
    type: string
    sql: ${TABLE}.pi_pardot_campaign_id_c ;;
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

  dimension: actual_cost {
    type: number
    sql: ${TABLE}.actual_cost ;;
  }

  dimension: amount_all_opportunities {
    type: number
    sql: ${TABLE}.amount_all_opportunities ;;
  }

  dimension: amount_won_opportunities {
    type: number
    sql: ${TABLE}.amount_won_opportunities ;;
  }

  dimension: budgeted_cost {
    type: number
    sql: ${TABLE}.budgeted_cost ;;
  }

  dimension: campaign_leads_report_c {
    type: string
    sql: ${TABLE}.campaign_leads_report_c ;;
  }

  dimension: campaign_member_record_type_id {
    type: string
    sql: ${TABLE}.campaign_member_record_type_id ;;
  }

  dimension: campaign_url_c {
    type: string
    sql: ${TABLE}.campaign_url_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: db_campaign_tactic_c {
    type: string
    sql: ${TABLE}.db_campaign_tactic_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: expected_response {
    type: number
    sql: ${TABLE}.expected_response ;;
  }

  dimension: expected_revenue {
    type: number
    sql: ${TABLE}.expected_revenue ;;
  }

  dimension: forecasted_leads_c {
    type: number
    sql: ${TABLE}.forecasted_leads_c ;;
  }

  dimension_group: fstr_auto_close_c {
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
    sql: ${TABLE}.fstr_auto_close_c ;;
  }

  dimension: fstr_auto_close_steps_not_created_c {
    type: number
    sql: ${TABLE}.fstr_auto_close_steps_not_created_c ;;
  }

  dimension: fstr_completed_by_c {
    type: string
    sql: ${TABLE}.fstr_completed_by_c ;;
  }

  dimension_group: fstr_completed_date_c {
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
    sql: ${TABLE}.fstr_completed_date_c ;;
  }

  dimension: fstr_pce_definition_c {
    type: string
    sql: ${TABLE}.fstr_pce_definition_c ;;
  }

  dimension: fstr_pce_definition_lookup_c {
    type: string
    sql: ${TABLE}.fstr_pce_definition_lookup_c ;;
  }

  dimension: fstr_process_group_c {
    type: string
    sql: ${TABLE}.fstr_process_group_c ;;
  }

  dimension_group: fstr_process_initiated_c {
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
    sql: ${TABLE}.fstr_process_initiated_c ;;
  }

  dimension: fstr_recurring_business_process_c {
    type: string
    sql: ${TABLE}.fstr_recurring_business_process_c ;;
  }

  dimension: fstr_skipped_steps_c {
    type: string
    sql: ${TABLE}.fstr_skipped_steps_c ;;
  }

  dimension: hierarchy_actual_cost {
    type: number
    sql: ${TABLE}.hierarchy_actual_cost ;;
  }

  dimension: hierarchy_amount_all_opportunities {
    type: number
    sql: ${TABLE}.hierarchy_amount_all_opportunities ;;
  }

  dimension: hierarchy_amount_won_opportunities {
    type: number
    sql: ${TABLE}.hierarchy_amount_won_opportunities ;;
  }

  dimension: hierarchy_budgeted_cost {
    type: number
    sql: ${TABLE}.hierarchy_budgeted_cost ;;
  }

  dimension: hierarchy_expected_revenue {
    type: number
    sql: ${TABLE}.hierarchy_expected_revenue ;;
  }

  dimension: hierarchy_number_of_contacts {
    type: number
    sql: ${TABLE}.hierarchy_number_of_contacts ;;
  }

  dimension: hierarchy_number_of_converted_leads {
    type: number
    sql: ${TABLE}.hierarchy_number_of_converted_leads ;;
  }

  dimension: hierarchy_number_of_leads {
    type: number
    sql: ${TABLE}.hierarchy_number_of_leads ;;
  }

  dimension: hierarchy_number_of_opportunities {
    type: number
    sql: ${TABLE}.hierarchy_number_of_opportunities ;;
  }

  dimension: hierarchy_number_of_responses {
    type: number
    sql: ${TABLE}.hierarchy_number_of_responses ;;
  }

  dimension: hierarchy_number_of_won_opportunities {
    type: number
    sql: ${TABLE}.hierarchy_number_of_won_opportunities ;;
  }

  dimension: hierarchy_number_sent {
    type: number
    sql: ${TABLE}.hierarchy_number_sent ;;
  }

  dimension: hours_to_build_c {
    type: number
    sql: ${TABLE}.hours_to_build_c ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: industry_contact_email_template_c {
    type: string
    sql: ${TABLE}.industry_contact_email_template_c ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension_group: last_activity {
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
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
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

  dimension_group: last_referenced {
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
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: legacy_id_c {
    type: string
    sql: ${TABLE}.legacy_id_c ;;
  }

  dimension: member_email_template_c {
    type: string
    sql: ${TABLE}.member_email_template_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_contacts {
    type: number
    sql: ${TABLE}.number_of_contacts ;;
  }

  dimension: number_of_converted_leads {
    type: number
    sql: ${TABLE}.number_of_converted_leads ;;
  }

  dimension: number_of_leads {
    type: number
    sql: ${TABLE}.number_of_leads ;;
  }

  dimension: number_of_opportunities {
    type: number
    sql: ${TABLE}.number_of_opportunities ;;
  }

  dimension: number_of_responses {
    type: number
    sql: ${TABLE}.number_of_responses ;;
  }

  dimension: number_of_won_opportunities {
    type: number
    sql: ${TABLE}.number_of_won_opportunities ;;
  }

  dimension: number_sent {
    type: number
    sql: ${TABLE}.number_sent ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: pi_pardot_has_dependencies_c {
    type: yesno
    sql: ${TABLE}.pi_pardot_has_dependencies_c ;;
  }

  dimension: prospect_email_template_c {
    type: string
    sql: ${TABLE}.prospect_email_template_c ;;
  }

  dimension: recommended_next_steps_c {
    type: string
    sql: ${TABLE}.recommended_next_steps_c ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: system_modstamp {
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
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [pi_pardot_campaign_id_c, name]
  }
}
