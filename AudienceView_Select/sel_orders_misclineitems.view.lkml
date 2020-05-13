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

  dimension: coupon {
    type: string
    sql: ${TABLE}.coupon ;;
  }

  dimension: date {
    type: number
    sql: ${TABLE}.date ;;
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
    type: string
    sql: ${TABLE}.servicefee ;;
  }

  dimension: settled {
    type: number
    sql: ${TABLE}.settled ;;
  }

  dimension: total {
    type: string
    sql: ${TABLE}.total ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, orders.id, exchanges.exchangeid]
  }
}
