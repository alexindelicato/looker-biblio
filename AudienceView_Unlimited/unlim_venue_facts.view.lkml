view: unlim_venue_facts {
  sql_table_name: audienceview.venue_facts ;;

  dimension: capacity {
    type: string
    sql: ${TABLE}.capacity ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: performance_name {
    type: string
    sql: ${TABLE}.performance_name ;;
  }

  dimension: performance_series_name {
    type: string
    sql: ${TABLE}.performance_series_name ;;
  }

  dimension: performance_short_description {
    type: string
    sql: ${TABLE}.performance_short_description ;;
  }

  dimension: performance_start_date {
    type: string
    sql: ${TABLE}.performance_start_date ;;
  }

  dimension: sf_account_id {
    type: string
    sql: ${TABLE}.sf_account_id ;;
  }

  dimension: sf_account_name {
    type: string
    sql: ${TABLE}.sf_account_name ;;
  }

  dimension: sold_count {
    type: string
    sql: ${TABLE}.sold_count ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.UUID ;;
  }

  dimension: venue_name {
    type: string
    sql: ${TABLE}.venue_name ;;
  }

  measure: count {
    type: count
    drill_fields: [sf_account_name, venue_name, performance_series_name, performance_name, client_name]
  }
}
