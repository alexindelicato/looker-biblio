view: ot_orders {
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
    hidden: yes
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
    hidden: yes
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

  dimension: is_held_by_client {
    type: number
    sql: ${TABLE}.is_held_by_client ;;
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

  dimension: name_on_ticket_first {
    type: string
    sql: ${TABLE}.name_on_ticket_first ;;
  }

  dimension: name_on_ticket_last {
    type: string
    sql: ${TABLE}.name_on_ticket_last ;;
  }

  dimension: order_taker_id {
    type: number
    sql: ${TABLE}.order_taker_id ;;
  }

  dimension: paid_amount {
    type: number
    sql: ${TABLE}.paid_amount ;;
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

  dimension: security_id {
    type: string
    sql: ${TABLE}.security_id ;;
  }

  dimension: service_fee_total {
    type: number
    sql: ${TABLE}.service_fee_total ;;
  }

  dimension: shipping_address_id {
    type: number
    sql: ${TABLE}.shipping_address_id ;;
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
      month_name,
      quarter,
      quarter_of_year,
      year
    ]
    sql: ${TABLE}.time ;;
  }

  dimension: month_formatted {
    group_label: "Created"  label: "Month Format"
    sql: ${time_month} ;;
    html: {{ rendered_value | append: "-01" |  date: "%B" }};;
  }

#   measure: max_order_date {
#     type: date
#     sql: cast(max(${time_date}) as timestamp) ;;
#   }

  measure: max_order_date {
    type: date
    sql: MAX(${time_raw}) ;;
  }

#   measure: min_order_date {
#     type: date
#     sql: cast(min(${time_date}) as timestamp) ;;
#   }

  measure: min_order_date {
    type: date
    sql: MIN(${time_raw}) ;;
  }

  dimension: to_be_printed {
    type: number
    sql: ${TABLE}.to_be_printed ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
    value_format: "$#,##0.00"
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: payment_type_custom_id {
    type: string
    sql: ${TABLE}.payment_type_custom_id ;;
  }

  dimension: is_guest_checkout {
    type: yesno
    sql: ${TABLE}.is_guest_checkout ;;
  }

  dimension: is_mobile_checkout {
    type: number
    sql: ${TABLE}.is_mobile_checkout ;;
  }

  dimension: checkout_option {
    type: string
    sql: case when ${TABLE}.checkout_option = 0 then 'Regular'
              when ${TABLE}.checkout_option = 1 then 'MasterPass'
              else 'Unknown' end ;;
  }

  dimension: order_location_mobile {
    type: number
    sql: CASE ${is_mobile_checkout} WHEN 0 THEN 0 WHEN 1 THEN 1 WHEN 2 THEN 0 WHEN 3 THEN 1 ELSE 0 END ;;
  }

  dimension: order_location_responsive {
    type:  string
    sql: CASE ${is_mobile_checkout} WHEN 0 THEN 'Legacy CI' WHEN 1 THEN 'Legacy Mobile' WHEN 2 THEN 'Responsive CI Desktop' WHEN 3 THEN 'Responsive CI Mobile' ELSE 'Legacy CI' END ;;
  }

  dimension: order_location {
    type: string
    sql: CASE WHEN ${originator} = 'WEB' AND ${order_location_mobile} = 0 THEN 'WEB-DESKTOP'
              WHEN ${originator} = 'WEB' AND ${order_location_mobile} = 1 THEN 'WEB-MOBILE'
              WHEN ${originator} = 'OTPHONE' THEN 'OTPHONE'
              WHEN ${originator} = 'BOPHONE' THEN 'BOPHONE'
              WHEN ${originator} = 'TKTS' THEN 'TKTS'
              WHEN ${originator} = 'BO' THEN 'BO'
              ELSE 'WEB-DESKTOP' End;;
  }

  dimension: order_location_web_or_backoffice {
    label: "Web Or Backoffice Location"
    type: string
    sql: CASE WHEN ${originator} = 'WEB'THEN 'ONLINE'
              WHEN ${originator} = 'BO' THEN 'BOX OFFICE'
              ELSE 'OTHER' END;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_orders {
    type: count_distinct
    sql:  ${ot_orders.order_id} ;;
    drill_fields: [ot_client.client_id,ot_client.client.client_name,ot_orders.customer_sum_total]
  }

  measure: sum_total {
    label: "Total Order Amount"
    type: sum
    sql: ${total} ;;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  measure: sum_total_distinct {
    label: "Total Order Amount Distinct"
    type: sum_distinct
    sql: ${total} ;;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  measure: average_price {
    type: average
    sql: ${total} ;;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  dimension: is_credit_card {
    type:  yesno
    sql:  ${payment_type_id} IN (1, 2, 3) ;;
  }

  dimension: card_present {
    type:  yesno
    sql: ${type} IN ('pcl', 'wcc', 'bo', 'tkt') ;;
  }

  dimension: originator {
    type: string
    sql: CASE ${type} WHEN 'web' THEN 'WEB' WHEN 'ptm' THEN 'OTPHONE' WHEN 'pcl' THEN 'BOPHONE' WHEN 'tkt' THEN 'TKTS' ELSE 'BO' END ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      order_id,
      ot_client.client_id,
      ot_client.client_name,
      ot_client.merchant_name,
      ot_client.lastname,
      ot_client.perspective_name,
      ot_client.firstname,
      ot_client.client_name,
      ot_client.verisign_username,
      time_date,
      sum_total,
      ot_order_detail.count_ticket_id
    ]
  }
}
