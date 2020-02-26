view: ga_pro_conversion {
  sql_table_name: ga_pro_conversion.ga_pro_conversion ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
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

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: goal_conversion_rate_all {
    type: number
    sql: ${TABLE}.goal_conversion_rate_all ;;
  }

  dimension: transactions_per_session {
    type: number
    sql: ${TABLE}.transactions_per_session ;;
  }

  measure: avg_transactions_per_session {
    type: average
    label: "Average Ecommerce Transation Rate"
    value_format: "0.00\%"
    sql: ${TABLE}.transactions_per_session ;;
  }

  measure: avg_goal_conversion_rate_all {
    type: average
    label: "Average Conversion Rate"
    value_format: "0.00\%"
    sql: ${TABLE}.goal_conversion_rate_all ;;
  }

  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
