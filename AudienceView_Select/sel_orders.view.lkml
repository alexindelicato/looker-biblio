view: sel_orders {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.orders`
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

  dimension: agentid {
    type: string
    sql: ${TABLE}.agentid ;;
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

  dimension: deliveryid {
    type: string
    sql: ${TABLE}.deliveryid ;;
  }

  dimension: deliveryprice {
    type: number
    sql: ${TABLE}.deliveryprice ;;
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
    type: string
    sql: ${TABLE}.totalcost ;;
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

  measure: count {
    type: count
    drill_fields: [id, transactions.count, refunds.count, exchanges.count, orders_misclineitems.count]
  }
}
