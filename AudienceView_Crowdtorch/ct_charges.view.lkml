view: ct_charges {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_charges`
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

  dimension: advance {
    type: number
    sql: ${TABLE}.advance ;;
  }

  dimension: ap_id {
    type: number
    sql: ${TABLE}.ap_id ;;
  }

  dimension: ap_invoicenum {
    type: string
    sql: ${TABLE}.ap_invoicenum ;;
  }

  dimension: ap_pmtid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ap_pmtid ;;
  }

  dimension: ar_id {
    type: number
    sql: ${TABLE}.ar_id ;;
  }

  dimension: ar_invoicenum {
    type: string
    sql: ${TABLE}.ar_invoicenum ;;
  }

  dimension: bankid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bankid ;;
  }

  dimension: chargeamt {
    label: "Orig_ChargeAmt"
    value_format_name: usd
    type: number
    sql: ${TABLE}.chargeamt ;;
  }

  measure: AP {
    label: "AP"
    value_format_name: usd
    type: number
    sql: round(${TABLE}.chargeamt * ${ct_fx_rates_bs.fx_rate_bs},2) ;;
  }

  measure: Rev_adj {
    type: number
    value_format_name: usd
    sql: case when ${ct_charges_glnumber.glnumber} = '4804' then round(${TABLE}.chargeamt * ${ct_fx_rates.fx_rate},2) END ;;
    required_fields: [ct_charges_glnumber.glnumber,ct_fx_rates.fx_rate]
  }

  measure: Exp_adj {
    type: number
    value_format_name: usd
    sql: case when ${ct_charges_glnumber.glnumber} = '5215' then round(${TABLE}.chargeamt * ${ct_fx_rates.fx_rate},2) END ;;
    required_fields: [ct_charges_glnumber.glnumber,ct_fx_rates.fx_rate]
  }

  measure: Gift_Cert {
    type: number
    value_format_name: usd
    sql: case when ${ct_charges_glnumber.glnumber} = '1211.6' then round(${TABLE}.chargeamt * ${ct_fx_rates_bs.fx_rate_bs},2) END ;;
    required_fields: [ct_charges_glnumber.glnumber,ct_fx_rates_bs.fx_rate_bs]
  }

  measure: Recoup {
    type: number
    value_format_name: usd
    sql: case when ${ct_charges_glnumber.glnumber} = '1211.7' then round(${TABLE}.chargeamt * ${ct_fx_rates_bs.fx_rate_bs},2) END ;;
    required_fields: [ct_charges_glnumber.glnumber,ct_fx_rates_bs.fx_rate_bs]
  }

  measure: AR {
    type: number
    value_format_name: usd
    sql: case when ${ct_charges_glnumber.glnumber} = '1211.1' then round(${TABLE}.chargeamt * ${ct_fx_rates_bs.fx_rate_bs},2) END ;;
    required_fields: [ct_charges_glnumber.glnumber,ct_fx_rates_bs.fx_rate_bs]
  }

  measure: Chargebacks {
    type: number
    value_format_name: usd
    sql: case when ${ct_charges_glnumber.glnumber} = '1211.3' then round(${TABLE}.chargeamt * ${ct_fx_rates_bs.fx_rate_bs},2) END ;;
    required_fields: [ct_charges_glnumber.glnumber,ct_fx_rates_bs.fx_rate_bs]
  }


  dimension_group: chargedate {
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
    sql: ${TABLE}.chargedate ;;
  }

  dimension: chargedesc {
    type: string
    sql: ${TABLE}.chargedesc ;;
  }

  dimension: chargeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.chargeid ;;
  }

  dimension: clientchargeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.clientchargeid ;;
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

  dimension: clientserviceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.clientserviceid ;;
  }

  dimension: clientvenueid {
    type: string
    sql: ${TABLE}.clientvenueid ;;
  }

  dimension_group: dateinserted {
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
    sql: CAST(${TABLE}.dateinserted AS TIMESTAMP) ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: glnumber {
    type: string
    sql: ${TABLE}.glnumber ;;
  }

  dimension: include_ap {
    type: number
    sql: ${TABLE}.include_ap ;;
  }

  dimension: include_ar {
    type: number
    sql: ${TABLE}.include_ar ;;
  }

  dimension: lateorderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.lateorderid ;;
  }

  dimension: module {
    type: string
    sql: ${TABLE}.module ;;
  }

  dimension: multiplecharges {
    type: number
    sql: ${TABLE}.multiplecharges ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.orderid ;;
  }

  dimension: refund {
    type: number
    sql: ${TABLE}.refund ;;
  }

  dimension: serviceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.serviceid ;;
  }

  dimension: servicelevel {
    type: string
    sql: ${TABLE}.servicelevel ;;
  }

  dimension: servicename {
    type: string
    sql: ${TABLE}.servicename ;;
  }

  dimension: serviceterm {
    type: string
    sql: ${TABLE}.serviceterm ;;
  }

  dimension: translogid {
    type: number
    value_format_name: id
    sql: ${TABLE}.translogid ;;
  }

  dimension: venuechargeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venuechargeid ;;
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
    drill_fields: [venuename, clientname, servicename]
  }
}
