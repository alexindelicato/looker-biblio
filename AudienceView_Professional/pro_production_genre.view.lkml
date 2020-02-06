view: pro_production_genre {
  sql_table_name: trs_trs.production_genre ;;

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

  dimension: genre_id {
    type: number
    sql: ${TABLE}.genre_id ;;
  }

  dimension: production_id {
    type: number
    sql: ${TABLE}.production_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
