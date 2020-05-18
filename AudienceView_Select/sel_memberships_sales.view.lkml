view: sel_memberships_sales {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.memberships_sales`
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

  dimension: agentid {
    type: string
    sql: ${TABLE}.agentid ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: conveniencefee {
    type: string
    sql: ${TABLE}.conveniencefee ;;
  }

  dimension: date {
    type: number
    sql: ${TABLE}.date ;;
  }

  dimension: declinebenefits {
    type: string
    sql: ${TABLE}.declinebenefits ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: membershipid {
    type: string
    sql: ${TABLE}.membershipid ;;
  }

  dimension: membershiplevelid {
    type: string
    sql: ${TABLE}.membershiplevelid ;;
  }

  dimension: membershipsaleid {
    type: string
    sql: ${TABLE}.membershipsaleid ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.orderid ;;
  }

  dimension: patronid {
    type: string
    sql: ${TABLE}.patronid ;;
  }

  dimension: servicefee {
    type: string
    sql: ${TABLE}.servicefee ;;
  }

  dimension: settled {
    type: number
    sql: ${TABLE}.settled ;;
  }

  dimension: settledaily {
    type: string
    sql: ${TABLE}.settledaily ;;
  }

  dimension: taxableamount {
    type: string
    sql: ${TABLE}.taxableamount ;;
  }

  dimension: testmode {
    type: string
    sql: ${TABLE}.testmode ;;
  }

  dimension: voidbenefits {
    type: string
    sql: ${TABLE}.voidbenefits ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
