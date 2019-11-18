view: sf_user {
  sql_table_name: new_salesforce.user ;;
  drill_fields: [deskscmt_desk_user_id_c]

  dimension: deskscmt_desk_user_id_c {
    type: string
    sql: ${TABLE}.deskscmt_desk_user_id_c ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
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

  dimension: about_me {
    type: string
    sql: ${TABLE}.about_me ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: badge_text {
    type: string
    sql: ${TABLE}.badge_text ;;
  }

  dimension: banner_photo_url {
    type: string
    sql: ${TABLE}.banner_photo_url ;;
  }

  dimension: call_center_id {
    type: string
    sql: ${TABLE}.call_center_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: community_nickname {
    type: string
    sql: ${TABLE}.community_nickname ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: default_currency_iso_code {
    type: string
    sql: ${TABLE}.default_currency_iso_code ;;
  }

  dimension: default_group_notification_frequency {
    type: string
    sql: ${TABLE}.default_group_notification_frequency ;;
  }

  dimension: delegated_approver_id {
    type: string
    sql: ${TABLE}.delegated_approver_id ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: digest_frequency {
    type: string
    sql: ${TABLE}.digest_frequency ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: dupcheck_dc_3_disable_duplicate_check_c {
    type: yesno
    sql: ${TABLE}.dupcheck_dc_3_disable_duplicate_check_c ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_encoding_key {
    type: string
    sql: ${TABLE}.email_encoding_key ;;
  }

  dimension: email_preferences_auto_bcc {
    type: yesno
    sql: ${TABLE}.email_preferences_auto_bcc ;;
  }

  dimension: email_preferences_auto_bcc_stay_in_touch {
    type: yesno
    sql: ${TABLE}.email_preferences_auto_bcc_stay_in_touch ;;
  }

  dimension: email_preferences_stay_in_touch_reminder {
    type: yesno
    sql: ${TABLE}.email_preferences_stay_in_touch_reminder ;;
  }

  dimension: employee_number {
    type: string
    sql: ${TABLE}.employee_number ;;
  }

  dimension: extension {
    type: string
    sql: ${TABLE}.extension ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: federation_identifier {
    type: string
    sql: ${TABLE}.federation_identifier ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: forecast_enabled {
    type: yesno
    sql: ${TABLE}.forecast_enabled ;;
  }

  dimension: full_photo_url {
    type: string
    sql: ${TABLE}.full_photo_url ;;
  }

  dimension: geocode_accuracy {
    type: string
    sql: ${TABLE}.geocode_accuracy ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: individual_id {
    type: string
    sql: ${TABLE}.individual_id ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_ext_indicator_visible {
    type: yesno
    sql: ${TABLE}.is_ext_indicator_visible ;;
  }

  dimension: is_portal_enabled {
    type: yesno
    sql: ${TABLE}.is_portal_enabled ;;
  }

  dimension: is_profile_photo_active {
    type: yesno
    sql: ${TABLE}.is_profile_photo_active ;;
  }

  dimension: language_locale_key {
    type: string
    sql: ${TABLE}.language_locale_key ;;
  }

  dimension_group: last_login {
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
    sql: ${TABLE}.last_login_date ;;
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

  dimension_group: last_password_change {
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
    sql: ${TABLE}.last_password_change_date ;;
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

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: locale_sid_key {
    type: string
    sql: ${TABLE}.locale_sid_key ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: manager_id {
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: medium_banner_photo_url {
    type: string
    sql: ${TABLE}.medium_banner_photo_url ;;
  }

  dimension: medium_photo_url {
    type: string
    sql: ${TABLE}.medium_photo_url ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: name {
    label: "Account Rep"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: offline_pda_trial_expiration {
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
    sql: ${TABLE}.offline_pda_trial_expiration_date ;;
  }

  dimension_group: offline_trial_expiration {
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
    sql: ${TABLE}.offline_trial_expiration_date ;;
  }

  dimension: out_of_office_message {
    type: string
    sql: ${TABLE}.out_of_office_message ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: pi_can_view_not_assigned_prospects_c {
    type: yesno
    sql: ${TABLE}.pi_can_view_not_assigned_prospects_c ;;
  }

  dimension: pi_pardot_api_key_c {
    type: string
    sql: ${TABLE}.pi_pardot_api_key_c ;;
  }

  dimension: pi_pardot_api_version_c {
    type: string
    sql: ${TABLE}.pi_pardot_api_version_c ;;
  }

  dimension: pi_pardot_user_id_c {
    type: string
    sql: ${TABLE}.pi_pardot_user_id_c ;;
  }

  dimension: pi_pardot_user_key_c {
    type: string
    sql: ${TABLE}.pi_pardot_user_key_c ;;
  }

  dimension: pi_pardot_user_role_c {
    type: string
    sql: ${TABLE}.pi_pardot_user_role_c ;;
  }

  dimension: portal_role {
    type: string
    sql: ${TABLE}.portal_role ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: receives_admin_info_emails {
    type: yesno
    sql: ${TABLE}.receives_admin_info_emails ;;
  }

  dimension: receives_info_emails {
    type: yesno
    sql: ${TABLE}.receives_info_emails ;;
  }

  dimension: sender_email {
    type: string
    sql: ${TABLE}.sender_email ;;
  }

  dimension: sender_name {
    type: string
    sql: ${TABLE}.sender_name ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: small_banner_photo_url {
    type: string
    sql: ${TABLE}.small_banner_photo_url ;;
  }

  dimension: small_photo_url {
    type: string
    sql: ${TABLE}.small_photo_url ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: stay_in_touch_note {
    type: string
    sql: ${TABLE}.stay_in_touch_note ;;
  }

  dimension: stay_in_touch_signature {
    type: string
    sql: ${TABLE}.stay_in_touch_signature ;;
  }

  dimension: stay_in_touch_subject {
    type: string
    sql: ${TABLE}.stay_in_touch_subject ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }

  dimension: support_squad_email_c {
    type: string
    sql: ${TABLE}.support_squad_email_c ;;
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

  dimension: time_zone_sid_key {
    type: string
    sql: ${TABLE}.time_zone_sid_key ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: user_permissions_avantgo_user {
    type: yesno
    sql: ${TABLE}.user_permissions_avantgo_user ;;
  }

  dimension: user_permissions_call_center_auto_login {
    type: yesno
    sql: ${TABLE}.user_permissions_call_center_auto_login ;;
  }

  dimension: user_permissions_interaction_user {
    type: yesno
    sql: ${TABLE}.user_permissions_interaction_user ;;
  }

  dimension: user_permissions_knowledge_user {
    type: yesno
    sql: ${TABLE}.user_permissions_knowledge_user ;;
  }

  dimension: user_permissions_marketing_user {
    type: yesno
    sql: ${TABLE}.user_permissions_marketing_user ;;
  }

  dimension: user_permissions_mobile_user {
    type: yesno
    sql: ${TABLE}.user_permissions_mobile_user ;;
  }

  dimension: user_permissions_offline_user {
    type: yesno
    sql: ${TABLE}.user_permissions_offline_user ;;
  }

  dimension: user_permissions_sfcontent_user {
    type: yesno
    sql: ${TABLE}.user_permissions_sfcontent_user ;;
  }

  dimension: user_permissions_support_user {
    type: yesno
    sql: ${TABLE}.user_permissions_support_user ;;
  }

  dimension: user_preferences_activity_reminders_popup {
    type: yesno
    sql: ${TABLE}.user_preferences_activity_reminders_popup ;;
  }

  dimension: user_preferences_apex_pages_developer_mode {
    type: yesno
    sql: ${TABLE}.user_preferences_apex_pages_developer_mode ;;
  }

  dimension: user_preferences_cache_diagnostics {
    type: yesno
    sql: ${TABLE}.user_preferences_cache_diagnostics ;;
  }

  dimension: user_preferences_create_lexapps_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_create_lexapps_wtshown ;;
  }

  dimension: user_preferences_dis_comment_after_like_email {
    type: yesno
    sql: ${TABLE}.user_preferences_dis_comment_after_like_email ;;
  }

  dimension: user_preferences_dis_mentions_comment_email {
    type: yesno
    sql: ${TABLE}.user_preferences_dis_mentions_comment_email ;;
  }

  dimension: user_preferences_dis_prof_post_comment_email {
    type: yesno
    sql: ${TABLE}.user_preferences_dis_prof_post_comment_email ;;
  }

  dimension: user_preferences_disable_all_feeds_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_all_feeds_email ;;
  }

  dimension: user_preferences_disable_bookmark_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_bookmark_email ;;
  }

  dimension: user_preferences_disable_change_comment_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_change_comment_email ;;
  }

  dimension: user_preferences_disable_endorsement_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_endorsement_email ;;
  }

  dimension: user_preferences_disable_file_share_notifications_for_api {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_file_share_notifications_for_api ;;
  }

  dimension: user_preferences_disable_followers_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_followers_email ;;
  }

  dimension: user_preferences_disable_later_comment_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_later_comment_email ;;
  }

  dimension: user_preferences_disable_like_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_like_email ;;
  }

  dimension: user_preferences_disable_mentions_post_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_mentions_post_email ;;
  }

  dimension: user_preferences_disable_message_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_message_email ;;
  }

  dimension: user_preferences_disable_profile_post_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_profile_post_email ;;
  }

  dimension: user_preferences_disable_share_post_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_share_post_email ;;
  }

  dimension: user_preferences_enable_auto_sub_for_feeds {
    type: yesno
    sql: ${TABLE}.user_preferences_enable_auto_sub_for_feeds ;;
  }

  dimension: user_preferences_event_reminders_checkbox_default {
    type: yesno
    sql: ${TABLE}.user_preferences_event_reminders_checkbox_default ;;
  }

  dimension: user_preferences_exclude_mail_app_attachments {
    type: yesno
    sql: ${TABLE}.user_preferences_exclude_mail_app_attachments ;;
  }

  dimension: user_preferences_favorites_show_top_favorites {
    type: yesno
    sql: ${TABLE}.user_preferences_favorites_show_top_favorites ;;
  }

  dimension: user_preferences_favorites_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_favorites_wtshown ;;
  }

  dimension: user_preferences_global_nav_bar_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_global_nav_bar_wtshown ;;
  }

  dimension: user_preferences_global_nav_grid_menu_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_global_nav_grid_menu_wtshown ;;
  }

  dimension: user_preferences_has_celebration_badge {
    type: yesno
    sql: ${TABLE}.user_preferences_has_celebration_badge ;;
  }

  dimension: user_preferences_hide_bigger_photo_callout {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_bigger_photo_callout ;;
  }

  dimension: user_preferences_hide_chatter_onboarding_splash {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_chatter_onboarding_splash ;;
  }

  dimension: user_preferences_hide_csndesktop_task {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_csndesktop_task ;;
  }

  dimension: user_preferences_hide_csnget_chatter_mobile_task {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_csnget_chatter_mobile_task ;;
  }

  dimension: user_preferences_hide_end_user_onboarding_assistant_modal {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_end_user_onboarding_assistant_modal ;;
  }

  dimension: user_preferences_hide_lightning_migration_modal {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_lightning_migration_modal ;;
  }

  dimension: user_preferences_hide_s_1_browser_ui {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_s_1_browser_ui ;;
  }

  dimension: user_preferences_hide_second_chatter_onboarding_splash {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_second_chatter_onboarding_splash ;;
  }

  dimension: user_preferences_hide_sfx_welcome_mat {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_sfx_welcome_mat ;;
  }

  dimension: user_preferences_lightning_experience_preferred {
    type: yesno
    sql: ${TABLE}.user_preferences_lightning_experience_preferred ;;
  }

  dimension: user_preferences_new_lightning_report_run_page_enabled {
    type: yesno
    sql: ${TABLE}.user_preferences_new_lightning_report_run_page_enabled ;;
  }

  dimension: user_preferences_path_assistant_collapsed {
    type: yesno
    sql: ${TABLE}.user_preferences_path_assistant_collapsed ;;
  }

  dimension: user_preferences_pipeline_view_hide_help_popover {
    type: yesno
    sql: ${TABLE}.user_preferences_pipeline_view_hide_help_popover ;;
  }

  dimension: user_preferences_preview_custom_theme {
    type: yesno
    sql: ${TABLE}.user_preferences_preview_custom_theme ;;
  }

  dimension: user_preferences_preview_lightning {
    type: yesno
    sql: ${TABLE}.user_preferences_preview_lightning ;;
  }

  dimension: user_preferences_record_home_reserved_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_record_home_reserved_wtshown ;;
  }

  dimension: user_preferences_record_home_section_collapse_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_record_home_section_collapse_wtshown ;;
  }

  dimension: user_preferences_reminder_sound_off {
    type: yesno
    sql: ${TABLE}.user_preferences_reminder_sound_off ;;
  }

  dimension: user_preferences_show_city_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_city_to_external_users ;;
  }

  dimension: user_preferences_show_city_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_city_to_guest_users ;;
  }

  dimension: user_preferences_show_country_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_country_to_external_users ;;
  }

  dimension: user_preferences_show_country_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_country_to_guest_users ;;
  }

  dimension: user_preferences_show_email_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_email_to_external_users ;;
  }

  dimension: user_preferences_show_email_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_email_to_guest_users ;;
  }

  dimension: user_preferences_show_fax_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_fax_to_external_users ;;
  }

  dimension: user_preferences_show_fax_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_fax_to_guest_users ;;
  }

  dimension: user_preferences_show_manager_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_manager_to_external_users ;;
  }

  dimension: user_preferences_show_manager_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_manager_to_guest_users ;;
  }

  dimension: user_preferences_show_mobile_phone_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_mobile_phone_to_external_users ;;
  }

  dimension: user_preferences_show_mobile_phone_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_mobile_phone_to_guest_users ;;
  }

  dimension: user_preferences_show_postal_code_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_postal_code_to_external_users ;;
  }

  dimension: user_preferences_show_postal_code_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_postal_code_to_guest_users ;;
  }

  dimension: user_preferences_show_profile_pic_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_profile_pic_to_guest_users ;;
  }

  dimension: user_preferences_show_state_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_state_to_external_users ;;
  }

  dimension: user_preferences_show_state_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_state_to_guest_users ;;
  }

  dimension: user_preferences_show_street_address_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_street_address_to_external_users ;;
  }

  dimension: user_preferences_show_street_address_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_street_address_to_guest_users ;;
  }

  dimension: user_preferences_show_title_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_title_to_external_users ;;
  }

  dimension: user_preferences_show_title_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_title_to_guest_users ;;
  }

  dimension: user_preferences_show_work_phone_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_work_phone_to_external_users ;;
  }

  dimension: user_preferences_show_work_phone_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_work_phone_to_guest_users ;;
  }

  dimension: user_preferences_sort_feed_by_comment {
    type: yesno
    sql: ${TABLE}.user_preferences_sort_feed_by_comment ;;
  }

  dimension: user_preferences_suppress_event_sfxreminders {
    type: yesno
    sql: ${TABLE}.user_preferences_suppress_event_sfxreminders ;;
  }

  dimension: user_preferences_suppress_task_sfxreminders {
    type: yesno
    sql: ${TABLE}.user_preferences_suppress_task_sfxreminders ;;
  }

  dimension: user_preferences_task_reminders_checkbox_default {
    type: yesno
    sql: ${TABLE}.user_preferences_task_reminders_checkbox_default ;;
  }

  dimension: user_preferences_user_debug_mode_pref {
    type: yesno
    sql: ${TABLE}.user_preferences_user_debug_mode_pref ;;
  }

  dimension: user_role_id {
    type: string
    sql: ${TABLE}.user_role_id ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      deskscmt_desk_user_id_c,
      community_nickname,
      company_name,
      last_name,
      sender_name,
      name,
      first_name,
      middle_name,
      username
    ]
  }
}
