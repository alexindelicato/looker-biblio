view: sel_purchase_stats {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.purchase_stats`
    ;;

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension_group: current_time {
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
      week_of_year,
      year
    ]
    sql: CURRENT_TIMESTAMP() ;;
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

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  measure: count_performance {
    type: count_distinct
    sql: ${performanceid} ;;
  }

  dimension_group: purchase {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month_name,
      week_of_year,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Purchase_Date ;;
  }

  dimension: ticket_quantity {
    type: number
    sql: ${TABLE}.Ticket_Quantity ;;
  }

  dimension: total_sales__ {
    type: number
    value_format_name: usd
    sql: ${TABLE}.Total_Sales__ ;;
  }

  dimension: order_count{
    type: number
    sql: ${TABLE}.order_count ;;
  }

  measure: total_order_count{
    type: sum
    sql: ${TABLE}.order_count;;
  }

  measure: count {
    type: count
    drill_fields: [memberid,performanceid,performance_date,purchase_date,ticket_quantity,total_sales__]
  }
}
