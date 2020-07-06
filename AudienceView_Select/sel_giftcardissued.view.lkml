view: sel_giftcardissued {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.giftcardissued`
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

  dimension: amount {
    type: number
    sql: round(safe_cast(${TABLE}.amount as FLOAT64),2);;
  }

  measure: sum_amount {
    label: "Gift Card Amount (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*0.72
    when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*1
          else 0 end ;;
  }

  measure: 2019_sum_amount {
    label: "2019 Gift Card Amount (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*1
                else 0 end ;;
    filters: {
      field: issuedon_year
      value: "2019"
    }
  }

  measure: 2018_sum_amount {
    label: "2018 Gift Card Amount (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*1
                else 0 end ;;
    filters: {
      field: issuedon_year
      value: "2018"
    }
  }

  measure: 2020_sum_amount {
    label: "2020 Gift Card Amount (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*1
                else 0 end ;;
    filters: {
      field: issuedon_year
      value: "2020"
    }
  }

  dimension: commissionableservicefee {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2) ;;
  }

  measure: sum_commissionableservicefee {
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*0.7673
      when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*1 END ;;
  }

  measure: 2019_commissionableservicefee {
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*0.7673
      when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*1 END ;;
    filters: {
      field: issuedon_year
      value: "2019"
    }
  }

  measure: junetodec_total_commissionableservicefee {
    label: "June 2019 to Dec 2019 Revenue Service Fee (VMA)"
    type: sum_distinct
    value_format_name: usd
    sql:case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*0.7673
      when  ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*1 END ;;
    filters: {
      field: issuedon_date
      value: "2019/06/01 to 2020/01/01"
    }
  }

  measure: 2019_cc_processing_service_fee {
    type: number
    value_format_name: usd
    sql: ${2019_total_servicefee_usd}-${2019_commissionableservicefee} ;;
  }

  measure: junetodec_cc_processing_service_fee {
    type: number
    value_format_name: usd
    sql: ${junetodec_total_arr_servicefee}-${junetodec_total_commissionableservicefee} ;;
  }

  dimension: expireson {
    type: number
    sql: ${TABLE}.expireson ;;
  }

  dimension: giftcardconfigurationid {
    type: number
    value_format_name: id
    sql: ${TABLE}.giftcardconfigurationid ;;
  }

  dimension_group: issuedon {
    type: time
    sql: timestamp_seconds(${TABLE}.issuedon) ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.orderid ;;
  }

  dimension: servicefee {
    type: number
    sql: ${TABLE}.servicefee ;;
  }

  measure: total_servicefee {
    type: sum_distinct
    sql: ${TABLE}.servicefee ;;
  }

  measure: total_servicefee_usd {
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
  }

  measure: 2019_total_servicefee_usd {
    label: "2019 Total Gift Card Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: issuedon_year
      value: "2019"
    }
  }

  measure: 2018_total_servicefee_usd {
    label: "2018 Total Gift Card Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: issuedon_year
      value: "2018"
    }
  }


  measure: 2020_total_servicefee_usd {
    label: "2020 Total Gift Card Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: issuedon_year
      value: "2020"
    }
  }


  measure: rolling_arr_servicefee_usd {
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: issuedon_date
      value: "12 months ago for 12 months"
    }
  }

  measure: junetodec_total_arr_servicefee {
    label: "June 2019 to Dec 2019 ARR Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: issuedon_date
      value: "2019/06/01 to 2020/01/01"
    }
  }


  dimension: settled {
    type: number
    sql: ${TABLE}.settled ;;
  }

  dimension: testmode {
    type: string
    sql: ${TABLE}.testmode ;;
  }

  dimension: uid {
    type: string
    sql: ${TABLE}.uid ;;
  }

  measure: count_gift_cards {
    label: "Number of Gift Cards"
    type: count_distinct
    sql: ${uid} ;;
    }

  measure: 2020_count {
    label: "2020 Number of Gift Cards"
    type: count_distinct
    sql: ${uid} ;;
  filters: {
    field: issuedon_year
    value: "2020"
  }
  }

  measure: 2019_count {
    label: "2019 Number of Gift Cards"
    type: count_distinct
    sql: ${uid} ;;
    filters: {
      field: issuedon_year
      value: "2019"
    }
  }

  measure: 2018_count {
    label: "2018 Number of Gift Cards"
    type: count_distinct
    sql: ${uid} ;;
    filters: {
      field: issuedon_year
      value: "2018"
    }
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
