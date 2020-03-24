view: sf_contact {
  sql_table_name: fivetran-ovation-tix-warehouse.new_salesforce.contact ;;
  drill_fields: [legacy_in_ticketing_contact_id_c]

  dimension: legacy_in_ticketing_contact_id_c {
    primary_key: yes
    type: string
    sql: ${TABLE}.legacy_in_ticketing_contact_id_c ;;
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

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: active_c {
    type: yesno
    sql: ${TABLE}.active_c ;;
  }

  dimension: active_contact_c {
    type: string
    sql: ${TABLE}.active_contact_c ;;
  }

  dimension: active_last_30_days_c {
    type: yesno
    sql: ${TABLE}.active_last_30_days_c ;;
  }

  dimension_group: admin_checkbox_date_c {
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
    sql: ${TABLE}.admin_checkbox_date_c ;;
  }

  dimension: alt_email_c {
    type: string
    sql: ${TABLE}.alt_email_c ;;
  }

  dimension: Account_Name_Formula__c {
    label: "Client Name"
    type: string
    sql: ${TABLE}.Account_Name_Formula__c ;;
  }

  dimension: apollo_contact_owner_c {
    type: string
    sql: ${TABLE}.apollo_contact_owner_c ;;
  }

  dimension: apply_to_all_contacts_c {
    type: string
    sql: ${TABLE}.apply_to_all_contacts_c ;;
  }

  dimension: assistant_name {
    type: string
    sql: ${TABLE}.assistant_name ;;
  }

  dimension: assistant_phone {
    type: string
    sql: ${TABLE}.assistant_phone ;;
  }

  dimension: av_community_activated_c {
    type: yesno
    sql: ${TABLE}.av_community_activated_c ;;
  }

  dimension: av_system_admin_c {
    type: yesno
    sql: ${TABLE}.av_system_admin_c ;;
  }

  dimension: behavior_score_c {
    type: number
    sql: ${TABLE}.behavior_score_c ;;
  }

  dimension_group: birthdate {
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
    sql: ${TABLE}.birthdate ;;
  }

  dimension: bounced_email_c {
    type: yesno
    sql: ${TABLE}.bounced_email_c ;;
  }

  dimension: box_office_2_nd_phone_c {
    type: string
    sql: ${TABLE}.box_office_2_nd_phone_c ;;
  }

  dimension: business_challenge_c {
    type: string
    sql: ${TABLE}.business_challenge_c ;;
  }

  dimension: buyer_type_c {
    type: string
    sql: ${TABLE}.buyer_type_c ;;
  }

  dimension: call_opt_out_c {
    type: yesno
    sql: ${TABLE}.call_opt_out_c ;;
  }

  dimension: campaign_c {
    type: string
    sql: ${TABLE}.campaign_c ;;
  }

  dimension: contact_de_dup_id_c {
    type: string
    sql: ${TABLE}.contact_de_dup_id_c ;;
  }

  dimension: contact_status_c {
    type: string
    sql: ${TABLE}.contact_status_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_by_marketing_acquisition_date_c {
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
    sql: ${TABLE}.created_by_marketing_acquisition_date_c ;;
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

  dimension: csat_delivered_desired_business_results_c {
    type: string
    sql: ${TABLE}.csat_delivered_desired_business_results_c ;;
  }

  dimension: ct_contact_lead_source_c {
    type: string
    sql: ${TABLE}.ct_contact_lead_source_c ;;
  }

  dimension: ct_opted_out_c {
    type: string
    sql: ${TABLE}.ct_opted_out_c ;;
  }

  dimension: ct_product_desired_c {
    type: string
    sql: ${TABLE}.ct_product_desired_c ;;
  }

  dimension: ct_record_id_c {
    type: string
    sql: ${TABLE}.ct_record_id_c ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: customer_community_profile_c {
    type: string
    sql: ${TABLE}.customer_community_profile_c ;;
  }

  dimension: demographic_score_c {
    type: number
    sql: ${TABLE}.demographic_score_c ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: department_c {
    type: string
    sql: ${TABLE}.department_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: desk_email_3_c {
    type: string
    sql: ${TABLE}.desk_email_3_c ;;
  }

  dimension: desk_email_4_c {
    type: string
    sql: ${TABLE}.desk_email_4_c ;;
  }

  dimension: desk_email_5_c {
    type: string
    sql: ${TABLE}.desk_email_5_c ;;
  }

  dimension: desk_id_c {
    type: string
    sql: ${TABLE}.desk_id_c ;;
  }

  dimension: desk_phone_5_c {
    type: string
    sql: ${TABLE}.desk_phone_5_c ;;
  }

  dimension: desk_phone_6_c {
    type: string
    sql: ${TABLE}.desk_phone_6_c ;;
  }

  dimension: desk_phone_7_c {
    type: string
    sql: ${TABLE}.desk_phone_7_c ;;
  }

  dimension: deskscmt_desk_customer_id_c {
    type: number
    value_format_name: id
    sql: ${TABLE}.deskscmt_desk_customer_id_c ;;
  }

  dimension: deskscmt_desk_migrated_contact_c {
    type: yesno
    sql: ${TABLE}.deskscmt_desk_migrated_contact_c ;;
  }

  dimension: direct_mail_opt_out_c {
    type: yesno
    sql: ${TABLE}.direct_mail_opt_out_c ;;
  }

  dimension: disruptor_c {
    type: yesno
    sql: ${TABLE}.disruptor_c ;;
  }

  dimension: do_not_call {
    type: yesno
    sql: ${TABLE}.do_not_call ;;
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

  dimension: email_domain_text_c {
    type: string
    sql: ${TABLE}.email_domain_text_c ;;
  }

  dimension: email_opt_in_c {
    type: yesno
    sql: ${TABLE}.email_opt_in_c ;;
  }

  dimension: exclude_from_na_arts_campaign_c {
    type: yesno
    sql: ${TABLE}.exclude_from_na_arts_campaign_c ;;
  }

  dimension: expectations_understood_implemented_c {
    type: string
    sql: ${TABLE}.expectations_understood_implemented_c ;;
  }

  dimension: facebook_profile_c {
    type: string
    sql: ${TABLE}.facebook_profile_c ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
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

  dimension: got_postcard_c {
    type: yesno
    sql: ${TABLE}.got_postcard_c ;;
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

  dimension: home_phone {
    type: string
    sql: ${TABLE}.home_phone ;;
  }

  dimension_group: hotlist_date_added_c {
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
    sql: ${TABLE}.hotlist_date_added_c ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: import_notes_c {
    type: string
    sql: ${TABLE}.import_notes_c ;;
  }

  dimension: inactive_c {
    type: yesno
    sql: ${TABLE}.inactive_c ;;
  }

  dimension: individual_id {
    type: string
    sql: ${TABLE}.individual_id ;;
  }

  dimension: inside_sales_rep_c {
    type: string
    sql: ${TABLE}.inside_sales_rep_c ;;
  }

  dimension: ip_address_c {
    type: string
    sql: ${TABLE}.ip_address_c ;;
  }

  dimension: is_admin_c {
    type: yesno
    sql: ${TABLE}.is_admin_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_email_bounced {
    type: yesno
    sql: ${TABLE}.is_email_bounced ;;
  }

  dimension: jigsaw {
    type: string
    sql: ${TABLE}.jigsaw ;;
  }

  dimension: jigsaw_contact_id {
    type: string
    sql: ${TABLE}.jigsaw_contact_id ;;
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

  dimension: last_csat_comment_c {
    type: string
    sql: ${TABLE}.last_csat_comment_c ;;
  }

  dimension_group: last_csat_date_c {
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
    sql: ${TABLE}.last_csat_date_c ;;
  }

  dimension: last_csat_reason_c {
    type: string
    sql: ${TABLE}.last_csat_reason_c ;;
  }

  dimension: last_csat_score_c {
    type: number
    sql: ${TABLE}.last_csat_score_c ;;
  }

  dimension_group: last_csat_send_date_c {
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
    sql: ${TABLE}.last_csat_send_date_c ;;
  }

  dimension_group: last_curequest {
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
    sql: ${TABLE}.last_curequest_date ;;
  }

  dimension_group: last_cuupdate {
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
    sql: ${TABLE}.last_cuupdate_date ;;
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

  dimension: lead_level_c {
    type: string
    sql: ${TABLE}.lead_level_c ;;
  }

  dimension: lead_record_id_c {
    type: string
    sql: ${TABLE}.lead_record_id_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lead_status_c {
    type: string
    sql: ${TABLE}.lead_status_c ;;
  }

  dimension: legacy_id_c {
    type: string
    sql: ${TABLE}.legacy_id_c ;;
  }

  dimension: legacy_in_ticketing_contact_owner_c {
    type: string
    sql: ${TABLE}.legacy_in_ticketing_contact_owner_c ;;
  }

  dimension: legacy_in_ticketing_currency_c {
    type: string
    sql: ${TABLE}.legacy_in_ticketing_currency_c ;;
  }

  dimension: legacy_org_c {
    type: string
    sql: ${TABLE}.legacy_org_c ;;
  }

  dimension: linked_in_c {
    type: string
    sql: ${TABLE}.linked_in_c ;;
  }

  dimension: linked_in_profile_c {
    type: string
    sql: ${TABLE}.linked_in_profile_c ;;
  }

  dimension: mailing_city {
    type: string
    sql: ${TABLE}.mailing_city ;;
  }

  dimension: mailing_country {
    type: string
    sql: ${TABLE}.mailing_country ;;
  }

  dimension: mailing_geocode_accuracy {
    type: string
    sql: ${TABLE}.mailing_geocode_accuracy ;;
  }

  dimension: mailing_latitude {
    type: number
    sql: ${TABLE}.mailing_latitude ;;
  }

  dimension: mailing_longitude {
    type: number
    sql: ${TABLE}.mailing_longitude ;;
  }

  dimension: mailing_postal_code {
    type: string
    sql: ${TABLE}.mailing_postal_code ;;
  }

  dimension: mailing_state {
    type: string
    sql: ${TABLE}.mailing_state ;;
  }

  dimension: mailing_street {
    type: string
    sql: ${TABLE}.mailing_street ;;
  }

  dimension: maintenance_contact_c {
    type: yesno
    sql: ${TABLE}.maintenance_contact_c ;;
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

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension_group: mkto_71_acquisition_date_c {
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
    sql: ${TABLE}.mkto_71_acquisition_date_c ;;
  }

  dimension: mkto_71_acquisition_program_c {
    type: string
    sql: ${TABLE}.mkto_71_acquisition_program_c ;;
  }

  dimension: mkto_71_acquisition_program_id_c {
    type: number
    value_format_name: id
    sql: ${TABLE}.mkto_71_acquisition_program_id_c ;;
  }

  dimension: mkto_71_inferred_city_c {
    type: string
    sql: ${TABLE}.mkto_71_inferred_city_c ;;
  }

  dimension: mkto_71_inferred_company_c {
    type: string
    sql: ${TABLE}.mkto_71_inferred_company_c ;;
  }

  dimension: mkto_71_inferred_country_c {
    type: string
    sql: ${TABLE}.mkto_71_inferred_country_c ;;
  }

  dimension: mkto_71_inferred_metropolitan_area_c {
    type: string
    sql: ${TABLE}.mkto_71_inferred_metropolitan_area_c ;;
  }

  dimension: mkto_71_inferred_phone_area_code_c {
    type: string
    sql: ${TABLE}.mkto_71_inferred_phone_area_code_c ;;
  }

  dimension: mkto_71_inferred_postal_code_c {
    type: string
    sql: ${TABLE}.mkto_71_inferred_postal_code_c ;;
  }

  dimension: mkto_71_inferred_state_region_c {
    type: string
    sql: ${TABLE}.mkto_71_inferred_state_region_c ;;
  }

  dimension: mkto_71_lead_score_c {
    type: number
    sql: ${TABLE}.mkto_71_lead_score_c ;;
  }

  dimension: mkto_71_original_referrer_c {
    type: string
    sql: ${TABLE}.mkto_71_original_referrer_c ;;
  }

  dimension: mkto_71_original_search_engine_c {
    type: string
    sql: ${TABLE}.mkto_71_original_search_engine_c ;;
  }

  dimension: mkto_71_original_search_phrase_c {
    type: string
    sql: ${TABLE}.mkto_71_original_search_phrase_c ;;
  }

  dimension: mkto_71_original_source_info_c {
    type: string
    sql: ${TABLE}.mkto_71_original_source_info_c ;;
  }

  dimension: mkto_71_original_source_type_c {
    type: string
    sql: ${TABLE}.mkto_71_original_source_type_c ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
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

  dimension_group: mql_date_c {
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
    sql: ${TABLE}.mql_date_c ;;
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

  dimension: nps_comments_c {
    type: string
    sql: ${TABLE}.nps_comments_c ;;
  }

  dimension_group: nps_last_send_date_c {
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
    sql: ${TABLE}.nps_last_send_date_c ;;
  }

  dimension: nps_manual_override_c {
    type: string
    sql: ${TABLE}.nps_manual_override_c ;;
  }

  dimension_group: nps_manual_override_date_c {
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
    sql: ${TABLE}.nps_manual_override_date_c ;;
  }

  dimension: nps_score_c {
    type: number
    sql: ${TABLE}.nps_score_c ;;
  }

  dimension_group: nps_submitted_c {
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
    sql: ${TABLE}.nps_submitted_c ;;
  }

  dimension: organization_type_c {
    type: string
    sql: ${TABLE}.organization_type_c ;;
  }

  dimension: other_city {
    type: string
    sql: ${TABLE}.other_city ;;
  }

  dimension: other_country {
    type: string
    sql: ${TABLE}.other_country ;;
  }

  dimension: other_geocode_accuracy {
    type: string
    sql: ${TABLE}.other_geocode_accuracy ;;
  }

  dimension: other_latitude {
    type: number
    sql: ${TABLE}.other_latitude ;;
  }

  dimension: other_longitude {
    type: number
    sql: ${TABLE}.other_longitude ;;
  }

  dimension: other_phone {
    type: string
    sql: ${TABLE}.other_phone ;;
  }

  dimension: other_postal_code {
    type: string
    sql: ${TABLE}.other_postal_code ;;
  }

  dimension: other_state {
    type: string
    sql: ${TABLE}.other_state ;;
  }

  dimension: other_street {
    type: string
    sql: ${TABLE}.other_street ;;
  }

  dimension: outreach_stage_c {
    type: string
    sql: ${TABLE}.outreach_stage_c ;;
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

  dimension: preferred_language_override_c {
    type: string
    sql: ${TABLE}.preferred_language_override_c ;;
  }

  dimension: preferred_pronoun_c {
    type: string
    sql: ${TABLE}.preferred_pronoun_c ;;
  }

  dimension: previous_company_c {
    type: string
    sql: ${TABLE}.previous_company_c ;;
  }

  dimension: project_communication_effective_c {
    type: string
    sql: ${TABLE}.project_communication_effective_c ;;
  }

  dimension: project_timelines_met_c {
    type: string
    sql: ${TABLE}.project_timelines_met_c ;;
  }

  dimension_group: qso_date_c {
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
    sql: ${TABLE}.qso_date_c ;;
  }

  dimension: rating_c {
    type: string
    sql: ${TABLE}.rating_c ;;
  }

  dimension: recycle_reason_c {
    type: string
    sql: ${TABLE}.recycle_reason_c ;;
  }

  dimension: reference_c {
    type: yesno
    sql: ${TABLE}.reference_c ;;
  }

  dimension: referenceable_c {
    type: string
    sql: ${TABLE}.referenceable_c ;;
  }

  dimension: referral_id_c {
    type: string
    sql: ${TABLE}.referral_id_c ;;
  }

  dimension: referrer_id_c {
    type: string
    sql: ${TABLE}.referrer_id_c ;;
  }

  dimension: reports_to_id {
    type: string
    sql: ${TABLE}.reports_to_id ;;
  }

  dimension_group: retarget_date_c {
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
    sql: ${TABLE}.retarget_date_c ;;
  }

  dimension: risks_communicated_and_managed_c {
    type: string
    sql: ${TABLE}.risks_communicated_and_managed_c ;;
  }

  dimension: role_c {
    type: string
    sql: ${TABLE}.role_c ;;
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

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension_group: sao_date_c {
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
    sql: ${TABLE}.sao_date_c ;;
  }

  dimension: score_behavior_c {
    type: number
    sql: ${TABLE}.score_behavior_c ;;
  }

  dimension: score_demographic_c {
    type: number
    sql: ${TABLE}.score_demographic_c ;;
  }

  dimension: secondary_lead_source_c {
    type: string
    sql: ${TABLE}.secondary_lead_source_c ;;
  }

  dimension: secondary_lead_source_old_c {
    type: string
    sql: ${TABLE}.secondary_lead_source_old_c ;;
  }

  dimension_group: sql_date_c {
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
    sql: ${TABLE}.sql_date_c ;;
  }

  dimension_group: sql_date_time_c {
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
    sql: ${TABLE}.sql_date_time_c ;;
  }

  dimension: sql_opportunity_c {
    type: string
    sql: ${TABLE}.sql_opportunity_c ;;
  }

  dimension: status_c {
    type: string
    sql: ${TABLE}.status_c ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }

  dimension: support_notes_c {
    type: string
    sql: ${TABLE}.support_notes_c ;;
  }

  dimension: suspend_marketing_c {
    type: yesno
    sql: ${TABLE}.suspend_marketing_c ;;
  }

  dimension: sync_to_net_suite_c {
    type: yesno
    sql: ${TABLE}.sync_to_net_suite_c ;;
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

  dimension: ticket_volume_tiers_c {
    type: string
    sql: ${TABLE}.ticket_volume_tiers_c ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: trigger_pardot_sync_c {
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
    sql: ${TABLE}.trigger_pardot_sync_c ;;
  }

  dimension: twitter_handle_c {
    type: string
    sql: ${TABLE}.twitter_handle_c ;;
  }

  dimension: typeof_buyer_c {
    type: string
    sql: ${TABLE}.typeof_buyer_c ;;
  }

  dimension: university_market_c {
    type: string
    sql: ${TABLE}.university_market_c ;;
  }

  dimension: unqualified_reason_c {
    type: string
    sql: ${TABLE}.unqualified_reason_c ;;
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

  dimension: vip_xfer_contact_c {
    type: yesno
    sql: ${TABLE}.vip_xfer_contact_c ;;
  }

  dimension: zendesk_contact_id_c {
    type: string
    sql: ${TABLE}.zendesk_contact_id_c ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      legacy_in_ticketing_contact_id_c,
      assistant_name,
      name,
      first_name,
      last_name,
      middle_name
    ]
  }
}
