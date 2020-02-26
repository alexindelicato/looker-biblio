view: ot_client_account {
  sql_table_name: trs_trs.client_account ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_sale {
    type:  number
    sql: CASE WHEN ${flags} & 1 <> 0 AND ${flags} & 2048 = 0 THEN 1 ELSE 0 END;;
  }

  dimension: is_refund {
    type: number
    sql: CASE WHEN ${flags} & 8 <> 0 AND ${flags} & 2048 = 0 THEN 1 ELSE 0 END;;
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

  dimension: adjustments {
    type: number
    sql: ${TABLE}.adjustments ;;
  }

  dimension: amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.amount ;;
  }

  measure: amount_value {
    type: number
    value_format_name: usd
    sql: ${TABLE}.amount ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: balance_due {
    type: number
    sql: ${TABLE}.balance_due ;;
  }

  dimension: cash_amount {
    type: number
    sql: ${TABLE}.cash_amount ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: flags {
    type: number
    sql: ${TABLE}.flags ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: orderdetail_id {
    type: number
    sql: ${TABLE}.orderdetail_id ;;
  }

  dimension: payable_and_on_hold {
    type: number
    sql: ${TABLE}.payable_and_on_hold ;;
  }

  dimension: payment_amount {
    type: number
    sql: ${TABLE}.payment_amount ;;
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: perf_id {
    type: number
    sql: ${TABLE}.perf_id ;;
  }

  dimension: processing_fee {
    type: number
    sql: ${TABLE}.processing_fee ;;
  }

  dimension: service_fee {
    type: number
    sql: ${TABLE}.service_fee ;;
  }

  dimension_group: tx {
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
    sql: ${TABLE}.tx_date ;;
  }

  dimension: type_payment {
    type: yesno
    sql: ${TABLE}.type_payment ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: withheld {
    type: number
    sql: ${TABLE}.withheld ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      client.client_id,
      client.client_display_name,
      client.merchant_name,
      client.lastname,
      client.perspective_name,
      client.firstname,
      client.client_name,
      client.verisign_username,
      orders.order_id,
      client_statement.count
    ]
  }
}
