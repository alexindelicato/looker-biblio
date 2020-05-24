view: ct_ar_payments {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_payments`
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

  dimension: transtype {
    type: string
    sql: "Manual CM" ;;
  }

  dimension: bankid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bankid ;;
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

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: fx_adj {
    type: number
    sql: ${TABLE}.fx_adj ;;
  }

  dimension: invoicenum {
    type: string
    sql: ${TABLE}.invoicenum ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: pmtamt {
    value_format_name: usd
    type: number
    sql: ${TABLE}.pmtamt ;;
  }

  measure: measure_pmtamt {
    label: "AR_Amt"
    value_format_name: usd
    type: number
    sql: ${TABLE}.pmtamt ;;
    required_fields: [pmtamt]
  }

  measure: bs_usd {
    label: "BS_USD"
    value_format_name: usd
    type: number
    sql: round(${TABLE}.pmtamt *  ${ct_fx_rates_bs.fx_rate_bs}, 2);;
    required_fields: [ct_fx_rates_bs.fx_rate_bs]
  }

  measure: is_usd {
    label: "IS_USD"
    value_format_name: usd
    type: number
    sql: round(${TABLE}.pmtamt *  ${ct_fx_rates.fx_rate}, 2);;
    required_fields: [ct_fx_rates.fx_rate]
  }


  dimension_group: pmtdate {
    type: time
    convert_tz: no
    datatype: date
    sql: ${TABLE}.pmtdate ;;
  }

  dimension: pmtid {
    type: number
    value_format_name: id
    sql: ${TABLE}.pmtid ;;
  }

  dimension: pmtref {
    type: string
    sql: ${TABLE}.pmtref ;;
  }

  dimension: totalpmt {
    type: number
    sql: ${TABLE}.totalpmt ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
