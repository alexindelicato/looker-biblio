view: sf_case {
  sql_table_name: new_salesforce.`case` ;;


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

  dimension: response_time {
    type: number
    sql: timestamp_diff(${first_response_c_raw},${created_raw}, MINUTE) ;;
  }

  measure: avg_response_time {
    label: "Average First Response Time (Minutes)"
    type: average
    value_format: "#"
    sql: ${response_time} ;;
  }

  measure: count_close {
    type: count
    drill_fields: [detail*]

    filters: {
      field: status
      value: "%Close%" }
  }

  measure: count_not_close {
    type: count
    drill_fields: [detail*]

    filters: {
      field: status
      value: "-%Close%" }

    filters: {
      field: subject
      value: "-%Approve%" }
  }


  measure: count_approved {
    type: count
    drill_fields: [detail*]

    filters: {
      field: case_owner_id
      value: "Approved for finance to settle" }
  }

  measure: count_settled {
    type: count
    drill_fields: [detail*]

    filters: {
      field: subject
      value: "Approved%" }
  }

  measure: count_rejected {
    type: count
    drill_fields: [detail*]

    filters: {
      field: status
      value: "%Close%" }

    filters: {
      field: subject
      value: "-%Approve%" }
  }


  measure: count_unapproved {
    type: count
    drill_fields: [detail*]

    filters: {
      field: case_owner_id
      value: "Withheld - In review with client" }
  }

  measure: count_escalated {
    type: count
    drill_fields: [detail*]

    filters: {
      field: case_owner_id
      value: "Approved for peer review" }
  }

  measure: count_settlement {
    type: count
    drill_fields: [detail*]

    filters: {
      field: case_owner_id
      value: "In Queue" }
  }



  measure: count {
    type: count
    drill_fields: [detail*]
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

  dimension: accounting_escalation_platform_c {
    type: string
    sql: ${TABLE}.accounting_escalation_platform_c ;;
  }

  dimension: accounting_escalation_type_c {
    type: string
    sql: ${TABLE}.accounting_escalation_type_c ;;
  }

  dimension: acquisition_feedback_c {
    type: string
    sql: ${TABLE}.acquisition_feedback_c ;;
  }

  dimension: acquisition_sentiment_c {
    type: string
    sql: ${TABLE}.acquisition_sentiment_c ;;
  }

  dimension_group: actual_launch_date_c {
    type: time
    sql: ${TABLE}.actual_launch_date_c ;;
  }

  dimension: ad_hoc_email_1_c {
    type: string
    sql: ${TABLE}.ad_hoc_email_1_c ;;
  }

  dimension: ad_hoc_email_2_c {
    type: string
    sql: ${TABLE}.ad_hoc_email_2_c ;;
  }

  dimension: ad_hoc_email_3_c {
    type: string
    sql: ${TABLE}.ad_hoc_email_3_c ;;
  }

  dimension: agent_in_desk_c {
    type: string
    sql: ${TABLE}.agent_in_desk_c ;;
  }

  dimension: agent_sentiment_c {
    type: string
    sql: ${TABLE}.agent_sentiment_c ;;
  }

  dimension: aha_url_c {
    type: string
    sql: ${TABLE}.aha_url_c ;;
  }

  dimension: application_c {
    type: string
    sql: ${TABLE}.application_c ;;
  }

  dimension: asset_id {
    type: string
    sql: ${TABLE}.asset_id ;;
  }

  dimension: assignee_c {
    type: string
    sql: ${TABLE}.assignee_c ;;
  }

  dimension: assignment_group_c {
    type: string
    sql: ${TABLE}.assignment_group_c ;;
  }

  dimension: assignment_type_c {
    type: string
    sql: ${TABLE}.assignment_type_c ;;
  }

  dimension: ba_email_c {
    type: string
    sql: ${TABLE}.ba_email_c ;;
  }

  dimension: box_office_feedback_c {
    type: string
    sql: ${TABLE}.box_office_feedback_c ;;
  }

  dimension: bug_number_c {
    type: string
    sql: ${TABLE}.bug_number_c ;;
  }

  dimension: build_type_c {
    type: string
    sql: ${TABLE}.build_type_c ;;
  }

  dimension: business_hours_id {
    type: string
    sql: ${TABLE}.business_hours_id ;;
  }

  dimension: case_cc_account_owner_c {
    type: string
    sql: ${TABLE}.case_cc_account_owner_c ;;
  }

  dimension: case_last_comment_public_yes_or_no_c {
    type: string
    sql: ${TABLE}.case_last_comment_public_yes_or_no_c ;;
  }

  dimension: case_opened {
    type: yesno
    sql:  ${case_number} IS NOT NULL ;;
  }

  dimension: case_number {
    type: string
    sql: ${TABLE}.case_number ;;
  }

  dimension: case_reassign_helper_c {
    type: string
    sql: ${TABLE}.case_reassign_helper_c ;;
  }

  dimension: case_type_c {
    type: string
    sql: ${TABLE}.case_type_c ;;
  }

  dimension: cause_c {
    type: string
    sql: ${TABLE}.cause_c ;;
  }

  dimension_group: closed_date {
    type: time
    sql: ${TABLE}.closed_date ;;
  }

  dimension: cms_non_urgent_exclude_c {
    type: string
    sql: ${TABLE}.cms_non_urgent_exclude_c ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension: contact_fax {
    type: string
    sql: ${TABLE}.contact_fax ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: contact_mobile {
    type: string
    sql: ${TABLE}.contact_mobile ;;
  }

  dimension: contact_phone {
    type: string
    sql: ${TABLE}.contact_phone ;;
  }

  dimension: contact_preference_c {
    type: string
    sql: ${TABLE}.contact_preference_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: created_from_closed_case_c {
    type: string
    sql: ${TABLE}.created_from_closed_case_c ;;
  }

  dimension: cross_sell_feedback_c {
    type: string
    sql: ${TABLE}.cross_sell_feedback_c ;;
  }

  dimension: csat_comment_c {
    type: string
    sql: ${TABLE}.csat_comment_c ;;
  }

  dimension_group: csat_date_time_c {
    type: time
    sql: ${TABLE}.csat_date_time_c ;;
  }

  dimension: csat_reason_c {
    type: string
    sql: ${TABLE}.csat_reason_c ;;
  }

  dimension: csat_score_c {
    type: number
    sql: ${TABLE}.csat_score_c ;;
  }

  dimension: csat_sent_c {
    type: string
    sql: ${TABLE}.csat_sent_c ;;
  }

  dimension: csm_email_address_c {
    type: string
    sql: ${TABLE}.csm_email_address_c ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: custom_demo_account_c {
    type: string
    sql: ${TABLE}.custom_demo_account_c ;;
  }

  dimension: custom_demo_account_needed_picklist_c {
    type: string
    sql: ${TABLE}.custom_demo_account_needed_picklist_c ;;
  }

  dimension: custom_presentation_c {
    type: string
    sql: ${TABLE}.custom_presentation_c ;;
  }

  dimension: custom_presentation_needed_picklist_c {
    type: string
    sql: ${TABLE}.custom_presentation_needed_picklist_c ;;
  }

  dimension: customer_s_internal_incident_number_c {
    type: string
    sql: ${TABLE}.customer_s_internal_incident_number_c ;;
  }

  dimension_group: date_time_escalation_first_response_c {
    type: time
    sql: ${TABLE}.date_time_escalation_first_response_c ;;
  }

  dimension_group: date_time_festival_survey_received_c {
    type: time
    sql: ${TABLE}.date_time_festival_survey_received_c ;;
  }

  dimension_group: date_time_festival_survey_sent_c {
    type: time
    sql: ${TABLE}.date_time_festival_survey_sent_c ;;
  }

  dimension_group: date_time_first_close_c {
    type: time
    sql: ${TABLE}.date_time_first_close_c ;;
  }

  dimension_group: date_time_first_touch_c {
    type: time
    sql: ${TABLE}.date_time_first_touch_c ;;
  }

  dimension: de_email_c {
    type: string
    sql: ${TABLE}.de_email_c ;;
  }

  dimension_group: deliverable_sla_clock_start_c {
    type: time
    sql: ${TABLE}.deliverable_sla_clock_start_c ;;
  }

  dimension_group: deliverable_sla_clock_stop_c {
    type: time
    sql: ${TABLE}.deliverable_sla_clock_stop_c ;;
  }

  dimension: deliverable_stage_c {
    type: string
    sql: ${TABLE}.deliverable_stage_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: desk_agent_text_c {
    type: string
    sql: ${TABLE}.desk_agent_text_c ;;
  }

  dimension: desk_case_number_c {
    type: string
    sql: ${TABLE}.desk_case_number_c ;;
  }

  dimension: desk_case_url_c {
    type: string
    sql: ${TABLE}.desk_case_url_c ;;
  }

  dimension: desk_id_c {
    type: string
    sql: ${TABLE}.desk_id_c ;;
  }

  dimension: desk_labels_c {
    type: string
    sql: ${TABLE}.desk_labels_c ;;
  }

  dimension: deskscmt_desk_case_id_c {
    type: number
    sql: ${TABLE}.deskscmt_desk_case_id_c ;;
  }

  dimension: deskscmt_desk_connect_sync_c {
    type: string
    sql: ${TABLE}.deskscmt_desk_connect_sync_c ;;
  }

  dimension: deskscmt_desk_migrated_case_c {
    type: string
    sql: ${TABLE}.deskscmt_desk_migrated_case_c ;;
  }

  dimension: discussed_adopting_wltl_c {
    type: string
    sql: ${TABLE}.discussed_adopting_wltl_c ;;
  }

  dimension: dnr_c {
    type: string
    sql: ${TABLE}.dnr_c ;;
  }

  dimension_group: due_date_c {
    type: time
    sql: ${TABLE}.due_date_c ;;
  }

  dimension_group: due_date_time_c {
    type: time
    sql: ${TABLE}.due_date_time_c ;;
  }

  dimension: dummy_checkbox_c {
    type: string
    sql: ${TABLE}.dummy_checkbox_c ;;
  }

  dimension: email_marketing_feedback_c {
    type: string
    sql: ${TABLE}.email_marketing_feedback_c ;;
  }

  dimension: environment_area_c {
    type: string
    sql: ${TABLE}.environment_area_c ;;
  }

  dimension: escalated_by_c {
    type: string
    sql: ${TABLE}.escalated_by_c ;;
  }

  dimension: escalated_case_c {
    type: string
    sql: ${TABLE}.escalated_case_c ;;
  }

  dimension_group: escalated_timestamp_c {
    type: time
    sql: ${TABLE}.escalated_timestamp_c ;;
  }

  dimension: escalation_first_response_by_c {
    type: string
    sql: ${TABLE}.escalation_first_response_by_c ;;
  }

  dimension: escalation_sent_back_by_c {
    type: string
    sql: ${TABLE}.escalation_sent_back_by_c ;;
  }

  dimension_group: escalation_sent_back_timestamp_c {
    type: time
    sql: ${TABLE}.escalation_sent_back_timestamp_c ;;
  }

  dimension: escalation_type_c {
    type: string
    sql: ${TABLE}.escalation_type_c ;;
  }

  dimension_group: event_ends_on_hardware_c {
    type: time
    sql: ${TABLE}.event_ends_on_hardware_c ;;
  }

  dimension_group: event_starts_on_hardware_c {
    type: time
    sql: ${TABLE}.event_starts_on_hardware_c ;;
  }

  dimension: event_wizard_feedback_c {
    type: string
    sql: ${TABLE}.event_wizard_feedback_c ;;
  }

  dimension: feature_request_pick_3_only_c {
    type: string
    sql: ${TABLE}.feature_request_pick_3_only_c ;;
  }

  dimension: fee_update_needed_c {
    type: string
    sql: ${TABLE}.fee_update_needed_c ;;
  }

  dimension_group: fee_verification_date_c {
    type: time
    sql: ${TABLE}.fee_verification_date_c ;;
  }

  dimension: fee_verifier_c {
    type: string
    sql: ${TABLE}.fee_verifier_c ;;
  }

  dimension: fees_verified_c {
    type: string
    sql: ${TABLE}.fees_verified_c ;;
  }

  dimension: field_update_test_c {
    type: string
    sql: ${TABLE}.field_update_test_c ;;
  }

  dimension_group: first_outbound_email_c {
    type: time
    sql: ${TABLE}.first_outbound_email_c ;;
  }

  dimension: first_resolved_by_c {
    type: string
    sql: ${TABLE}.first_resolved_by_c ;;
  }

  dimension_group: first_response_c {
    type: time
    sql: ${TABLE}.first_response_c ;;
  }

  dimension: first_response_sent_by_c {
    type: string
    sql: ${TABLE}.first_response_sent_by_c ;;
  }

  dimension: first_touched_by_c {
    type: string
    sql: ${TABLE}.first_touched_by_c ;;
  }

  dimension: fixed_in_c {
    type: string
    sql: ${TABLE}.fixed_in_c ;;
  }

  dimension: flag_for_management_c {
    type: string
    sql: ${TABLE}.flag_for_management_c ;;
  }

  dimension: french_language_detected_c {
    type: string
    sql: ${TABLE}.french_language_detected_c ;;
  }

  dimension: group_c {
    type: string
    sql: ${TABLE}.group_c ;;
  }

  dimension: hardware_api_key_venue_url_c {
    type: string
    sql: ${TABLE}.hardware_api_key_venue_url_c ;;
  }

  dimension: hardware_invoice_link_c {
    type: string
    sql: ${TABLE}.hardware_invoice_link_c ;;
  }

  dimension: hardware_invoice_status_c {
    type: string
    sql: ${TABLE}.hardware_invoice_status_c ;;
  }

  dimension: hardware_item_no_1_c {
    type: string
    sql: ${TABLE}.hardware_item_no_1_c ;;
  }

  dimension: hardware_item_no_1_quantity_c {
    type: number
    sql: ${TABLE}.hardware_item_no_1_quantity_c ;;
  }

  dimension: hardware_item_no_2_c {
    type: string
    sql: ${TABLE}.hardware_item_no_2_c ;;
  }

  dimension: hardware_item_no_2_quantity_c {
    type: number
    sql: ${TABLE}.hardware_item_no_2_quantity_c ;;
  }

  dimension: hardware_item_no_3_c {
    type: string
    sql: ${TABLE}.hardware_item_no_3_c ;;
  }

  dimension: hardware_item_no_3_quantity_c {
    type: number
    sql: ${TABLE}.hardware_item_no_3_quantity_c ;;
  }

  dimension: hardware_request_comments_c {
    type: string
    sql: ${TABLE}.hardware_request_comments_c ;;
  }

  dimension_group: hardware_request_date_c {
    type: time
    sql: ${TABLE}.hardware_request_date_c ;;
  }

  dimension: hardware_request_type_c {
    type: string
    sql: ${TABLE}.hardware_request_type_c ;;
  }

  dimension: heat_call_number_c {
    type: string
    sql: ${TABLE}.heat_call_number_c ;;
  }

  dimension: hosting_ticket_url_c {
    type: string
    sql: ${TABLE}.hosting_ticket_url_c ;;
  }

  dimension: hotfix_c {
    type: number
    sql: ${TABLE}.hotfix_c ;;
  }

  dimension: impact_level_c {
    type: string
    sql: ${TABLE}.impact_level_c ;;
  }

  dimension: import_record_count_c {
    type: number
    sql: ${TABLE}.import_record_count_c ;;
  }

  dimension: import_type_c {
    type: string
    sql: ${TABLE}.import_type_c ;;
  }

  dimension: inbound_email_address_c {
    type: string
    sql: ${TABLE}.inbound_email_address_c ;;
  }

  dimension: internal_owner_c {
    type: string
    sql: ${TABLE}.internal_owner_c ;;
  }

  dimension: is_closed {
    type: string
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_closed_on_create {
    type: string
    sql: ${TABLE}.is_closed_on_create ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_escalated {
    type: string
    sql: ${TABLE}.is_escalated ;;
  }

  dimension: is_escalated_c {
    type: string
    sql: ${TABLE}.is_escalated_c ;;
  }

  dimension: jira_id_c {
    type: string
    sql: ${TABLE}.jira_id_c ;;
  }

  dimension: jira_url_c {
    type: string
    sql: ${TABLE}.jira_url_c ;;
  }

  dimension: kickoff_call_complete_c {
    type: string
    sql: ${TABLE}.kickoff_call_complete_c ;;
  }

  dimension_group: last_call_logged_timestamp_c {
    type: time
    sql: ${TABLE}.last_call_logged_timestamp_c ;;
  }

  dimension: last_case_comment_creator_c {
    type: string
    sql: ${TABLE}.last_case_comment_creator_c ;;
  }

  dimension_group: last_case_comment_date_c {
    type: time
    sql: ${TABLE}.last_case_comment_date_c ;;
  }

  dimension_group: last_comment_timestamp_c {
    type: time
    sql: ${TABLE}.last_comment_timestamp_c ;;
  }

  dimension_group: last_inbound_message_timestamp_c {
    type: time
    sql: ${TABLE}.last_inbound_message_timestamp_c ;;
  }

  dimension_group: last_message_timestamp_c {
    type: time
    sql: ${TABLE}.last_message_timestamp_c ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_outbound_email_c {
    type: time
    sql: ${TABLE}.last_outbound_email_c ;;
  }

  dimension_group: last_outbound_message_timestamp_c {
    type: time
    sql: ${TABLE}.last_outbound_message_timestamp_c ;;
  }

  dimension: last_private_case_comment_c {
    type: string
    sql: ${TABLE}.last_private_case_comment_c ;;
  }

  dimension_group: last_private_case_comment_date_c {
    type: time
    sql: ${TABLE}.last_private_case_comment_date_c ;;
  }

  dimension: last_public_case_comment_c {
    type: string
    sql: ${TABLE}.last_public_case_comment_c ;;
  }

  dimension_group: last_referenced_date {
    type: time
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed_date {
    type: time
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension_group: launch_date_c {
    type: time
    sql: ${TABLE}.launch_date_c ;;
  }

  dimension: launch_description_test_c {
    type: string
    sql: ${TABLE}.launch_description_test_c ;;
  }

  dimension: launch_health_c {
    type: string
    sql: ${TABLE}.launch_health_c ;;
  }

  dimension: launch_health_reason_c {
    type: string
    sql: ${TABLE}.launch_health_reason_c ;;
  }

  dimension: launch_request_prep_alert_sent_c {
    type: string
    sql: ${TABLE}.launch_request_prep_alert_sent_c ;;
  }

  dimension_group: launch_request_submitted_c {
    type: time
    sql: ${TABLE}.launch_request_submitted_c ;;
  }

  dimension: launched_c {
    type: string
    sql: ${TABLE}.launched_c ;;
  }

  dimension_group: launched_timestamp_c {
    type: time
    sql: ${TABLE}.launched_timestamp_c ;;
  }

  dimension: legacy_case_number_c {
    type: string
    sql: ${TABLE}.legacy_case_number_c ;;
  }

  dimension: legacy_id_c {
    type: string
    sql: ${TABLE}.legacy_id_c ;;
  }

  dimension_group: live_date_c {
    type: time
    sql: ${TABLE}.live_date_c ;;
  }

  dimension: live_mode_c {
    type: string
    sql: ${TABLE}.live_mode_c ;;
  }

  dimension_group: maintenance_date_c {
    type: time
    sql: ${TABLE}.maintenance_date_c ;;
  }

  dimension: maintenance_de_c {
    type: string
    sql: ${TABLE}.maintenance_de_c ;;
  }

  dimension: maintenance_order_c {
    type: string
    sql: ${TABLE}.maintenance_order_c ;;
  }

  dimension: maintenance_type_c {
    type: string
    sql: ${TABLE}.maintenance_type_c ;;
  }

  dimension: manager_override_actual_launch_date_c {
    type: string
    sql: ${TABLE}.manager_override_actual_launch_date_c ;;
  }

  dimension: member_corp_site_webform_c {
    type: string
    sql: ${TABLE}.member_corp_site_webform_c ;;
  }

  dimension: member_support_high_priority_c {
    type: string
    sql: ${TABLE}.member_support_high_priority_c ;;
  }

  dimension: merchant_account_created_c {
    type: string
    sql: ${TABLE}.merchant_account_created_c ;;
  }

  dimension: mistake_in_prep_c {
    type: string
    sql: ${TABLE}.mistake_in_prep_c ;;
  }

  dimension: module_c {
    type: string
    sql: ${TABLE}.module_c ;;
  }

  dimension: new_case_c {
    type: string
    sql: ${TABLE}.new_case_c ;;
  }

  dimension: nps_comments_c {
    type: string
    sql: ${TABLE}.nps_comments_c ;;
  }

  dimension_group: nps_date_time_c {
    type: time
    sql: ${TABLE}.nps_date_time_c ;;
  }

  dimension: nps_score_c {
    type: number
    sql: ${TABLE}.nps_score_c ;;
  }

  dimension: nps_survey_platform_c {
    type: string
    sql: ${TABLE}.nps_survey_platform_c ;;
  }

  dimension: nps_tag_1_c {
    type: string
    sql: ${TABLE}.nps_tag_1_c ;;
  }

  dimension: nps_tag_1_category_c {
    type: string
    sql: ${TABLE}.nps_tag_1_category_c ;;
  }

  dimension: nps_tag_2_c {
    type: string
    sql: ${TABLE}.nps_tag_2_c ;;
  }

  dimension: nps_tag_2_category_c {
    type: string
    sql: ${TABLE}.nps_tag_2_category_c ;;
  }

  dimension: nps_tag_3_c {
    type: string
    sql: ${TABLE}.nps_tag_3_c ;;
  }

  dimension: nps_tag_3_category_c {
    type: string
    sql: ${TABLE}.nps_tag_3_category_c ;;
  }

  dimension: nps_tag_4_c {
    type: string
    sql: ${TABLE}.nps_tag_4_c ;;
  }

  dimension: nps_tag_4_category_c {
    type: string
    sql: ${TABLE}.nps_tag_4_category_c ;;
  }

  dimension: nps_tag_5_c {
    type: string
    sql: ${TABLE}.nps_tag_5_c ;;
  }

  dimension: nps_tag_5_category_c {
    type: string
    sql: ${TABLE}.nps_tag_5_category_c ;;
  }

  dimension: ntbf_product_area_c {
    type: string
    sql: ${TABLE}.ntbf_product_area_c ;;
  }

  dimension: ntbf_retention_issue_c {
    type: string
    sql: ${TABLE}.ntbf_retention_issue_c ;;
  }

  dimension: number_of_seats_c {
    type: number
    sql: ${TABLE}.number_of_seats_c ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: other_accounts_reporting_c {
    type: string
    sql: ${TABLE}.other_accounts_reporting_c ;;
  }

  dimension: owner_id {
    type: string
    sql:${TABLE}.owner_id;;
  }

  dimension: case_owner_id {
    type: string
    sql: case when ${TABLE}.owner_id IN ("00G4T000000Z9eiUAC","0054T000001XoxiQAC","0054T000001VEQ6QAO","0054T000001XvhiQAC","0054T000001VEQ3QAO","0054T000001VW3MQAW","0054T000001XiNnQAK","0054T000001XvPJQA0") then "Approved for finance to settle"
         when ${TABLE}.owner_id = "00G4T000000Z9edUAC" then "Approved for peer review"
         when ${TABLE}.owner_id = "00G4T000000Z9UTUA0" then "In Queue"
         when ${TABLE}.owner_id = "00G4T000000ZAAzUAO" then "Donation Settlement"
         when ${TABLE}.owner_id NOT IN ("00G4T000000Z9eiUAC","0054T000001XoxiQAC","0054T000001VEQ6QAO","0054T000001XvhiQAC","0054T000001VEQ3QAO","0054T000001VW3MQAW","0054T000001XiNnQAK","0054T000001XvPJQA0")  and ${TABLE}.owner_id != "00G4T000000Z9eiUAC" and ${TABLE}.owner_id != "00G4T000000Z9UTUA0" and ${TABLE}.owner_id != "00G4T000000ZAAzUAO" then "Withheld - In review with client"
    else  ${TABLE}.owner_id end ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: patron_corp_site_webform_c {
    type: string
    sql: ${TABLE}.patron_corp_site_webform_c ;;
  }

  dimension: payment_gateway_created_c {
    type: string
    sql: ${TABLE}.payment_gateway_created_c ;;
  }

  dimension: pending_reason_c {
    type: string
    sql: ${TABLE}.pending_reason_c ;;
  }

  dimension: pm_email_c {
    type: string
    sql: ${TABLE}.pm_email_c ;;
  }

  dimension: post_training_action_c {
    type: string
    sql: ${TABLE}.post_training_action_c ;;
  }

  dimension: pretty_pic_needed_c {
    type: string
    sql: ${TABLE}.pretty_pic_needed_c ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: product_c {
    type: string
    sql: ${TABLE}.product_c ;;
  }

  dimension: queue_escalation_picklist_c {
    type: string
    sql: ${TABLE}.queue_escalation_picklist_c ;;
  }

  dimension: ready_for_alert_c {
    type: string
    sql: ${TABLE}.ready_for_alert_c ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: reason_launch_date_changed_c {
    type: string
    sql: ${TABLE}.reason_launch_date_changed_c ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: related_opportunity_c {
    type: string
    sql: ${TABLE}.related_opportunity_c ;;
  }

  dimension_group: rep_s_est_launch_date_c {
    type: time
    sql: ${TABLE}.rep_s_est_launch_date_c ;;
  }

  dimension: report_to_it_c {
    type: string
    sql: ${TABLE}.report_to_it_c ;;
  }

  dimension: request_comments_c {
    type: string
    sql: ${TABLE}.request_comments_c ;;
  }

  dimension: request_type_c {
    type: string
    sql: ${TABLE}.request_type_c ;;
  }

  dimension: resolution_c {
    type: string
    sql: ${TABLE}.resolution_c ;;
  }

  dimension: revenue_opportunity_status_c {
    type: string
    sql: ${TABLE}.revenue_opportunity_status_c ;;
  }

  dimension: revenue_opportunity_type_c {
    type: string
    sql: ${TABLE}.revenue_opportunity_type_c ;;
  }

  dimension: rush_c {
    type: string
    sql: ${TABLE}.rush_c ;;
  }

  dimension: site_needed_for_launch_c {
    type: string
    sql: ${TABLE}.site_needed_for_launch_c ;;
  }

  dimension: site_url_c {
    type: string
    sql: ${TABLE}.site_url_c ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.source_id ;;
  }

  dimension: spam_c {
    type: string
    sql: ${TABLE}.spam_c ;;
  }

  dimension: staging_work_in_progress_c {
    type: string
    sql: ${TABLE}.staging_work_in_progress_c ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: supplied_company {
    type: string
    sql: ${TABLE}.supplied_company ;;
  }

  dimension: supplied_email {
    type: string
    sql: ${TABLE}.supplied_email ;;
  }

  dimension: supplied_name {
    type: string
    sql: ${TABLE}.supplied_name ;;
  }

  dimension: supplied_phone {
    type: string
    sql: ${TABLE}.supplied_phone ;;
  }

  dimension: support_squad_email_c {
    type: string
    sql: ${TABLE}.support_squad_email_c ;;
  }

  dimension: sync_to_desk_c {
    type: string
    sql: ${TABLE}.sync_to_desk_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: tab_c {
    type: string
    sql: ${TABLE}.tab_c ;;
  }

  dimension_group: target_date_c {
    type: time
    sql: ${TABLE}.target_date_c ;;
  }

  dimension: targeted_for_next_maintenance_release_c {
    type: string
    sql: ${TABLE}.targeted_for_next_maintenance_release_c ;;
  }

  dimension: template_c {
    type: string
    sql: ${TABLE}.template_c ;;
  }

  dimension_group: test_date_c {
    type: time
    sql: ${TABLE}.test_date_c ;;
  }

  dimension: test_desk_sync_c {
    type: string
    sql: ${TABLE}.test_desk_sync_c ;;
  }

  dimension: tickets_per_year_c {
    type: number
    sql: ${TABLE}.tickets_per_year_c ;;
  }

  dimension: tiered_pricing_feedback_c {
    type: string
    sql: ${TABLE}.tiered_pricing_feedback_c ;;
  }

  dimension: topic_c {
    type: string
    sql: ${TABLE}.topic_c ;;
  }

  dimension_group: touch_again_c {
    type: time
    sql: ${TABLE}.touch_again_c ;;
  }

  dimension_group: training_date_time_c {
    type: time
    sql: ${TABLE}.training_date_time_c ;;
  }

  dimension: training_topic_c {
    type: string
    sql: ${TABLE}.training_topic_c ;;
  }

  dimension: trigger_email_alert_c {
    type: string
    sql: ${TABLE}.trigger_email_alert_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: update_c {
    type: string
    sql: ${TABLE}.update_c ;;
  }

  dimension: venue_name_c {
    type: string
    sql: ${TABLE}.venue_name_c ;;
  }

  dimension: venue_type_c {
    type: string
    sql: ${TABLE}.venue_type_c ;;
  }

  dimension: version_c {
    type: string
    sql: ${TABLE}.version_c ;;
  }

  dimension: vfas_feedback_c {
    type: string
    sql: ${TABLE}.vfas_feedback_c ;;
  }

  dimension_group: website_launch_date_c {
    type: time
    sql: ${TABLE}.website_launch_date_c ;;
  }

  dimension: website_manager_build_needed_picklist_c {
    type: string
    sql: ${TABLE}.website_manager_build_needed_picklist_c ;;
  }

  dimension: website_manager_sample_c {
    type: string
    sql: ${TABLE}.website_manager_sample_c ;;
  }

  dimension: wltl_feedback_c {
    type: string
    sql: ${TABLE}.wltl_feedback_c ;;
  }

  dimension: wm_build_type_c {
    type: string
    sql: ${TABLE}.wm_build_type_c ;;
  }

  dimension: x_1_1_training_time_spent_c {
    type: string
    sql: ${TABLE}.x_1_1_training_time_spent_c ;;
  }

  dimension: x_3_rd_party_ticket_number_c {
    type: string
    sql: ${TABLE}.x_3_rd_party_ticket_number_c ;;
  }

  dimension: xf_review_c {
    type: string
    sql: ${TABLE}.xf_review_c ;;
  }

  dimension: year_1_attainment_on_track_c {
    type: string
    sql: ${TABLE}.year_1_attainment_on_track_c ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: fstr_already_generated_c {
    type: string
    sql: ${TABLE}.fstr_already_generated_c ;;
  }

  dimension: fstr_approval_c {
    type: string
    sql: ${TABLE}.fstr_approval_c ;;
  }

  dimension_group: fstr_auto_close_c {
    type: time
    sql: ${TABLE}.fstr_auto_close_c ;;
  }

  dimension: fstr_auto_close_steps_not_created_c {
    type: number
    sql: ${TABLE}.fstr_auto_close_steps_not_created_c ;;
  }

  dimension: fstr_business_process_c {
    type: string
    sql: ${TABLE}.fstr_business_process_c ;;
  }

  dimension: fstr_completed_by_c {
    type: string
    sql: ${TABLE}.fstr_completed_by_c ;;
  }

  dimension_group: fstr_completed_date_c {
    type: time
    sql: ${TABLE}.fstr_completed_date_c ;;
  }

  dimension: fstr_contract_c {
    type: string
    sql: ${TABLE}.fstr_contract_c ;;
  }

  dimension_group: fstr_due_date_c {
    type: time
    sql: ${TABLE}.fstr_due_date_c ;;
  }

  dimension: fstr_email_queue_members_c {
    type: string
    sql: ${TABLE}.fstr_email_queue_members_c ;;
  }

  dimension: fstr_opportunity_c {
    type: string
    sql: ${TABLE}.fstr_opportunity_c ;;
  }

  dimension: fstr_parent_event_id_c {
    type: string
    sql: ${TABLE}.fstr_parent_event_id_c ;;
  }

  dimension: fstr_parent_object_name_c {
    type: string
    sql: ${TABLE}.fstr_parent_object_name_c ;;
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

  dimension: fstr_step_id_c {
    type: string
    sql: ${TABLE}.fstr_step_id_c ;;
  }

  dimension: fstr_step_lookup_c {
    type: string
    sql: ${TABLE}.fstr_step_lookup_c ;;
  }

  dimension: fstr_step_stage_id_c {
    type: string
    sql: ${TABLE}.fstr_step_stage_id_c ;;
  }

  dimension: project_manager_c {
    type: string
    sql: ${TABLE}.project_manager_c ;;
  }

  dimension: zendesk_id_c {
    type: number
    sql: ${TABLE}.zendesk_id_c ;;
  }

  dimension: zendesk_recipient_email_c {
    type: string
    sql: ${TABLE}.zendesk_recipient_email_c ;;
  }

  dimension: zendesk_tags_c {
    type: string
    sql: ${TABLE}.zendesk_tags_c ;;
  }

  dimension: zendesk_category_c {
    type: string
    sql: ${TABLE}.zendesk_category_c ;;
  }

  dimension: zendesk_is_public_c {
    type: string
    sql: ${TABLE}.zendesk_is_public_c ;;
  }

  dimension: zendesk_ticket_id_c {
    type: number
    sql: ${TABLE}.zendesk_ticket_id_c ;;
  }

  dimension: import_notes_c {
    type: string
    sql: ${TABLE}.import_notes_c ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: html_5_ta_release_feedback_c {
    type: string
    sql: ${TABLE}.html_5_ta_release_feedback_c ;;
  }

  dimension: covid_19_cancellation_c {
    type: string
    sql: ${TABLE}.covid_19_cancellation_c ;;
  }

  dimension: anything_else_sf_c {
    type: string
    sql: ${TABLE}.anything_else_sf_c ;;
  }

  dimension: did_you_scan_tickets_to_your_event_sf_c {
    type: string
    sql: ${TABLE}.did_you_scan_tickets_to_your_event_sf_c ;;
  }

  dimension: external_report_sf_c {
    type: string
    sql: ${TABLE}.external_report_sf_c ;;
  }

  dimension: is_there_a_deadline_for_your_patrons_sf_c {
    type: string
    sql: ${TABLE}.is_there_a_deadline_for_your_patrons_sf_c ;;
  }

  dimension: name_of_organization_sf_c {
    type: string
    sql: ${TABLE}.name_of_organization_sf_c ;;
  }

  dimension: offer_refunds_credits_etc_sf_c {
    type: string
    sql: ${TABLE}.offer_refunds_credits_etc_sf_c ;;
  }

  dimension: urls_to_website_and_social_media_site_sf_c {
    type: string
    sql: ${TABLE}.urls_to_website_and_social_media_site_sf_c ;;
  }

  dimension: what_event_s_took_place_what_dates_sf_c {
    type: string
    sql: ${TABLE}.what_event_s_took_place_what_dates_sf_c ;;
  }

  dimension: what_is_your_email_address_sf_c {
    type: string
    sql: ${TABLE}.what_is_your_email_address_sf_c ;;
  }

  dimension: what_is_your_name_sf_c {
    type: string
    sql: ${TABLE}.what_is_your_name_sf_c ;;
  }

  dimension: what_platform_do_you_sell_tickets_on_sf_c {
    type: string
    sql: ${TABLE}.what_platform_do_you_sell_tickets_on_sf_c ;;
  }

  dimension: written_consent_regarding_ticket_sf_c {
    type: string
    sql: ${TABLE}.written_consent_regarding_ticket_sf_c ;;
  }

  dimension: select_your_settlement_period_sf_c {
    type: string
    sql: ${TABLE}.select_your_settlement_period_sf_c ;;
  }

  dimension: rank_settlement_period {
    type: number
    sql: case when ${TABLE}.select_your_settlement_period_sf_c = "March 2 - March 8" then 1
         when ${TABLE}.select_your_settlement_period_sf_c = "March 9 - March 15" then 2
         when ${TABLE}.select_your_settlement_period_sf_c = "March 16 - March 22" then 3
         when ${TABLE}.select_your_settlement_period_sf_c = "March 23 - March 29" then 4
         when ${TABLE}.select_your_settlement_period_sf_c = "March 30 - April 5" then 5
         when ${TABLE}.select_your_settlement_period_sf_c = "April 6 - April 12" then 6
         when ${TABLE}.select_your_settlement_period_sf_c = "April 13 - April 19" then 7
         when ${TABLE}.select_your_settlement_period_sf_c = "April 20 - April 26" then 8
         when ${TABLE}.select_your_settlement_period_sf_c = "April 27 - May 3" then 9
         else 0 End;;
  }

  dimension: settlement_amount_c {
    type: number
    value_format_name: usd
    sql: ${TABLE}.settlement_amount_c ;;
  }

  set: detail {
    fields: [
      name_of_organization_sf_c,
      sf_contact.name,
      sf_contact.email,
      case_number,
      case_owner_id,
      subject,
      created_time,
      status,
      settlement_amount_c,
      did_you_scan_tickets_to_your_event_sf_c,
      is_there_a_deadline_for_your_patrons_sf_c,
      name_of_organization_sf_c,
      offer_refunds_credits_etc_sf_c,
      urls_to_website_and_social_media_site_sf_c,
      what_event_s_took_place_what_dates_sf_c,
      what_is_your_email_address_sf_c,
      what_is_your_name_sf_c,
      what_platform_do_you_sell_tickets_on_sf_c,
      written_consent_regarding_ticket_sf_c,
      select_your_settlement_period_sf_c,
      anything_else_sf_c
    ]
  }
}
