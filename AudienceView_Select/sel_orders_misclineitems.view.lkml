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

  dimension: commissionableservicefee {
    type: number
    sql: ${TABLE}.commissionableservicefee ;;
  }

  measure: total_commissionableservicefee {
    label: "Misc Item Revenue Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2) ;;
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

  measure: 2019_total_tipjar {
    label: "2019 Total Tipjar Donation"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;

    filters: {
      field: donation
      value: "Y"
    }

    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2020_total_tipjar {
    label: "2020 Total Tipjar Donation"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;

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
