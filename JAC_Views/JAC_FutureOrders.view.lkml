view: JAC_FutureOrders {
  derived_table: {
    sql:
        select o.id orderid
          , TIMESTAMP_SECONDS(o.date) date
          , p.eventid
          , ifnull(events.memberid, o.memberid) memberid
          , ifnull(tr.refundid, r.refundid) refundId
          , ifnull(te.exchangeid, e.exchangeid) exchangeid
          , count(distinct pay.id) payments
        from mysql_service.orders o

        left join mysql_service.transactions t
          on t.orderid = o.id
        left join mysql_service.payments pay
          on o.id = pay.orderid
        full join mysql_service.performances p
          on t.performanceid = p.performanceid
        LEFT JOIN mysql_service.events events
          ON events.eventid = p.eventid
        left join mysql_service.transactions_refunds tr
          on tr.transactionid  = t.transactionid
          and t.voided is not null
        left join mysql_service.refunds r
          on r.orderid = t.orderId and r.trans_id is null
          and t.voided is not null
        left join mysql_service.transactions_exchanges te
          on te.transactionId = t.transactionId
          and t.voided is not null

        left join mysql_service.exchanges e
          on e.orderid = t.orderId
          and e.trans_id is null
          and t.voided is not null

        where (TIMESTAMP_SECONDS(p.starttime) > CURRENT_TIMESTAMP() or p.performanceid is null)
        group by 1,2,3,4,5,6 ;;
  }

  dimension: orderid {
    label: "Order Id"
  }

  dimension: memberid {
    label: "Member Id"
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
    sql: CONCAT(${TABLE}.orderid, ifnull(${TABLE}.eventid, ""), ifnull(${TABLE}.refundId,0), ifnull(${TABLE}.exchangeid,0)) ;;
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
