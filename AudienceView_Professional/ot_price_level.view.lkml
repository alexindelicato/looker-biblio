view: ot_price_level {
  sql_table_name: trs_trs.price_level ;;


  dimension: price_level_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.price_level_id ;;
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

  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}.display_order ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: production_id {
    type: number
    sql: ${TABLE}.production_id ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [price_level_id, name, performance_stats_total.count, performance_stats_consumed.count]
  }
}
