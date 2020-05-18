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
    type: number
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;
  }

  measure: sum_membership_amount {
    label: "Total Membership Amount"
    value_format_name: usd
    type: sum_distinct
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;
  }

  dimension: conveniencefee {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2) ;;
  }

  measure: total_conveniencefee {
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2) ;;
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
    primary_key: yes
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

  dimension: settled {
    type: string
    sql: ${TABLE}.settled ;;
  }

  dimension: servicefee {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;
  }

  measure: total_servicefee {
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;
  }

  measure: total_membership_arr {
    type: number
    value_format_name: usd
    sql: ${total_conveniencefee}+${total_servicefee} ;;
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