view: unlimited_client_facts {
  sql_table_name: audienceview.unlimited_client_facts ;;

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: client_version {
    type: string
    sql: ${TABLE}.client_version ;;
  }

  dimension: sf_account_id {
    type: string
    sql: ${TABLE}.sf_account_id ;;
  }

  dimension: sf_account_name {
    type: string
    sql: ${TABLE}.sf_account_name ;;
  }

  measure: count {
    type: count
    drill_fields: [sf_account_name, client_name]
  }
}
