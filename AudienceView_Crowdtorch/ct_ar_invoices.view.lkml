view: ct_ar_invoices {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_invoices`
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

  dimension: ar_id {
    type: number
    sql: ${TABLE}.ar_id ;;
  }

  measure: max_ar_id {
    type: max
    sql: ${TABLE}.ar_id ;;
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

  dimension: billingcheck {
    type: string
    sql: ${TABLE}.billingcheck ;;
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

  dimension: clienttype {
    type: string
    sql: ${TABLE}.clienttype ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
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

  dimension_group: holddate {
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
    sql: ${TABLE}.holddate ;;
  }

  dimension: invnum {
    type: number
    value_format_name: id
    sql: ${TABLE}.invnum ;;
  }

  dimension: invoiceamt {
    type: number
    sql: ${TABLE}.invoiceamt ;;
  }

  dimension_group: invoicedate {
    type: time
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoicedate ;;
  }

  dimension: invoicenum {
    type: string
    sql: ${TABLE}.invoicenum ;;
  }

  dimension: invoicetotal {
    type: number
    sql: ${TABLE}.invoicetotal ;;
  }

  dimension: manualinv {
    type: number
    sql: ${TABLE}.manualinv ;;
  }

  dimension: merch_fees {
    type: number
    sql: ${TABLE}.merch_fees ;;
  }

  dimension: onhold {
    type: number
    sql: ${TABLE}.onhold ;;
  }

  dimension: othercharges_amt {
    type: number
    sql: ${TABLE}.othercharges_amt ;;
  }

  dimension: servicesamt {
    type: number
    sql: ${TABLE}.servicesamt ;;
  }

  dimension: ticketamt {
    type: number
    sql: ${TABLE}.ticketamt ;;
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
    drill_fields: [venuename, clientname]
  }
}
