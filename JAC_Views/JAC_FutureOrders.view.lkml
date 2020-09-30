view: JAC_FutureOrders {
  derived_table: {
    sql:
      select t.orderid
        , TIMESTAMP_SECONDS(o.date) date
        , p.eventid
        , ifnull(tr.refundid, r.refundid) refundId
        , ifnull(te.exchangeid, e.exchangeid) exchangeid
        , count(distinct pay.id) payments
      from mysql_service.transactions t

      join mysql_service.orders o
        on t.orderid = o.id
      left join mysql_service.payments pay
        on o.id = pay.orderid --and pay.amount <> '0'
      join mysql_service.performances p
        on t.performanceid = p.performanceid
      left join mysql_service.transactions_refunds tr
        on tr.transactionid  = t.transactionid
      left join mysql_service.refunds r
        on r.orderid = t.orderId and r.trans_id is null
      left join mysql_service.transactions_exchanges te
        on te.transactionId =t.transactionId
      left join mysql_service.exchanges e
        on e.orderid = t.orderId and e.trans_id is null

      where TIMESTAMP_SECONDS(p.starttime) > CURRENT_TIMESTAMP()
      group by 1,2,3,4,5 ;;
  }

  dimension: orderid {
    label: "Order Id"
  }

  dimension: eventid {
    label: "Event Id"
  }

  dimension: refundId {
    label: "Refund Id"
  }

  dimension: exchangeid {
    label: "Exchange Id"
  }

  dimension: date {
    label: "Order Date"
    type: date
  }

  dimension: payments {
    label: "Payments"
    type:  number
  }
  dimension: primary_key {

    primary_key: yes
    sql: CONCAT(${TABLE}.orderid, ${TABLE}.eventid, ${TABLE}.refundId, ${TABLE}.exchangeid) ;;
  }

  measure: count {
    type: count_distinct
    label: "Total Count"
    sql: ${orderid} ;;
    drill_fields: [eventid, orderid]
  }

  measure: SalesCount {
    type: count
    label: "Sales Count"
    filters: [refundId: "NULL", exchangeid: "NULL", payments: ">0"]
    drill_fields: [eventid, orderid]
  }

  measure: InvoiceCount {
    type: count
    label: "Invoice Count"
    filters: [refundId: "NULL", exchangeid: "NULL", payments: "0"]
    drill_fields: [eventid, orderid]
  }

  measure: RefundCount {
    type: count
    label: "Refund Count"
    filters: [refundId: "-NULL"]
    drill_fields: [eventid, orderid]
  }

  measure: ExchangeCount {
    type: count_distinct
    label: "Exchange Count"
    sql: ${orderid} ;;
    filters: [exchangeid: "-NULL", refundId: "NULL"]
    drill_fields: [eventid, orderid]
  }

  measure: RecentOrders {
    type: count_distinct
    label: "Orders > than 90days"
    sql: ${orderid} ;;
    filters: [date: "90 days"]
    drill_fields: [eventid, orderid]
  }


}
