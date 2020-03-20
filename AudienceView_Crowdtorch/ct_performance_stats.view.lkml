view: ct_performance_stats {
  sql_table_name: fivetran-ovation-tix-warehouse.crowd_torch.performance_stats ;;

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

  dimension: cc_service_fee {
    type: number
    sql: ${TABLE}.CC_Service_Fee ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.clientName ;;
  }

  dimension: grand_total {
    type: number
    sql: ${TABLE}.Grand_Total ;;
  }

  dimension: quantity_tickets {
    type: number
    sql: ${TABLE}.Quantity_tickets ;;
  }

  dimension: service_fee {
    type: number
    sql: ${TABLE}.Service_Fee ;;
  }

  dimension_group: show_date {
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
    sql: ${TABLE}.showDateTime ;;
  }

  dimension: show_name {
    type: string
    sql: ${TABLE}.showName ;;
  }

  dimension: usd_ap_amount {
    type: number
    sql: ${TABLE}.USD_AP_Amount ;;
  }

  measure: count {
    type: count
    drill_fields: [show_name, client_name]
  }
}
