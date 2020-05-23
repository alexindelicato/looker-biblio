view: ct_ap_invoices {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ap_invoices`
    ;;

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

  dimension: advances {
    type: number
    sql: ${TABLE}.advances ;;
  }

  dimension: ap_id {
    type: number
    sql: ${TABLE}.ap_id ;;
  }

  dimension_group: beginperiod {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.beginperiod ;;
  }

  dimension: billingcurrency {
    type: string
    sql: ${TABLE}.billingcurrency ;;
  }

  dimension: clientid {
    type: number
    value_format_name: id
    sql: ${TABLE}.clientid ;;
  }

  dimension: clientname {
    type: string
    sql: ${TABLE}.clientname ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension_group: endperiod {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.endperiod ;;
  }

  dimension: filename {
    type: string
    sql: ${TABLE}.filename ;;
  }

  dimension: grouppmts {
    type: number
    sql: ${TABLE}.grouppmts ;;
  }

  dimension_group: invoicedate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoicedate ;;
  }

  dimension: invoicename {
    type: string
    sql: ${TABLE}.invoicename ;;
  }

  dimension: invoicenum {
    type: string
    sql: ${TABLE}.invoicenum ;;
  }

  dimension_group: loaddate {
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
    sql: CAST(${TABLE}.loaddate AS TIMESTAMP) ;;
  }

  dimension: netrevenue {
    type: number
    sql: ${TABLE}.netrevenue ;;
  }

  dimension: othercharges {
    type: number
    sql: ${TABLE}.othercharges ;;
  }

  dimension: pastrefunds {
    type: number
    sql: ${TABLE}.pastrefunds ;;
  }

  dimension: totalrevenue {
    type: number
    sql: ${TABLE}.totalrevenue ;;
  }

  dimension: trans_show {
    type: string
    sql: ${TABLE}.trans_show ;;
  }

  dimension: translogid {
    type: number
    value_format_name: id
    sql: ${TABLE}.translogid ;;
  }

  dimension: uniquevenueid {
    type: string
    sql: ${TABLE}.uniquevenueid ;;
  }

  dimension: venueid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venueid ;;
  }

  dimension: venuename {
    type: string
    sql: ${TABLE}.venuename ;;
  }

  measure: count {
    type: count
    drill_fields: [venuename, invoicename, clientname, filename]
  }
}
