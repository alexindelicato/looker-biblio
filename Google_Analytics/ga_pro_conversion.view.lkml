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

  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
