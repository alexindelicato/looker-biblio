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
    type: string
    sql:case when ${TABLE}.access_control_and_credentials = 1 then "Yes" Else NULL END ;;
  }

  dimension: at_door {
    type: string
    sql: case when ${TABLE}.at_door = 1 then "Yes" Else NULL END;;
  }

  dimension: auto_publish_to_own_website {
    type: string
    sql:case when ${TABLE}.auto_publish_to_own_website = 1 then "Yes" Else NULL END;;
  }

  dimension: bluetooth_mobile_tickets_and_receipt_printing {
    type: string
    sql:case when ${TABLE}.bluetooth_mobile_tickets_and_receipt_printing = 1 then "Yes" Else NULL END;;
  }

  dimension: box_office_phone_support {
    type: string
    sql: case when ${TABLE}.box_office_phone_support = 1 then "Yes" Else NULL END;;
  }

  dimension: competitor_name {
    type: string
    sql: ${TABLE}.competitor_name ;;
  }

  dimension: customized_thermal_tix {
    type: string
    sql:case when ${TABLE}.customized_thermal_tix= 1 then "Yes" Else NULL END ;;
  }

  dimension: direct_sales_via_facebook {
    type: string
    sql: case when ${TABLE}.direct_sales_via_facebook= 1 then "Yes" Else NULL END ;;
  }

  dimension: free_ticket_signups {
    type: string
    sql:case when  ${TABLE}.free_ticket_signups = 1 then "Yes" Else NULL END;;
  }

  dimension: group_sales {
    type: string
    sql:case when ${TABLE}.group_sales = 1 then "Yes" Else NULL END;;
  }

  dimension: import_guest_list_from_spreadsheet {
    type: string
    sql:case when ${TABLE}.import_guest_list_from_spreadsheet = 1 then "Yes" Else NULL END;;
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
    type: string
    sql: case when ${TABLE}.login_required = 1 then "Yes" Else NULL END;;
  }

  dimension: memberships {
    type: string
    sql:case when ${TABLE}.memberships= 1 then "Yes" Else NULL END ;;
  }

  dimension: merchandise {
    type: string
    sql:case when ${TABLE}.merchandise= 1 then "Yes" Else NULL END ;;
  }

  dimension: mobile_delivery_via_app {
    type: string
    sql:case when ${TABLE}.mobile_delivery_via_app = 1 then "Yes" Else NULL END;;
  }

  dimension: mobile_delivery_via_e_mail {
    type: string
    sql:case when ${TABLE}.mobile_delivery_via_e_mail= 1 then "Yes" Else NULL END ;;
  }

  dimension: mobile_guestlist {
    type: string
    sql:case when ${TABLE}.mobile_guestlist = 1 then "Yes" Else NULL END;;
  }

  dimension: mobile_optimized_purchase {
    type: string
    sql:case when ${TABLE}.mobile_optimized_purchase = 1 then "Yes" Else NULL END;;
  }

  dimension: mobile_pos {
    type: string
    sql: case when ${TABLE}.mobile_pos = 1 then "Yes" Else NULL END;;
  }

  dimension: mobile_scanning {
    type: string
    sql:case when ${TABLE}.mobile_scanning = 1 then "Yes" Else NULL END;;
  }

  dimension: multi_question_surveys {
    type: string
    sql:case when ${TABLE}.multi_question_surveys= 1 then "Yes" Else NULL END ;;
  }

  dimension: packages {
    type: number
    sql:case when ${TABLE}.packages = 1 then "Yes" Else NULL END;;
  }

  dimension: print_at_home {
    type: string
    sql:case when ${TABLE}.print_at_home = 1 then "Yes" Else NULL END;;
  }

  dimension: qr_codes {
    type: string
    sql:case when ${TABLE}.qr_codes = 1 then "Yes" Else NULL END;;
  }

  dimension: rfid {
    type: string
    sql:case when ${TABLE}.rfid= 1 then "Yes" Else NULL END ;;
  }

  dimension: rfid_cashless_payment {
    type: string
    sql:case when ${TABLE}.rfid_cashless_payment= 1 then "Yes" Else NULL END ;;
  }

  dimension: season_renewals {
    type: string
    sql:case when ${TABLE}.season_renewals= 1 then "Yes" Else NULL END ;;
  }

  dimension: single_ticket_surveys {
    type: string
    sql:case when ${TABLE}.single_ticket_surveys= 1 then "Yes" Else NULL END ;;
  }

  dimension: thermal_tix {
    type: string
    sql:case when ${TABLE}.thermal_tix= 1 then "Yes" Else NULL END ;;
  }

  dimension: ticket_printing_and_fulfillment {
    type: string
    sql:case when ${TABLE}.ticket_printing_and_fulfillment= 1 then "Yes" Else NULL END ;;
  }

  dimension: ticket_transfer {
    type: string
    sql:case when ${TABLE}.ticket_transfer= 1 then "Yes" Else NULL END ;;
  }

  dimension: traditional_shopping_cart {
    type: string
    sql:case when ${TABLE}.traditional_shopping_cart= 1 then "Yes" Else NULL END ;;
  }

  dimension: view_from_seat {
    type: string
    sql:case when ${TABLE}.view_from_seat= 1 then "Yes" Else NULL END ;;
  }

  dimension: white_label_check_out {
    type: string
    sql:case when ${TABLE}.white_label_check_out= 1 then "Yes" Else NULL END ;;
  }

  dimension: will_call {
    type: string
    sql:case when ${TABLE}.will_call = 1 then "Yes" Else NULL END;;
  }

  measure: count {
    type: count
    drill_fields: [competitor_name]
  }
}
