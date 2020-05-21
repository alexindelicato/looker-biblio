view: tbl_ticketing_ar_invoices_trans {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_invoices_trans`
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

  dimension: ar_amt {
    type: number
    sql: ${TABLE}.ar_amt ;;
  }

  dimension: ar_id {
    type: number
    sql: ${TABLE}.ar_id ;;
  }

  dimension: ar_transid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ar_transid ;;
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

  dimension: bsf_percent {
    type: number
    sql: ${TABLE}.bsf_percent ;;
  }

  dimension: bsf_perticket {
    type: number
    sql: ${TABLE}.bsf_perticket ;;
  }

  dimension: chargeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.chargeid ;;
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

  dimension: csf_month {
    type: number
    sql: ${TABLE}.csf_month ;;
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

  dimension: invoicenum {
    type: string
    sql: ${TABLE}.invoicenum ;;
  }

  dimension: onhold {
    type: number
    sql: ${TABLE}.onhold ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: saletype {
    type: string
    sql: ${TABLE}.saletype ;;
  }

  dimension: saletypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.saletypeid ;;
  }

  dimension: servicetype {
    type: string
    sql: ${TABLE}.servicetype ;;
  }

  dimension_group: transdate {
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
    sql: ${TABLE}.transdate ;;
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
