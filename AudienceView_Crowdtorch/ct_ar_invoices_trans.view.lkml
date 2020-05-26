view: ct_ar_invoices_trans {
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

  dimension: transtype {
    type: string
    sql: "Billed Services - Other" ;;
  }

  dimension: ar_amt {
    type: number
    sql: ${TABLE}.ar_amt ;;
  }

  measure: measure_ar_amt {
    label: "Revenue"
    type: sum
    value_format_name: usd
    sql: round(${TABLE}.ar_amt,2) ;;
  }

  measure: measure_ar_amt_usd {
    label: "AR_USD"
    type: sum
    value_format_name: usd
    sql: round(${TABLE}.ar_amt,2) *  ${ct_fx_rates_bs.fx_rate_bs} ;;
    required_fields: [ct_fx_rates_bs.fx_rate_bs]
  }

  measure: sum_revenue {
    label: "Revenue_USD"
    type: sum
    value_format_name: usd
    sql: round(${ar_amt},2) * ${ct_fx_rates.fx_rate} ;;
    filters: {
      field: ct_charges_glnumber.glnumber
      value: "4804"
    }
    required_fields: [ct_fx_rates.fx_rate]
  }

  measure: sum_chargeback {
    label: "Chargeback"
    type: sum
    value_format_name: usd
    sql: round(${ar_amt},2) * ${ct_fx_rates_bs.fx_rate_bs} ;;
    filters: {
      field: ct_charges_glnumber.glnumber
      value: "1211.3"
    }
    required_fields: [ct_fx_rates_bs.fx_rate_bs]
  }

  measure: sum_ap_recovery {
    label: "AP_Recovery"
    type: sum
    value_format_name: usd
    sql: round(${ar_amt},2) * ${ct_fx_rates_bs.fx_rate_bs} ;;
    filters: {
      field: ct_charges_glnumber.glnumber
      value: "2002"
    }
    required_fields: [ct_fx_rates_bs.fx_rate_bs]
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
    label: "FeeMetric"
    type: number
    sql: ${TABLE}.bsf_perticket ;;
  }

  measure: measure_bsf_perticket {
    label: "FeeMetric"
    type: number
    value_format_name: usd
    sql: ${TABLE}.bsf_perticket ;;
    required_fields: [bsf_perticket]
  }

  measure: sum_bsf_perticket {
    label: "FeeTotal"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.bsf_perticket ;;
  }

  dimension: fee_type {
    label: "FeeType"
    type: string
    sql: "Per Ticket" ;;
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

  measure: sum_qty {
    label: "Amount"
    type: sum
    sql: ${TABLE}.qty ;;
  }


  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

#   measure: measure_revenue {
#     label: "AR_Amt"
#     type: sum
#     value_format_name: usd
#     sql: round(${TABLE}.revenue,2) ;;
#   }
#
#   measure: sum_revenue {
#     label: "Revenue_USD"
#     type: sum
#     value_format_name: usd
#     sql: round(${revenue},2) * ${ct_fx_rates.fx_rate} ;;
#     filters: {
#       field: ct_charges_glnumber.glnumber
#       value: "4804"
#     }
#     required_fields: [ct_fx_rates.fx_rate]
#   }

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
