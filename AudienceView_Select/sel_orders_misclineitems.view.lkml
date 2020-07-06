view: sel_orders_misclineitems {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.orders_misclineitems`
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


  measure: total_commissionableservicefee {
    label: "Misc Item Revenue Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2) ;;
  }

  dimension: commissionableservicefee {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2) ;;
  }

  measure: sum_commissionableservicefee_usd {
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
      field: date_year
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
      field: date_date
      value: "2019/06/01 to 2020/01/01"
    }
  }

  measure: 2019_cc_processing_service_fee {
    type: number
    value_format_name: usd
    sql: ${2019_total_arr_servicefee}-${2019_commissionableservicefee} ;;
  }

  measure: junetodec_cc_processing_service_fee {
    type: number
    value_format_name: usd
    sql: ${junetodec_total_arr_servicefee}-${junetodec_total_commissionableservicefee} ;;
  }


  dimension: coupon {
    type: string
    sql: ${TABLE}.coupon ;;
  }

  dimension_group: date {
    type: time
    sql: timestamp_seconds(${TABLE}.date) ;;
  }

  dimension: donation {
    type: string
    sql: ${TABLE}.donation ;;
  }

  dimension: exchangeid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.exchangeid ;;
  }

  dimension: maxamount {
    type: string
    sql: ${TABLE}.maxamount ;;
  }

  dimension: misclineitemid {
    type: number
    value_format_name: id
    sql: ${TABLE}.misclineitemid ;;
  }

  dimension: misclineitemscheduleid {
    type: string
    sql: ${TABLE}.misclineitemscheduleid ;;
  }

  dimension: name {
    label: "MLI Item"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.orderid ;;
  }

  dimension: packageid {
    type: string
    sql: ${TABLE}.packageid ;;
  }

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  dimension: perticket {
    type: string
    sql: ${TABLE}.perticket ;;
  }

  dimension: refunded {
    type: string
    sql: ${TABLE}.refunded ;;
  }

  dimension: salestax {
    type: string
    sql: ${TABLE}.salestax ;;
  }

  dimension: servicefee {
    label: "Service Fee"
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;
  }

  measure: total_servicefee {
    label: "Total Misc Item Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;
  }

  measure: total_servicefee_usd {
    label: "Total  Misc Item Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:    case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end  ;;
  }

  measure: total_arr_servicefee {
    label: "Rolling  Misc Item Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:    case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
    when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
    else 0 end  ;;
    filters: {
      field: date_date
      value: "12 months ago for 12 months"
    }
  }

  measure: 2019_total_arr_servicefee {
    label: "2019 Rolling  Misc Item Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:    case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end  ;;
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2018_total_arr_servicefee {
    label: "2018 Rolling  Misc Item Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:    case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end  ;;
    filters: {
      field: date_year
      value: "2018"
    }
  }


  measure: total_tipjar_servicefee {
    label: "Total Tipjar Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;

    filters: {
      field: donation
      value: "Y"
    }
  }

  measure: total_tipjar_servicefee_usd {
    label: "Total Tipjar Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end  ;;

    filters: {
      field: donation
      value: "Y"
    }
  }

  measure: 2019_total_tipjar_servicefee {
    label: "2019 Total Tipjar Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;

    filters: {
      field: donation
      value: "Y"
    }
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2018_total_tipjar_servicefee {
    label: "2018 Total Tipjar Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;

    filters: {
      field: donation
      value: "Y"
    }
    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: 2020_total_servicefee {
    label: "2020 Total MLI Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;

    filters: {
      field: donation
      value: "N"
    }
    filters: {
      field: date_year
      value: "2020"
    }
  }

  measure: 2019_total_servicefee {
    label: "2019 Total MLI Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end  ;;

    filters: {
      field: donation
      value: "N"
    }
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2018_total_servicefee {
    label: "2018 Total MLI Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end  ;;

      filters: {
        field: donation
        value: "N"
      }
      filters: {
        field: date_year
        value: "2018"
      }
    }

  measure: 2020_total_tipjar_servicefee {
    label: "2020 Total Tipjar Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end  ;;

    filters: {
      field: donation
      value: "Y"
    }
    filters: {
      field: date_year
      value: "2020"
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
      field: date_date
      value: "2019/06/01 to 2020/01/01"
    }
  }


  dimension: settled {
    type: number
    sql: ${TABLE}.settled ;;
  }

  dimension: total {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;
  }

  measure: sum_total {
    label: "Total Misc Items Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;
    drill_fields: [sel_members.organizationname,orderid,date_date,total]
  }

  measure: total_tipjar {
    label: "Total Tipjar Donation"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;

    filters: {
      field: donation
      value: "Y"
    }
  }

  measure: total_mlm {
    label: "Total MLM (excluding tipjar)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)*1
          else 0 end ;;

    filters: {
      field: donation
      value: "N"
    }
  }

  measure: 2019_total_mlm {
    label: "2019 Total MLI (USD excludes tipjar)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)*1
          else 0 end  ;;

    filters: {
      field: donation
      value: "N"
    }
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2018_total_mlm {
    label: "2018 Total MLI (USD excludes tipjar)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)*1
          else 0 end  ;;

      filters: {
        field: donation
        value: "N"
      }
      filters: {
        field: date_year
        value: "2018"
      }
    }

  measure: 2020_total_mli {
    label: "2020 Total MLI (USD excludes tipjar)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)*1
          else 0 end ;;

    filters: {
      field: donation
      value: "N"
    }
    filters: {
      field: date_year
      value: "2020"
    }
  }


  measure: count_2019_mli {
    label: "2019 Number of MLI (excludes tipjar)"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, name, orders.id, exchanges.exchangeid]
    filters: {
      field: donation
      value: "N"
    }

    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: count_2018_mli {
    label: "2018 Number of MLI (excludes tipjar)"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, name, orders.id, exchanges.exchangeid]
    filters: {
      field: donation
      value: "N"
    }

    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: count_mli {
    label: "Number of MLI (excludes tipjar)"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, name, orders.id, exchanges.exchangeid]
    filters: {
      field: donation
      value: "N"
    }
    }

  measure: count_2020_mli {
    label: "2020 Number of MLI (excludes tipjar)"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, name, orders.id, exchanges.exchangeid]
    filters: {
      field: donation
      value: "N"
    }

    filters: {
      field: date_year
      value: "2020"
    }
  }


  measure: 2019_total_tipjar {
    label: "2019 Total Tipjar Donation"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
         else round(safe_cast(${TABLE}.total as FLOAT64), 2) *1 END;;

    filters: {
      field: donation
      value: "Y"
    }

    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2018_total_tipjar {
    label: "2018 Total Tipjar Donation"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
      else round(safe_cast(${TABLE}.total as FLOAT64), 2) *1 END;;

    filters: {
      field: donation
      value: "Y"
    }

    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: 2020_total_tipjar {
    label: "2020 Total Tipjar Donation"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
         else round(safe_cast(${TABLE}.total as FLOAT64), 2) *1 END;;

    filters: {
      field: donation
      value: "Y"
    }

    filters: {
      field: date_year
      value: "2020"
    }
  }

  measure: count_tipjar {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, name, orders.id, exchanges.exchangeid]
    filters: {
      field: donation
      value: "Y"
    }
    }

 measure: count_2019_tipjar {
    type: count_distinct
    sql: ${id} ;;
        drill_fields: [id, name, orders.id, exchanges.exchangeid]
  filters: {
    field: donation
    value: "Y"
  }

  filters: {
    field: date_year
    value: "2019"
  }
}

  measure: count_2018_tipjar {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, name, orders.id, exchanges.exchangeid]
    filters: {
      field: donation
      value: "Y"
    }

    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: count_2020_tipjar {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, name, orders.id, exchanges.exchangeid]
    filters: {
      field: donation
      value: "Y"
    }

    filters: {
      field: date_year
      value: "2020"
    }
  }

  measure: count {
    type: count
    drill_fields: [id, name, orders.id, exchanges.exchangeid]
  }
}
