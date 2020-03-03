view: pro_ticket {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.ticket` ;;
  drill_fields: [ticket_id]

  dimension: ticket_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ticket_id ;;
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

  dimension: create_user_id {
    type: number
    sql: ${TABLE}.create_user_id ;;
  }

  dimension_group: last_timestamp {
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
    sql: CAST(${TABLE}.last_timestamp AS TIMESTAMP) ;;
  }

  dimension: patron_id {
    type: number
    sql: ${TABLE}.patron_id ;;
  }

  dimension: performance_id {
    type: number
    sql: ${TABLE}.performance_id ;;
  }

  dimension: promotion_id {
    type: number
    sql: ${TABLE}.promotion_id ;;
  }

  dimension: state {
    type: number
    sql: ${TABLE}.state ;;
  }

  dimension: status_initial {
    type: string
    sql: ${TABLE}.status_initial ;;
  }

  dimension: status_initial_before_cart {
    type: string
    sql: ${TABLE}.status_initial_before_cart ;;
  }

  dimension: ticket_seat_id {
    type: number
    sql: ${TABLE}.ticket_seat_id ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [ticket_id]
  }
}
