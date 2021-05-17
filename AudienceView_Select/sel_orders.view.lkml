view: sel_orders {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.orders`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
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

  dimension: agentid {
    type: string
    sql: ${TABLE}.agentid ;;
  }

  dimension: sold_by {
    type: string
    sql: case when ${TABLE}.agentid is NULL then "Ticket Line"
         when ${TABLE}.agentid is NOT NULL then "Ticket Agent"
        Else "Research" End;;
  }

  dimension: billingreminded {
    type: string
    sql: ${TABLE}.billingreminded ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: confirmationhash {
    type: string
    sql: ${TABLE}.confirmationhash ;;
  }

  dimension: consigneeid {
    type: string
    sql: ${TABLE}.consigneeid ;;
  }

  dimension: consigneeinvoiceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.consigneeinvoiceid ;;
  }

  dimension_group: date {
    type: time
    sql: timestamp_seconds(${TABLE}.date) ;;
  }

  measure: max_order_date {
    type: time
    sql: max${date_raw} ;;
  }

  measure: min_order_date {
    type: time
    sql: min${date_raw} ;;
  }

  dimension: deliveryid {
    type: string
    sql: ${TABLE}.deliveryid ;;
  }

  dimension: deliveryprice {
    type: number
    sql: round(safe_cast(${TABLE}.deliveryprice as FLOAT64), 2) ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: patronbillingid {
    type: number
    value_format_name: id
    sql: ${TABLE}.patronbillingid ;;
  }

  dimension: patronemailid {
    type: number
    value_format_name: id
    sql: ${TABLE}.patronemailid ;;
  }

  dimension: patronid {
    type: string
    sql: ${TABLE}.patronid ;;
  }

  measure: count_patronid {
    type: count_distinct
    sql: ${TABLE}.patronid ;;
  }

  dimension: patronphoneid {
    type: number
    value_format_name: id
    sql: ${TABLE}.patronphoneid ;;
  }

  dimension: patronshippingid {
    type: number
    value_format_name: id
    sql: ${TABLE}.patronshippingid ;;
  }

  dimension: settled {
    type: string
    sql: ${TABLE}.settled ;;
  }

  dimension: settledaily {
    type: string
    sql: ${TABLE}.settledaily ;;
  }

  dimension: testmode {
    type: string
    sql: ${TABLE}.testmode ;;
  }

  dimension: totalcost {
    label: "Total Order Cost"
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.totalcost as FLOAT64), 2) ;;
  }

  measure: sum_totalcost {
    label: "Total Order Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.totalcost as FLOAT64), 2) ;;
    drill_fields: [sel_members.organizationname,id]
  }

  dimension: totaldiscount {
    type: string
    sql: ${TABLE}.totaldiscount ;;
  }

  dimension: voucher {
    type: string
    sql: ${TABLE}.voucher ;;
  }

  dimension: voucherredeemdate {
    type: number
    sql: ${TABLE}.voucherredeemdate ;;
  }

  dimension: voucherredeemedagentid {
    type: string
    sql: ${TABLE}.voucherredeemedagentid ;;
  }

  measure: count_orders {
    type: count_distinct
    sql: ${TABLE}.id ;;
    drill_fields: [id, transactions.count, refunds.count, exchanges.count, orders_misclineitems.count, sel_members.organizationname,sel_events.title,sel_performances.starttime_time]
    }

  measure: count_past_orders {
    type: count_distinct
    sql: ${TABLE}.id ;;
    drill_fields: [id, transactions.count, refunds.count, exchanges.count, orders_misclineitems.count, sel_members.organizationname,sel_events.title,sel_performances.starttime_time]
    filters: {
      field: date_date
      value: "before today"
    }
  }

  measure: count_present_orders {
    type: count_distinct
    sql: ${TABLE}.id ;;
    drill_fields: [id, transactions.count, refunds.count, exchanges.count, orders_misclineitems.count, sel_members.organizationname,sel_events.title,sel_performances.starttime_time]
    filters: {
      field: sel_performances.starttime_date
      value: "after today"
    }
  }

  measure: count {
    type: count
    drill_fields: [id, transactions.count, refunds.count, exchanges.count, orders_misclineitems.count]
  }
}
