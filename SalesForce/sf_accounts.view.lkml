view: sf_accounts {
  sql_table_name: new_salesforce.account ;;


  dimension: salesforce_account_id_c {
    type: string
    sql: ${TABLE}.salesforce_account_id_c ;;
  }

#   dimension_group: _fivetran_synced {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}._fivetran_synced ;;
#   }

  dimension: looker_join_id_c {
    label: "Looker Join ID"
    type: string
    sql: ${TABLE}.looker_join_id_c ;;
  }


  dimension: account_acquisition_source_c {
    type: string
    sql: ${TABLE}.account_acquisition_source_c ;;
  }

  dimension: account_description_c {
    type: string
    sql: ${TABLE}.account_description_c ;;
  }

  dimension: account_legal_name_c {
    type: string
    sql: ${TABLE}.account_legal_name_c ;;
  }

# not in use
# dimension: account_name_source_c {
#     type: string
#     sql: ${TABLE}.account_name_source_c ;;
#   }

  dimension: account_number {
    type: string
    sql: ${TABLE}.account_number ;;
  }

  dimension: account_owner_contact_only_c {
    type: yesno
    sql: ${TABLE}.account_owner_contact_only_c ;;
  }

  dimension: account_owner_media_c {
    type: string
    sql: ${TABLE}.account_owner_media_c ;;
  }

  dimension_group: account_review_date_c {
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
    sql: ${TABLE}.account_review_date_c ;;
  }

  dimension: account_source {
    type: string
    sql: ${TABLE}.account_source ;;
  }

  dimension: account_source_c {
    type: string
    sql: ${TABLE}.account_source_c ;;
  }

  dimension: account_status_c {
    type: string
    sql: ${TABLE}.account_status_c ;;
  }

  dimension: product_name {
    label: "Product Name"
    type:  string
    sql:  case when ${TABLE}.type = 'Client - AudienceView Professional' THEN "AudienceView Professional"
          WHEN ${TABLE}.type = "Client - AudienceView Unlimited" THEN "AudienceView Unlimited"
          WHEN ${TABLE}.type = "Client - AudienceView Select" THEN "AudienceView Select"
          WHEN ${TABLE}.type = "Live Mode" THEN "AudienceView Select"
          WHEN ${TABLE}.type = "Client - CrowdTorch" THEN "CrowdTorch"
          WHEN ${TABLE}.type = "Client - AudienceView Campus" THEN "AudienceView Campus"
          WHEN ${TABLE}.type = "Client - AudienceView Grad" THEN "AudienceView Grad"
          ELSE "Research" END;;
  }

  dimension: market_solution {
    label: "Market Solution"
    sql:case when ${TABLE}.type = 'Client - AudienceView Professional' or 'Client - AudienceView Select' THEN 'MidMarket'
    WHEN ${TABLE}.type = 'Client - CrowdTorch' THEN 'MidMarket'
    WHEN ${TABLE}.type = 'Client - AudienceView Unlimited' THEN 'Enterprise'
    ELSE 'Research' END;;
  }


  dimension_group: activation_date_c {
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
    sql: ${TABLE}.activation_date_c ;;
  }

  dimension: active_last_30_days_c {
    type: yesno
    sql: ${TABLE}.active_last_30_days_c ;;
  }

  dimension: add_ons_up_sales_c {
    type: yesno
    sql: ${TABLE}.add_ons_up_sales_c ;;
  }

  dimension: additional_call_center_information_c {
    type: string
    sql: ${TABLE}.additional_call_center_information_c ;;
  }

  dimension: additional_data_import_information_c {
    type: string
    sql: ${TABLE}.additional_data_import_information_c ;;
  }

  dimension: additional_fee_notes_c {
    type: string
    sql: ${TABLE}.additional_fee_notes_c ;;
  }

  dimension: address_verification_c {
    type: yesno
    sql: ${TABLE}.address_verification_c ;;
  }

  dimension: admission_type_c {
    type: string
    sql: ${TABLE}.admission_type_c ;;
  }

  dimension_group: amendment_date_c {
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
    sql: ${TABLE}.amendment_date_c ;;
  }

  dimension: amendment_notes_ot_c {
    type: string
    sql: ${TABLE}.amendment_notes_ot_c ;;
  }

  dimension: annual_contract_value_c {
    type: number
    value_format_name: usd
    sql: ${TABLE}.annual_contract_value_c ;;
  }

  dimension: annual_email_fees_c {
    type: number
    sql: ${TABLE}.annual_email_fees_c ;;
  }

  dimension: annual_hosting_c {
    type: number
    sql: ${TABLE}.annual_hosting_c ;;
  }

  dimension: annual_per_unit_fees_c {
    type: number
    sql: ${TABLE}.annual_per_unit_fees_c ;;
  }

  dimension: annual_recurring_fees_c {
    type: number
    value_format_name: usd
    sql: ${TABLE}.annual_recurring_fees_c ;;
  }

  dimension: annual_revenue {
    type: number
    value_format_name: usd
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: annual_subscription_fee_c {
    type: number
    value_format_name: usd
    sql: ${TABLE}.annual_subscription_fee_c ;;
  }

  dimension: annual_support_c {
    type: number
    value_format_name: usd
    sql: ${TABLE}.annual_support_c ;;
  }

  dimension: annual_ticket_volume_c {
    type: string
    sql: ${TABLE}.annual_ticket_volume_c ;;
  }

  dimension: annual_transaction_fee_c {
    type: number
    value_format_name: usd
    sql: ${TABLE}.annual_transaction_fee_c ;;
  }

  dimension: annual_transactional_minimum_c {
    type: number
    sql: ${TABLE}.annual_transactional_minimum_c ;;
  }

  dimension: api_support_fee_c {
    type: number
    sql: ${TABLE}.api_support_fee_c ;;
  }

  dimension: apollo_account_owner_c {
    type: string
    sql: ${TABLE}.apollo_account_owner_c ;;
  }

  dimension: ar_days_owing_c {
    type: string
    sql: ${TABLE}.ar_days_owing_c ;;
  }

  dimension: arts_conferences_c {
    type: string
    sql: ${TABLE}.arts_conferences_c ;;
  }

  dimension: authority_c {
    type: yesno
    sql: ${TABLE}.authority_c ;;
  }

  dimension: auto_number_c {
    type: string
    sql: ${TABLE}.auto_number_c ;;
  }

  dimension: av_online_is_corporate_site_c {
    type: yesno
    sql: ${TABLE}.av_online_is_corporate_site_c ;;
  }

  dimension: average_ticket_price_c {
    type: number
    sql: ${TABLE}.average_ticket_price_c ;;
  }

  dimension: averaged_f_c {
    type: yesno
    sql: ${TABLE}.averaged_f_c ;;
  }

  dimension: avg_gross_rev_c {
    type: number
    sql: ${TABLE}.avg_gross_rev_c ;;
  }

  dimension: avtiki_c {
    type: yesno
    sql: ${TABLE}.avtiki_c ;;
  }

  dimension: bi_charts_graphs_c {
    type: yesno
    sql: ${TABLE}.bi_charts_graphs_c ;;
  }

  dimension: bi_formulas_c {
    type: yesno
    sql: ${TABLE}.bi_formulas_c ;;
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billing_city ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: billing_geocode_accuracy {
    type: string
    sql: ${TABLE}.billing_geocode_accuracy ;;
  }

  dimension: billing_latitude {
    type: number
    sql: ${TABLE}.billing_latitude ;;
  }

  dimension: billing_longitude {
    type: number
    sql: ${TABLE}.billing_longitude ;;
  }

  dimension: billing_postal_code {
    map_layer_name: countries
    type: string
    sql: ${TABLE}.billing_postal_code ;;
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billing_state ;;
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.billing_street ;;
  }

  dimension: booking_protect_c {
    type: yesno
    sql: ${TABLE}.booking_protect_c ;;
  }

  dimension: box_office_cash_fee_ot_c {
    type: number
    sql: ${TABLE}.box_office_cash_fee_ot_c ;;
  }

  dimension: box_office_credit_card_fee_ot_c {
    type: number
    sql: ${TABLE}.box_office_credit_card_fee_ot_c ;;
  }

  dimension: box_office_fixed_fee_ot_c {
    type: number
    sql: ${TABLE}.box_office_fixed_fee_ot_c ;;
  }

  dimension: box_office_fixed_fee_schedule_ot_c {
    type: string
    sql: ${TABLE}.box_office_fixed_fee_schedule_ot_c ;;
  }

  dimension: box_office_phone_fee_ot_c {
    type: number
    sql: ${TABLE}.box_office_phone_fee_ot_c ;;
  }

  dimension: boxxo_acquisition_client_c {
    type: yesno
    sql: ${TABLE}.boxxo_acquisition_client_c ;;
  }

  dimension: boxxo_annual_revenue_c {
    type: number
    sql: ${TABLE}.boxxo_annual_revenue_c ;;
  }

  dimension: boxxo_client_id_c {
    type: number
    value_format_name: id
    sql: ${TABLE}.boxxo_client_id_c ;;
  }

  dimension: boxxo_contract_notes_c {
    type: string
    sql: ${TABLE}.boxxo_contract_notes_c ;;
  }

  dimension: boxxo_custom_dev_in_progress_c {
    type: string
    sql: ${TABLE}.boxxo_custom_dev_in_progress_c ;;
  }

  dimension: boxxo_feature_gap_identified_c {
    type: string
    sql: ${TABLE}.boxxo_feature_gap_identified_c ;;
  }

  dimension: boxxo_merchant_account_setup_c {
    type: string
    sql: ${TABLE}.boxxo_merchant_account_setup_c ;;
  }

  dimension: boxxo_on_site_v_hosted_c {
    type: string
    sql: ${TABLE}.boxxo_on_site_v_hosted_c ;;
  }

  dimension: boxxo_payment_terms_c {
    type: string
    sql: ${TABLE}.boxxo_payment_terms_c ;;
  }

  dimension: boxxo_sow_work_in_progress_c {
    type: string
    sql: ${TABLE}.boxxo_sow_work_in_progress_c ;;
  }

  dimension: boxxo_template_c {
    type: string
    sql: ${TABLE}.boxxo_template_c ;;
  }

  dimension_group: bp_go_live_date_c {
    label: "BookingProtect Go Live Date"
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
    sql: ${TABLE}.bp_go_live_date_c ;;
  }

  dimension: budget_c {
    type: yesno
    sql: ${TABLE}.budget_c ;;
  }

  dimension: budget_for_purchase_c {
    type: number
    sql: ${TABLE}.budget_for_purchase_c ;;
  }

  dimension: budget_notes_c {
    type: string
    sql: ${TABLE}.budget_notes_c ;;
  }

  dimension: budgeted_churn_c {
    type: yesno
    sql: ${TABLE}.budgeted_churn_c ;;
  }

  dimension: bundles_c {
    type: yesno
    sql: ${TABLE}.bundles_c ;;
  }

  dimension: business_analyst_2_c {
    type: string
    sql: ${TABLE}.business_analyst_2_c ;;
  }

  dimension: business_analyst_email_c {
    type: string
    sql: ${TABLE}.business_analyst_email_c ;;
  }

  dimension: business_entity_c {
    type: string
    sql: ${TABLE}.business_entity_c ;;
  }

  dimension: business_intelligence_c {
    type: yesno
    sql: ${TABLE}.business_intelligence_c ;;
  }

  dimension: business_objectives_c {
    type: string
    sql: ${TABLE}.business_objectives_c ;;
  }

  dimension: call_center_fee_c {
    type: number
    sql: ${TABLE}.call_center_fee_c ;;
  }

  dimension: call_center_fixed_fee_c {
    type: number
    sql: ${TABLE}.call_center_fixed_fee_c ;;
  }

  dimension: call_center_fixed_fee_invoice_schedule_c {
    type: string
    sql: ${TABLE}.call_center_fixed_fee_invoice_schedule_c ;;
  }

  dimension: call_center_ot_c {
    type: string
    sql: ${TABLE}.call_center_ot_c ;;
  }

  dimension: campaign_id_c {
    type: string
    sql: ${TABLE}.campaign_id_c ;;
  }

  dimension: capacity_c {
    type: string
    sql: ${TABLE}.capacity_c ;;
  }

  dimension: cbord_c {
    type: yesno
    sql: ${TABLE}.cbord_c ;;
  }

  dimension: child_count_c {
    type: number
    sql: ${TABLE}.child_count_c ;;
  }

  dimension: client_environment_c {
    type: string
    sql: ${TABLE}.client_environment_c ;;
  }

  dimension: code_repository_c {
    type: string
    sql: ${TABLE}.code_repository_c ;;
  }

  dimension: cohort_c {
    type: string
    sql: ${TABLE}.cohort_c ;;
  }

  dimension_group: completed_on_boarding_date_c {
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
    sql: ${TABLE}.completed_on_boarding_date_c ;;
  }

  dimension: conference_c {
    type: string
    sql: ${TABLE}.conference_c ;;
  }

  dimension: conference_university_c {
    type: string
    sql: ${TABLE}.conference_university_c ;;
  }

  dimension: contact_c {
    type: string
    sql: ${TABLE}.contact_c ;;
  }

  dimension: content_management_c {
    type: yesno
    sql: ${TABLE}.content_management_c ;;
  }

  dimension: contract_auto_renew_c {
    type: yesno
    sql: ${TABLE}.contract_auto_renew_c ;;
  }

  dimension_group: contract_end_date_c {
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
    sql: ${TABLE}.contract_end_date_c ;;
  }

  dimension_group: contract_expiration_c {
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
    sql: ${TABLE}.contract_expiration_c ;;
    html: {{ rendered_value | date: "%b %d, %Y" }} ;;
  }

  dimension_group: contract_expires_c {
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
    sql: ${TABLE}.contract_expires_c ;;
  }

  dimension: contract_name_time_system_name_c {
    type: string
    sql: ${TABLE}.contract_name_time_system_name_c ;;
  }

  dimension: contract_price_model_c {
    type: string
    sql: ${TABLE}.contract_price_model_c ;;
  }

  dimension_group: contract_termination_c {
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
    sql: ${TABLE}.contract_termination_c ;;
  }

  dimension: contributed_revenue_c {
    type: number
    sql: ${TABLE}.contributed_revenue_c ;;
  }

  dimension: corporate_structure_c {
    type: string
    sql: ${TABLE}.corporate_structure_c ;;
  }

  dimension: correspondance_codes_c {
    type: yesno
    sql: ${TABLE}.correspondance_codes_c ;;
  }

  dimension_group: created_by_date_c {
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
    sql: ${TABLE}.created_by_date_c ;;
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

  dimension: credit_term_interest_rate_ot_c {
    type: number
    sql: ${TABLE}.credit_term_interest_rate_ot_c ;;
  }

  dimension: crowd_torch_account_c {
    type: yesno
    sql: ${TABLE}.crowd_torch_account_c ;;
  }

  dimension_group: csm_assigned_c {
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
    sql: ${TABLE}.csm_assigned_c ;;
  }

  dimension: csm_attainment_monitoring_c {
    type: yesno
    sql: ${TABLE}.csm_attainment_monitoring_c ;;
  }

  dimension: csm_health_sentiment_product_detail_c {
    type: string
    sql: ${TABLE}.csm_health_sentiment_product_detail_c ;;
  }

  dimension: csm_health_sentiment_reason_c {
    type: string
    sql: ${TABLE}.csm_health_sentiment_reason_c ;;
  }

  dimension: csm_sentiment_c {
    type: string
    sql: ${TABLE}.csm_sentiment_c ;;
  }

  dimension: ct_account_emergency_notes_c {
    type: string
    sql: ${TABLE}.ct_account_emergency_notes_c ;;
  }

  dimension: ct_account_status_c {
    type: string
    sql: ${TABLE}.ct_account_status_c ;;
  }

  dimension: ct_client_id_c {
    type: string
    sql: ${TABLE}.ct_client_id_c ;;
  }

  dimension: ct_consent_for_logo_c {
    type: string
    sql: ${TABLE}.ct_consent_for_logo_c ;;
  }

  dimension: ct_purchased_license_c {
    type: string
    sql: ${TABLE}.ct_purchased_license_c ;;
  }

  dimension: ct_record_id_c {
    type: string
    sql: ${TABLE}.ct_record_id_c ;;
  }

  dimension: ct_venue_id_c {
    type: string
    sql: ${TABLE}.ct_venue_id_c ;;
  }

  dimension: currency_c {
    type: string
    sql: ${TABLE}.currency_c ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

#   no longer being used - moving to annual contract value
  dimension: current_acv_c {
    type: number
    hidden: no
    value_format_name: usd
    sql: ${TABLE}.current_acv_c ;;
  }

  dimension: converted_acv {
    type:  number
    value_format_name: usd
    label: "Current ACV (USD)"
    sql: case
      when ${currency_iso_code} = "USD" THEN ${current_acv_c} * 1.00
      when ${currency_iso_code} = "CAD" THEN ${current_acv_c} * 0.76
      when ${currency_iso_code} = "GBP" THEN ${current_acv_c} * 1.32
      when ${currency_iso_code} = "PHP" THEN ${current_acv_c} * 0.020
      when ${currency_iso_code} = "EUR" THEN ${current_acv_c} * 1.11
      when ${currency_iso_code} = "COP" THEN ${current_acv_c} * 0.00029
    else ${TABLE}.current_acv_c
    end;;
}

  dimension: current_printer_c {
    type: string
    sql: ${TABLE}.current_printer_c ;;
  }

  dimension: current_production_hotfix_version_c {
    type: number
    sql: ${TABLE}.current_production_hotfix_version_c ;;
  }

  dimension: current_production_software_version_c {
    type: string
    sql: ${TABLE}.current_production_software_version_c ;;
  }

  dimension: current_staging_c {
    type: string
    sql: ${TABLE}.current_staging_c ;;
  }

  dimension: current_staging_hotfix_version_c {
    type: number
    sql: ${TABLE}.current_staging_hotfix_version_c ;;
  }

  dimension: current_system_annual_cost_c {
    type: number
    sql: ${TABLE}.current_system_annual_cost_c ;;
  }

  dimension: current_term_end_c {
    type: string
    sql: ${TABLE}.current_term_end_c ;;
  }

  dimension: current_term_start_c {
    type: string
    sql: ${TABLE}.current_term_start_c ;;
  }

  dimension: current_ticketing_solution_c {
    type: string
    sql: ${TABLE}.current_ticketing_solution_c ;;
  }

  dimension: unlimited_version {
    type: number
    sql: case when STARTS_WITH(sf_accounts.current_production_software_version_c,'7.')
     then  CAST( SUBSTR(sf_accounts.current_production_software_version_c, 1, 4) AS FLOAT64) end ;;
  }

  dimension: current_version_c {
    type: string
    sql: ${TABLE}.current_version_c ;;
  }

  dimension: customer_code_c {
    type: string
    sql: ${TABLE}.customer_code_c ;;
  }

  dimension: customer_mailing_list_c {
    type: string
    sql: ${TABLE}.customer_mailing_list_c ;;
  }

  dimension: customer_profiling_c {
    type: yesno
    sql: ${TABLE}.customer_profiling_c ;;
  }

  dimension: customer_success_manager_c {
    type: string
    sql: ${TABLE}.customer_success_manager_c ;;
  }

  dimension: customer_success_manager_picklist_c {
    type: string
    sql: ${TABLE}.customer_success_manager_picklist_c ;;
  }

  dimension: customer_tier_c {
    type: string
    sql: ${TABLE}.customer_tier_c ;;
  }

  dimension: customizations_required_c {
    type: yesno
    sql: ${TABLE}.customizations_required_c ;;
  }

  dimension: cybba_c {
    type: yesno
    sql: ${TABLE}.cybba_c ;;
  }

  dimension: cybba_product_c {
    type: string
    sql: ${TABLE}.cybba_product_c ;;
  }

  dimension: data_import_c {
    type: yesno
    sql: ${TABLE}.data_import_c ;;
  }

  dimension: database_size_c {
    type: number
    sql: ${TABLE}.database_size_c ;;
  }

  dimension: dataloader_c {
    type: yesno
    sql: ${TABLE}.dataloader_c ;;
  }

  dimension: db_configuration_type_c {
    type: string
    sql: ${TABLE}.db_configuration_type_c ;;
  }

  dimension: deal_structure_c {
    type: string
    sql: ${TABLE}.deal_structure_c ;;
  }

  dimension: deal_type_f_c {
    type: string
    sql: ${TABLE}.deal_type_f_c ;;
  }

  dimension: dedicated_support_queue_c {
    type: string
    sql: ${TABLE}.dedicated_support_queue_c ;;
  }

  dimension: dedicated_support_rep_c {
    type: string
    sql: ${TABLE}.dedicated_support_rep_c ;;
  }

  dimension: deployment_engineer_c {
    type: string
    sql: ${TABLE}.deployment_engineer_c ;;
  }

  dimension: deployment_engineer_email_c {
    type: string
    sql: ${TABLE}.deployment_engineer_email_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: desk_id_c {
    type: string
    sql: ${TABLE}.desk_id_c ;;
  }

  dimension: desk_id_sync_c {
    type: string
    sql: ${TABLE}.desk_id_sync_c ;;
  }

  dimension: deskscmt_desk_company_id_c {
    type: number
    value_format_name: id
    sql: ${TABLE}.deskscmt_desk_company_id_c ;;
  }

  dimension: deskscmt_desk_migrated_account_c {
    type: yesno
    sql: ${TABLE}.deskscmt_desk_migrated_account_c ;;
  }

  dimension: detailed_support_notes_c {
    type: string
    sql: ${TABLE}.detailed_support_notes_c ;;
  }

  dimension: development_system_c {
    type: string
    sql: ${TABLE}.development_system_c ;;
  }

  dimension: digonex_c {
    type: yesno
    sql: ${TABLE}.digonex_c ;;
  }

  dimension: disk_type_c {
    type: string
    sql: ${TABLE}.disk_type_c ;;
  }

  dimension: division_c {
    type: string
    sql: ${TABLE}.division_c ;;
  }

  dimension: division_university_c {
    type: string
    sql: ${TABLE}.division_university_c ;;
  }

  dimension: dkim_domain_s_c {
    type: string
    sql: ${TABLE}.dkim_domain_s_c ;;
  }

  dimension: donations_incumbent_1_c {
    type: string
    sql: ${TABLE}.donations_incumbent_1_c ;;
  }

  dimension: dupcheck_dc_3_disable_duplicate_check_c {
    type: yesno
    sql: ${TABLE}.dupcheck_dc_3_disable_duplicate_check_c ;;
  }

  dimension: dupcheck_dc_3_index_c {
    type: string
    sql: ${TABLE}.dupcheck_dc_3_index_c ;;
  }

  dimension: dynamic_ticket_templates_c {
    type: yesno
    sql: ${TABLE}.dynamic_ticket_templates_c ;;
  }

  dimension: ein_employer_identification_number_c {
    type: string
    sql: ${TABLE}.ein_employer_identification_number_c ;;
  }

  dimension: email_c {
    type: string
    sql: ${TABLE}.email_c ;;
  }

  dimension: email_marketing_c {
    type: yesno
    sql: ${TABLE}.email_marketing_c ;;
  }

  dimension: email_marketing_incumbent_c {
    type: string
    sql: ${TABLE}.email_marketing_incumbent_c ;;
  }

  dimension: email_overage_rate_c {
    type: string
    sql: ${TABLE}.email_overage_rate_c ;;
  }

  dimension: email_volume_maximum_c {
    type: string
    sql: ${TABLE}.email_volume_maximum_c ;;
  }

  dimension: era_of_contract_ot_c {
    type: string
    sql: ${TABLE}.era_of_contract_ot_c ;;
  }

  dimension: est_annual_volume_c {
    type: number
    sql: ${TABLE}.est_annual_volume_c ;;
  }

  dimension_group: est_ps_completion_date_c {
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
    sql: ${TABLE}.est_ps_completion_date_c ;;
  }

  dimension: event_dates_yr_c {
    type: number
    sql: ${TABLE}.event_dates_yr_c ;;
  }

  dimension: event_month_c {
    type: string
    sql: ${TABLE}.event_month_c ;;
  }

  dimension: events_yr_c {
    type: number
    sql: ${TABLE}.events_yr_c ;;
  }

  dimension: exclusivity_type_ot_c {
    type: string
    sql: ${TABLE}.exclusivity_type_ot_c ;;
  }

  dimension: exhibit_a_non_standard_text_ot_c {
    type: string
    sql: ${TABLE}.exhibit_a_non_standard_text_ot_c ;;
  }

  dimension: facebook_url_c {
    type: string
    sql: ${TABLE}.facebook_url_c ;;
  }

  dimension: facility_management_c {
    type: string
    sql: ${TABLE}.facility_management_c ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: feature_requests_pick_3_only_c {
    type: string
    sql: ${TABLE}.feature_requests_pick_3_only_c ;;
  }

  dimension_group: finacial_year_end_c {
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
    sql: ${TABLE}.finacial_year_end_c ;;
  }

  dimension: fixed_package_comp_fee_c {
    type: number
    sql: ${TABLE}.fixed_package_comp_fee_c ;;
  }

  dimension: flat_flex_package_purchase_fee_ot_c {
    type: number
    sql: ${TABLE}.flat_flex_package_purchase_fee_ot_c ;;
  }

  dimension: flat_flex_package_redemption_fee_ot_c {
    type: number
    sql: ${TABLE}.flat_flex_package_redemption_fee_ot_c ;;
  }

  dimension: flex_package_comp_fee_ot_c {
    type: number
    sql: ${TABLE}.flex_package_comp_fee_ot_c ;;
  }

  dimension: focus_account_c {
    type: yesno
    sql: ${TABLE}.focus_account_c ;;
  }

  dimension_group: former_member_timestamp_c {
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
    sql: ${TABLE}.former_member_timestamp_c ;;
  }

  dimension: fortress_c {
    type: yesno
    sql: ${TABLE}.fortress_c ;;
  }

  dimension: functional_requirements_c {
    type: string
    sql: ${TABLE}.functional_requirements_c ;;
  }

  dimension: fundraising_incumbent_c {
    type: string
    sql: ${TABLE}.fundraising_incumbent_c ;;
  }

  dimension: funds_management_c {
    type: yesno
    sql: ${TABLE}.funds_management_c ;;
  }

  dimension: fy_budgeting_approved_c {
    type: string
    sql: ${TABLE}.fy_budgeting_approved_c ;;
  }

  dimension: fy_budgeting_begins_c {
    type: string
    sql: ${TABLE}.fy_budgeting_begins_c ;;
  }

  dimension: fy_fiscal_c {
    type: string
    sql: ${TABLE}.fy_fiscal_c ;;
  }

  dimension: global_competitor_c {
    type: string
    sql: ${TABLE}.global_competitor_c ;;
  }

  dimension: global_incumbent_ta_c {
    type: string
    sql: ${TABLE}.global_incumbent_ta_c ;;
  }

  dimension: global_incumbent_tl_c {
    type: string
    sql: ${TABLE}.global_incumbent_tl_c ;;
  }

  dimension_group: go_live_date_c {
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
    sql: ${TABLE}.go_live_date_c ;;
  }

  dimension: google_analytics_c {
    type: yesno
    sql: ${TABLE}.google_analytics_c ;;
  }

  dimension: google_tags_manager_c {
    type: yesno
    sql: ${TABLE}.google_tags_manager_c ;;
  }

  dimension: grandfathered_c {
    type: yesno
    sql: ${TABLE}.grandfathered_c ;;
  }

  dimension_group: grandfathered_time_stamp_c {
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
    sql: ${TABLE}.grandfathered_time_stamp_c ;;
  }

  dimension: gross_margin_c {
    type: number
    sql: ${TABLE}.gross_margin_c ;;
  }

  dimension: hardware_summary_c {
    type: string
    sql: ${TABLE}.hardware_summary_c ;;
  }

  dimension: health_reason_notes_c {
    type: string
    sql: ${TABLE}.health_reason_notes_c ;;
  }

  dimension: historic_ticket_volume_1_year_c {
    type: number
    sql: ${TABLE}.historic_ticket_volume_1_year_c ;;
  }

  dimension: historic_ticket_volume_2_years_c {
    type: number
    sql: ${TABLE}.historic_ticket_volume_2_years_c ;;
  }

  dimension: historic_ticket_volume_3_years_c {
    type: number
    sql: ${TABLE}.historic_ticket_volume_3_years_c ;;
  }

  dimension: hosted_c {
    type: yesno
    sql: ${TABLE}.hosted_c ;;
  }

  dimension: hosted_location_c {
    type: string
    sql: ${TABLE}.hosted_location_c ;;
  }

  dimension: hybrid_type_deal_c {
    type: yesno
    sql: ${TABLE}.hybrid_type_deal_c ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: inactive_wot_c {
    type: yesno
    sql: ${TABLE}.inactive_wot_c ;;
  }

  dimension: incumbent_c {
    type: string
    sql: ${TABLE}.incumbent_c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: inferred_annual_revenue_c {
    type: string
    sql: ${TABLE}.inferred_annual_revenue_c ;;
  }

  dimension: inferred_annual_ticket_volume_c {
    type: string
    sql: ${TABLE}.inferred_annual_ticket_volume_c ;;
  }

  dimension: integrations_required_c {
    type: yesno
    sql: ${TABLE}.integrations_required_c ;;
  }

  dimension: invoice_schedule_c {
    type: string
    sql: ${TABLE}.invoice_schedule_c ;;
  }

  dimension: is_customer_portal {
    type: yesno
    sql: ${TABLE}.is_customer_portal ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: jigsaw {
    type: string
    sql: ${TABLE}.jigsaw ;;
  }

  dimension: jigsaw_company_id {
    type: string
    sql: ${TABLE}.jigsaw_company_id ;;
  }

  dimension: jmm_interlinx_c {
    type: yesno
    sql: ${TABLE}.jmm_interlinx_c ;;
  }

  dimension: key_contacts_c {
    type: string
    sql: ${TABLE}.key_contacts_c ;;
  }

  dimension: kiosks_c {
    type: yesno
    sql: ${TABLE}.kiosks_c ;;
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

  dimension_group: last_audited_c {
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
    sql: ${TABLE}.last_audited_c ;;
  }

  dimension_group: last_evaluated_c {
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
    sql: ${TABLE}.last_evaluated_c ;;
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

  dimension_group: last_updated_c {
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
    sql: ${TABLE}.last_updated_c ;;
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

  dimension_group: launch_date_c {
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
    sql: ${TABLE}.launch_date_c ;;
  }

  dimension: lead_source_c {
    type: string
    sql: ${TABLE}.lead_source_c ;;
  }

  dimension: legacy_id_c {
    type: string
    sql: ${TABLE}.legacy_id_c ;;
  }

  dimension: legacy_owner_c {
    type: string
    sql: ${TABLE}.legacy_owner_c ;;
  }

  dimension: legacy_source_c {
    type: string
    sql: ${TABLE}.legacy_source_c ;;
  }

  dimension: license_type_c {
    type: string
    sql: ${TABLE}.license_type_c ;;
  }

  dimension: limits_caps_c {
    type: yesno
    sql: ${TABLE}.limits_caps_c ;;
  }

  dimension: link_only_reference_c {
    type: yesno
    sql: ${TABLE}.link_only_reference_c ;;
  }

  dimension_group: live_date_c {
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
    sql: ${TABLE}.live_date_c ;;
  }

  dimension: live_f_c {
    type: yesno
    sql: ${TABLE}.live_f_c ;;
  }

  dimension_group: live_mode_enabled_c {
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
    sql: ${TABLE}.live_mode_enabled_c ;;
  }

  dimension: low_score_context_c {
    type: string
    sql: ${TABLE}.low_score_context_c ;;
  }

  dimension: maintain_support_c {
    type: yesno
    sql: ${TABLE}.maintain_support_c ;;
  }

  dimension: managed_service_fee_c {
    type: number
    sql: ${TABLE}.managed_service_fee_c ;;
  }

  dimension: market_c {
    type: string
    sql: ${TABLE}.market_c ;;
  }

  dimension: marketing_strategy_c {
    type: string
    sql: ${TABLE}.marketing_strategy_c ;;
  }

  dimension: marquee_c {
    type: yesno
    sql: ${TABLE}.marquee_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: media_market_c {
    type: string
    sql: ${TABLE}.media_market_c ;;
  }

  dimension: memberships_benefits_c {
    type: yesno
    sql: ${TABLE}.memberships_benefits_c ;;
  }

  dimension: merchant_processing_fee_ot_c {
    type: number
    sql: ${TABLE}.merchant_processing_fee_ot_c ;;
  }

  dimension: microsites_c {
    type: yesno
    sql: ${TABLE}.microsites_c ;;
  }

  dimension: misc_items_c {
    type: yesno
    sql: ${TABLE}.misc_items_c ;;
  }

  dimension: mkt_data_fields_c {
    type: yesno
    sql: ${TABLE}.mkt_data_fields_c ;;
  }

  dimension: mobile_c {
    type: yesno
    sql: ${TABLE}.mobile_c ;;
  }

  dimension: model_pricing_c {
    type: yesno
    sql: ${TABLE}.model_pricing_c ;;
  }

  dimension: most_recent_defection_status_c {
    type: string
    sql: ${TABLE}.most_recent_defection_status_c ;;
  }

  dimension_group: ms_expiration_c {
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
    sql: ${TABLE}.ms_expiration_c ;;
  }

  dimension: ms_hours_remaining_c {
    type: number
    sql: ${TABLE}.ms_hours_remaining_c ;;
  }

  dimension: ms_owner_c {
    type: string
    sql: ${TABLE}.ms_owner_c ;;
  }

  dimension: ms_total_hours_c {
    type: number
    sql: ${TABLE}.ms_total_hours_c ;;
  }

  dimension: ms_type_c {
    type: string
    sql: ${TABLE}.ms_type_c ;;
  }

  dimension: my_audience_view_c {
    type: yesno
    sql: ${TABLE}.my_audience_view_c ;;
  }

  dimension: name {
    label: "Client Name"
    type: string
    sql: ${TABLE}.name ;;
#     html:
#     {% if sf_accounts.product_name._value == 'Vendini' %}
# <a href="/dashboards/33?Name={{ value }}"> {{value}}</a>
# {% elsif sf_accounts.product_name._value == 'OvationTix' %}
# <a href="/dashboards/34?Name={{ value }}">{{value }}</a>
# {% elsif sf_accounts.product_name._value == 'AudienceView' %}
# <a href="/dashboards/34?Name={{ value }}">{{value }}</a>
# {% elsif sf_accounts.product_name._value == 'UTix' %}
# <a href="/dashboards/34?Name={{ value }}">{{value }}</a>
# {% elsif sf_accounts.product_name._value == 'UGrad' %}
# <a href="/dashboards/34?Name={{ value }}">{{value }}</a>
# {% endif %};;
    link: {
      label: "Client Overview"
      url: "{% if sf_accounts.product_name._value == 'AudienceView Select' %}/dashboards/49?Client Name={{sf_accounts.name._filterable_value    | url_encode}}
            {% elsif sf_accounts.product_name._value == 'AudienceView Professional' %}/dashboards/47?Client Name={{sf_accounts.name._filterable_value   | url_encode }}
            {% elsif sf_accounts.product_name._value == 'AudienceView Unlimited' %}/dashboards/57?Client Name={{sf_accounts.name._filterable_value | url_encode }}
            {% elsif sf_accounts.product_name._value == 'AudienceView Campus' %}/dashboards/34?Product={{sf_accounts.product_name._value | url_encode }}
            {% elsif sf_accounts.product_name._value == 'AudienceView Grad' %}/dashboards/34?Product={{sf_accounts.product_name._value | url_encode }} {% endif %}"
      icon_url: "https://www.pngfind.com/pngs/m/383-3836953_overview-icon-wp-overview-icon-hd-png-download.png"
    }
    link: {
      label: "Client Insights"
      url:  "{% if sf_accounts.product_name._value == 'AudienceView Select' %}/dashboards/46?Product={{sf_accounts.product_name._value }}&Client Name={{sf_accounts.name._filterable_value   | url_encode}}
            {% elsif sf_accounts.product_name._value == 'AudienceView Professional' %}/dashboards/48?Client Name={{sf_accounts.name._filterable_value  | url_encode  }}
            {% elsif sf_accounts.product_name._value == 'AudienceView Unlimited' %}/dashboards/58?Product Name={{sf_accounts.product_name._filterable_value | ur_encode }}&Client Name={{sf_accounts.name._filterable_value   | url_encode}}
            {% elsif sf_accounts.product_name._value == 'AudienceView Campus' %}/dashboards/34?Product={{sf_accounts.product_name._value }}
            {% elsif sf_accounts.product_name._value == 'AudienceView Grad' %}/dashboards/34?Product={{sf_accounts.product_name._value }} {% endif %}"
      icon_url: "https://st4.depositphotos.com/4799321/26935/v/1600/depositphotos_269359362-stock-illustration-insight-icon-in-transparent-style.jpg"
    }
    link: {
      label: "Return to Client Listing"
      url:  "/dashboards/45"
      icon_url: "https://banner2.cleanpng.com/20180810/hae/kisspng-market-research-digital-marketing-market-analysis-audit-fgms-5b6d379e26d579.4000885615338843181591.jpg"
    }
  }


  dimension: named_account_c {
    type: yesno
    sql: ${TABLE}.named_account_c ;;
  }

  dimension: need_c {
    type: yesno
    sql: ${TABLE}.need_c ;;
  }

  dimension: new_ci_or_legacy_c {
    type: string
    sql: ${TABLE}.new_ci_or_legacy_c ;;
  }

  dimension: new_hardware_required_c {
    type: string
    sql: ${TABLE}.new_hardware_required_c ;;
  }

  dimension: next_step_c {
    type: string
    sql: ${TABLE}.next_step_c ;;
  }

  dimension: next_step_text_c {
    type: string
    sql: ${TABLE}.next_step_text_c ;;
  }

  dimension: no_corporate_marketing_consent_c {
    type: yesno
    sql: ${TABLE}.no_corporate_marketing_consent_c ;;
  }

  dimension: notes_c {
    type: yesno
    sql: ${TABLE}.notes_c ;;
  }

  dimension: notes_copy_c {
    type: string
    sql: ${TABLE}.notes_copy_c ;;
  }

  dimension: notes_customer_c {
    type: yesno
    sql: ${TABLE}.notes_customer_c ;;
  }

  dimension: notes_orders_c {
    type: yesno
    sql: ${TABLE}.notes_orders_c ;;
  }

  dimension: notes_performance_c {
    type: yesno
    sql: ${TABLE}.notes_performance_c ;;
  }

  dimension: notify_account_manager_on_new_calls_c {
    type: yesno
    sql: ${TABLE}.notify_account_manager_on_new_calls_c ;;
  }

  dimension: notify_ba_c {
    type: yesno
    sql: ${TABLE}.notify_ba_c ;;
  }

  dimension: notify_de_c {
    type: yesno
    sql: ${TABLE}.notify_de_c ;;
  }

  dimension: notify_hosting_director_on_all_calls_c {
    type: yesno
    sql: ${TABLE}.notify_hosting_director_on_all_calls_c ;;
  }

  dimension: notify_pm_c {
    type: yesno
    sql: ${TABLE}.notify_pm_c ;;
  }

  dimension: ns_customer_id_c {
    type: string
    sql: ${TABLE}.ns_customer_id_c ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: number_of_seating_charts_required_c {
    type: string
    sql: ${TABLE}.number_of_seating_charts_required_c ;;
  }

  dimension: of_amendments_c {
    type: number
    sql: ${TABLE}.of_amendments_c ;;
  }

  dimension: of_av_conf_regs_incl_c {
    type: number
    sql: ${TABLE}.of_av_conf_regs_incl_c ;;
  }

  dimension: of_events_c {
    type: string
    sql: ${TABLE}.of_events_c ;;
  }

  dimension: of_season_ticket_holders_subscribers_c {
    type: number
    sql: ${TABLE}.of_season_ticket_holders_subscribers_c ;;
  }

  dimension: of_users_c {
    type: number
    sql: ${TABLE}.of_users_c ;;
  }

  dimension: offers_c {
    type: yesno
    sql: ${TABLE}.offers_c ;;
  }

  dimension_group: oldest_invoice_date_account_c {
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
    sql: ${TABLE}.oldest_invoice_date_account_c ;;
  }

  dimension_group: opportunity_close_date_c {
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
    sql: ${TABLE}.opportunity_close_date_c ;;
  }

  dimension: opt_out_of_email_alerts_c {
    type: yesno
    sql: ${TABLE}.opt_out_of_email_alerts_c ;;
  }

  dimension_group: original_contract_date_c {
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
    sql: ${TABLE}.original_contract_date_c ;;
  }

  dimension: original_license_fee_c {
    type: number
    sql: ${TABLE}.original_license_fee_c ;;
  }

  dimension: original_software_version_c {
    type: string
    sql: ${TABLE}.original_software_version_c ;;
  }

  dimension: other_fixed_fee_details_c {
    type: string
    sql: ${TABLE}.other_fixed_fee_details_c ;;
  }

  dimension: other_systems_in_use_c {
    type: string
    sql: ${TABLE}.other_systems_in_use_c ;;
  }

  dimension: other_terms_c {
    type: string
    sql: ${TABLE}.other_terms_c ;;
  }

  dimension: other_vendors_c {
    type: string
    sql: ${TABLE}.other_vendors_c ;;
  }

  dimension: outstanding_credits_c {
    type: string
    sql: ${TABLE}.outstanding_credits_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: ownership {
    type: string
    sql: ${TABLE}.ownership ;;
  }

  dimension: packages_and_memberships_c {
    type: string
    sql: ${TABLE}.packages_and_memberships_c ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: passes_c {
    type: yesno
    sql: ${TABLE}.passes_c ;;
  }

  dimension: patron_support_notes_c {
    type: string
    sql: ${TABLE}.patron_support_notes_c ;;
  }

  dimension: patron_support_services_c {
    type: string
    sql: ${TABLE}.patron_support_services_c ;;
  }

  dimension: pay_pal_ec_c {
    type: yesno
    sql: ${TABLE}.pay_pal_ec_c ;;
  }

  dimension: payment_gateway_c {
    type: string
    sql: ${TABLE}.payment_gateway_c ;;
  }

  dimension: payment_processor_c {
    type: string
    sql: ${TABLE}.payment_processor_c ;;
  }

  dimension: payment_schedule_details_ot_c {
    type: string
    sql: ${TABLE}.payment_schedule_details_ot_c ;;
  }

  dimension: payout_method_c_c {
    type: string
    sql: ${TABLE}.payout_method_c_c ;;
  }

  dimension: pendo_desktop_c {
    type: string
    sql: ${TABLE}.pendo_desktop_c ;;
  }

  dimension_group: pendo_lastvisit_last_30_d_c {
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
    sql: ${TABLE}.pendo_lastvisit_last_30_d_c ;;
  }

  dimension: pendo_nps_account_c {
    type: number
    sql: ${TABLE}.pendo_nps_account_c ;;
  }

  dimension: pendo_numberofvisitors_last_30_d_c {
    type: number
    sql: ${TABLE}.pendo_numberofvisitors_last_30_d_c ;;
  }

  dimension: pendo_timeonsite_last_30_d_c {
    type: number
    sql: ${TABLE}.pendo_timeonsite_last_30_d_c ;;
  }

  dimension: per_unit_fee_c {
    type: number
    sql: ${TABLE}.per_unit_fee_c ;;
  }

  dimension: permissible_comps_c {
    type: string
    sql: ${TABLE}.permissible_comps_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: pinpad_models_c {
    type: string
    sql: ${TABLE}.pinpad_models_c ;;
  }

  dimension: po_required_c {
    type: yesno
    sql: ${TABLE}.po_required_c ;;
  }

  dimension: point_of_sale_c {
    type: string
    sql: ${TABLE}.point_of_sale_c ;;
  }

  dimension: pos_c {
    type: yesno
    sql: ${TABLE}.pos_c ;;
  }

  dimension: preferred_language_c {
    type: string
    sql: ${TABLE}.preferred_language_c ;;
  }

  dimension: previous_system_c {
    type: string
    sql: ${TABLE}.previous_system_c ;;
  }

  dimension: price_range_c {
    type: string
    sql: ${TABLE}.price_range_c ;;
  }

  dimension: procurement_process_c {
    type: string
    sql: ${TABLE}.procurement_process_c ;;
  }

  dimension: product_c {
    type: string
    sql: ${TABLE}.product_c ;;
  }

  dimension: product_fit_c {
    type: string
    sql: ${TABLE}.product_fit_c ;;
  }

  dimension: product_interest_accounts_c {
    type: string
    sql: ${TABLE}.product_interest_accounts_c ;;
  }

  dimension: production_ticketing_website_c {
    type: string
    sql: ${TABLE}.production_ticketing_website_c ;;
  }

  dimension: production_version_url_c {
    type: string
    sql: ${TABLE}.production_version_url_c ;;
  }

  dimension: prof_services_c {
    type: number
    sql: ${TABLE}.prof_services_c ;;
  }

  dimension: professional_organizations_c {
    type: string
    sql: ${TABLE}.professional_organizations_c ;;
  }

  dimension: project_manager_c {
    type: string
    sql: ${TABLE}.project_manager_c ;;
  }

  dimension: project_manager_email_c {
    type: string
    sql: ${TABLE}.project_manager_email_c ;;
  }

  dimension: promotions_c {
    type: yesno
    sql: ${TABLE}.promotions_c ;;
  }

  dimension: prospect_type_c {
    type: string
    sql: ${TABLE}.prospect_type_c ;;
  }

  dimension: ps_day_rate_c {
    type: number
    sql: ${TABLE}.ps_day_rate_c ;;
  }

  dimension_group: ps_day_rate_increase_date_c {
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
    sql: ${TABLE}.ps_day_rate_increase_date_c ;;
  }

  dimension: ps_day_rate_remarks_c {
    type: string
    sql: ${TABLE}.ps_day_rate_remarks_c ;;
  }

  dimension_group: ps_day_rate_review_date_c {
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
    sql: ${TABLE}.ps_day_rate_review_date_c ;;
  }

  dimension: purchasing_roles_c {
    type: string
    sql: ${TABLE}.purchasing_roles_c ;;
  }

  dimension: purple_seven_c {
    type: yesno
    sql: ${TABLE}.purple_seven_c ;;
  }

  dimension: py_client_revenue_c {
    type: number
    sql: ${TABLE}.py_client_revenue_c ;;
  }

  dimension: qas_c {
    type: yesno
    sql: ${TABLE}.qas_c ;;
  }

  dimension: qualified_c {
    type: string
    sql: ${TABLE}.qualified_c ;;
  }

  dimension: questions_c {
    type: yesno
    sql: ${TABLE}.questions_c ;;
  }

  dimension: queue_it_c {
    type: yesno
    sql: ${TABLE}.queue_it_c ;;
  }

  dimension: radar_link_c {
    type: string
    sql: ${TABLE}.radar_link_c ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension: reason_for_ci_or_legacy_c {
    type: string
    sql: ${TABLE}.reason_for_ci_or_legacy_c ;;
  }

  dimension: reason_for_go_live_c {
    type: string
    sql: ${TABLE}.reason_for_go_live_c ;;
  }

  dimension: reason_for_health_status_c {
    type: string
    sql: ${TABLE}.reason_for_health_status_c ;;
  }

  dimension: reason_for_search_c {
    type: string
    sql: ${TABLE}.reason_for_search_c ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: record_type {
    label: "Record Type"
    sql:case when ${TABLE}.record_type_id =   '0124T000000UCh9QAG' THEN 'AudienceView'
          WHEN ${TABLE}.record_type_id = '0124T000000UChJQAW' THEN 'Vendini'
          WHEN ${TABLE}.record_type_id = '0124T000000UChEQAW' THEN 'OvationTix'
          WHEN ${TABLE}.record_type_id = '0124T000000UD5pQAG' THEN 'Partner'
          WHEN ${TABLE}.record_type_id = '0124T000000UCiqQAG' THEN 'Prospect'
          ELSE 'Research' END;;
  }

  dimension: reference_information_c {
    type: string
    sql: ${TABLE}.reference_information_c ;;
  }

  dimension: reference_status_c {
    type: string
    sql: ${TABLE}.reference_status_c ;;
  }

  dimension: referenceability_c {
    type: string
    sql: ${TABLE}.referenceability_c ;;
  }

  dimension: renewal_executive_sponsor_c {
    type: string
    sql: ${TABLE}.renewal_executive_sponsor_c ;;
  }

  dimension: renewal_status_c {
    type: string
    sql: ${TABLE}.renewal_status_c ;;
  }

  dimension: renewal_strategy_c {
    type: string
    sql: ${TABLE}.renewal_strategy_c ;;
  }

  dimension_group: renewal_target_close_c {
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
    sql: ${TABLE}.renewal_target_close_c ;;
  }

  dimension: renewal_termination_autorenew_terms_c {
    type: string
    sql: ${TABLE}.renewal_termination_autorenew_terms_c ;;
  }

  dimension: renewal_utility_c {
    type: yesno
    sql: ${TABLE}.renewal_utility_c ;;
  }

  dimension: replicated_database_c {
    type: yesno
    sql: ${TABLE}.replicated_database_c ;;
  }

  dimension: replicated_db_use_case_c {
    type: string
    sql: ${TABLE}.replicated_db_use_case_c ;;
  }

  dimension: reserve_terms_c {
    type: string
    sql: ${TABLE}.reserve_terms_c ;;
  }

  dimension: revenue_health_status_c {
    type: string
    sql: ${TABLE}.revenue_health_status_c ;;
  }

  dimension: saas_mrr_f_c {
    type: yesno
    sql: ${TABLE}.saas_mrr_f_c ;;
  }

  dimension: sales_quarter_c {
    type: string
    sql: ${TABLE}.sales_quarter_c ;;
  }

  dimension: scanning_c {
    type: yesno
    sql: ${TABLE}.scanning_c ;;
  }

  dimension: scheduled_reports_c {
    type: yesno
    sql: ${TABLE}.scheduled_reports_c ;;
  }

  dimension: score_commercial_c {
    type: number
    sql: ${TABLE}.score_commercial_c ;;
  }

  dimension: score_quality_c {
    type: number
    sql: ${TABLE}.score_quality_c ;;
  }

  dimension: score_relationship_c {
    type: number
    sql: ${TABLE}.score_relationship_c ;;
  }

  dimension: score_solution_c {
    type: number
    sql: ${TABLE}.score_solution_c ;;
  }

  dimension: score_value_c {
    type: number
    sql: ${TABLE}.score_value_c ;;
  }

  dimension: seating_type_c {
    type: string
    sql: ${TABLE}.seating_type_c ;;
  }

  dimension: secondary_payment_gateway_c {
    type: string
    sql: ${TABLE}.secondary_payment_gateway_c ;;
  }

  dimension: segment_c {
    type: string
    sql: ${TABLE}.segment_c ;;
  }

  dimension: segment_new_c {
    type: string
    sql: ${TABLE}.segment_new_c ;;
  }

  dimension: server_type_c {
    type: string
    sql: ${TABLE}.server_type_c ;;
  }

  dimension: service_charge_structure_c {
    type: string
    sql: ${TABLE}.service_charge_structure_c ;;
  }

  dimension: setup_fee_c {
    type: number
    sql: ${TABLE}.setup_fee_c ;;
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shipping_city ;;
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shipping_country ;;
  }

  dimension: shipping_geocode_accuracy {
    type: string
    sql: ${TABLE}.shipping_geocode_accuracy ;;
  }

  dimension: shipping_latitude {
    type: number
    sql: ${TABLE}.shipping_latitude ;;
  }

  dimension: shipping_longitude {
    type: number
    sql: ${TABLE}.shipping_longitude ;;
  }

  dimension: shipping_postal_code {
    type: string
    sql: ${TABLE}.shipping_postal_code ;;
  }

  dimension: shipping_state {
    type: string
    sql: ${TABLE}.shipping_state ;;
  }

  dimension: shipping_street {
    type: string
    sql: ${TABLE}.shipping_street ;;
  }

  dimension: sic {
    type: string
    sql: ${TABLE}.sic ;;
  }

  dimension: sic_desc {
    type: string
    sql: ${TABLE}.sic_desc ;;
  }

  dimension: single_ticket_comp_fee_ot_c {
    type: number
    sql: ${TABLE}.single_ticket_comp_fee_ot_c ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: site_ops_c {
    type: yesno
    sql: ${TABLE}.site_ops_c ;;
  }

  dimension: skidata_c {
    type: yesno
    sql: ${TABLE}.skidata_c ;;
  }

  dimension: sla_c {
    type: string
    sql: ${TABLE}.sla_c ;;
  }

  dimension: source_comments_c {
    type: string
    sql: ${TABLE}.source_comments_c ;;
  }

  dimension: sourced_by_program_channel_c {
    type: string
    sql: ${TABLE}.sourced_by_program_channel_c ;;
  }

  dimension_group: sourced_by_program_date_time_c {
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
    sql: ${TABLE}.sourced_by_program_date_time_c ;;
  }

  dimension: sourced_by_program_group_c {
    type: string
    sql: ${TABLE}.sourced_by_program_group_c ;;
  }

  dimension: sourced_by_program_insight_c {
    type: string
    sql: ${TABLE}.sourced_by_program_insight_c ;;
  }

  dimension: sourced_by_program_name_c {
    type: string
    sql: ${TABLE}.sourced_by_program_name_c ;;
  }

  dimension: sourced_by_program_vertical_c {
    type: string
    sql: ${TABLE}.sourced_by_program_vertical_c ;;
  }

  dimension: sourced_by_tactic_campaign_c {
    type: string
    sql: ${TABLE}.sourced_by_tactic_campaign_c ;;
  }

  dimension: sourced_by_tactic_content_c {
    type: string
    sql: ${TABLE}.sourced_by_tactic_content_c ;;
  }

  dimension_group: sourced_by_tactic_date_time_c {
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
    sql: ${TABLE}.sourced_by_tactic_date_time_c ;;
  }

  dimension: sourced_by_tactic_medium_c {
    type: string
    sql: ${TABLE}.sourced_by_tactic_medium_c ;;
  }

  dimension: sourced_by_tactic_source_c {
    type: string
    sql: ${TABLE}.sourced_by_tactic_source_c ;;
  }

  dimension: sourced_by_tactic_term_c {
    type: string
    sql: ${TABLE}.sourced_by_tactic_term_c ;;
  }

  dimension: sql_version_c {
    type: string
    sql: ${TABLE}.sql_version_c ;;
  }

  dimension: staffing_structure_c {
    type: string
    sql: ${TABLE}.staffing_structure_c ;;
  }

  dimension: staging_version_url_c {
    type: string
    sql: ${TABLE}.staging_version_url_c ;;
  }

  dimension_group: started_on_boarding_date_c {
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
    sql: ${TABLE}.started_on_boarding_date_c ;;
  }

  dimension: state_province_of_jurisdiction_c {
    type: string
    sql: ${TABLE}.state_province_of_jurisdiction_c ;;
  }

  dimension: still_in_test_mode_c {
    type: yesno
    sql: ${TABLE}.still_in_test_mode_c ;;
  }

  dimension: stored_value_items_c {
    type: yesno
    sql: ${TABLE}.stored_value_items_c ;;
  }

  dimension: strategic_account_c {
    type: yesno
    sql: ${TABLE}.strategic_account_c ;;
  }

  dimension: stub_hub_c {
    type: yesno
    sql: ${TABLE}.stub_hub_c ;;
  }

  dimension_group: stub_hub_go_live_date_c {
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
    sql: ${TABLE}.stub_hub_go_live_date_c ;;
  }

  dimension: sub_category_c {
    type: string
    sql: ${TABLE}.sub_category_c ;;
  }

  dimension: sub_segment_c {
    type: string
    sql: ${TABLE}.sub_segment_c ;;
  }

  dimension_group: support_expiration_date_c {
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
    sql: ${TABLE}.support_expiration_date_c ;;
  }

  dimension: support_notes_c {
    type: string
    sql: ${TABLE}.support_notes_c ;;
  }

  dimension: support_squad_email_c {
    type: string
    sql: ${TABLE}.support_squad_email_c ;;
  }

  dimension: sync_to_desk_c {
    type: yesno
    sql: ${TABLE}.sync_to_desk_c ;;
  }

  dimension: sync_to_desk_picklist_c {
    type: string
    sql: ${TABLE}.sync_to_desk_picklist_c ;;
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

  dimension: ta_fee_schedule_c {
    type: string
    sql: ${TABLE}.ta_fee_schedule_c ;;
  }

  dimension: ta_gateway_c {
    type: string
    sql: ${TABLE}.ta_gateway_c ;;
  }

  dimension: target_account_c {
    type: yesno
    sql: ${TABLE}.target_account_c ;;
  }

  dimension: target_priority_c {
    type: string
    sql: ${TABLE}.target_priority_c ;;
  }

  dimension: term_f_c {
    type: number
    sql: ${TABLE}.term_f_c ;;
  }

  dimension: term_years_c {
    type: number
    sql: ${TABLE}.term_years_c ;;
  }

  dimension: termination_notice_period_c {
    type: string
    sql: ${TABLE}.termination_notice_period_c ;;
  }

  dimension: territory_code_c {
    type: string
    sql: ${TABLE}.territory_code_c ;;
  }

  dimension: theater_mania_affiliate_program_c {
    type: yesno
    sql: ${TABLE}.theater_mania_affiliate_program_c ;;
  }

  dimension: theater_mania_status_c {
    type: string
    sql: ${TABLE}.theater_mania_status_c ;;
  }

  dimension: ticker_symbol {
    type: string
    sql: ${TABLE}.ticker_symbol ;;
  }

  dimension: ticket_fees_c {
    type: number
    sql: ${TABLE}.ticket_fees_c ;;
  }

  dimension: ticket_program_services_revneue_c {
    type: number
    sql: ${TABLE}.ticket_program_services_revneue_c ;;
  }

  dimension: ticket_volume_c {
    type: number
    sql: ${TABLE}.ticket_volume_c ;;
  }

  dimension: tickets_per_year_c {
    type: number
    sql: ${TABLE}.tickets_per_year_c ;;
  }

  dimension: tickets_sold_per_month_c {
    type: string
    sql: ${TABLE}.tickets_sold_per_month_c ;;
  }

  dimension: time_zone_c {
    type: string
    sql: ${TABLE}.time_zone_c ;;
  }

  dimension: timeline_c {
    type: yesno
    sql: ${TABLE}.timeline_c ;;
  }

  dimension_group: timeline_for_go_live_c {
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
    sql: ${TABLE}.timeline_for_go_live_c ;;
  }

  dimension_group: timeline_for_purchase_c {
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
    sql: ${TABLE}.timeline_for_purchase_c ;;
  }

  dimension: timezone_c {
    type: string
    sql: ${TABLE}.timezone_c ;;
  }

  dimension: tkts_c {
    type: string
    sql: ${TABLE}.tkts_c ;;
  }

  dimension: tkts_fee_c {
    type: string
    sql: ${TABLE}.tkts_fee_c ;;
  }

  dimension: tl_fee_schedule_c {
    type: string
    sql: ${TABLE}.tl_fee_schedule_c ;;
  }

  dimension: tl_gateway_c {
    type: string
    sql: ${TABLE}.tl_gateway_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: type_global_c {
    type: string
    sql: ${TABLE}.type_global_c ;;
  }

  dimension: type_media_c {
    type: string
    sql: ${TABLE}.type_media_c ;;
  }

  dimension: uk_region_c {
    type: string
    sql: ${TABLE}.uk_region_c ;;
  }

  dimension: unit_exceptions_c {
    type: string
    sql: ${TABLE}.unit_exceptions_c ;;
  }

  dimension: upgrade_cycle_notes_c {
    type: string
    sql: ${TABLE}.upgrade_cycle_notes_c ;;
  }

  dimension: upgrades_included_c {
    type: string
    sql: ${TABLE}.upgrades_included_c ;;
  }

  dimension: using_ovation_tix_call_center_c {
    type: string
    sql: ${TABLE}.using_ovation_tix_call_center_c ;;
  }

  dimension: utilities_c {
    type: yesno
    sql: ${TABLE}.utilities_c ;;
  }

  dimension: vam_member_id_c {
    type: string
    sql: ${TABLE}.vam_member_id_c ;;
  }

  dimension: vendini_per_ticket_revenue_c {
    type: number
    sql: ${TABLE}.vendini_per_ticket_revenue_c ;;
  }

  dimension: venue_capacity_c {
    type: string
    sql: ${TABLE}.venue_capacity_c ;;
  }

  dimension: venue_configuration_c {
    type: yesno
    sql: ${TABLE}.venue_configuration_c ;;
  }

  dimension: version_7_upgrade_project_manager_c {
    type: string
    sql: ${TABLE}.version_7_upgrade_project_manager_c ;;
  }

  dimension_group: version_7_upgrade_start_date_c {
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
    sql: ${TABLE}.version_7_upgrade_start_date_c ;;
  }

  dimension: vertical_new_c {
    type: string
    sql: ${TABLE}.vertical_new_c ;;
  }

  dimension: vivid_seats_c {
    type: yesno
    sql: ${TABLE}.vivid_seats_c ;;
  }

  dimension: want_to_use_c {
    type: string
    sql: ${TABLE}.want_to_use_c ;;
  }

  dimension: web_api_c {
    type: yesno
    sql: ${TABLE}.web_api_c ;;
  }

  dimension: web_service_fee_ceiling_ot_c {
    type: number
    sql: ${TABLE}.web_service_fee_ceiling_ot_c ;;
  }

  dimension: web_service_fee_floor_ot_c {
    type: number
    sql: ${TABLE}.web_service_fee_floor_ot_c ;;
  }

  dimension: web_service_fee_ot_c {
    type: number
    sql: ${TABLE}.web_service_fee_ot_c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: website_manager_url_c {
    type: string
    sql: ${TABLE}.website_manager_url_c ;;
  }

  dimension: what_software_they_using_and_for_what_c {
    type: string
    sql: ${TABLE}.what_software_they_using_and_for_what_c ;;
  }

  dimension: why_they_chose_us_why_we_lost_c {
    type: string
    sql: ${TABLE}.why_they_chose_us_why_we_lost_c ;;
  }

  dimension: wiki_page_c {
    type: string
    sql: ${TABLE}.wiki_page_c ;;
  }

  dimension: will_they_be_printing_tickets_c {
    type: string
    sql: ${TABLE}.will_they_be_printing_tickets_c ;;
  }

  dimension: won_current_year_all_children_c {
    type: number
    sql: ${TABLE}.won_current_year_all_children_c ;;
  }

  dimension: won_current_year_c {
    type: number
    sql: ${TABLE}.won_current_year_c ;;
  }

  dimension: x_2013_survey_response_c {
    type: yesno
    sql: ${TABLE}.x_2013_survey_response_c ;;
  }

  dimension: x_3_d_digital_venue_c {
    type: yesno
    sql: ${TABLE}.x_3_d_digital_venue_c ;;
  }

  dimension: x_3_rd_party_email_provider_c {
    type: string
    sql: ${TABLE}.x_3_rd_party_email_provider_c ;;
  }

  dimension: x_3_rd_party_website_hosting_c {
    type: string
    sql: ${TABLE}.x_3_rd_party_website_hosting_c ;;
  }

  dimension: x_501_c_3_c {
    type: yesno
    sql: ${TABLE}.x_501_c_3_c ;;
  }

  measure: count {
    type: count
    drill_fields: [name, product_name,unlimited_version]
  }
}
