view: sf_task {
  sql_table_name: new_salesforce.task ;;


#   dimension: legacy_in_ticketing_task_id_c {
#     type: string
#     sql: ${TABLE}.legacy_in_ticketing_task_id_c ;;
#   }

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

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: activity {
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
    sql: ${TABLE}.activity_date ;;
  }

  dimension: call_disposition {
    type: string
    sql: ${TABLE}.call_disposition ;;
  }

  dimension: call_duration_in_seconds {
    type: number
    sql: ${TABLE}.call_duration_in_seconds ;;
  }

  dimension: call_object {
    type: string
    sql: ${TABLE}.call_object ;;
  }

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }

  dimension: case_c {
    type: string
    sql: ${TABLE}.case_c ;;
  }

  dimension: comments_c {
    type: string
    sql: ${TABLE}.comments_c ;;
  }

  dimension_group: completed_date_c {
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
    sql: ${TABLE}.completed_date_c ;;
  }

  dimension_group: completed_date {
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
    sql: ${TABLE}.completed_date_time ;;
  }

  dimension: contact_phone_c {
    type: string
    sql: ${TABLE}.contact_phone_c ;;
  }

  dimension: create_an_opportunity_c {
    type: yesno
    sql: ${TABLE}.create_an_opportunity_c ;;
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

  dimension: csm_event_subject_c {
    type: string
    sql: ${TABLE}.csm_event_subject_c ;;
  }

  dimension: ct_created_by_c {
    type: string
    sql: ${TABLE}.ct_created_by_c ;;
  }

  dimension: ct_record_id_c {
    type: string
    sql: ${TABLE}.ct_record_id_c ;;
  }

  dimension: ct_review_c {
    type: yesno
    sql: ${TABLE}.ct_review_c ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: custom_demo_account_c {
    type: yesno
    sql: ${TABLE}.custom_demo_account_c ;;
  }

  dimension: custom_demo_account_needed_picklist_c {
    type: string
    sql: ${TABLE}.custom_demo_account_needed_picklist_c ;;
  }

  dimension: custom_presentation_c {
    type: yesno
    sql: ${TABLE}.custom_presentation_c ;;
  }

  dimension: custom_presentation_needed_picklist_c {
    type: string
    sql: ${TABLE}.custom_presentation_needed_picklist_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: due_date_time_c {
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
    sql: ${TABLE}.due_date_time_c ;;
  }

  dimension: duplicate_account_c {
    type: yesno
    sql: ${TABLE}.duplicate_account_c ;;
  }

  dimension: duplicate_contact_c {
    type: yesno
    sql: ${TABLE}.duplicate_contact_c ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_high_priority {
    type: yesno
    sql: ${TABLE}.is_high_priority ;;
  }

  dimension: is_recurrence {
    type: yesno
    sql: ${TABLE}.is_recurrence ;;
  }

  dimension: is_reminder_set {
    type: yesno
    sql: ${TABLE}.is_reminder_set ;;
  }

  dimension: is_visible_in_self_service {
    type: yesno
    sql: ${TABLE}.is_visible_in_self_service ;;
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

  dimension: legacy_id_c {
    type: string
    sql: ${TABLE}.legacy_id_c ;;
  }

  dimension: legacy_in_ticketing_assigned_to_c {
    type: string
    sql: ${TABLE}.legacy_in_ticketing_assigned_to_c ;;
  }

  dimension: manual_demo_credit_c {
    type: yesno
    sql: ${TABLE}.manual_demo_credit_c ;;
  }

  dimension: meeting_type_c {
    type: string
    sql: ${TABLE}.meeting_type_c ;;
  }

  dimension: other_c {
    type: yesno
    sql: ${TABLE}.other_c ;;
  }

  dimension: owner_from_siebel_c {
    type: string
    sql: ${TABLE}.owner_from_siebel_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: recurrence_activity_id {
    type: string
    sql: ${TABLE}.recurrence_activity_id ;;
  }

  dimension: recurrence_day_of_month {
    type: number
    sql: ${TABLE}.recurrence_day_of_month ;;
  }

  dimension: recurrence_day_of_week_mask {
    type: number
    sql: ${TABLE}.recurrence_day_of_week_mask ;;
  }

  dimension_group: recurrence_end_date_only {
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
    sql: ${TABLE}.recurrence_end_date_only ;;
  }

  dimension: recurrence_instance {
    type: string
    sql: ${TABLE}.recurrence_instance ;;
  }

  dimension: recurrence_interval {
    type: number
    sql: ${TABLE}.recurrence_interval ;;
  }

  dimension: recurrence_month_of_year {
    type: string
    sql: ${TABLE}.recurrence_month_of_year ;;
  }

  dimension: recurrence_regenerated_type {
    type: string
    sql: ${TABLE}.recurrence_regenerated_type ;;
  }

  dimension_group: recurrence_start_date_only {
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
    sql: ${TABLE}.recurrence_start_date_only ;;
  }

  dimension: recurrence_time_zone_sid_key {
    type: string
    sql: ${TABLE}.recurrence_time_zone_sid_key ;;
  }

  dimension: recurrence_type {
    type: string
    sql: ${TABLE}.recurrence_type ;;
  }

  dimension_group: reminder_date {
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
    sql: ${TABLE}.reminder_date_time ;;
  }

  dimension: report_samples_c {
    type: string
    sql: ${TABLE}.report_samples_c ;;
  }

  dimension: request_sales_engineer_c {
    type: yesno
    sql: ${TABLE}.request_sales_engineer_c ;;
  }

  dimension: sales_engineering_comments_c {
    type: string
    sql: ${TABLE}.sales_engineering_comments_c ;;
  }

  dimension: siebel_intergation_id_c {
    type: string
    sql: ${TABLE}.siebel_intergation_id_c ;;
  }

  dimension: sourced_by_c {
    type: string
    sql: ${TABLE}.sourced_by_c ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
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

  dimension: task_subtype {
    type: string
    sql: ${TABLE}.task_subtype ;;
  }

  dimension: template_c {
    type: string
    sql: ${TABLE}.template_c ;;
  }

  dimension_group: time_completed_c {
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
    sql: ${TABLE}.time_completed_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: website_c {
    type: string
    sql: ${TABLE}.website_c ;;
  }

  dimension: website_manager_build_needed_picklist_c {
    type: string
    sql: ${TABLE}.website_manager_build_needed_picklist_c ;;
  }

  dimension: website_manager_sample_c {
    type: yesno
    sql: ${TABLE}.website_manager_sample_c ;;
  }

  dimension: what_count {
    type: number
    sql: ${TABLE}.what_count ;;
  }

  dimension: what_id {
    type: string
    sql: ${TABLE}.what_id ;;
  }

  dimension: who_count {
    type: number
    sql: ${TABLE}.who_count ;;
  }

  dimension: who_id {
    type: string
    sql: ${TABLE}.who_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
