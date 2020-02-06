view: pro_genres {
  sql_table_name: trs_trs.genres ;;
  drill_fields: [genre_id]

  dimension: genre_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.genre_id ;;
  }

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

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [genre_id]
  }
}
