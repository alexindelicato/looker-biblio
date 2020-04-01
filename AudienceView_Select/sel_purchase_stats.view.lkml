view: sel_purchase_stats {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.purchase_stats`
    ;;

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension_group: performance {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
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

  dimension_group: purchase {
    type: time
    timeframes: [
      raw,
      date,
      week,
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
    sql: ${TABLE}.Total_Sales__ ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
