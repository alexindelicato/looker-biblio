view: pro_production_genre {
  sql_table_name: trs_trs.production_genre ;;

  dimension: _fivetran_deleted {
    type: yesno
    hidden: yes
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.genre_id ;;
  }

  dimension: production_id {
    type: number
    hidden: yes
    sql: ${TABLE}.production_id ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
