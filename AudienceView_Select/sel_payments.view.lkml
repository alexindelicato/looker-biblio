view: sel_payments {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.payments`
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

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
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

  dimension: ccswiped {
    type: string
    sql: ${TABLE}.ccswiped ;;
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

  dimension: date {
    type: number
    sql: ${TABLE}.date ;;
  }

  dimension: exchangeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.exchangeid ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
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

  dimension: paymenttype {
    type: number
    sql: ${TABLE}.paymenttype ;;
  }

  dimension: ref_trans_id {
    type: string
    sql: ${TABLE}.ref_trans_id ;;
  }

  dimension: refundedpaymentid {
    type: number
    value_format_name: id
    sql: ${TABLE}.refundedpaymentid ;;
  }

  dimension: refundid {
    type: number
    value_format_name: id
    sql: ${TABLE}.refundid ;;
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
    drill_fields: [id]
  }
}
