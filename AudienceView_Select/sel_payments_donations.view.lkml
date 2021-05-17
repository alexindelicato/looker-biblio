view: sel_payments_donations {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.payments_donations`
    ;;
  drill_fields: [payments_donationsid]

  dimension: payments_donationsid {
    primary_key: yes
    type: number
    sql: ${TABLE}.payments_donationsid ;;
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

  dimension: amountheld {
    type: number
    sql: ${TABLE}.amountheld ;;
  }

  measure: sum_amountheld {
    label: "Amount Held"
    type: sum_distinct
    value_format_name:usd
    sql:round(safe_cast(${amountheld} as FLOAT64),2)  ;;
  }

  dimension: date {
    type: number
    sql: ${TABLE}.date ;;
  }

  dimension: disbursement {
    type: string
    sql: ${TABLE}.disbursement ;;
  }

  measure: sum_disbursement {
    label: "Disbursement"
    type: sum
    value_format_name:usd
    sql:round(safe_cast(${disbursement} as FLOAT64),2) ;;
  }


  dimension: donationid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.donationid ;;
  }

  dimension: feesdue {
    type: string
    sql: ${TABLE}.feesdue ;;
  }

  measure: sum_fees {
    label: "Fees Due"
    type: sum_distinct
    value_format_name:usd
    sql:round(safe_cast(${feesdue} as FLOAT64),2)  ;;
  }

  dimension: fundid {
    type: string
    sql: ${TABLE}.fundid ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  measure: count_memberid {
    type: count_distinct
    sql: ${TABLE}.memberid ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.orderid ;;
  }

  dimension: patronid {
    type: string
    sql: ${TABLE}.patronid ;;
  }

  dimension: paymentid {
    type: number
    value_format_name: id
    sql: ${TABLE}.paymentid ;;
  }

  dimension: settled {
    type: number
    sql: ${TABLE}.settled ;;
  }

  dimension: settledaily {
    type: string
    sql: ${TABLE}.settledaily ;;
  }

  measure: count {
    type: count
    drill_fields: [payments_donationsid, donations.donationid]
  }
}
