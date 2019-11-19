view: orders {
  sql_table_name: trs_trs.orders ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
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

  dimension: amount_tendered {
    type: number
    sql: ${TABLE}.amount_tendered ;;
  }

  dimension_group: balance_due {
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
    sql: ${TABLE}.balance_due_date ;;
  }

  dimension: checkout_option {
    type: number
    sql: ${TABLE}.checkout_option ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: consumer_fee_total {
    type: number
    sql: ${TABLE}.consumer_fee_total ;;
  }

  dimension: consumer_id {
    type: number
    sql: ${TABLE}.consumer_id ;;
  }

  dimension: credit_card_gateway {
    type: string
    sql: ${TABLE}.credit_card_gateway ;;
  }

  dimension: imported {
    type: number
    sql: ${TABLE}.imported ;;
  }

  dimension_group: imported {
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
    sql: ${TABLE}.imported_date ;;
  }

  dimension: is_guest_checkout {
    type: number
    sql: ${TABLE}.is_guest_checkout ;;
  }

  dimension: is_held_by_client {
    type: number
    sql: ${TABLE}.is_held_by_client ;;
  }

  dimension: is_mobile_checkout {
    type: number
    sql: ${TABLE}.is_mobile_checkout ;;
  }

  dimension: is_test_mode {
    type: number
    sql: ${TABLE}.is_test_mode ;;
  }

  dimension_group: last_tx {
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
    sql: ${TABLE}.last_tx_date ;;
  }

  dimension: message_id {
    type: string
    sql: ${TABLE}.message_id ;;
  }

  dimension: order_taker_id {
    type: number
    sql: ${TABLE}.order_taker_id ;;
  }

  dimension: paid_amount {
    type: number
    sql: ${TABLE}.paid_amount ;;
  }

  dimension: payment_type_custom_id {
    type: string
    sql: ${TABLE}.payment_type_custom_id ;;
  }

  dimension: payment_type_id {
    type: number
    sql: ${TABLE}.payment_type_id ;;
  }

  dimension: per_order_fee {
    type: number
    sql: ${TABLE}.per_order_fee ;;
  }

  dimension: processing_fee_total {
    type: number
    sql: ${TABLE}.processing_fee_total ;;
  }

  dimension: service_fee_total {
    type: number
    sql: ${TABLE}.service_fee_total ;;
  }

  dimension: shipping_method_id {
    type: number
    sql: ${TABLE}.shipping_method_id ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  dimension_group: time {
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
    sql: ${TABLE}.time ;;
  }

  dimension: to_be_printed {
    type: number
    sql: ${TABLE}.to_be_printed ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
      order_id,
      client.client_id,
      client.client_display_name,
      client.merchant_name,
      client.lastname,
      client.perspective_name,
      client.firstname,
      client.client_name,
      client.verisign_username,
      payment_segment.count,
      order_detail.count,
      client_account.count
    ]
  }
}
