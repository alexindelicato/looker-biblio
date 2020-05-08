view: pos_usage {
  sql_table_name: `fivetran-ovation-tix-warehouse.audienceview.pos_usage`
    ;;

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension_group: pos {
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
    sql: CAST(${TABLE}.pos_date AS TIMESTAMP) ;;
  }

  dimension: pos_logins {
    type: number
    sql: ${TABLE}.pos_logins ;;
  }

  dimension: sf_account_id {
    type: string
    sql: ${TABLE}.sf_account_id ;;
  }

  dimension: sf_account_name {
    type: string
    sql: ${TABLE}.sf_account_name ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.UUID ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

measure: total_logins {
  type: sum
  sql: ${TABLE}.pos_logins ;;

}

  measure: count {
    type: count
    drill_fields: [sf_account_name, client_name]
  }
}
