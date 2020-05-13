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
    type: string
    sql: ${TABLE}.amount ;;
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

  dimension: date {
    type: number
    sql: ${TABLE}.date ;;
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

  dimension: settled {
    type: number
    sql: ${TABLE}.settled ;;
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

  measure: count {
    type: count
    drill_fields: [refundid, orders.id]
  }
}
