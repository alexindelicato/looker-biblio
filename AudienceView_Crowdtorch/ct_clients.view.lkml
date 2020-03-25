view: ct_clients {
  sql_table_name: fivetran-ovation-tix-warehouse.ct_clients.ct_clients ;;

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

  dimension: client_id {
    type: number
    sql: cast(${TABLE}.client_id as string) ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: venue_email {
    type: string
    sql: ${TABLE}.venue_email ;;
  }

  dimension: venue_id {
    type: number
    sql: ${TABLE}.venue_id ;;
  }

  dimension: venue_name {
    type: string
    sql: ${TABLE}.venue_name ;;
  }

  measure: count {
    type: count
    drill_fields: [venue_name, client_name]
  }
}
