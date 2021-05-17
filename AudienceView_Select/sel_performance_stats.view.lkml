## for the settlement processs/issue
view: sel_performance_stats {
  sql_table_name: fivetran-ovation-tix-warehouse.SelectAWS_service.performance_stats ;;

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
      week_of_year,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Performance_date ;;
  }

  dimension: performance_settlement {
    type: string
    sql: case when ${performance_week_of_year} = 10 then "March 2nd to March 8th"
         when ${performance_week_of_year} = 11 then "March 9th to March 15th"
         when ${performance_week_of_year} = 12 then "March 16th to March 22nd"
         when ${performance_week_of_year} = 13 then "March 23rd to March 29th"
         when ${performance_week_of_year} = 14 then "March 30th to April 5th"
         when ${performance_week_of_year} = 15 then "April 6th to April 12th"
         when ${performance_week_of_year} = 16 then "April 13th to April 19th"
         when ${performance_week_of_year} = 17 then "April 20th to April 26th"
         when ${performance_week_of_year} = 18 then "April 27th to May 3rd"
         when ${performance_week_of_year} = 19 then "May 4th to May 10th"
    else "Research" End;;
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
    sql: round(safe_cast(${TABLE}.Total_Convenience_Fees as FLOAT64),2) ;;
  }

  measure: sum_total_convenience_fees {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.Total_Convenience_Fees as FLOAT64),2) ;;
  }


  dimension: total_sales__ {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.Total_Sales__ as FLOAT64),2) ;;
  }

  measure: sum_total_sales__ {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.Total_Sales__ as FLOAT64),2) ;;
  }

  dimension: total_service_fees {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.Total_Service_Fees as FLOAT64),2) ;;
  }

  measure: sum_total_service_fees {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.Total_Service_Fees as FLOAT64),2) ;;
  }

dimension: payout_amount {
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
