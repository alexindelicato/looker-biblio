view: sel_refunds {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.refunds`
    ;;
  drill_fields: [refundid]

  dimension: refundid {
    primary_key: yes
    type: number
    sql: ${TABLE}.refundid ;;
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

  dimension: adminid {
    type: string
    sql: ${TABLE}.adminid ;;
  }

  dimension: agentid {
    type: string
    sql: ${TABLE}.agentid ;;
  }

  dimension: amount {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;
  }

  measure:: total_refund_amount {
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;
    drill_fields: [sel_members.organizationname,orderid,sel_performances.startime_date,date_date]
  }


  measure:: total_refund_amount_usd {
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)* 0.72
      else round(safe_cast(${TABLE}.amount as FLOAT64), 2)*1 End ;;
  }

#   measure: partial_refund {
#     type: yesno
#     sql: ${total_refund_amount} <> ${sel_orders.sum_totalcost} and  ${total_refund_amount} > 0  ;;
#     required_fields: [orderid]
#   }

  dimension: partial_refund {
    type: yesno
    sql: ${amount} <> ${sel_orders.totalcost} and  ${amount} > 0  ;;
  }


  measure:: 2020_total_refund_amount {
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;

  filters: {
    field: date_year
    value: "2020"
  }
}

  measure:: 2019_total_refund_amount {
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;

    filters: {
      field: date_year
      value: "2019"
    }
  }

  dimension: arbitrary {
    type: string
    sql: ${TABLE}.arbitrary ;;
  }

  dimension: auth_code {
    type: string
    sql: ${TABLE}.auth_code ;;
  }

  dimension: avs_code {
    type: string
    sql: ${TABLE}.avs_code ;;
  }

  dimension: ccmonth {
    type: string
    sql: ${TABLE}.ccmonth ;;
  }

  dimension: cctrunknumber {
    type: string
    sql: ${TABLE}.cctrunknumber ;;
  }

  dimension: cctype {
    type: string
    sql: ${TABLE}.cctype ;;
  }

  dimension: ccyear {
    type: string
    sql: ${TABLE}.ccyear ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: commissionableconveniencefeerefunded {
    type: number
    sql: ${TABLE}.commissionableconveniencefeerefunded ;;
  }

  dimension: conveniencerefunded {
    type: string
    sql: ${TABLE}.conveniencerefunded ;;
  }

  dimension: conveniencesalestaxrefunded {
    type: number
    sql: ${TABLE}.conveniencesalestaxrefunded ;;
  }

  dimension_group: date {
    type: time
    sql: timestamp_seconds(${TABLE}.date) ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: multiprocesspayment {
    type: string
    sql: ${TABLE}.multiprocesspayment ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.orderid ;;
  }

  dimension: paidtovendini {
    type: string
    sql: ${TABLE}.paidtovendini ;;
  }

  dimension: patronid {
    type: string
    sql: ${TABLE}.patronid ;;
  }

  dimension: ref_trans_id {
    type: string
    sql: ${TABLE}.ref_trans_id ;;
  }

  dimension: refundby {
    type: string
    sql: ${TABLE}.refundby ;;
  }

  dimension: refundfees {
    type: string
    sql: ${TABLE}.refundfees ;;
  }

  dimension: refundtype {
    type: number
    sql: ${TABLE}.refundtype ;;
  }

  dimension: refund_type_description {
    case: {
      when: {
        sql: ${TABLE}.refundtype = 1 ;;
        label: "Credit card method"
      }
      when: {
        sql: ${TABLE}.refundtype = 2 ;;
        label: "Cash payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 3 ;;
        label: "Check payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 4 ;;
        label: "Comp payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 5 ;;
        label: "Voucher payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 6 ;;
        label: "Voucher payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 9 ;;
        label: "Invoice payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 30 ;;
        label: "Gift card payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 100 ;;
        label: "Custom payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 0 ;;
        label: "Exchange Amount 0"
      }
      when: {
        sql: ${TABLE}.refundtype = 8 ;;
        label: "Renewal payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 23 ;;
        label: "Multiple payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 10 ;;
        label: "'in kind' payment method (for donations)"
      }
      when: {
        sql: ${TABLE}.refundtype = 11 ;;
        label: "'stock options' payment method (for donations)"
      }
      when: {
        sql: ${TABLE}.refundtype = 12 ;;
        label: "'volunteer' payment method (for donations)"
      }
      when: {
        sql: ${TABLE}.refundtype = 13 ;;
        label: "'planned giving' payment method (for donations)"
      }
      when: {
        sql: ${TABLE}.refundtype = 15 ;;
        label: "Donation refund payment method"
      }
      when: {
        sql: ${TABLE}.refundtype = 16 ;;
        label: "Misc refund payment type"
      }
      when: {
        sql: ${TABLE}.refundtype = 20 ;;
        label: "Release refund payment type"
      }
      when: {
        sql: ${TABLE}.refundtype = 21 ;;
        label: "Exchange credit payment type"
      }
      else: "unknown"
    }
  }

  dimension: response_code {
    type: string
    sql: ${TABLE}.response_code ;;
  }

  dimension: response_reason_code {
    type: string
    sql: ${TABLE}.response_reason_code ;;
  }

  dimension: response_subcode {
    type: string
    sql: ${TABLE}.response_subcode ;;
  }

  dimension_group: settled {
    type: time
    sql: timestamp_seconds(${TABLE}.settled) ;;
  }

  dimension: settledaily {
    type: string
    sql: ${TABLE}.settledaily ;;
  }

  dimension: shippingrefunded {
    type: string
    sql: ${TABLE}.shippingrefunded ;;
  }

  dimension: testmode {
    type: string
    sql: ${TABLE}.testmode ;;
  }

  dimension: trans_id {
    type: string
    sql: ${TABLE}.trans_id ;;
  }

  measure: count_refund {
    label: "Count of Partial Refunds Per Order"
    type: count_distinct
    sql: ${orderid} ;;
    drill_fields: [refundid, sel_members.organizationname,sel_orders.id,sel_orders.totalcost,amount]
  }

  measure: 2019_count_refunds_donations {
    label: "2019 Number of Ticket to Donation Conversions"
    type: count_distinct
    sql: ${refundid} ;;
    drill_fields: [refundid, sel_members.organizationname,sel_orders.id,sel_orders.totalcost,amount]

    filters: {
      field: date_year
      value: "2019"
    }

    filters: {
      field: refundtype
      value: "15"
    }
  }

  measure: count {
    type: count
    drill_fields: [refundid, orders.id]
  }
}
