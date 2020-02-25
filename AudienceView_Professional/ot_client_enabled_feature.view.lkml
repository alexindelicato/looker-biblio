view: ot_client_enabled_feature {
  sql_table_name: trs_trs.client_enabled_feature ;;

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

  dimension: allow_public_comps {
    type: number
    sql: ${TABLE}.allow_public_comps ;;
  }

  dimension: bundled_package_non_adjacent_seats_allowed {
    type: number
    sql: ${TABLE}.bundled_package_non_adjacent_seats_allowed ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    primary_key: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: credit_card_tokenization_method {
    type: number
    sql: ${TABLE}.credit_card_tokenization_method ;;
  }

  dimension: custom_login_enabled {
    type: number
    sql: ${TABLE}.custom_login_enabled ;;
  }

  dimension: custom_login_label {
    type: string
    sql: ${TABLE}.custom_login_label ;;
  }

  dimension: default_optin {
    type: number
    sql: ${TABLE}.default_optin ;;
  }

  dimension: default_ticket_type {
    type: number
    sql: ${TABLE}.default_ticket_type ;;
  }

  dimension: default_tm_insider {
    type: number
    sql: ${TABLE}.default_tm_insider ;;
  }

  dimension: theatermania_feature {
    label: "TM Newsletter Setting"
    type: string
    sql: case when ${default_tm_insider} = 0 then "Unchecked"
          when ${default_tm_insider} = 1 then "Checked"
          else "Off" End;;
  }

  dimension: enable_donor_dashboard {
    type: number
    sql: ${TABLE}.enable_donor_dashboard ;;
  }

  dimension: enable_donor_management_email {
    type: number
    sql: ${TABLE}.enable_donor_management_email ;;
  }

  dimension: enabled_add_cal {
    type: number
    sql: ${TABLE}.enabled_add_cal ;;
  }

  dimension: enabled_add_facebook {
    type: number
    sql: ${TABLE}.enabled_add_facebook ;;
  }

  dimension: enabled_add_to_order {
    type: number
    sql: ${TABLE}.enabled_add_to_order ;;
  }

  dimension: enabled_add_twitter {
    type: number
    sql: ${TABLE}.enabled_add_twitter ;;
  }

  dimension: enabled_analytics {
    type: yesno
    sql: ${TABLE}.enabled_analytics ;;
  }

  dimension: enabled_balance_report {
    type: number
    sql: ${TABLE}.enabled_balance_report ;;
  }

  dimension: enabled_captcha {
    type: number
    sql: ${TABLE}.enabled_captcha ;;
  }

  dimension: enabled_ci_mobile {
    type: number
    sql: ${TABLE}.enabled_ci_mobile ;;
  }

  dimension: enabled_client_communications {
    type: number
    sql: ${TABLE}.enabled_client_communications ;;
  }

  dimension: enabled_client_mail_list {
    type: number
    sql: ${TABLE}.enabled_client_mail_list ;;
  }

  dimension: enabled_display_email_signup {
    type: number
    sql: ${TABLE}.enabled_display_email_signup ;;
  }

  dimension: enabled_donation_acknowledgment {
    type: number
    sql: ${TABLE}.enabled_donation_acknowledgment ;;
  }

  dimension: enabled_export_wrapsheet {
    type: number
    sql: ${TABLE}.enabled_export_wrapsheet ;;
  }

  dimension: enabled_fundraising {
    type: number
    sql: ${TABLE}.enabled_fundraising ;;
  }

  dimension: enabled_gift_card {
    type: number
    sql: ${TABLE}.enabled_gift_card ;;
  }

  dimension: enabled_guest_checkout {
    type: number
    sql: ${TABLE}.enabled_guest_checkout ;;
  }

  dimension: enabled_inventory_limit_for_coded_ticket {
    type: number
    sql: ${TABLE}.enabled_inventory_limit_for_coded_ticket ;;
  }

  dimension: enabled_invite_friend {
    type: number
    sql: ${TABLE}.enabled_invite_friend ;;
  }

  dimension: enabled_master_pass {
    type: number
    sql: ${TABLE}.enabled_master_pass ;;
  }

  dimension: enabled_merge_patron {
    type: number
    sql: ${TABLE}.enabled_merge_patron ;;
  }

  dimension: enabled_new_ci {
    type: yesno
    sql: ${TABLE}.enabled_new_ci = 1 ;;
  }

  measure: enabled_new_ci_yes {
    type: count
    filters: {
      field: enabled_new_ci
      value: "Yes" }
  }

  measure: enabled_new_ci_no {
    type: count
    filters: {
      field: enabled_new_ci
      value: "No" }
  }

  measure: percentage_to_goal {
    type:  number
    value_format_name: percent_0
    sql: ${enabled_new_ci_yes}/${enabled_new_ci_no} ;;
  }

  dimension: enabled_new_ci_pk {
    type: yesno
    sql: ${TABLE}.enabled_new_ci_pk ;;
  }

  dimension: enabled_new_ci_pt {
    type: yesno
    sql: ${TABLE}.enabled_new_ci_pt ;;
  }

  dimension: enabled_new_user_permissions {
    type: number
    sql: ${TABLE}.enabled_new_user_permissions ;;
  }

  dimension: enabled_new_wrap_sheet {
    type: number
    sql: ${TABLE}.enabled_new_wrap_sheet ;;
  }

  dimension: enabled_outer_client_email_list {
    type: number
    sql: ${TABLE}.enabled_outer_client_email_list ;;
  }

  dimension: enabled_partial_order_online {
    type: number
    sql: ${TABLE}.enabled_partial_order_online ;;
  }

  dimension: enabled_patron_credit {
    type: number
    sql: ${TABLE}.enabled_patron_credit ;;
  }

  dimension: enabled_patron_credit_create {
    type: number
    sql: ${TABLE}.enabled_patron_credit_create ;;
  }

  dimension: enabled_post_dated_donation {
    type: number
    sql: ${TABLE}.enabled_post_dated_donation ;;
  }

  dimension: enabled_postevent_tx {
    type: number
    sql: ${TABLE}.enabled_postevent_tx ;;
  }

  dimension: enabled_proto_tickets {
    type: number
    sql: ${TABLE}.enabled_proto_tickets ;;
  }

  dimension: enabled_purchase_protection {
    type: number
    sql: ${TABLE}.enabled_purchase_protection ;;
  }

  dimension: enabled_recurring_donations {
    type: number
    sql: ${TABLE}.enabled_recurring_donations ;;
  }

  dimension: enabled_ticket_type_availability {
    type: number
    sql: ${TABLE}.enabled_ticket_type_availability ;;
  }

  dimension: enabled_tkts {
    type: number
    sql: ${TABLE}.enabled_tkts ;;
  }

  dimension: enabled_view_from_seat {
    type: number
    sql: ${TABLE}.enabled_view_from_seat ;;
  }

  dimension: flex_package_recurring {
    type: number
    sql: ${TABLE}.flex_package_recurring ;;
  }

  dimension: fraud_protection_enabled {
    type: number
    sql: ${TABLE}.fraud_protection_enabled ;;
  }

  dimension: packages_enabled {
    type: number
    sql: ${TABLE}.packages_enabled ;;
  }

  dimension: partial_payments_enabled {
    type: number
    sql: ${TABLE}.partial_payments_enabled ;;
  }

  dimension: performance_entry_times {
    type: number
    sql: ${TABLE}.performance_entry_times ;;
  }

  dimension: post_show_email_mandrill_enabled {
    type: number
    sql: ${TABLE}.post_show_email_mandrill_enabled ;;
  }

  dimension: split_tender_enabled {
    type: number
    sql: ${TABLE}.split_tender_enabled ;;
  }

  dimension: third_party_resources {
    type: number
    sql: ${TABLE}.third_party_resources ;;
  }

  dimension: ticket_exchange {
    type: number
    sql: ${TABLE}.ticket_exchange ;;
  }

  dimension: whos_coming_default_basic {
    type: number
    sql: ${TABLE}.whos_coming_default_basic ;;
  }

  dimension: whos_coming_display {
    type: number
    sql: ${TABLE}.whos_coming_display ;;
  }

  dimension: whos_coming_email_enabled {
    type: number
    sql: ${TABLE}.whos_coming_email_enabled ;;
  }

  dimension: whos_coming_member_display {
    type: number
    sql: ${TABLE}.whos_coming_member_display ;;
  }

  dimension: whos_coming_plus_one_email_enabled {
    type: number
    sql: ${TABLE}.whos_coming_plus_one_email_enabled ;;
  }

  dimension: wos_mailing_option {
    type: number
    sql: ${TABLE}.wos_mailing_option ;;
  }

  measure: count {
    type: count
    drill_fields: [ot_client.client_id,sf_accounts.name]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      client.client_id,
      client.client_display_name,
      client.merchant_name,
      client.lastname,
      client.perspective_name,
      client.firstname,
      client.client_name,
      client.verisign_username
    ]
  }
}
