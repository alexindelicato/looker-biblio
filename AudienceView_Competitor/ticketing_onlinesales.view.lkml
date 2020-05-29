view: ticketing_onlinesales {
  sql_table_name: `fivetran-ovation-tix-warehouse.competitor.ticketing_onlinesales`
    ;;

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

  dimension: access_control_and_credentials {
    type: number
    sql: ${TABLE}.access_control_and_credentials ;;
  }

  dimension: at_door {
    type: number
    sql: ${TABLE}.at_door ;;
  }

  dimension: auto_publish_to_own_website {
    type: number
    sql: ${TABLE}.auto_publish_to_own_website ;;
  }

  dimension: bluetooth_mobile_tickets_and_receipt_printing {
    type: number
    sql: ${TABLE}.bluetooth_mobile_tickets_and_receipt_printing ;;
  }

  dimension: box_office_phone_support {
    type: number
    sql: ${TABLE}.box_office_phone_support ;;
  }

  dimension: competitor_name {
    type: string
    sql: ${TABLE}.competitor_name ;;
  }

  dimension: customized_thermal_tix {
    type: number
    sql: ${TABLE}.customized_thermal_tix ;;
  }

  dimension: direct_sales_via_facebook {
    type: number
    sql: ${TABLE}.direct_sales_via_facebook ;;
  }

  dimension: free_ticket_signups {
    type: number
    sql: ${TABLE}.free_ticket_signups ;;
  }

  dimension: group_sales {
    type: number
    sql: ${TABLE}.group_sales ;;
  }

  dimension: import_guest_list_from_spreadsheet {
    type: number
    sql: ${TABLE}.import_guest_list_from_spreadsheet ;;
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

  dimension: login_required {
    type: number
    sql: ${TABLE}.login_required ;;
  }

  dimension: memberships {
    type: number
    sql: ${TABLE}.memberships ;;
  }

  dimension: merchandise {
    type: number
    sql: ${TABLE}.merchandise ;;
  }

  dimension: mobile_delivery_via_app {
    type: number
    sql: ${TABLE}.mobile_delivery_via_app ;;
  }

  dimension: mobile_delivery_via_e_mail {
    type: number
    sql: ${TABLE}.mobile_delivery_via_e_mail ;;
  }

  dimension: mobile_guestlist {
    type: number
    sql: ${TABLE}.mobile_guestlist ;;
  }

  dimension: mobile_optimized_purchase {
    type: number
    sql: ${TABLE}.mobile_optimized_purchase ;;
  }

  dimension: mobile_pos {
    type: number
    sql: ${TABLE}.mobile_pos ;;
  }

  dimension: mobile_scanning {
    type: number
    sql: ${TABLE}.mobile_scanning ;;
  }

  dimension: multi_question_surveys {
    type: number
    sql: ${TABLE}.multi_question_surveys ;;
  }

  dimension: packages {
    type: number
    sql: ${TABLE}.packages ;;
  }

  dimension: print_at_home {
    type: number
    sql: ${TABLE}.print_at_home ;;
  }

  dimension: qr_codes {
    type: number
    sql: ${TABLE}.qr_codes ;;
  }

  dimension: rfid {
    type: number
    value_format_name: id
    sql: ${TABLE}.rfid ;;
  }

  dimension: rfid_cashless_payment {
    type: number
    sql: ${TABLE}.rfid_cashless_payment ;;
  }

  dimension: season_renewals {
    type: number
    sql: ${TABLE}.season_renewals ;;
  }

  dimension: single_ticket_surveys {
    type: number
    sql: ${TABLE}.single_ticket_surveys ;;
  }

  dimension: thermal_tix {
    type: number
    sql: ${TABLE}.thermal_tix ;;
  }

  dimension: ticket_printing_and_fulfillment {
    type: number
    sql: ${TABLE}.ticket_printing_and_fulfillment ;;
  }

  dimension: ticket_transfer {
    type: number
    sql: ${TABLE}.ticket_transfer ;;
  }

  dimension: traditional_shopping_cart {
    type: number
    sql: ${TABLE}.traditional_shopping_cart ;;
  }

  dimension: view_from_seat {
    type: number
    sql: ${TABLE}.view_from_seat ;;
  }

  dimension: white_label_check_out {
    type: number
    sql: ${TABLE}.white_label_check_out ;;
  }

  dimension: will_call {
    type: number
    sql: ${TABLE}.will_call ;;
  }

  measure: count {
    type: count
    drill_fields: [competitor_name]
  }
}
