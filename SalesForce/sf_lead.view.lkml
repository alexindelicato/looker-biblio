view: sf_lead {
  sql_table_name: fivetran-ovation-tix-warehouse.new_salesforce.lead ;;
  drill_fields: [lead_id_to_contact_wfr_c]

  dimension: lead_id_to_contact_wfr_c {
    primary_key: yes
    type: string
    sql: ${TABLE}.lead_id_to_contact_wfr_c ;;
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

  dimension: account_c {
    type: string
    sql: ${TABLE}.account_c ;;
  }

  dimension: account_manager_c {
    type: string
    sql: ${TABLE}.account_manager_c ;;
  }

  dimension: activity_completed_c {
    type: yesno
    sql: ${TABLE}.activity_completed_c ;;
  }

  dimension: admission_type_c {
    type: string
    sql: ${TABLE}.admission_type_c ;;
  }

  dimension: alt_email_c {
    type: string
    sql: ${TABLE}.alt_email_c ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: annual_ticket_volume_c {
    type: string
    sql: ${TABLE}.annual_ticket_volume_c ;;
  }

  dimension: auto_number_c {
    type: string
    sql: ${TABLE}.auto_number_c ;;
  }

  dimension: bdr_c {
    type: string
    sql: ${TABLE}.bdr_c ;;
  }

  dimension: behavior_score_c {
    type: number
    sql: ${TABLE}.behavior_score_c ;;
  }

  dimension: box_office_2_nd_phone_c {
    type: string
    sql: ${TABLE}.box_office_2_nd_phone_c ;;
  }

  dimension: business_challenge_c {
    type: string
    sql: ${TABLE}.business_challenge_c ;;
  }

  dimension: campaign_c {
    type: string
    sql: ${TABLE}.campaign_c ;;
  }

  dimension: campaign_id_c {
    type: string
    sql: ${TABLE}.campaign_id_c ;;
  }

  dimension: capacity_c {
    type: string
    sql: ${TABLE}.capacity_c ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: close_date_1_st_deal_c {
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
    sql: ${TABLE}.close_date_1_st_deal_c ;;
  }

  dimension: comment_question_c {
    type: string
    sql: ${TABLE}.comment_question_c ;;
  }

  dimension: comments_c {
    type: string
    sql: ${TABLE}.comments_c ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
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
  }

  dimension: contributed_revenue_c {
    type: number
    sql: ${TABLE}.contributed_revenue_c ;;
  }

  dimension: converted_account_id {
    type: string
    sql: ${TABLE}.converted_account_id ;;
  }

  dimension: converted_contact_id {
    type: string
    sql: ${TABLE}.converted_contact_id ;;
  }

  dimension_group: converted {
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
    sql: ${TABLE}.converted_date ;;
  }

  dimension: converted_from_lead_c {
    type: yesno
    sql: ${TABLE}.converted_from_lead_c ;;
  }

  dimension: converted_opportunity_id {
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: country_c {
    type: string
    sql: ${TABLE}.country_c ;;
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

  dimension: created_by_in_siebel_c {
    type: string
    sql: ${TABLE}.created_by_in_siebel_c ;;
  }

  dimension: created_by_marketing_c {
    type: yesno
    sql: ${TABLE}.created_by_marketing_c ;;
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

  dimension: current_ticketing_solution_c {
    type: string
    sql: ${TABLE}.current_ticketing_solution_c ;;
  }

  dimension: dataloader_tag_c {
    type: string
    sql: ${TABLE}.dataloader_tag_c ;;
  }

  dimension: deal_killers_pick_3_only_c {
    type: string
    sql: ${TABLE}.deal_killers_pick_3_only_c ;;
  }

  dimension: demographic_score_c {
    type: number
    sql: ${TABLE}.demographic_score_c ;;
  }

  dimension: department_c {
    type: string
    sql: ${TABLE}.department_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: do_not_call {
    type: yesno
    sql: ${TABLE}.do_not_call ;;
  }

  dimension: do_not_display_territory_code_c {
    type: string
    sql: ${TABLE}.do_not_display_territory_code_c ;;
  }

  dimension: do_not_sync_to_marketo_c {
    type: yesno
    sql: ${TABLE}.do_not_sync_to_marketo_c ;;
  }

  dimension: dupcheck_dc_3_disable_duplicate_check_c {
    type: yesno
    sql: ${TABLE}.dupcheck_dc_3_disable_duplicate_check_c ;;
  }

  dimension: dupcheck_dc_3_index_c {
    type: string
    sql: ${TABLE}.dupcheck_dc_3_index_c ;;
  }

  dimension: dupcheck_dc_3_web_2_lead_c {
    type: yesno
    sql: ${TABLE}.dupcheck_dc_3_web_2_lead_c ;;
  }

  dimension: eft_enabled_c {
    type: yesno
    sql: ${TABLE}.eft_enabled_c ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: email_bounced {
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
    sql: ${TABLE}.email_bounced_date ;;
  }

  dimension: email_bounced_reason {
    type: string
    sql: ${TABLE}.email_bounced_reason ;;
  }

  dimension: email_consent_c {
    type: string
    sql: ${TABLE}.email_consent_c ;;
  }

  dimension_group: email_consent_date_c {
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
    sql: ${TABLE}.email_consent_date_c ;;
  }

  dimension: email_opt_in_c {
    type: yesno
    sql: ${TABLE}.email_opt_in_c ;;
  }

  dimension: eventsperyear_c {
    type: number
    sql: ${TABLE}.eventsperyear_c ;;
  }

  dimension: expected_revenue_c {
    type: number
    sql: ${TABLE}.expected_revenue_c ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: forecast_c {
    type: yesno
    sql: ${TABLE}.forecast_c ;;
  }

  dimension: form_page_url_c {
    type: string
    sql: ${TABLE}.form_page_url_c ;;
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

  dimension_group: future_ping_c {
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
    sql: ${TABLE}.future_ping_c ;;
  }

  dimension: geocode_accuracy {
    type: string
    sql: ${TABLE}.geocode_accuracy ;;
  }

  dimension: got_postcard_c {
    type: yesno
    sql: ${TABLE}.got_postcard_c ;;
  }

  dimension: grow_sumo_id_c {
    type: string
    sql: ${TABLE}.grow_sumo_id_c ;;
  }

  dimension: guide_start_contact_id_c {
    type: string
    sql: ${TABLE}.guide_start_contact_id_c ;;
  }

  dimension: has_opted_out_of_email {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_email ;;
  }

  dimension: has_opted_out_of_fax {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_fax ;;
  }

  dimension: hear_about_vendini_c {
    type: string
    sql: ${TABLE}.hear_about_vendini_c ;;
  }

  dimension: how_they_heard_about_us_c {
    type: string
    sql: ${TABLE}.how_they_heard_about_us_c ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: import_id_c {
    type: string
    sql: ${TABLE}.import_id_c ;;
  }

  dimension: incumbent_global_c {
    type: string
    sql: ${TABLE}.incumbent_global_c ;;
  }

  dimension: incumbent_notes_c {
    type: string
    sql: ${TABLE}.incumbent_notes_c ;;
  }

  dimension: individual_id {
    type: string
    sql: ${TABLE}.individual_id ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: internet_connection_in_box_office_c {
    type: yesno
    sql: ${TABLE}.internet_connection_in_box_office_c ;;
  }

  dimension: invoice_1_st_deal_c {
    type: number
    sql: ${TABLE}.invoice_1_st_deal_c ;;
  }

  dimension: ip_address_c {
    type: string
    sql: ${TABLE}.ip_address_c ;;
  }

  dimension: is_converted {
    type: yesno
    sql: ${TABLE}.is_converted ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_unread_by_owner {
    type: yesno
    sql: ${TABLE}.is_unread_by_owner ;;
  }

  dimension: jigsaw {
    type: string
    sql: ${TABLE}.jigsaw ;;
  }

  dimension: jigsaw_contact_id {
    type: string
    sql: ${TABLE}.jigsaw_contact_id ;;
  }

  dimension: job_function_c {
    type: string
    sql: ${TABLE}.job_function_c ;;
  }

  dimension: job_role_c {
    type: string
    sql: ${TABLE}.job_role_c ;;
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

  dimension_group: last_campaign_membership_date_time_c {
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
    sql: ${TABLE}.last_campaign_membership_date_time_c ;;
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

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
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

  dimension_group: last_transfer {
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
    sql: ${TABLE}.last_transfer_date ;;
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

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: lead_id_to_opportunity_wfr_c {
    type: string
    sql: ${TABLE}.lead_id_to_opportunity_wfr_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension_group: lead_status_assigned_date_c {
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
    sql: ${TABLE}.lead_status_assigned_date_c ;;
  }

  dimension_group: lead_status_qualified_date_c {
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
    sql: ${TABLE}.lead_status_qualified_date_c ;;
  }

  dimension_group: lead_status_sales_accepted_date_c {
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
    sql: ${TABLE}.lead_status_sales_accepted_date_c ;;
  }

  dimension_group: lead_status_working_date_c {
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
    sql: ${TABLE}.lead_status_working_date_c ;;
  }

  dimension: lead_type_global_c {
    type: string
    sql: ${TABLE}.lead_type_global_c ;;
  }

  dimension: legacy_id_c {
    type: string
    sql: ${TABLE}.legacy_id_c ;;
  }

  dimension: legacy_in_ticketing_lead_id_c {
    type: string
    sql: ${TABLE}.legacy_in_ticketing_lead_id_c ;;
  }

  dimension: legacy_in_ticketing_lead_owner_c {
    type: string
    sql: ${TABLE}.legacy_in_ticketing_lead_owner_c ;;
  }

  dimension: legacy_owner_id_c {
    type: string
    sql: ${TABLE}.legacy_owner_id_c ;;
  }

  dimension: legacy_status_c {
    type: string
    sql: ${TABLE}.legacy_status_c ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: market_c {
    type: string
    sql: ${TABLE}.market_c ;;
  }

  dimension: marketing_known_program_channel_c {
    type: string
    sql: ${TABLE}.marketing_known_program_channel_c ;;
  }

  dimension_group: marketing_known_program_date_time_c {
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
    sql: ${TABLE}.marketing_known_program_date_time_c ;;
  }

  dimension: marketing_known_program_group_c {
    type: string
    sql: ${TABLE}.marketing_known_program_group_c ;;
  }

  dimension: marketing_known_program_insight_c {
    type: string
    sql: ${TABLE}.marketing_known_program_insight_c ;;
  }

  dimension: marketing_known_program_name_c {
    type: string
    sql: ${TABLE}.marketing_known_program_name_c ;;
  }

  dimension: marketing_known_program_vertical_c {
    type: string
    sql: ${TABLE}.marketing_known_program_vertical_c ;;
  }

  dimension: marketing_known_tactic_campaign_c {
    type: string
    sql: ${TABLE}.marketing_known_tactic_campaign_c ;;
  }

  dimension: marketing_known_tactic_content_c {
    type: string
    sql: ${TABLE}.marketing_known_tactic_content_c ;;
  }

  dimension_group: marketing_known_tactic_date_time_c {
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
    sql: ${TABLE}.marketing_known_tactic_date_time_c ;;
  }

  dimension: marketing_known_tactic_medium_c {
    type: string
    sql: ${TABLE}.marketing_known_tactic_medium_c ;;
  }

  dimension: marketing_known_tactic_source_c {
    type: string
    sql: ${TABLE}.marketing_known_tactic_source_c ;;
  }

  dimension: marketing_known_tactic_term_c {
    type: string
    sql: ${TABLE}.marketing_known_tactic_term_c ;;
  }

  dimension: marketing_qualified_program_channel_c {
    type: string
    sql: ${TABLE}.marketing_qualified_program_channel_c ;;
  }

  dimension_group: marketing_qualified_program_date_time_c {
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
    sql: ${TABLE}.marketing_qualified_program_date_time_c ;;
  }

  dimension: marketing_qualified_program_group_c {
    type: string
    sql: ${TABLE}.marketing_qualified_program_group_c ;;
  }

  dimension: marketing_qualified_program_insight_c {
    type: string
    sql: ${TABLE}.marketing_qualified_program_insight_c ;;
  }

  dimension: marketing_qualified_program_name_c {
    type: string
    sql: ${TABLE}.marketing_qualified_program_name_c ;;
  }

  dimension: marketing_qualified_program_vertical_c {
    type: string
    sql: ${TABLE}.marketing_qualified_program_vertical_c ;;
  }

  dimension: marketing_qualified_tactic_campaign_c {
    type: string
    sql: ${TABLE}.marketing_qualified_tactic_campaign_c ;;
  }

  dimension: marketing_qualified_tactic_content_c {
    type: string
    sql: ${TABLE}.marketing_qualified_tactic_content_c ;;
  }

  dimension_group: marketing_qualified_tactic_date_time_c {
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
    sql: ${TABLE}.marketing_qualified_tactic_date_time_c ;;
  }

  dimension: marketing_qualified_tactic_medium_c {
    type: string
    sql: ${TABLE}.marketing_qualified_tactic_medium_c ;;
  }

  dimension: marketing_qualified_tactic_source_c {
    type: string
    sql: ${TABLE}.marketing_qualified_tactic_source_c ;;
  }

  dimension: marketing_qualified_tactic_term_c {
    type: string
    sql: ${TABLE}.marketing_qualified_tactic_term_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: media_metro_c {
    type: string
    sql: ${TABLE}.media_metro_c ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: modified_by_in_siebel_c {
    type: string
    sql: ${TABLE}.modified_by_in_siebel_c ;;
  }

  dimension_group: modified_date_c {
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
    sql: ${TABLE}.modified_date_c ;;
  }

  dimension: most_recent_comment_c {
    type: string
    sql: ${TABLE}.most_recent_comment_c ;;
  }

  dimension: most_recent_comment_history_c {
    type: string
    sql: ${TABLE}.most_recent_comment_history_c ;;
  }

  dimension: most_recent_tactic_c {
    type: string
    sql: ${TABLE}.most_recent_tactic_c ;;
  }

  dimension: most_recent_tactic_history_c {
    type: string
    sql: ${TABLE}.most_recent_tactic_history_c ;;
  }

  dimension_group: mql_date_time_c {
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
    sql: ${TABLE}.mql_date_time_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: newsletter_opt_in_c {
    type: yesno
    sql: ${TABLE}.newsletter_opt_in_c ;;
  }

  dimension: next_step_c {
    type: string
    sql: ${TABLE}.next_step_c ;;
  }

  dimension: nps_comments_c {
    type: string
    sql: ${TABLE}.nps_comments_c ;;
  }

  dimension: nps_score_c {
    type: number
    sql: ${TABLE}.nps_score_c ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: of_events_per_year_c {
    type: number
    sql: ${TABLE}.of_events_per_year_c ;;
  }

  dimension: of_users_c {
    type: number
    sql: ${TABLE}.of_users_c ;;
  }

  dimension: operating_revenue_c {
    type: number
    sql: ${TABLE}.operating_revenue_c ;;
  }

  dimension: organization_type_c {
    type: string
    sql: ${TABLE}.organization_type_c ;;
  }

  dimension: own_venue_c {
    type: yesno
    sql: ${TABLE}.own_venue_c ;;
  }

  dimension: owner_alias_c {
    type: string
    sql: ${TABLE}.owner_alias_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: persona_c {
    type: string
    sql: ${TABLE}.persona_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: pi_campaign_c {
    type: string
    sql: ${TABLE}.pi_campaign_c ;;
  }

  dimension: pi_comments_c {
    type: string
    sql: ${TABLE}.pi_comments_c ;;
  }

  dimension_group: pi_conversion_date_c {
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
    sql: ${TABLE}.pi_conversion_date_c ;;
  }

  dimension: pi_conversion_object_name_c {
    type: string
    sql: ${TABLE}.pi_conversion_object_name_c ;;
  }

  dimension: pi_conversion_object_type_c {
    type: string
    sql: ${TABLE}.pi_conversion_object_type_c ;;
  }

  dimension_group: pi_created_date_c {
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
    sql: ${TABLE}.pi_created_date_c ;;
  }

  dimension_group: pi_first_activity_c {
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
    sql: ${TABLE}.pi_first_activity_c ;;
  }

  dimension: pi_first_search_term_c {
    type: string
    sql: ${TABLE}.pi_first_search_term_c ;;
  }

  dimension: pi_first_search_type_c {
    type: string
    sql: ${TABLE}.pi_first_search_type_c ;;
  }

  dimension: pi_first_touch_url_c {
    type: string
    sql: ${TABLE}.pi_first_touch_url_c ;;
  }

  dimension: pi_grade_c {
    type: string
    sql: ${TABLE}.pi_grade_c ;;
  }

  dimension_group: pi_last_activity_c {
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
    sql: ${TABLE}.pi_last_activity_c ;;
  }

  dimension: pi_needs_score_synced_c {
    type: yesno
    sql: ${TABLE}.pi_needs_score_synced_c ;;
  }

  dimension: pi_notes_c {
    type: string
    sql: ${TABLE}.pi_notes_c ;;
  }

  dimension: pi_pardot_hard_bounced_c {
    type: yesno
    sql: ${TABLE}.pi_pardot_hard_bounced_c ;;
  }

  dimension_group: pi_pardot_last_scored_at_c {
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
    sql: ${TABLE}.pi_pardot_last_scored_at_c ;;
  }

  dimension: pi_score_c {
    type: number
    sql: ${TABLE}.pi_score_c ;;
  }

  dimension: pi_url_c {
    type: string
    sql: ${TABLE}.pi_url_c ;;
  }

  dimension: pi_utm_campaign_c {
    type: string
    sql: ${TABLE}.pi_utm_campaign_c ;;
  }

  dimension: pi_utm_content_c {
    type: string
    sql: ${TABLE}.pi_utm_content_c ;;
  }

  dimension: pi_utm_medium_c {
    type: string
    sql: ${TABLE}.pi_utm_medium_c ;;
  }

  dimension: pi_utm_source_c {
    type: string
    sql: ${TABLE}.pi_utm_source_c ;;
  }

  dimension: pi_utm_term_c {
    type: string
    sql: ${TABLE}.pi_utm_term_c ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: price_range_c {
    type: string
    sql: ${TABLE}.price_range_c ;;
  }

  dimension: product_fit_c {
    type: string
    sql: ${TABLE}.product_fit_c ;;
  }

  dimension: product_interest_webto_lead_c {
    type: string
    sql: ${TABLE}.product_interest_webto_lead_c ;;
  }

  dimension: product_of_interest_c {
    type: string
    sql: ${TABLE}.product_of_interest_c ;;
  }

  dimension: profit_motive_c {
    type: string
    sql: ${TABLE}.profit_motive_c ;;
  }

  dimension: qualified_button_used_c {
    type: yesno
    sql: ${TABLE}.qualified_button_used_c ;;
  }

  dimension: quiz_result_c {
    type: string
    sql: ${TABLE}.quiz_result_c ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension_group: re_engagement_date_c {
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
    sql: ${TABLE}.re_engagement_date_c ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: recycled_reason_c {
    type: string
    sql: ${TABLE}.recycled_reason_c ;;
  }

  dimension: referral_id_c {
    type: string
    sql: ${TABLE}.referral_id_c ;;
  }

  dimension: referrer_id_c {
    type: string
    sql: ${TABLE}.referrer_id_c ;;
  }

  dimension_group: sal_date_time_c {
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
    sql: ${TABLE}.sal_date_time_c ;;
  }

  dimension: sales_stage_c {
    type: string
    sql: ${TABLE}.sales_stage_c ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: score_behavior_c {
    type: number
    sql: ${TABLE}.score_behavior_c ;;
  }

  dimension: score_demographic_c {
    type: number
    sql: ${TABLE}.score_demographic_c ;;
  }

  dimension: seats_exact_c {
    type: string
    sql: ${TABLE}.seats_exact_c ;;
  }

  dimension: secondary_lead_source_c {
    type: string
    sql: ${TABLE}.secondary_lead_source_c ;;
  }

  dimension: secondary_lead_source_opportunity_c {
    type: string
    sql: ${TABLE}.secondary_lead_source_opportunity_c ;;
  }

  dimension: segment_c {
    type: string
    sql: ${TABLE}.segment_c ;;
  }

  dimension: segment_new_c {
    type: string
    sql: ${TABLE}.segment_new_c ;;
  }

  dimension: services_c {
    type: string
    sql: ${TABLE}.services_c ;;
  }

  dimension: siebel_integration_id_c {
    type: string
    sql: ${TABLE}.siebel_integration_id_c ;;
  }

  dimension: source_c {
    type: string
    sql: ${TABLE}.source_c ;;
  }

  dimension: source_comments_c {
    type: string
    sql: ${TABLE}.source_comments_c ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_c {
    type: string
    sql: ${TABLE}.status_c ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: sub_segment_c {
    type: string
    sql: ${TABLE}.sub_segment_c ;;
  }

  dimension: submitter_ip_c {
    type: string
    sql: ${TABLE}.submitter_ip_c ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
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

  dimension: territory_code_c {
    type: string
    sql: ${TABLE}.territory_code_c ;;
  }

  dimension: territory_name_c {
    type: string
    sql: ${TABLE}.territory_name_c ;;
  }

  dimension_group: ticket_sales_deadline_c {
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
    sql: ${TABLE}.ticket_sales_deadline_c ;;
  }

  dimension: ticket_volume_tiers_c {
    type: string
    sql: ${TABLE}.ticket_volume_tiers_c ;;
  }

  dimension: ticket_vouch_percent_c {
    type: number
    sql: ${TABLE}.ticket_vouch_percent_c ;;
  }

  dimension: tickets_per_year_c {
    type: number
    sql: ${TABLE}.tickets_per_year_c ;;
  }

  dimension: timeline_c {
    type: string
    sql: ${TABLE}.timeline_c ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: unbounce_page_id_c {
    type: string
    sql: ${TABLE}.unbounce_page_id_c ;;
  }

  dimension: unbounce_page_variant_c {
    type: string
    sql: ${TABLE}.unbounce_page_variant_c ;;
  }

  dimension_group: unbounce_submission_date_c {
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
    sql: ${TABLE}.unbounce_submission_date_c ;;
  }

  dimension: unbounce_submission_time_c {
    type: string
    sql: ${TABLE}.unbounce_submission_time_c ;;
  }

  dimension: university_market_c {
    type: string
    sql: ${TABLE}.university_market_c ;;
  }

  dimension: upgrade_opportunity_name_c {
    type: string
    sql: ${TABLE}.upgrade_opportunity_name_c ;;
  }

  dimension: utm_campaign_c {
    type: string
    sql: ${TABLE}.utm_campaign_c ;;
  }

  dimension: utm_medium_c {
    type: string
    sql: ${TABLE}.utm_medium_c ;;
  }

  dimension: utm_source_c {
    type: string
    sql: ${TABLE}.utm_source_c ;;
  }

  dimension: utm_term_c {
    type: string
    sql: ${TABLE}.utm_term_c ;;
  }

  dimension: venue_capacity_c {
    type: number
    sql: ${TABLE}.venue_capacity_c ;;
  }

  dimension: venue_s_c {
    type: string
    sql: ${TABLE}.venue_s_c ;;
  }

  dimension: vertical_new_c {
    type: string
    sql: ${TABLE}.vertical_new_c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: zisf_person_has_moved_c {
    type: string
    sql: ${TABLE}.zisf_person_has_moved_c ;;
  }

  dimension: zisf_zoom_clean_status_c {
    type: string
    sql: ${TABLE}.zisf_zoom_clean_status_c ;;
  }

  dimension: zisf_zoom_id_c {
    type: string
    sql: ${TABLE}.zisf_zoom_id_c ;;
  }

  dimension: zisf_zoom_info_complete_status_c {
    type: string
    sql: ${TABLE}.zisf_zoom_info_complete_status_c ;;
  }

  dimension: zisf_zoom_info_email_c {
    type: string
    sql: ${TABLE}.zisf_zoom_info_email_c ;;
  }

  dimension: zisf_zoom_info_industry_c {
    type: string
    sql: ${TABLE}.zisf_zoom_info_industry_c ;;
  }

  dimension_group: zisf_zoom_info_last_clean_run_c {
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
    sql: ${TABLE}.zisf_zoom_info_last_clean_run_c ;;
  }

  dimension: zisf_zoom_info_phone_c {
    type: string
    sql: ${TABLE}.zisf_zoom_info_phone_c ;;
  }

  dimension: zisf_zoom_info_trigger_c {
    type: yesno
    sql: ${TABLE}.zisf_zoom_info_trigger_c ;;
  }

  dimension_group: zisf_zoom_lastupdated_c {
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
    sql: ${TABLE}.zisf_zoom_lastupdated_c ;;
  }

  dimension: zoom_contact_id_c {
    type: string
    sql: ${TABLE}.zoom_contact_id_c ;;
  }

  measure: count {
    type: count
    drill_fields: [lead_id_to_contact_wfr_c, name, first_name, last_name, middle_name]
  }
}
