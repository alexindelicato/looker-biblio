view: ct_performance_stats {
  sql_table_name: fivetran-ovation-tix-warehouse.crowd_torch.performance_stats ;;

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: client_name {
  type: string
  sql: ${TABLE}.clientName ;;
}

dimension: client_id {
  type: number
  sql: ${TABLE}.clientID ;;
}

dimension: show_name {
  type: string
  sql: ${TABLE}.showName ;;
}

dimension_group: show_date_time {
  type: time
  sql: ${TABLE}.showDateTime ;;
}

dimension: brand_property {
  type: string
  sql: ${TABLE}.brandProperty ;;
}

dimension: quantity_tickets {
  type: number
  sql: ${TABLE}.Quantity_tickets ;;
}

dimension: total_scan {
  type: number
  sql: ${TABLE}.totalScan ;;
}

dimension: grand_total {
  type: number
  sql: ${TABLE}.Grand_Total ;;
}

dimension: service_fee {
  type: number
  sql: ${TABLE}.Service_Fee ;;
}

dimension: cc_service_fee {
  type: number
  sql: ${TABLE}.CC_Service_Fee ;;
}

dimension: additional_fee {
  type: number
  sql: ${TABLE}.Additional_Fee ;;
}

dimension: ap_amount {
  type: number
  sql: ${TABLE}.AP_Amount ;;
}

dimension: billing_currency {
  type: string
  sql: ${TABLE}.billingCurrency ;;
}

dimension: usd_ap_amount {
  type: number
  sql: ${TABLE}.USD_AP_Amount ;;
}

set: detail {
  fields: [
    client_name,
    client_id,
    show_name,
    show_date_time_time,
    brand_property,
    quantity_tickets,
    total_scan,
    grand_total,
    service_fee,
    cc_service_fee,
    additional_fee,
    ap_amount,
    billing_currency,
    usd_ap_amount
  ]
}
}
