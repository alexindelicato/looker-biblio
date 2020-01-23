view: ot_production {
  sql_table_name: trs_trs.production ;;
  drill_fields: [production_id]

  dimension: production_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.production_id ;;
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

  dimension: ad_banner_html {
    type: string
    sql: ${TABLE}.ad_banner_html ;;
  }

  dimension: allow_single_seats {
    type: string
    sql: ${TABLE}.allow_single_seats ;;
  }

  dimension: boxoffice_hours {
    type: string
    sql: ${TABLE}.boxoffice_hours ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: confirmation_image_id {
    type: number
    sql: ${TABLE}.confirmation_image_id ;;
  }

  dimension: confirmation_image_position {
    type: number
    sql: ${TABLE}.confirmation_image_position ;;
  }

  dimension: department_id {
    type: number
    sql: ${TABLE}.department_id ;;
  }

  dimension: display_subtitle {
    type: string
    sql: ${TABLE}.display_subtitle ;;
  }

  dimension: display_supertitle {
    type: string
    sql: ${TABLE}.display_supertitle ;;
  }

  dimension: eticket_seat_number {
    type: string
    sql: ${TABLE}.eticket_seat_number ;;
  }

  dimension: hard_ticket_logo_id {
    type: number
    sql: ${TABLE}.hard_ticket_logo_id ;;
  }

  dimension_group: hidden_until {
    label: "On Sale Time"
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
    sql: ${TABLE}.hidden_until ;;
  }

  dimension: image_file_name {
    type: string
    sql: ${TABLE}.image_file_name ;;
  }

  dimension: is_hidden {
    type: string
    sql: ${TABLE}.is_hidden ;;
  }

  dimension: is_powerticket {
    type: number
    sql: ${TABLE}.is_powerticket ;;
  }

  dimension: landing_url {
    type: string
    sql: ${TABLE}.landing_url ;;
  }

  dimension_group: last_change {
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
    sql: ${TABLE}.last_change_date ;;
  }

  dimension: logo_file_id {
    type: number
    sql: ${TABLE}.logo_file_id ;;
  }

  dimension: logo_file_name {
    type: string
    sql: ${TABLE}.logo_file_name ;;
  }

  dimension: max_tix_allowed {
    type: number
    sql: ${TABLE}.max_tix_allowed ;;
  }

  dimension: member_login_text {
    type: string
    sql: ${TABLE}.member_login_text ;;
  }

  dimension: no_remaining_message {
    type: string
    sql: ${TABLE}.no_remaining_message ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: package_holder_text {
    type: string
    sql: ${TABLE}.package_holder_text ;;
  }

  dimension: per_order_fee_amount {
    type: number
    sql: ${TABLE}.per_order_fee_amount ;;
  }

  dimension: per_order_fee_name {
    type: string
    sql: ${TABLE}.per_order_fee_name ;;
  }

  dimension: phone_message {
    type: string
    sql: ${TABLE}.phone_message ;;
  }

  dimension: print_barcodes {
    type: string
    sql: ${TABLE}.print_barcodes ;;
  }

  dimension: prod_desc {
    type: string
    sql: ${TABLE}.prod_desc ;;
  }

  dimension: prod_name {
    type: string
    sql: ${TABLE}.prod_name ;;
  }

  dimension: puchase_alert {
    type: string
    sql: ${TABLE}.puchase_alert ;;
  }

  dimension: purchase_protection {
    type: number
    sql: ${TABLE}.purchase_protection ;;
  }

  dimension: receipt_text {
    type: string
    sql: ${TABLE}.receipt_text ;;
  }

  dimension: receipt_text_other {
    type: string
    sql: ${TABLE}.receipt_text_other ;;
  }

  dimension: reserved_seating {
    type: string
    sql: ${TABLE}.reserved_seating ;;
  }

  dimension: seat_picking_method {
    type: string
    sql: ${TABLE}.seat_picking_method ;;
  }

  dimension: seating_chart_id {
    type: number
    sql: ${TABLE}.seating_chart_id ;;
  }

  dimension: shutoff_hour_message {
    type: string
    sql: ${TABLE}.shutoff_hour_message ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: style {
    type: number
    sql: ${TABLE}.style ;;
  }

  dimension: subtitle {
    type: string
    sql: ${TABLE}.subtitle ;;
  }

  dimension: supertitle {
    type: string
    sql: ${TABLE}.supertitle ;;
  }

  dimension: ticket_print_method {
    type: string
    sql: ${TABLE}.ticket_print_method ;;
  }

  dimension: venue_address_city {
    type: string
    sql: ${TABLE}.venue_address_city ;;
  }

  dimension: venue_address_country {
    type: string
    sql: ${TABLE}.venue_address_country ;;
  }

  dimension: venue_address_line1 {
    type: string
    sql: ${TABLE}.venue_address_line1 ;;
  }

  dimension: venue_address_line2 {
    type: string
    sql: ${TABLE}.venue_address_line2 ;;
  }

  dimension: venue_address_state {
    type: string
    sql: ${TABLE}.venue_address_state ;;
  }

  dimension: venue_address_zipcode {
    map_layer_name: us_zipcode_tabulation_areas
    type: string
    sql: ${TABLE}.venue_address_zipcode ;;
  }

  dimension: venue_location {
    type: string
    sql: ${TABLE}.venue_location ;;
  }

  dimension: venue_name {
    type: string
    sql: ${TABLE}.venue_name ;;
  }

  dimension: venue_phone {
    type: string
    sql: ${TABLE}.venue_phone ;;
  }

  dimension: venue_transit_info {
    type: string
    sql: ${TABLE}.venue_transit_info ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      production_id,
      logo_file_name,
      image_file_name,
      per_order_fee_name,
      venue_name,
      prod_name,
      client.client_id,
      client.client_display_name,
      client.merchant_name,
      client.lastname,
      client.perspective_name,
      client.firstname,
      client.client_name,
      client.verisign_username,
      performance.count
    ]
  }
}
