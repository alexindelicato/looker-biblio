view: ct_purchase_stats {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowd_torch.purchase_stats`
    ;;

  dimension: billing_currency {
    type: string
    sql: ${TABLE}.billingCurrency ;;
  }

  dimension: brand_property {
    type: string
    sql: ${TABLE}.brandProperty ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.clientID ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.clientName ;;
  }

  dimension: grand_total {
    type: number
    sql: ${TABLE}.Grand_Total ;;
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

  dimension_group: purchase {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      week_of_year,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.purchaseDate ;;
  }

  dimension: quantity_tickets {
    type: number
    sql: ${TABLE}.Quantity_tickets ;;
  }

  dimension_group: show_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      week_of_year,
      quarter,
      year
    ]
    sql: ${TABLE}.showDateTime ;;
  }

  dimension: show_name {
    type: string
    sql: ${TABLE}.showName ;;
  }

  dimension: order_count {
    type: number
    sql: ${TABLE}.Order_Count ;;
  }

  measure: sum_order_count {
    type: sum
    sql: ${TABLE}.Order_Count ;;
  }

  measure: count {
    type: count
    drill_fields: [show_name, client_name]
  }
}
