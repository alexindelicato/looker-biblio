view: sf_opportunity {
  sql_table_name: new_salesforce.opportunity ;;

measure: count {
  type: count
  drill_fields: [detail*]
}

  measure: count_won_bti {
    type: count
    drill_fields: [detail*]
    filters: {
      field: name
      value: "%BTI 2020%"
    }
    filters: {
      field: stage_name
      value: "Closed Won"
    }
  }

  measure: count_bti {
    type: count
    drill_fields: [detail*]
    filters: {
      field: name
      value: "%BTI 2020%"
    }
  }

  measure: acv_sum {
    type: sum
    value_format_name: usd
    sql: CASE
          WHEN ${TABLE}.currency_iso_code = 'CAD' THEN ${TABLE}.amount  * 0.76
          WHEN ${TABLE}.currency_iso_code = 'COP' THEN ${TABLE}.amount  * 0.00029
          WHEN ${TABLE}.currency_iso_code = 'GBP' THEN ${TABLE}.amount  * 1.32
          WHEN ${TABLE}.currency_iso_code = 'PHP' THEN ${TABLE}.amount  * 0.020
          WHEN ${TABLE}.currency_iso_code = 'USD' THEN ${TABLE}.amount  * 1
          ELSE 0
      END ;;
    filters: {
      field: name
      value: "%BTI 2020%"
    }
    filters: {
      field: stage_name
      value: "Closed Won"
    }
    drill_fields: [detail*]
  }

  measure: acv_sum_lost {
    type: sum
    value_format_name: usd
    sql: CASE
          WHEN ${TABLE}.currency_iso_code = 'CAD' THEN ${sf_bti.actual_2019_total_fee_revenue_c}  * 0.76
          WHEN ${TABLE}.currency_iso_code = 'COP' THEN ${sf_bti.actual_2019_total_fee_revenue_c}  * 0.00029
          WHEN ${TABLE}.currency_iso_code = 'GBP' THEN ${sf_bti.actual_2019_total_fee_revenue_c}  * 1.32
          WHEN ${TABLE}.currency_iso_code = 'PHP' THEN ${sf_bti.actual_2019_total_fee_revenue_c}  * 0.020
          WHEN ${TABLE}.currency_iso_code = 'USD' THEN ${sf_bti.actual_2019_total_fee_revenue_c}  * 1
          ELSE 0
      END ;;
    filters: {
      field: name
      value: "%BTI 2020%"
    }
    filters: {
      field: stage_name
      value: "Closed Lost"
    }
    drill_fields: [detail*]
  }

  measure: acv_total_2019 {
    type: number
    value_format_name: usd
    sql: 22000000 ;;
  }

dimension: id {
  type: string
  primary_key: yes
  sql: ${TABLE}.id ;;
}

dimension_group: _fivetran_synced {
  type: time
  sql: ${TABLE}._fivetran_synced ;;
}

dimension: account_id {
  type: string
  sql: ${TABLE}.account_id ;;
}

dimension: activity_id_c {
  type: string
  sql: ${TABLE}.activity_id_c ;;
}

dimension: actual_core_productization_days_c {
  type: number
  sql: ${TABLE}.actual_core_productization_days_c ;;
}

dimension_group: actual_launch_date_c {
  type: time
  sql: ${TABLE}.actual_launch_date_c ;;
}

dimension_group: actual_project_go_live_date_c {
  type: time
  sql: ${TABLE}.actual_project_go_live_date_c ;;
}

dimension_group: actual_project_start_date_c {
  type: time
  sql: ${TABLE}.actual_project_start_date_c ;;
}

dimension: actual_ps_days_c {
  type: number
  sql: ${TABLE}.actual_ps_days_c ;;
}

dimension: actual_upgrade_script_days_c {
  type: number
  sql: ${TABLE}.actual_upgrade_script_days_c ;;
}

dimension_group: acv_effective_date_c {
  type: time
  sql: ${TABLE}.acv_effective_date_c ;;
}

dimension: acv_history_tracking_c {
  type: number
  sql: ${TABLE}.acv_history_tracking_c ;;
}

dimension: additional_info_c {
  type: string
  sql: ${TABLE}.additional_info_c ;;
}

dimension: agree_information_is_accurate_c {
  type: string
  sql: ${TABLE}.agree_information_is_accurate_c ;;
}

dimension: amount {
  type: number
  value_format_name: usd
  sql: ${TABLE}.amount ;;
}

dimension: ancillary_ps_days_c {
  type: number
  sql: ${TABLE}.ancillary_ps_days_c ;;
}

dimension: ancillary_ps_price_c {
  type: number
  sql: ${TABLE}.ancillary_ps_price_c ;;
}

dimension: ancillary_ps_type_c {
  type: string
  sql: ${TABLE}.ancillary_ps_type_c ;;
}

dimension: annual_hosting_fees_c {
  type: number
  sql: ${TABLE}.annual_hosting_fees_c ;;
}

dimension: annual_paid_tickets_c {
  type: number
  sql: ${TABLE}.annual_paid_tickets_c ;;
}

dimension: annual_support_fees_c {
  type: number
  sql: ${TABLE}.annual_support_fees_c ;;
}

dimension: annual_ticket_volume_c {
  type: number
  sql: ${TABLE}.annual_ticket_volume_c ;;
}

dimension: annual_volume_c {
  type: number
  sql: ${TABLE}.annual_volume_c ;;
}

dimension: approved_by_c {
  type: string
  sql: ${TABLE}.approved_by_c ;;
}

dimension: arr_c {
  type: number
  sql: ${TABLE}.arr_c ;;
}

dimension: at_risk_c {
  type: string
  sql: ${TABLE}.at_risk_c ;;
}

dimension: authority_c {
  type: string
  sql: ${TABLE}.authority_c ;;
}

dimension: av_com_av_go_free_tickets_c {
  type: number
  sql: ${TABLE}.av_com_av_go_free_tickets_c ;;
}

dimension: av_com_av_go_paid_tickets_c {
  type: number
  sql: ${TABLE}.av_com_av_go_paid_tickets_c ;;
}

dimension: av_com_av_go_revenue_c {
  type: number
  sql: ${TABLE}.av_com_av_go_revenue_c ;;
}

dimension: av_com_av_go_sales_c {
  type: number
  sql: ${TABLE}.av_com_av_go_sales_c ;;
}

dimension: av_community_opportunity_amount_c {
  type: number
  sql: ${TABLE}.av_community_opportunity_amount_c ;;
}

dimension: av_to_ov_c {
  type: string
  sql: ${TABLE}.av_to_ov_c ;;
}

dimension: average_ticket_fee_c {
  type: number
  sql: ${TABLE}.average_ticket_fee_c ;;
}

dimension: average_ticket_value_c {
  type: number
  sql: ${TABLE}.average_ticket_value_c ;;
}

dimension: avg_ticket_price_1_c {
  type: number
  sql: ${TABLE}.avg_ticket_price_1_c ;;
}

dimension: avg_ticket_price_2_c {
  type: number
  sql: ${TABLE}.avg_ticket_price_2_c ;;
}

dimension: avg_ticket_price_3_c {
  type: number
  sql: ${TABLE}.avg_ticket_price_3_c ;;
}

dimension: avg_tickets_sold_1_c {
  type: number
  sql: ${TABLE}.avg_tickets_sold_1_c ;;
}

dimension: avg_tickets_sold_2_c {
  type: number
  sql: ${TABLE}.avg_tickets_sold_2_c ;;
}

dimension: avg_tickets_sold_3_c {
  type: number
  sql: ${TABLE}.avg_tickets_sold_3_c ;;
}

dimension: awarded_c {
  type: string
  sql: ${TABLE}.awarded_c ;;
}

dimension: bdr_c {
  type: string
  sql: ${TABLE}.bdr_c ;;
}

dimension: budget_c {
  type: string
  sql: ${TABLE}.budget_c ;;
}

dimension: budget_confirmed_c {
  type: string
  sql: ${TABLE}.budget_confirmed_c ;;
}

dimension: budget_core_productization_days_c {
  type: number
  sql: ${TABLE}.budget_core_productization_days_c ;;
}

dimension: budget_ps_days_c {
  type: number
  sql: ${TABLE}.budget_ps_days_c ;;
}

dimension: budget_upgrade_script_days_c {
  type: number
  sql: ${TABLE}.budget_upgrade_script_days_c ;;
}

dimension: business_objectives_c {
  type: string
  sql: ${TABLE}.business_objectives_c ;;
}

dimension: called_signed_c {
  type: string
  sql: ${TABLE}.called_signed_c ;;
}

dimension: campaign_id {
  type: string
  sql: ${TABLE}.campaign_id ;;
}

dimension: capacity_c {
  type: number
  sql: ${TABLE}.capacity_c ;;
}

dimension: capacity_format_c {
  type: string
  sql: ${TABLE}.capacity_format_c ;;
}

dimension: catering_c {
  type: string
  sql: ${TABLE}.catering_c ;;
}

dimension_group: close_date {
  type: time
  sql: ${TABLE}.close_date ;;
}

dimension: closest_competitor_c {
  type: string
  sql: ${TABLE}.closest_competitor_c ;;
}

dimension: compelling_event_c {
  type: string
  sql: ${TABLE}.compelling_event_c ;;
}

dimension: contact_c {
  type: string
  sql: ${TABLE}.contact_c ;;
}

dimension: contract_id {
  type: string
  sql: ${TABLE}.contract_id ;;
}

dimension: contract_is_auto_renew_c {
  type: string
  sql: ${TABLE}.contract_is_auto_renew_c ;;
}

dimension: contract_manager_notes_c {
  type: string
  sql: ${TABLE}.contract_manager_notes_c ;;
}

dimension: contract_process_stage_c {
  type: string
  sql: ${TABLE}.contract_process_stage_c ;;
}

dimension: contract_required_del_c {
  type: string
  sql: ${TABLE}.contract_required_del_c ;;
}

dimension: contract_term_in_months_c {
  type: number
  sql: ${TABLE}.contract_term_in_months_c ;;
}

dimension: contract_term_length_c {
  type: string
  sql: ${TABLE}.contract_term_length_c ;;
}

dimension: converted_from_lead_c {
  type: string
  sql: ${TABLE}.converted_from_lead_c ;;
}

dimension: created_by_form_assembly_c {
  type: string
  sql: ${TABLE}.created_by_form_assembly_c ;;
}

dimension: created_by_id {
  type: string
  sql: ${TABLE}.created_by_id ;;
}

dimension: created_by_isr_c {
  type: string
  sql: ${TABLE}.created_by_isr_c ;;
}

dimension_group: created_by_marketing_acquisition_date_c {
  type: time
  sql: ${TABLE}.created_by_marketing_acquisition_date_c ;;
}

dimension_group: created_date {
  type: time
  sql: ${TABLE}.created_date ;;
}

dimension: ct_additional_fee_info_c {
  type: string
  sql: ${TABLE}.ct_additional_fee_info_c ;;
}

dimension: ct_additional_terms_c {
  type: string
  sql: ${TABLE}.ct_additional_terms_c ;;
}

dimension: ct_comments_c {
  type: string
  sql: ${TABLE}.ct_comments_c ;;
}

dimension: ct_contact_role_c {
  type: string
  sql: ${TABLE}.ct_contact_role_c ;;
}

dimension_group: ct_contract_end_date_c {
  type: time
  sql: ${TABLE}.ct_contract_end_date_c ;;
}

dimension_group: ct_contract_start_date_c {
  type: time
  sql: ${TABLE}.ct_contract_start_date_c ;;
}

dimension: ct_license_type_c {
  type: string
  sql: ${TABLE}.ct_license_type_c ;;
}

dimension: ct_min_revenue_committed_over_contract_c {
  type: number
  sql: ${TABLE}.ct_min_revenue_committed_over_contract_c ;;
}

dimension: ct_min_ticket_w_fees_committed_c {
  type: number
  sql: ${TABLE}.ct_min_ticket_w_fees_committed_c ;;
}

dimension: ct_new_type_c {
  type: string
  sql: ${TABLE}.ct_new_type_c ;;
}

dimension: ct_opportunity_lead_source_c {
  type: string
  sql: ${TABLE}.ct_opportunity_lead_source_c ;;
}

dimension: ct_record_id_c {
  type: string
  sql: ${TABLE}.ct_record_id_c ;;
}

dimension: ct_record_type_name_c {
  type: string
  sql: ${TABLE}.ct_record_type_name_c ;;
}

dimension_group: ct_renewal_date_c {
  type: time
  sql: ${TABLE}.ct_renewal_date_c ;;
}

dimension: currency_iso_code {
  type: string
  sql: ${TABLE}.currency_iso_code ;;
}

dimension: current_annual_contract_value_c {
  type: number
  sql: ${TABLE}.current_annual_contract_value_c ;;
}

dimension: current_take_rate_c {
  type: number
  sql: ${TABLE}.current_take_rate_c ;;
}

dimension: custom_dev_confidence_indicator_c {
  type: string
  sql: ${TABLE}.custom_dev_confidence_indicator_c ;;
}

dimension: custom_dev_days_c {
  type: number
  sql: ${TABLE}.custom_dev_days_c ;;
}

dimension: custom_dev_price_c {
  type: number
  sql: ${TABLE}.custom_dev_price_c ;;
}

dimension: dataloader_tag_c {
  type: string
  sql: ${TABLE}.dataloader_tag_c ;;
}

dimension_group: date_submitted_by_form_assembly_c {
  type: time
  sql: ${TABLE}.date_submitted_by_form_assembly_c ;;
}

dimension_group: date_time_submitted_by_form_assembly_c {
  type: time
  sql: ${TABLE}.date_time_submitted_by_form_assembly_c ;;
}

dimension: db_competitor_c {
  type: string
  sql: ${TABLE}.db_competitor_c ;;
}

dimension: dba_c {
  type: string
  sql: ${TABLE}.dba_c ;;
}

dimension: deal_calculator_link_c {
  type: string
  sql: ${TABLE}.deal_calculator_link_c ;;
}

dimension: deal_lost_comments_c {
  type: string
  sql: ${TABLE}.deal_lost_comments_c ;;
}

dimension: deal_lost_reason_c {
  type: string
  sql: ${TABLE}.deal_lost_reason_c ;;
}

dimension: deal_won_reason_c {
  type: string
  sql: ${TABLE}.deal_won_reason_c ;;
}

dimension: department_c {
  type: string
  sql: ${TABLE}.department_c ;;
}

dimension: describe_the_manual_payment_process_c {
  type: string
  sql: ${TABLE}.describe_the_manual_payment_process_c ;;
}

dimension: description {
  type: string
  sql: ${TABLE}.description ;;
}

dimension: desk_link_c {
  type: string
  sql: ${TABLE}.desk_link_c ;;
}

dimension: did_se_help_sale_c {
  type: string
  sql: ${TABLE}.did_se_help_sale_c ;;
}

dimension: discovery_completed_c {
  type: string
  sql: ${TABLE}.discovery_completed_c ;;
}

dimension: email_marketing_price_c {
  type: number
  sql: ${TABLE}.email_marketing_price_c ;;
}

dimension_group: end_date_c {
  type: time
  sql: ${TABLE}.end_date_c ;;
}

dimension_group: event_month_c {
  type: time
  sql: ${TABLE}.event_month_c ;;
}

dimension_group: existing_contract_end_date_c {
  type: time
  sql: ${TABLE}.existing_contract_end_date_c ;;
}

dimension: expected_avg_ticket_fee_c {
  type: number
  sql: ${TABLE}.expected_avg_ticket_fee_c ;;
}

dimension: expected_revenue {
  type: number
  sql: ${TABLE}.expected_revenue ;;
}

dimension: festival_interest_c {
  type: string
  sql: ${TABLE}.festival_interest_c ;;
}

dimension: festival_manager_c {
  type: string
  sql: ${TABLE}.festival_manager_c ;;
}

dimension: festival_service_interest_c {
  type: string
  sql: ${TABLE}.festival_service_interest_c ;;
}

dimension: fiscal {
  type: string
  sql: ${TABLE}.fiscal ;;
}

dimension: fiscal_quarter {
  type: number
  sql: ${TABLE}.fiscal_quarter ;;
}

dimension: fiscal_year {
  type: number
  sql: ${TABLE}.fiscal_year ;;
}

dimension: flat_fees_c {
  type: number
  sql: ${TABLE}.flat_fees_c ;;
}

dimension: forecast_c {
  type: string
  sql: ${TABLE}.forecast_c ;;
}

dimension: forecast_category {
  type: string
  sql: ${TABLE}.forecast_category ;;
}

dimension: forecast_category_name {
  type: string
  sql: ${TABLE}.forecast_category_name ;;
}

dimension: forecasting_c {
  type: string
  sql: ${TABLE}.forecasting_c ;;
}

dimension: fulfillment_amount_c {
  type: number
  sql: ${TABLE}.fulfillment_amount_c ;;
}

dimension: functional_gaps_c {
  type: string
  sql: ${TABLE}.functional_gaps_c ;;
}

dimension: funded_dev_confidence_indicator_c {
  type: string
  sql: ${TABLE}.funded_dev_confidence_indicator_c ;;
}

dimension: funded_dev_days_c {
  type: number
  sql: ${TABLE}.funded_dev_days_c ;;
}

dimension: funded_dev_price_c {
  type: number
  sql: ${TABLE}.funded_dev_price_c ;;
}

dimension: gbi_approved_c {
  type: string
  sql: ${TABLE}.gbi_approved_c ;;
}

dimension: global_competitors_c {
  type: string
  sql: ${TABLE}.global_competitors_c ;;
}

dimension: global_deal_lost_competitor_c {
  type: string
  sql: ${TABLE}.global_deal_lost_competitor_c ;;
}

dimension: global_tl_incumbent_c {
  type: string
  sql: ${TABLE}.global_tl_incumbent_c ;;
}

dimension_group: go_live_date_c {
  type: time
  sql: ${TABLE}.go_live_date_c ;;
}

dimension: grow_sumo_id_c {
  type: string
  sql: ${TABLE}.grow_sumo_id_c ;;
}

dimension: hardware_price_c {
  type: number
  sql: ${TABLE}.hardware_price_c ;;
}

dimension_group: hardware_ship_date_c {
  type: time
  sql: ${TABLE}.hardware_ship_date_c ;;
}

dimension: has_open_activity {
  type: string
  sql: ${TABLE}.has_open_activity ;;
}

dimension: has_opportunity_line_item {
  type: string
  sql: ${TABLE}.has_opportunity_line_item ;;
}

dimension: has_overdue_task {
  type: string
  sql: ${TABLE}.has_overdue_task ;;
}

dimension: how_many_current_events_on_sale_online_c {
  type: number
  sql: ${TABLE}.how_many_current_events_on_sale_online_c ;;
}

dimension: how_many_events_held_c {
  type: number
  sql: ${TABLE}.how_many_events_held_c ;;
}

dimension: how_many_tickets_sold_last_year_c {
  type: number
  sql: ${TABLE}.how_many_tickets_sold_last_year_c ;;
}

dimension: how_many_years_in_business_c {
  type: number
  sql: ${TABLE}.how_many_years_in_business_c ;;
}

dimension: if_0_tix_online_use_vendini_to_sell_c {
  type: string
  sql: ${TABLE}.if_0_tix_online_use_vendini_to_sell_c ;;
}

dimension: if_tix_online_companies_used_to_process_c {
  type: string
  sql: ${TABLE}.if_tix_online_companies_used_to_process_c ;;
}

dimension: incumbent_notes_c {
  type: string
  sql: ${TABLE}.incumbent_notes_c ;;
}

dimension: invoice_paid_date_c {
  type: number
  sql: ${TABLE}.invoice_paid_date_c ;;
}

dimension: is_closed {
  type: string
  sql: ${TABLE}.is_closed ;;
}

dimension: is_deleted {
  type: string
  sql: ${TABLE}.is_deleted ;;
}

dimension: is_private {
  type: string
  sql: ${TABLE}.is_private ;;
}

dimension: is_split {
  type: string
  sql: ${TABLE}.is_split ;;
}

dimension: is_won {
  type: string
  sql: ${TABLE}.is_won ;;
}

dimension: jira_url_c {
  type: string
  sql: ${TABLE}.jira_url_c ;;
}

dimension: last_12_gross_revenue_c {
  type: number
  sql: ${TABLE}.last_12_gross_revenue_c ;;
}

dimension: last_12_months_box_office_revenue_c {
  type: number
  sql: ${TABLE}.last_12_months_box_office_revenue_c ;;
}

dimension: last_12_months_box_office_tickets_c {
  type: number
  sql: ${TABLE}.last_12_months_box_office_tickets_c ;;
}

dimension: last_12_months_online_revenue_c {
  type: number
  sql: ${TABLE}.last_12_months_online_revenue_c ;;
}

dimension: last_12_months_online_tickets_c {
  type: number
  sql: ${TABLE}.last_12_months_online_tickets_c ;;
}

dimension: last_12_total_fees_c {
  type: number
  sql: ${TABLE}.last_12_total_fees_c ;;
}

dimension_group: last_activity_date {
  type: time
  sql: ${TABLE}.last_activity_date ;;
}

dimension: last_modified_by_id {
  type: string
  sql: ${TABLE}.last_modified_by_id ;;
}

dimension_group: last_modified_date {
  type: time
  sql: ${TABLE}.last_modified_date ;;
}

dimension_group: last_referenced_date {
  type: time
  sql: ${TABLE}.last_referenced_date ;;
}

dimension_group: last_viewed_date {
  type: time
  sql: ${TABLE}.last_viewed_date ;;
}

dimension_group: launch_request_submitted_c {
  type: time
  sql: ${TABLE}.launch_request_submitted_c ;;
}

dimension: lead_record_id_c {
  type: string
  sql: ${TABLE}.lead_record_id_c ;;
}

dimension: lead_source {
  type: string
  sql: ${TABLE}.lead_source ;;
}

dimension: legacy_id_c {
  type: string
  sql: ${TABLE}.legacy_id_c ;;
}

dimension: legacy_owner_c {
  type: string
  sql: ${TABLE}.legacy_owner_c ;;
}

dimension: legacy_stage_c {
  type: string
  sql: ${TABLE}.legacy_stage_c ;;
}

dimension: license_amount_new_c {
  type: number
  sql: ${TABLE}.license_amount_new_c ;;
}

dimension: license_sale_type_c {
  type: string
  sql: ${TABLE}.license_sale_type_c ;;
}

dimension_group: live_date_c {
  type: time
  sql: ${TABLE}.live_date_c ;;
}

dimension: loss_reason_c {
  type: string
  sql: ${TABLE}.loss_reason_c ;;
}

dimension: loss_reason_drilled_down_c {
  type: string
  sql: ${TABLE}.loss_reason_drilled_down_c ;;
}

dimension: managed_services_hours_c {
  type: number
  sql: ${TABLE}.managed_services_hours_c ;;
}

dimension: managed_services_price_c {
  type: number
  sql: ${TABLE}.managed_services_price_c ;;
}

dimension: manual_payment_options_c {
  type: string
  sql: ${TABLE}.manual_payment_options_c ;;
}

dimension: monthly_avtiki_fee_c {
  type: number
  sql: ${TABLE}.monthly_avtiki_fee_c ;;
}

dimension: monthly_email_fee_c {
  type: number
  sql: ${TABLE}.monthly_email_fee_c ;;
}

dimension: monthly_fee_1_st_6_months_c {
  type: number
  sql: ${TABLE}.monthly_fee_1_st_6_months_c ;;
}

dimension: monthly_fee_2_nd_6_months_c {
  type: number
  sql: ${TABLE}.monthly_fee_2_nd_6_months_c ;;
}

dimension: monthly_fee_ongoing_c {
  type: number
  sql: ${TABLE}.monthly_fee_ongoing_c ;;
}

dimension: monthly_license_fee_c {
  type: number
  sql: ${TABLE}.monthly_license_fee_c ;;
}

dimension: monthly_pos_fee_c {
  type: number
  sql: ${TABLE}.monthly_pos_fee_c ;;
}

dimension_group: mql_date_time_c {
  type: time
  sql: ${TABLE}.mql_date_time_c ;;
}

dimension: name {
  type: string
  sql: ${TABLE}.name ;;
}

dimension: name_of_person_submitting_form_c {
  type: string
  sql: ${TABLE}.name_of_person_submitting_form_c ;;
}

dimension: named_c {
  type: string
  sql: ${TABLE}.named_c ;;
}

dimension: nbr_event_dates_1_c {
  type: number
  sql: ${TABLE}.nbr_event_dates_1_c ;;
}

dimension: nbr_event_dates_2_c {
  type: number
  sql: ${TABLE}.nbr_event_dates_2_c ;;
}

dimension: nbr_event_dates_3_c {
  type: number
  sql: ${TABLE}.nbr_event_dates_3_c ;;
}

dimension: nbr_multi_day_tickets_c {
  type: number
  sql: ${TABLE}.nbr_multi_day_tickets_c ;;
}

dimension: need_c {
  type: string
  sql: ${TABLE}.need_c ;;
}

dimension: net_acv_c {
  type: number
  sql: ${TABLE}.net_acv_c ;;
}

dimension_group: new_contract_end_date_c {
  type: time
  sql: ${TABLE}.new_contract_end_date_c ;;
}

dimension: new_install_days_c {
  type: number
  sql: ${TABLE}.new_install_days_c ;;
}

dimension: new_install_price_c {
  type: number
  sql: ${TABLE}.new_install_price_c ;;
}

dimension: next_next_step_c {
  type: string
  sql: ${TABLE}.next_next_step_c ;;
}

dimension: next_step {
  type: string
  sql: ${TABLE}.next_step ;;
}

dimension: next_step_c {
  type: string
  sql: ${TABLE}.next_step_c ;;
}

dimension: notes_heard_about_us_c {
  type: string
  sql: ${TABLE}.notes_heard_about_us_c ;;
}

dimension: number_complimentary_tickets_c {
  type: number
  sql: ${TABLE}.number_complimentary_tickets_c ;;
}

dimension: number_of_portals_to_loan_c {
  type: number
  sql: ${TABLE}.number_of_portals_to_loan_c ;;
}

dimension: number_of_scanners_to_loan_c {
  type: number
  sql: ${TABLE}.number_of_scanners_to_loan_c ;;
}

dimension: number_ticket_packages_sold_c {
  type: number
  sql: ${TABLE}.number_ticket_packages_sold_c ;;
}

dimension_group: on_sale_date_c {
  type: time
  sql: ${TABLE}.on_sale_date_c ;;
}

dimension: on_site_staffing_needs_c {
  type: number
  sql: ${TABLE}.on_site_staffing_needs_c ;;
}

dimension: on_site_support_c {
  type: string
  sql: ${TABLE}.on_site_support_c ;;
}

dimension: opportunity_credit_c {
  type: string
  sql: ${TABLE}.opportunity_credit_c ;;
}

dimension: opportunity_type_c {
  type: string
  sql: ${TABLE}.opportunity_type_c ;;
}

dimension_group: original_launch_date_c {
  type: time
  sql: ${TABLE}.original_launch_date_c ;;
}

dimension: overage_quantity_c {
  type: number
  sql: ${TABLE}.overage_quantity_c ;;
}

dimension: owner_id {
  type: string
  sql: ${TABLE}.owner_id ;;
}

dimension: owner_sales_role_c {
  type: string
  sql: ${TABLE}.owner_sales_role_c ;;
}

dimension: paid_c {
  type: string
  sql: ${TABLE}.paid_c ;;
}

dimension: partner_estimated_revenue_details_c {
  type: string
  sql: ${TABLE}.partner_estimated_revenue_details_c ;;
}

dimension: partner_unit_revenue_c {
  type: number
  sql: ${TABLE}.partner_unit_revenue_c ;;
}

dimension: partner_units_c {
  type: number
  sql: ${TABLE}.partner_units_c ;;
}

dimension: patron_support_c {
  type: string
  sql: ${TABLE}.patron_support_c ;;
}

dimension: payment_gateway_c {
  type: string
  sql: ${TABLE}.payment_gateway_c ;;
}

dimension: per_unit_overage_c {
  type: number
  sql: ${TABLE}.per_unit_overage_c ;;
}

dimension: per_unit_rate_c {
  type: number
  sql: ${TABLE}.per_unit_rate_c ;;
}

dimension: poc_email_c {
  type: string
  sql: ${TABLE}.poc_email_c ;;
}

dimension: poc_first_and_last_name_c {
  type: string
  sql: ${TABLE}.poc_first_and_last_name_c ;;
}

dimension: poc_number_c {
  type: string
  sql: ${TABLE}.poc_number_c ;;
}

dimension: poc_title_c {
  type: string
  sql: ${TABLE}.poc_title_c ;;
}

dimension: point_of_sale_c {
  type: string
  sql: ${TABLE}.point_of_sale_c ;;
}

dimension: points_c {
  type: number
  sql: ${TABLE}.points_c ;;
}

dimension: previous_ticketing_solution_c_c {
  type: string
  sql: ${TABLE}.previous_ticketing_solution_c_c ;;
}

dimension: pricebook_2_id {
  type: string
  sql: ${TABLE}.pricebook_2_id ;;
}

dimension: primary_contact_c {
  type: string
  sql: ${TABLE}.primary_contact_c ;;
}

dimension: probability {
  type: number
  sql: ${TABLE}.probability ;;
}

dimension: product_c {
  type: string
  sql: ${TABLE}.product_c ;;
}

dimension: product_fit_c {
  type: string
  sql: ${TABLE}.product_fit_c ;;
}

dimension: product_gaps_and_risks_c {
  type: string
  sql: ${TABLE}.product_gaps_and_risks_c ;;
}

dimension: product_interest_c {
  type: string
  sql: ${TABLE}.product_interest_c ;;
}

dimension: product_limitation_reasons_c {
  type: string
  sql: ${TABLE}.product_limitation_reasons_c ;;
}

dimension: project_lifecycle_c {
  type: string
  sql: ${TABLE}.project_lifecycle_c ;;
}

dimension_group: project_start_date_c {
  type: time
  sql: ${TABLE}.project_start_date_c ;;
}

dimension: projected_next_12_months_revenue_c {
  type: number
  sql: ${TABLE}.projected_next_12_months_revenue_c ;;
}

dimension: projected_next_12_months_tickets_c {
  type: number
  sql: ${TABLE}.projected_next_12_months_tickets_c ;;
}

dimension: proposal_c {
  type: string
  sql: ${TABLE}.proposal_c ;;
}

dimension: quota_c {
  type: string
  sql: ${TABLE}.quota_c ;;
}

dimension: quoted_aug_2006_pricing_c {
  type: string
  sql: ${TABLE}.quoted_aug_2006_pricing_c ;;
}

dimension: ready_to_award_c {
  type: string
  sql: ${TABLE}.ready_to_award_c ;;
}

dimension_group: ready_to_award_timestamp_c {
  type: time
  sql: ${TABLE}.ready_to_award_timestamp_c ;;
}

dimension: reason_launch_date_changed_c {
  type: string
  sql: ${TABLE}.reason_launch_date_changed_c ;;
}

dimension: record_type_id {
  type: string
  sql: ${TABLE}.record_type_id ;;
}

dimension: recoupable_advance_c {
  type: number
  sql: ${TABLE}.recoupable_advance_c ;;
}

dimension: recoupable_signing_bonus_c {
  type: number
  sql: ${TABLE}.recoupable_signing_bonus_c ;;
}

dimension: renewal_contract_type_c {
  type: string
  sql: ${TABLE}.renewal_contract_type_c ;;
}

dimension: rep_current_quota_c {
  type: number
  sql: ${TABLE}.rep_current_quota_c ;;
}

dimension: request_non_standard_contract_approval_c {
  type: string
  sql: ${TABLE}.request_non_standard_contract_approval_c ;;
}

dimension: revenue_share_c {
  type: number
  sql: ${TABLE}.revenue_share_c ;;
}

dimension: roi_analysis_completed_c {
  type: string
  sql: ${TABLE}.roi_analysis_completed_c ;;
}

dimension_group: sal_date_time_c {
  type: time
  sql: ${TABLE}.sal_date_time_c ;;
}

dimension: sales_engineer_c {
  type: string
  sql: ${TABLE}.sales_engineer_c ;;
}

dimension: sales_engineer_user_c {
  type: string
  sql: ${TABLE}.sales_engineer_user_c ;;
}

dimension: sales_group_c {
  type: string
  sql: ${TABLE}.sales_group_c ;;
}

dimension: sales_support_lead_c {
  type: string
  sql: ${TABLE}.sales_support_lead_c ;;
}

dimension: se_notes_c {
  type: string
  sql: ${TABLE}.se_notes_c ;;
}

dimension: seating_capacity_1_c {
  type: number
  sql: ${TABLE}.seating_capacity_1_c ;;
}

dimension: seating_capacity_2_c {
  type: number
  sql: ${TABLE}.seating_capacity_2_c ;;
}

dimension: seating_capacity_3_c {
  type: number
  sql: ${TABLE}.seating_capacity_3_c ;;
}

dimension: seats_exact_c {
  type: string
  sql: ${TABLE}.seats_exact_c ;;
}

dimension: secondary_campaign_source_c {
  type: string
  sql: ${TABLE}.secondary_campaign_source_c ;;
}

dimension: secondary_lead_source_c {
  type: string
  sql: ${TABLE}.secondary_lead_source_c ;;
}

dimension: severity_go_live_date_c {
  type: string
  sql: ${TABLE}.severity_go_live_date_c ;;
}

dimension: show_name_c {
  type: string
  sql: ${TABLE}.show_name_c ;;
}

dimension: signing_bonus_c {
  type: number
  sql: ${TABLE}.signing_bonus_c ;;
}

dimension: soft_costs_c {
  type: number
  sql: ${TABLE}.soft_costs_c ;;
}

dimension: soft_costs_description_c {
  type: string
  sql: ${TABLE}.soft_costs_description_c ;;
}

dimension: software_price_c {
  type: number
  sql: ${TABLE}.software_price_c ;;
}

dimension: source_comments_c {
  type: string
  sql: ${TABLE}.source_comments_c ;;
}

dimension: source_lead_c {
  type: string
  sql: ${TABLE}.source_lead_c ;;
}

dimension: sourced_by_program_channel_c {
  type: string
  sql: ${TABLE}.sourced_by_program_channel_c ;;
}

dimension_group: sourced_by_program_date_time_c {
  type: time
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

dimension_group: sql_date_time_c {
  type: time
  sql: ${TABLE}.sql_date_time_c ;;
}

dimension: staffing_days_c {
  type: number
  sql: ${TABLE}.staffing_days_c ;;
}

dimension: stage_name {
  type: string
  sql: ${TABLE}.stage_name ;;
}

dimension_group: start_date_c {
  type: time
  sql: ${TABLE}.start_date_c ;;
}

dimension: strategic_c {
  type: string
  sql: ${TABLE}.strategic_c ;;
}

dimension: summary_c {
  type: string
  sql: ${TABLE}.summary_c ;;
}

dimension: support_case_number_c {
  type: string
  sql: ${TABLE}.support_case_number_c ;;
}

dimension: synced_quote_id {
  type: string
  sql: ${TABLE}.synced_quote_id ;;
}

dimension_group: system_modstamp {
  type: time
  sql: ${TABLE}.system_modstamp ;;
}

dimension: ta_fee_schedule_c {
  type: string
  sql: ${TABLE}.ta_fee_schedule_c ;;
}

dimension_group: target_installation_date_c {
  type: time
  sql: ${TABLE}.target_installation_date_c ;;
}

dimension_group: target_live_date_c {
  type: time
  sql: ${TABLE}.target_live_date_c ;;
}

dimension: tax_classification_c {
  type: string
  sql: ${TABLE}.tax_classification_c ;;
}

dimension: tax_id_c {
  type: string
  sql: ${TABLE}.tax_id_c ;;
}

dimension: tender_process_c {
  type: string
  sql: ${TABLE}.tender_process_c ;;
}

dimension: term_months_c {
  type: number
  sql: ${TABLE}.term_months_c ;;
}

dimension: term_years_c {
  type: number
  sql: ${TABLE}.term_years_c ;;
}

dimension: ticket_cash_chk_percent_c {
  type: number
  sql: ${TABLE}.ticket_cash_chk_percent_c ;;
}

dimension: ticket_ccpercent_c {
  type: number
  sql: ${TABLE}.ticket_ccpercent_c ;;
}

dimension: ticket_comp_percent_c {
  type: number
  sql: ${TABLE}.ticket_comp_percent_c ;;
}

dimension: ticket_other_percent_c {
  type: number
  sql: ${TABLE}.ticket_other_percent_c ;;
}

dimension: tickets_per_year_c {
  type: number
  sql: ${TABLE}.tickets_per_year_c ;;
}

dimension: tickets_sold_via_website_c {
  type: number
  sql: ${TABLE}.tickets_sold_via_website_c ;;
}

dimension: timing_c {
  type: string
  sql: ${TABLE}.timing_c ;;
}

dimension: title_c {
  type: string
  sql: ${TABLE}.title_c ;;
}

dimension: tl_fee_schedule_c {
  type: string
  sql: ${TABLE}.tl_fee_schedule_c ;;
}

dimension: total_opportunity_quantity {
  type: number
  sql: ${TABLE}.total_opportunity_quantity ;;
}

dimension: total_ticket_sales_revenue_c {
  type: number
  sql: ${TABLE}.total_ticket_sales_revenue_c ;;
}

dimension: type {
  type: string
  sql: ${TABLE}.type ;;
}

dimension: type_global_c {
  type: string
  sql: ${TABLE}.type_global_c ;;
}

dimension: unidentified_order_growth_c {
  type: number
  sql: ${TABLE}.unidentified_order_growth_c ;;
}

dimension: upfront_payment_c {
  type: number
  sql: ${TABLE}.upfront_payment_c ;;
}

dimension: upgrade_type_c {
  type: string
  sql: ${TABLE}.upgrade_type_c ;;
}

dimension: upgrade_window_notes_c {
  type: string
  sql: ${TABLE}.upgrade_window_notes_c ;;
}

dimension: using_ovation_tix_call_center_c {
  type: string
  sql: ${TABLE}.using_ovation_tix_call_center_c ;;
}

dimension_group: vam_link_added_date_time_c {
  type: time
  sql: ${TABLE}.vam_link_added_date_time_c ;;
}

dimension: vam_link_c {
  type: string
  sql: ${TABLE}.vam_link_c ;;
}

dimension: venue_name_1_c {
  type: string
  sql: ${TABLE}.venue_name_1_c ;;
}

dimension: venue_name_2_c {
  type: string
  sql: ${TABLE}.venue_name_2_c ;;
}

dimension: venue_name_3_c {
  type: string
  sql: ${TABLE}.venue_name_3_c ;;
}

dimension: verify_sales_data_c {
  type: string
  sql: ${TABLE}.verify_sales_data_c ;;
}

dimension: vertical_c {
  type: string
  sql: ${TABLE}.vertical_c ;;
}

dimension: web_address_c {
  type: string
  sql: ${TABLE}.web_address_c ;;
}

dimension: who_helped_close_c {
  type: string
  sql: ${TABLE}.who_helped_close_c ;;
}

dimension: win_loss_picklist_c {
  type: string
  sql: ${TABLE}.win_loss_picklist_c ;;
}

dimension: win_loss_reason_c {
  type: string
  sql: ${TABLE}.win_loss_reason_c ;;
}

dimension: wireless_scanners_required_c {
  type: string
  sql: ${TABLE}.wireless_scanners_required_c ;;
}

dimension: x_1_year_attained_c {
  type: string
  sql: ${TABLE}.x_1_year_attained_c ;;
}

dimension: x_1_year_attainment_notes_c {
  type: string
  sql: ${TABLE}.x_1_year_attainment_notes_c ;;
}

dimension: years_in_business_c {
  type: number
  sql: ${TABLE}.years_in_business_c ;;
}

dimension: legacy_org_c {
  type: string
  sql: ${TABLE}.legacy_org_c ;;
}

dimension: new_annual_contract_value_c {
  type: number
  value_format_name: usd
  sql: ${TABLE}.new_annual_contract_value_c ;;
}

dimension: new_partner_estimated_revenue_c {
  type: number
  sql: ${TABLE}.new_partner_estimated_revenue_c ;;
}

dimension: jr_update_c {
  type: string
  sql: ${TABLE}.jr_update_c ;;
}

dimension_group: fstr_auto_close_c {
  type: time
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
  sql: ${TABLE}.fstr_completed_date_c ;;
}

dimension: fstr_contact_bpm_c {
  type: string
  sql: ${TABLE}.fstr_contact_bpm_c ;;
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

dimension: update_forecast_c {
  type: string
  sql: ${TABLE}.update_forecast_c ;;
}

dimension: partner_commercial_terms_c {
  type: string
  sql: ${TABLE}.partner_commercial_terms_c ;;
}

dimension: approval_request_reason_c {
  type: string
  sql: ${TABLE}.approval_request_reason_c ;;
}

dimension: gclid_c {
  type: string
  sql: ${TABLE}.gclid_c ;;
}

dimension: loss_picklist_new_saa_s_c {
  type: string
  sql: ${TABLE}.loss_picklist_new_saa_s_c ;;
}

dimension: account_phone_number_c {
  type: string
  sql: ${TABLE}.account_phone_number_c ;;
}

dimension: acct_name_c {
  type: string
  sql: ${TABLE}.acct_name_c ;;
}

dimension: acv_c {
  type: number
  sql: ${TABLE}.acv_c ;;
}

dimension: adj_amount_for_report_c {
  type: number
  sql: ${TABLE}.adj_amount_for_report_c ;;
}

dimension: adj_weighted_amount_for_reports_c {
  type: number
  sql: ${TABLE}.adj_weighted_amount_for_reports_c ;;
}

dimension: amount_won_c {
  type: number
  sql: ${TABLE}.amount_won_c ;;
}

dimension: ancillary_ps_day_rate_c {
  type: number
  sql: ${TABLE}.ancillary_ps_day_rate_c ;;
}

dimension: annual_contract_value_c {
  type: number
  sql: ${TABLE}.annual_contract_value_c ;;
}

dimension: av_community_rev_share_deal_value_c {
  type: number
  sql: ${TABLE}.av_community_rev_share_deal_value_c ;;
}

dimension: av_community_subscription_deal_value_c {
  type: number
  sql: ${TABLE}.av_community_subscription_deal_value_c ;;
}

dimension: campaign_owner_c {
  type: string
  sql: ${TABLE}.campaign_owner_c ;;
}

dimension: case_safe_id_c {
  type: string
  sql: ${TABLE}.case_safe_id_c ;;
}

dimension: category_c {
  type: string
  sql: ${TABLE}.category_c ;;
}

dimension: city_c {
  type: string
  sql: ${TABLE}.city_c ;;
}

dimension: company_phone_c {
  type: string
  sql: ${TABLE}.company_phone_c ;;
}

dimension: contact_email_c {
  type: string
  sql: ${TABLE}.contact_email_c ;;
}

dimension: contract_required_ob_c {
  type: string
  sql: ${TABLE}.contract_required_ob_c ;;
}

dimension: crowd_torch_url_c {
  type: string
  sql: ${TABLE}.crowd_torch_url_c ;;
}

dimension: current_opportunity_c {
  type: string
  sql: ${TABLE}.current_opportunity_c ;;
}

dimension: custom_dev_day_rate_c {
  type: number
  sql: ${TABLE}.custom_dev_day_rate_c ;;
}

dimension: deal_value_c {
  type: number
  sql: ${TABLE}.deal_value_c ;;
}

dimension: edit_delete_c {
  type: string
  sql: ${TABLE}.edit_delete_c ;;
}

dimension: email_c {
  type: string
  sql: ${TABLE}.email_c ;;
}

dimension: est_tpy_c {
  type: number
  sql: ${TABLE}.est_tpy_c ;;
}

dimension: festival_dates_ob_c {
  type: string
  sql: ${TABLE}.festival_dates_ob_c ;;
}

dimension: final_amount_c {
  type: number
  sql: ${TABLE}.final_amount_c ;;
}

dimension: first_name_c {
  type: string
  sql: ${TABLE}.first_name_c ;;
}

dimension: forecasted_age_c {
  type: number
  sql: ${TABLE}.forecasted_age_c ;;
}

dimension: forecasted_amount_c {
  type: number
  sql: ${TABLE}.forecasted_amount_c ;;
}

dimension: funded_dev_day_rate_c {
  type: number
  sql: ${TABLE}.funded_dev_day_rate_c ;;
}

dimension: isr_lead_source_ob_c {
  type: string
  sql: ${TABLE}.isr_lead_source_ob_c ;;
}

dimension: last_name_c {
  type: string
  sql: ${TABLE}.last_name_c ;;
}

dimension: license_deal_value_c {
  type: number
  sql: ${TABLE}.license_deal_value_c ;;
}

dimension: license_order_growth_c {
  type: number
  sql: ${TABLE}.license_order_growth_c ;;
}

dimension: logistics_manager_ob_c {
  type: string
  sql: ${TABLE}.logistics_manager_ob_c ;;
}

dimension: member_id_c {
  type: string
  sql: ${TABLE}.member_id_c ;;
}

dimension: misc_deal_value_c {
  type: number
  sql: ${TABLE}.misc_deal_value_c ;;
}

dimension: monthly_recurring_revenue_c {
  type: number
  sql: ${TABLE}.monthly_recurring_revenue_c ;;
}

dimension: negotiations_or_verbal_c {
  type: string
  sql: ${TABLE}.negotiations_or_verbal_c ;;
}

dimension: net_acv_new_c {
  type: number
  sql: ${TABLE}.net_acv_new_c ;;
}

dimension: new_install_day_rate_c {
  type: number
  sql: ${TABLE}.new_install_day_rate_c ;;
}

dimension: new_total_contract_value_c {
  type: number
  sql: ${TABLE}.new_total_contract_value_c ;;
}

  measure: total_BTI_contract_value_c {
    type: sum
    value_format_name: usd
    sql: CASE
          WHEN ${TABLE}.currency_iso_code = 'CAD' THEN ${TABLE}.new_total_contract_value_c  * 0.76
          WHEN ${TABLE}.currency_iso_code = 'COP' THEN ${TABLE}.new_total_contract_value_c  * 0.00029
          WHEN ${TABLE}.currency_iso_code = 'GBP' THEN ${TABLE}.new_total_contract_value_c  * 1.32
          WHEN ${TABLE}.currency_iso_code = 'PHP' THEN ${TABLE}.new_total_contract_value_c  * 0.020
          WHEN ${TABLE}.currency_iso_code = 'USD' THEN ${TABLE}.new_total_contract_value_c  * 1
          ELSE 0
      END ;;
    filters: {
      field: name
      value: "%BTI 2020%"
    }
    filters: {
      field: stage_name
      value: "Closed Won"
    }
  }

dimension: next_step_2_c {
  type: string
  sql: ${TABLE}.next_step_2_c ;;
}

dimension: non_profit_ob_c {
  type: string
  sql: ${TABLE}.non_profit_ob_c ;;
}

dimension: ns_department_c {
  type: string
  sql: ${TABLE}.ns_department_c ;;
}

dimension: number_of_portals_to_loan_ob_c {
  type: string
  sql: ${TABLE}.number_of_portals_to_loan_ob_c ;;
}

dimension: number_of_scanners_to_loan_ob_c {
  type: string
  sql: ${TABLE}.number_of_scanners_to_loan_ob_c ;;
}

dimension: of_quota_c {
  type: number
  sql: ${TABLE}.of_quota_c ;;
}

dimension: on_sale_date_ob_c {
  type: string
  sql: ${TABLE}.on_sale_date_ob_c ;;
}

dimension: on_site_staff_ob_c {
  type: string
  sql: ${TABLE}.on_site_staff_ob_c ;;
}

dimension: opportunity_count_c {
  type: number
  sql: ${TABLE}.opportunity_count_c ;;
}

dimension: opportunity_credit_profile_c {
  type: string
  sql: ${TABLE}.opportunity_credit_profile_c ;;
}

dimension: opportunity_status_c {
  type: string
  sql: ${TABLE}.opportunity_status_c ;;
}

dimension: owner_role_c {
  type: string
  sql: ${TABLE}.owner_role_c ;;
}

dimension: partner_estimated_revenue_c {
  type: number
  sql: ${TABLE}.partner_estimated_revenue_c ;;
}

dimension: patron_support_ob_c {
  type: string
  sql: ${TABLE}.patron_support_ob_c ;;
}

dimension: primary_contact_first_name_c {
  type: string
  sql: ${TABLE}.primary_contact_first_name_c ;;
}

dimension: probability_c {
  type: number
  sql: ${TABLE}.probability_c ;;
}

dimension: ps_deal_value_c {
  type: number
  sql: ${TABLE}.ps_deal_value_c ;;
}

dimension: ps_order_growth_c {
  type: number
  sql: ${TABLE}.ps_order_growth_c ;;
}

dimension: qualification_status_c {
  type: string
  sql: ${TABLE}.qualification_status_c ;;
}

dimension: quota_match_c {
  type: string
  sql: ${TABLE}.quota_match_c ;;
}

dimension: rae_sae_type_c {
  type: string
  sql: ${TABLE}.rae_sae_type_c ;;
}

dimension: recurring_order_growth_c {
  type: number
  sql: ${TABLE}.recurring_order_growth_c ;;
}

dimension: revenue_type_c {
  type: string
  sql: ${TABLE}.revenue_type_c ;;
}

dimension: rfid_event_ob_c {
  type: string
  sql: ${TABLE}.rfid_event_ob_c ;;
}

dimension: sales_engineer_ob_c {
  type: string
  sql: ${TABLE}.sales_engineer_ob_c ;;
}

dimension: sales_rep_location_c {
  type: string
  sql: ${TABLE}.sales_rep_location_c ;;
}

dimension: sales_role_c {
  type: string
  sql: ${TABLE}.sales_role_c ;;
}

dimension: sales_vertical_c {
  type: string
  sql: ${TABLE}.sales_vertical_c ;;
}

dimension: sql_count_c {
  type: number
  sql: ${TABLE}.sql_count_c ;;
}

dimension: staffing_days_ob_c {
  type: string
  sql: ${TABLE}.staffing_days_ob_c ;;
}

dimension: state_province_c {
  type: string
  sql: ${TABLE}.state_province_c ;;
}

dimension: subscription_deal_value_c {
  type: number
  sql: ${TABLE}.subscription_deal_value_c ;;
}

dimension_group: targt_live_date_ob_c {
  type: time
  sql: ${TABLE}.targt_live_date_ob_c ;;
}

dimension: tickets_per_year_ob_c {
  type: number
  sql: ${TABLE}.tickets_per_year_ob_c ;;
}

dimension: title_primary_c {
  type: string
  sql: ${TABLE}.title_primary_c ;;
}

dimension: total_contract_value_renewals_c {
  type: number
  sql: ${TABLE}.total_contract_value_renewals_c ;;
}

dimension: user_mobile_c {
  type: string
  sql: ${TABLE}.user_mobile_c ;;
}

dimension: user_phone_c {
  type: string
  sql: ${TABLE}.user_phone_c ;;
}

dimension: vam_link_ob_c {
  type: string
  sql: ${TABLE}.vam_link_ob_c ;;
}

dimension: vertical_categorized_c {
  type: string
  sql: ${TABLE}.vertical_categorized_c ;;
}

dimension: website_c {
  type: string
  sql: ${TABLE}.website_c ;;
}

dimension: weighted_amount_c {
  type: number
  sql: ${TABLE}.weighted_amount_c ;;
}

dimension: weighted_deal_value_c {
  type: number
  sql: ${TABLE}.weighted_deal_value_c ;;
}

dimension: weighted_license_order_growth_c {
  type: number
  sql: ${TABLE}.weighted_license_order_growth_c ;;
}

dimension: weighted_monthly_recurring_revenue_c {
  type: number
  sql: ${TABLE}.weighted_monthly_recurring_revenue_c ;;
}

dimension: weighted_net_acv_c {
  type: number
  sql: ${TABLE}.weighted_net_acv_c ;;
}

dimension: weighted_ps_order_growth_c {
  type: number
  sql: ${TABLE}.weighted_ps_order_growth_c ;;
}

dimension: weighted_recurring_order_growth_c {
  type: number
  sql: ${TABLE}.weighted_recurring_order_growth_c ;;
}

dimension_group: next_step_last_edited_c {
  type: time
  sql: ${TABLE}.next_step_last_edited_c ;;
}

dimension: billing_city_c {
  type: string
  sql: ${TABLE}.billing_city_c ;;
}

dimension: business_type_c {
  type: string
  sql: ${TABLE}.business_type_c ;;
}

dimension: opportunity_type_2_c {
  type: string
  sql: ${TABLE}.opportunity_type_2_c ;;
}

dimension: pricing_model_c {
  type: string
  sql: ${TABLE}.pricing_model_c ;;
}

dimension: contract_start_date_c {
  type: string
  sql: ${TABLE}.contract_start_date_c ;;
}

dimension_group: original_contract_start_date_c {
  type: time
  sql: ${TABLE}.original_contract_start_date_c ;;
}

dimension: number_of_venues_c {
  type: number
  sql: ${TABLE}.number_of_venues_c ;;
}

dimension: launch_case_c {
  type: string
  sql: ${TABLE}.launch_case_c ;;
}

dimension: admin_contact_c {
  type: string
  sql: ${TABLE}.admin_contact_c ;;
}

dimension: primary_onboarding_contact_c {
  type: string
  sql: ${TABLE}.primary_onboarding_contact_c ;;
}

dimension: proposed_payment_gateway_c {
  type: string
  sql: ${TABLE}.proposed_payment_gateway_c ;;
}

dimension: proposed_payment_gateway_2_c {
  type: string
  sql: ${TABLE}.proposed_payment_gateway_2_c ;;
}


dimension: onboarding_c {
  type: string
  sql: ${TABLE}.onboarding_c ;;
}

dimension: onboarding_request_c {
  type: string
  sql: ${TABLE}.onboarding_request_c ;;
}

dimension_group: next_step_due_date_c {
  type: time
  sql: ${TABLE}.next_step_due_date_c ;;
}

dimension: quote_c {
  type: string
  sql: ${TABLE}.quote_c ;;
}


dimension: activity_metric_id {
  type: string
  sql: ${TABLE}.activity_metric_id ;;
}

dimension: bti_opp_c {
  type: string
  sql: ${TABLE}.bti_opp_c ;;
}

dimension: bti_target_c {
  type: string
  sql: ${TABLE}.bti_target_c ;;
}

dimension: current_payment_gateway_c {
  type: string
  sql: ${TABLE}.current_payment_gateway_c ;;
}

dimension: engagement_request_c {
  type: string
  sql: ${TABLE}.engagement_request_c ;;
}

dimension: form_responses_c {
  type: string
  sql: ${TABLE}.form_responses_c ;;
}

dimension: primary_implementation_contact_c {
  type: string
  sql: ${TABLE}.primary_implementation_contact_c ;;
}

dimension: transition_from_c {
  type: string
  sql: ${TABLE}.transition_from_c ;;
}

dimension: bti_scaled_c {
  type: string
  sql: ${TABLE}.bti_scaled_c ;;
}

dimension: billing_info_c {
  type: string
  sql: ${TABLE}.billing_info_c ;;
}

dimension: estimated_py_ticket_volume_c {
  type: number
  sql: ${TABLE}.estimated_py_ticket_volume_c ;;
}

dimension: transaction_fee_c {
  type: number
  sql: ${TABLE}.transaction_fee_c ;;
}

dimension: year_1_access_fee_c {
  type: number
  sql: ${TABLE}.year_1_access_fee_c ;;
}

dimension: year_1_projected_total_fee_revenue_c {
  type: number
  sql: ${TABLE}.year_1_projected_total_fee_revenue_c ;;
}

dimension: year_1_total_contract_value_c {
  type: number
  sql: ${TABLE}.year_1_total_contract_value_c ;;
}

dimension: current_opp_id_c {
  type: string
  sql: ${TABLE}.current_opp_id_c ;;
}

dimension: access_fee_bti_c {
  type: number
  sql: ${TABLE}.access_fee_bti_c ;;
}

dimension: bti_individual_rate_c {
  type: string
  sql: ${TABLE}.bti_individual_rate_c ;;
}

dimension: bti_promo_1_c {
  type: string
  sql: ${TABLE}.bti_promo_1_c ;;
}

dimension: bti_promo_2_c {
  type: string
  sql: ${TABLE}.bti_promo_2_c ;;
}

dimension: bti_promo_3_c {
  type: string
  sql: ${TABLE}.bti_promo_3_c ;;
}

dimension: per_ticket_fee_bti_c {
  type: number
  sql: ${TABLE}.per_ticket_fee_bti_c ;;
}

dimension: received_rfp_c {
  type: string
  sql: ${TABLE}.received_rfp_c ;;
}

dimension: contract_agreement_c {
  type: string
  sql: ${TABLE}.contract_agreement_c ;;
}

  dimension: split_product_gaps_risks_c {
    type: string
    sql: With vd as (SELECT id,
          split(sf_risk_opp.product_gaps_and_risks_c, ";")  AS risk
      FROM `fivetran-ovation-tix-warehouse.new_salesforce.opportunity` as sf_risk_opp
      )

          select id, v as ve from vd, unnest(risk) v;;
  }



set: detail {
  fields: [
    id,
    contract_agreement_c,
    sf_accounts.name,
    stage_name,
    sf_risk_list.ve,
    loss_picklist_new_saa_s_c,
    win_loss_reason_c,
    sf_bti.actual_2019_total_fee_revenue_c,
    amount
  ]
}
}
