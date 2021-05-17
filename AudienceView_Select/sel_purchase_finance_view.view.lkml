view: sel_purchase_finance_view {
      sql_table_name:`fivetran-ovation-tix-warehouse.SelectAWS_service.purchase_stats`
        ;;


    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: memberid {
      type: string
      sql: ${TABLE}.memberid ;;
    }

    dimension: performanceid {
      type: string
      sql: ${TABLE}.performanceid ;;

    }
  dimension_group: performance {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Performance_Date ;;
  }

    dimension_group: purchase_date {
      type: time
      datatype: date
      sql: ${TABLE}.Purchase_Date ;;
    }

    dimension: ticket_quantity {
      type: number
      sql: ${TABLE}.Ticket_Quantity ;;
    }

    dimension: order_count {
      type: number
      sql: ${TABLE}.Order_Count ;;
    }

    dimension: total_sales__ {
      type: number
      sql: round(safe_cast(${TABLE}.Total_Sales__ as FLOAT64),2) ;;
    }

  measure: total_sales_ {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.Total_Sales__ as FLOAT64),2) ;;
  }

  measure: 2020_total_sales_ {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.Total_Sales__ as FLOAT64),2) ;;


    filters: {
      field: purchase_date_year
      value: "2020"
    }
  }

    dimension: total_service_fee {
      type: number
      sql: round(safe_cast(${TABLE}.total_service_fee as FLOAT64),2) ;;
    }


  measure: total_service_fee_ {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${total_service_fee} as FLOAT64),2) ;;
  }

    dimension: actual_revenue_service_fee {
      type: number
      value_format_name: usd
      sql: round(safe_cast(${TABLE}.Actual_Revenue_Service_Fee as FLOAT64),2) ;;
    }

  measure: actual_revenue_service_fee_ {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.Actual_Revenue_Service_Fee as FLOAT64),2) ;;
  }

    dimension: cc_proceessing_service_fee {
      type: number
      value_format_name: usd
      sql: round(safe_cast(${TABLE}.CC_Proceessing_Service_Fee as FLOAT64),2) ;;
    }

  measure: cc_proceessing_service_fee_ {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.CC_Proceessing_Service_Fee as FLOAT64),2) ;;
  }

    dimension: total_convenience_fee {
      type: number
      value_format_name: usd
      sql: round(safe_cast(${TABLE}.Total_Convenience_Fee as FLOAT64),2) ;;
    }

  measure: total_convenience_fee_ {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.Total_Convenience_Fee as FLOAT64),2) ;;
  }

    dimension: actual_revenue_convenience_fee {
      type: number
      value_format_name: usd
      sql: round(safe_cast(${TABLE}.Actual_Revenue_Convenience_Fee as FLOAT64), 2) ;;
    }


  measure: actual_revenue_convenience_fee_ {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.Actual_Revenue_Convenience_Fee as FLOAT64), 2) ;;
  }

    measure: cc_processing_convenience_fee {
      type: sum
      value_format_name: usd
      sql: round(safe_cast(${TABLE}.CC_Processing_Convenience_Fee as FLOAT64),2) ;;
    }

    set: detail {
      fields: [
        memberid,
        performanceid,
        performance_date,
        purchase_date_date,
        ticket_quantity,
        order_count,
        total_sales__,
        total_service_fee,
        actual_revenue_service_fee,
        cc_proceessing_service_fee,
        total_convenience_fee,
        actual_revenue_convenience_fee,
        cc_processing_convenience_fee
      ]
    }
  }
