view: ot_client {
  sql_table_name: trs_trs.client ;;
  drill_fields: [client_id]

  dimension: client_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.client_id ;;
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

  dimension: active {
    type: number
    sql: ${TABLE}.active ;;
  }

  dimension: address_city {
    type: string
    sql: ${TABLE}.address_city ;;
  }

  dimension: address_country {
    type: string
    sql: ${TABLE}.address_country ;;
  }

  dimension: address_line1 {
    type: string
    sql: ${TABLE}.address_line1 ;;
  }

  dimension: address_line2 {
    type: string
    sql: ${TABLE}.address_line2 ;;
  }

  dimension: address_state {
    type: string
    sql: ${TABLE}.address_state ;;
  }

  dimension: address_zipcode {
    type: string
    sql: ${TABLE}.address_zipcode ;;
  }

  dimension: auth_dev_account {
    type: number
    sql: ${TABLE}.auth_dev_account ;;
  }

  dimension: bank_info {
    type: string
    sql: ${TABLE}.bank_info ;;
  }

  dimension: calendar_type {
    type: number
    sql: ${TABLE}.calendar_type ;;
  }

  dimension: card_type_enabled_set {
    type: string
    sql: ${TABLE}.card_type_enabled_set ;;
  }

  dimension: catch_all_receipt_text {
    type: string
    sql: ${TABLE}.catch_all_receipt_text ;;
  }

  dimension: city_of_incorporation {
    type: string
    sql: ${TABLE}.city_of_incorporation ;;
  }

  dimension: client_display_name {
    type: string
    sql: ${TABLE}.client_display_name ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
    link: {
      label: "Insight Client Performance Listings"
      url: "https://audienceview.looker.com/explore/biblio/ot_orders?fields=ot_client.client_name,ot_production.prod_name,ot_performance.perf_start_time,ot_performance.web_available,ot_performance.web_display_label,ot_order_detail.count_scanned_tickets,ot_performance_stats_consumed.total_sold_seats,ot_order_detail.sum_price&f[ot_client.client_name]={{ filterable_value  | url_encode }}&f[ot_performance.perf_start_date]=2020/03/09 to 2020/03/16"
      icon_url: "https://www.pngfind.com/pngs/m/383-3836953_overview-icon-wp-overview-icon-hd-png-download.png"
    }
    link: {
      label: "View Settlement Requests Dashboard"
      url: "/dashboards/61"
      icon_url: "https://st4.depositphotos.com/4799321/26935/v/1600/depositphotos_269359362-stock-illustration-insight-icon-in-transparent-style.jpg"
    }
    link: {
      label: "AV Pro Client Listing"
      url: "/looks/508"
      icon_url: "https://st4.depositphotos.com/4799321/26935/v/1600/depositphotos_269359362-stock-illustration-insight-icon-in-transparent-style.jpg"
    }
    link: {
      label: "Return to SMA Client Dashboard"
      url: "/dashboards/62"
      icon_url: "https://st4.depositphotos.com/4799321/26935/v/1600/depositphotos_269359362-stock-illustration-insight-icon-in-transparent-style.jpg"
    }
  }

  dimension: country_of_incorporation {
    type: string
    sql: ${TABLE}.country_of_incorporation ;;
  }

  dimension_group: create {
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
    sql: ${TABLE}.create_date ;;
  }

  dimension: credit_card_gateway {
    type: string
    sql: ${TABLE}.credit_card_gateway ;;
  }

  dimension: credit_card_swiper_type {
    type: number
    sql: ${TABLE}.credit_card_swiper_type ;;
  }

  dimension: customer_success_user_id {
    type: number
    sql: ${TABLE}.customer_success_user_id ;;
  }

  dimension: cvv_required {
    type: number
    sql: ${TABLE}.cvv_required ;;
  }

  dimension: demo {
    type: number
    sql: ${TABLE}.demo ;;
  }

  dimension: details_privacy {
    type: string
    sql: ${TABLE}.details_privacy ;;
  }

  dimension: donation_accepted {
    type: number
    sql: ${TABLE}.donation_accepted ;;
  }

  dimension: donation_desc {
    type: string
    sql: ${TABLE}.donation_desc ;;
  }

  dimension: donation_level {
    type: string
    sql: ${TABLE}.donation_level ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: enabled_tax_calc {
    type: number
    sql: ${TABLE}.enabled_tax_calc ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: fiscal_year_day {
    type: number
    sql: ${TABLE}.fiscal_year_day ;;
  }

  dimension: fiscal_year_month {
    type: number
    sql: ${TABLE}.fiscal_year_month ;;
  }

  dimension: google_analytics_account {
    type: string
    sql: ${TABLE}.google_analytics_account ;;
  }

  dimension: google_analytics_cross_domain {
    type: string
    sql: ${TABLE}.google_analytics_cross_domain ;;
  }

  dimension: google_tag_manager_account {
    type: string
    sql: ${TABLE}.google_tag_manager_account ;;
  }

  dimension: grid_group_by {
    type: number
    sql: ${TABLE}.grid_group_by ;;
  }

  dimension: has_barcode_scanner {
    type: number
    sql: ${TABLE}.has_barcode_scanner ;;
  }

  dimension: has_hard_ticket_printer {
    type: number
    sql: ${TABLE}.has_hard_ticket_printer ;;
  }

  dimension: has_swiper {
    type: number
    sql: ${TABLE}.has_swiper ;;
  }

  dimension: initial_active_tab_walkup {
    type: number
    sql: ${TABLE}.initial_active_tab_walkup ;;
  }

  dimension: internal_tax_rate {
    type: number
    sql: ${TABLE}.internal_tax_rate ;;
  }

  dimension: is_hidden {
    type: string
    sql: ${TABLE}.is_hidden ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: logo_image {
    type: string
    sql: ${TABLE}.logo_image ;;
  }

  dimension: logo_image_file_id {
    type: number
    sql: ${TABLE}.logo_image_file_id ;;
  }

  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }

  dimension: netsuite_id {
    type: string
    sql: ${TABLE}.netsuite_id ;;
  }

  dimension: nexus_states {
    type: string
    sql: ${TABLE}.nexus_states ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: optin_text {
    type: string
    sql: ${TABLE}.optin_text ;;
  }

  dimension: payee {
    type: string
    sql: ${TABLE}.payee ;;
  }

  dimension: payment_schedule {
    type: string
    sql: ${TABLE}.payment_schedule ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: payout_method {
    type: string
    sql: ${TABLE}.payout_method ;;
  }

  dimension: payout_withhold {
    type: number
    sql: ${TABLE}.payout_withhold ;;
  }

  dimension: perspective_name {
    type: string
    sql: ${TABLE}.perspective_name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: private_merchant_account {
    type: number
    sql: ${TABLE}.private_merchant_account ;;
  }

  dimension: private_tax_calc_account {
    type: number
    sql: ${TABLE}.private_tax_calc_account ;;
  }

  dimension: psgatewayacctid {
    type: number
    value_format_name: id
    sql: ${TABLE}.psgatewayacctid ;;
  }

  dimension: psgatewayacctownerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.psgatewayacctownerid ;;
  }

  dimension: rep_user_id {
    type: number
    sql: ${TABLE}.rep_user_id ;;
  }

  dimension: report_crm_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.report_crm_id ;;
  }

  dimension: service_fee_tax_rate_id {
    type: number
    sql: ${TABLE}.service_fee_tax_rate_id ;;
  }

  dimension: state_of_incorporation {
    type: string
    sql: ${TABLE}.state_of_incorporation ;;
  }

  dimension: take_phone_order_in_house {
    type: number
    sql: ${TABLE}.take_phone_order_in_house ;;
  }

  dimension: tax_calc_id {
    type: string
    sql: ${TABLE}.tax_calc_id ;;
  }

  dimension: tax_id {
    type: string
    sql: ${TABLE}.tax_id ;;
  }

  dimension: tax_type {
    type: number
    sql: ${TABLE}.tax_type ;;
  }

  dimension: testing_mode {
    type: number
    sql: ${TABLE}.testing_mode ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: transaction_key {
    type: string
    sql: ${TABLE}.transaction_key ;;
  }

  dimension: verisign_partner {
    type: string
    sql: ${TABLE}.verisign_partner ;;
  }

  dimension: verisign_username {
    type: string
    sql: ${TABLE}.verisign_username ;;
  }

  dimension: verisign_vendor_id {
    type: string
    sql: ${TABLE}.verisign_vendor_id ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: zip_code_required {
    type: number
    sql: ${TABLE}.zip_code_required ;;
  }

  dimension: zipcode_of_incorporation {
    type: string
    sql: ${TABLE}.zipcode_of_incorporation ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      client_id,
      client_display_name,
      merchant_name,
      lastname,
      perspective_name,
      firstname,
      client_name,
      verisign_username,
      report_crm.crm_name,
      report_crm.id,
      client_statement.count,
      client_enabled_feature.count,
      client_account.count,
      production.count,
      gl_code.count,
      orders.count,
      client_fee_structure.count
    ]
  }
}
