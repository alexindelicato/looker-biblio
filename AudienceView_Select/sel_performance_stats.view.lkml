## for the settlement processs/issue
view: sel_performance_stats {
  sql_table_name: fivetran-ovation-tix-warehouse.mysql_service.performance_stats ;;

  dimension: admission {
    type: string
    sql: ${TABLE}.admission ;;
  }

  dimension: capacity {
    type: number
    sql: ${TABLE}.capacity ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: performance_cancelled {
    type: string
    sql: ${TABLE}.Performance_cancelled ;;
  }

  dimension_group: performance {
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
    sql: ${TABLE}.Performance_date ;;
  }

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  dimension: tickets_scanned {
    type: number
    sql: ${TABLE}.Tickets_Scanned ;;
  }

  dimension: tickets_sold {
    type: number
    sql: ${TABLE}.Tickets_Sold ;;
  }

  measure: sum_tickets_sold {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Tickets_Sold ;;
  }

  dimension: total_convenience_fees {
    type: number
    value_format_name: usd
    sql: ${TABLE}.Total_Convenience_Fees ;;
  }

  measure: sum_total_convenience_fees {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Total_Convenience_Fees ;;
  }

  dimension: total_sales__ {
    type: number
    value_format_name: usd
    sql: ${TABLE}.Total_Sales__ ;;
  }

  measure: sum_total_sales__ {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Total_Sales__ ;;
  }

  dimension: total_service_fees {
    type: number
    value_format_name: usd
    sql: ${TABLE}.Total_Service_Fees ;;
  }

  measure: sum_total_service_fees {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Total_Service_Fees ;;
  }

measure: payout_amount {
  type: number
  value_format_name: usd
  sql:${total_sales__}-${total_service_fees}-${total_convenience_fees} ;;
}

  measure: sum_payout_amount {
    type: number
    value_format_name: usd
    sql: ${sum_total_sales__}-${sum_total_service_fees}-${sum_total_convenience_fees} ;;
  }

  dimension: venueid {
    type: string
    sql: ${TABLE}.venueid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
