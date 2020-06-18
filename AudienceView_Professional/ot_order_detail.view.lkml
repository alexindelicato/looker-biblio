view: ot_order_detail {
  sql_table_name: trs_trs.order_detail ;;

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
  }

  measure: total_fees {
    label: "Total Fees"
    type: number
    value_format_name: usd
    sql:  ${ot_service_fee_total}+${processing_fee_total} ;;
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

  measure: count_ticket_id {
    label: "Total # of Tickets"
    type: count_distinct
    sql: ${TABLE}.ticket_id ;;
    drill_fields: [ot_orders.order_id,ot_client.client_id,ot_client.client_name,count_ticket_id,price]
  }

  measure: tickets_refunded {
    label: "Total Tickets Refunded"
    type: number
    hidden: yes
    sql: ${ot_order_detail.count_ticket_id} - ${ot_performance_stats_consumed.total_sold_seats} ;;
  }

  measure: tickets_sold {
    label: "Total Tickets Sold (Minus Refunds)"
    type: number
    sql: ${ot_order_detail.count_ticket_id} - ${ot_order_detail.tickets_refunded} ;;
  }

  measure: tm_tickets_sold {
    label: "Total Tickets Sold By TM"
    type: count_distinct
    sql: ${TABLE}.ticket_id ;;
    drill_fields: [ot_orders.order_id,ot_client.client_id,ot_client.client_name,count_ticket_id,price]

    filters: {
      field: ganalytics_ot.segment
      value: "Source contains Theatermania" }
    }


  dimension: consumer_fee {
    type: number
    sql: ${TABLE}.consumer_fee ;;
  }

  measure: sum_consumer_fee {
    type: sum
    sql: ${TABLE}.consumer_fee ;;
    value_format_name: usd
  }

  dimension: consumer_pac_id {
    type: number
    sql: ${TABLE}.consumer_pac_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: donation_id {
    type: number
    sql: ${TABLE}.donation_id ;;
  }

  measure: count_donations {
    type: count_distinct
    sql: ${TABLE}.donation_id ;;
    filters: {
      field: donation_id
      value: "NOT NULL"
    }
  }

  dimension: group_discount_id {
    type: number
    sql: ${TABLE}.group_discount_id ;;
  }


dimension_group: last_tx {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.last_tx_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: orderdetail_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.orderdetail_id ;;
  }

  dimension: paid_amount {
    type: number
    sql: ${TABLE}.paid_amount ;;
  }

  dimension: pct_off {
    type: number
    sql: ${TABLE}.pct_off ;;
  }

  dimension: performance_id {
    type: number
    sql: ${TABLE}.performance_id ;;
  }

  dimension: price {
    type: number
    value_format: "$#,##0.00"
    sql: ${TABLE}.price ;;
    drill_fields: [ot_client.client_id,ot_client.client_name,ot_orders.order_id,ganalytics_ot.date_date,sum_donations]
  }

  measure: avg_price {
    type:  average
    value_format: "$#,##0.00"
    sql: ${TABLE}.price ;;
  }

  measure: sum_price{
    type: sum
    value_format_name:usd
    sql: ${TABLE}.price ;;
    drill_fields: [detail*]
  }

  measure: sum_donations{
    type: sum_distinct
    value_format_name:usd
    sql: ${TABLE}.price ;;
    drill_fields: [ot_client.client_id,ot_client.client_name,ot_orders.order_id,ganalytics_ot.date_date,sum_donations]

    filters: {
      field: order_type
      value: "Donation" }
  }


  measure: sum_ticket_revenue{
    type: sum_distinct
    value_format_name:usd
    sql: ${TABLE}.price ;;
    drill_fields: [ot_client.client_id,ot_client.client_name,ot_orders.order_id,ganalytics_ot.date_date,sum_donations]

    filters: {
      field: order_type
      value: "Tickets" }
  }

  measure: sum_package_revenue{
    type: sum_distinct
    value_format_name:usd
    sql: ${TABLE}.price ;;
    drill_fields: [ot_client.client_id,ot_client.client_name,ot_orders.order_id,ganalytics_ot.date_date,sum_donations]

    filters: {
      field: order_type
      value: "Package" }
  }


  dimension: price_level_id {
    type: number
    sql: ${TABLE}.price_level_id ;;
  }

  dimension: processing_fee {
    type: number
    sql: ${TABLE}.processing_fee ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: promotion_code {
    type: string
    sql: ${TABLE}.promotion_code ;;
  }

  dimension: promotion_id {
    type: number
    sql: ${TABLE}.promotion_id ;;
  }

  dimension: promotion_name {
    type: string
    sql: ${TABLE}.promotion_name ;;
  }

  dimension: service_fee {
    type: number
    sql: ${TABLE}.service_fee ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  measure: count_scanned_tickets {
    label: "Scanned Tickets"
    type: count
    drill_fields: [ot_orders.order_id,ot_client.client_id,ot_client.client_name,count_ticket_id,price]

    filters: {
      field: status_id
      value: "9" }
  }

  measure: count_complete_tickets {
    label: "Complete Tickets"
    type: count
    drill_fields: [ot_orders.order_id,ot_client.client_id,ot_client.client_name,count_ticket_id,price]

    filters: {
      field: status_id
      value: "2"}
  }

  measure: total_tickets_for_scanning {
    label: "Total Attendence"
    type: number
    value_format_name: percent_2
    sql: 1 - (${count_scanned_tickets} / (${count_complete_tickets} + ${count_scanned_tickets})) ;;
  }


  dimension: order_status {
    type: string
    sql:case when cast(${status_id} as string) = '1' then 'As Order'
             when cast(${status_id} as string) = '2' then 'Complete'
             when cast(${status_id} as string) = '4' then 'Void'
             when cast(${status_id} as string) = '5' then 'Refund'
             when cast(${status_id} as string) = '9' then 'Scanned'
             when cast(${status_id} as string) = '11' then 'Pending'
        Else cast(${status_id} as string) end;;
  }

  dimension: tax {
    type: number
    sql: ${TABLE}.tax ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: ticket_type_id {
    type: number
    sql: ${TABLE}.ticket_type_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: order_type{
    type:  string
    sql: CASE WHEN  ${type} = 'DLV' THEN 'Delivery Method'
        WHEN  ${type} = 'DNT' THEN 'Donation'
        WHEN  ${type} = 'PRD' THEN 'Product'
        WHEN  ${type} = 'GC' THEN 'Gift Card'
        WHEN  ${type} = 'INS' THEN 'Insurance'
        WHEN  ${type} = 'PAP' THEN 'Package'
        WHEN  ${type} = 'PKT' Then 'Package'
        WHEN  ${type} = 'PHF' THEN 'Phone Order Charge'
        WHEN  ${type} = 'PMT' THEN 'Redeemed Ticket'
        WHEN  ${type} = 'TCK' THEN 'Tickets'
      ELSE 'Research' END ;;
  }

  dimension: isTicket {
    type: yesno
    sql: ${type} IN ('TCK', 'PMT', 'PKT');;
  }

  dimension: isDonation {
    type: yesno
    sql: ${type} IN ('DNT');;
  }

  dimension: isPhoneOrderFee {
    type: yesno
    sql: ${type} IN ('PHF') ;;
  }

  measure: count {
    type: count_distinct
    sql:  ${orderdetail_id} ;;
    drill_fields: [detail*]
  }

  measure: ot_service_fee_total {
    label: "Credit Card Fees"
    type: sum
    sql:  ${service_fee};;
    value_format_name: usd
  }

  measure: ACV_service_fee_total {
    type: sum
#     sql: if(${acv_is_sale}, ${service_fee}, 0) ;;
    sql:  ${service_fee};;
    value_format_name: usd_0
    hidden: yes
    filters: {
      field: time
      value: "12 months ago for 12 months" }
  }


  measure: processing_fee_total {
    label: "OvationTix Service Fee"
    type: sum
    sql:  ${processing_fee};;
    value_format_name: usd
  }

  measure: ACV_processing_fee_total {
    type: sum
    #sql: if(${acv_is_sale}, ${processing_fee}, 0) ;;
    sql:  ${processing_fee};;
    value_format_name: usd_0
    hidden: yes
    filters: {
      field: time
      value: "12 months ago for 12 months" }
  }

  measure: OT_ARR{
    label:"OT ARR"
    type: number
    sql: ${ACV_service_fee_total}+${ACV_processing_fee_total} ;;
    value_format_name: usd_0
    drill_fields: [sf_accounts.name,sf_accounts.contract_expiration_c_date,OT_ARR]
  }

  dimension: acv_is_sale {
    type: yesno
    sql: ${ot_client_account.is_sale} = 1;;
    hidden: yes
  }

#   dimension: tx {
#     type: date_month
#     sql: (${ot_client_account.tx_raw});;
#   }

  dimension: time {
    type: date_month
    sql: ${ot_orders.time_raw} ;;
  }

  measure: gross_earnings_total {
    type: sum
    sql:  ${service_fee} + ${processing_fee};;
    value_format_name: usd_0
  }
# ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      ot_order.id,
      ot_client.client_id,
      ot_client.client_name,
      ot_orders.order_id,
      ot_production.prod_name,
      ot_client.merchant_name,
      ot_client.lastname,
      ot_client.perspective_name,
      ot_client.firstname,
      ot_client.client_name,
      ot_client.verisign_username,
      ot_time.date,
      ot_orders.sum_total,
      ot_order_detail.count_ticket_id
    ]
  }
}
