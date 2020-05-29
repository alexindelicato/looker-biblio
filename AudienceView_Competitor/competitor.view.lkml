view: competitor {
  sql_table_name: `fivetran-ovation-tix-warehouse.competitor.competitor`
    ;;

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

  dimension: competitor_name {
    type: string
    sql: ${TABLE}.competitor_name ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: resources_to_win {
    type: string
    sql: ${TABLE}.resources_to_win ;;
  }

  dimension: verticals {
    type: string
    sql: ${TABLE}.verticals ;;
  }

  dimension: why_how_we_win_what_we_do_better_than_them_ {
    type: string
    sql: ${TABLE}.why_how_we_win_what_we_do_better_than_them_ ;;
  }

  dimension: why_they_win {
    type: string
    sql: ${TABLE}.why_they_win ;;
  }

  dimension: year_established {
    type: number
    sql: ${TABLE}.year_established ;;
  }

  measure: count {
    type: count
    drill_fields: [competitor_name]
  }
}
