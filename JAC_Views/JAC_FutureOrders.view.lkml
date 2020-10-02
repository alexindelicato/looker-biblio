view: JAC_FutureOrders {
  derived_table: {
    sql:
        select o.id orderid
          , TIMESTAMP_SECONDS(o.date) date
          , p.performanceid
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
        and ifnull(events.memberid, o.memberid) NOT IN ("4619e330fb68df17f017b1e89057d833", "211753f41b97e0700b33a570bde6c596", "6af4c79db09e0fb21d5f1b00095eaff8","4d8371bfae939dd32c7e10ff635b70bc","9e56c4935eea00caf287798718dfc94e","0d3536aad4341dcc256094c4c0bb0d6d","0fa0bb4fafbdb4cf5809433d80ab51e6","2a9dbca455e8b90c6b948bcb13939091","1df0aa9f217bb395fca282649811ec1e","af1ddb0b66213b3fa5ca8fa2f1f4d6ba", "45b4785ab727fd298943870f04dfcb8e","baae585e07764146b3692d35e7d2168d","e5d9bd60769bbf7b081349d50aa6b9c3","067da8bb66a30bdb73e10bde13bce8fb","8deca3b0ee8e883b6f89168e406cab12","dc7e2f44ca288588308940db1b45d4be","fe70ab1c75ffc4925639c07e0891a482","0806de427b3d1058a38169a25fce337f","f7d254de2d3506db04ef6eb89704fc28","c42dd251cd9381a73c5a0757fb77f5e9","0323d533228fc21ef9bdc14ba294e710","3ffe0a5e424b75967aa5d3fd326e4443","00d44100179c9b77eb6a06f46c85fa1e","ac43989129cab86b2f66eafbe84e639d","4ae6e9ab6d914b85eee46299348e163a","e7d0920b0ce8b6f293ff9c7d687466a9","a832a73fa655d6916d9d19f04aa47eb7","f5a0c859439061492b2f5d4d8c5552d2","2f6f48ca11bf79cb041f29517b3984bb","382d8d9d16f86d68c7b9ce9ae33933a8","1ac4cf3b7d79c3fd4593de81abd9e998","649d4c4f1bec4ce34dc9b1e03105d07b","75de64085f3d6cc501f5d3de02f16372","b5cc0907683f20463f2f084c6a3cd682","02217573d59983f801339bccb8b6869c","245515b655d69a0085b1f0096a0c6056","485902522b820b1d2315146956fd5325","b4bc3d66c4cb9051547a0ad897c9690d", "1410de8f55455590cca95acd53a8b97d","fb7ade9ed08721d8d1dd9b3a5eaf1482","85fbf43f381373e4f59033acb72c8b3a","4a2e13fb185fdaf7fad8ffdb9211f307")
        group by 1,2,3,4,5,6 ;;
  }

  dimension: orderid {
    label: "Order Id"
  }

  dimension: memberid {
    label: "Member Id"
  }

  dimension: performanceid {
    label: "Performance Id"
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
    sql: CONCAT(${TABLE}.orderid, ifnull(${TABLE}.performanceid, ""), ifnull(${TABLE}.refundId,0), ifnull(${TABLE}.exchangeid,0)) ;;
  }

  measure: count {
    type: count_distinct
    label: "Total Count"
    sql: ${orderid} ;;
  }

  measure: SalesCount {
    type: count
    label: "Sales Count"
    filters: [refundId: "NULL", exchangeid: "NULL", payments: ">0"]
  }

  measure: InvoiceCount {
    type: count
    label: "Invoice Count"
    filters: [refundId: "NULL", exchangeid: "NULL", payments: "0"]
  }

  measure: RefundCount {
    type: count
    label: "Refund Count"
    filters: [refundId: "-NULL"]
  }

  measure: ExchangeCount {
    type: count_distinct
    label: "Exchange Count"
    sql: ${orderid} ;;
    filters: [exchangeid: "-NULL", refundId: "NULL"]
  }

  measure: RecentOrders {
    type: count_distinct
    label: "Orders > than 90days"
    sql: ${orderid} ;;
    filters: [date: "90 days"]
  }


}
