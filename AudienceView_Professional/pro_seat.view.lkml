view: pro_seat {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.seat`
    ;;
  drill_fields: [seat_id]

  dimension: seat_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.seat_id ;;
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

  dimension: is_seat {
    type: string
    sql: ${TABLE}.is_seat ;;
  }

  dimension: number {
    label: "Seat Label"
    type: string
    sql: ${TABLE}.number ;;
  }

  dimension: pos_x {
    type: number
    sql: ${TABLE}.pos_x ;;
  }

  dimension: pos_y {
    type: number
    sql: ${TABLE}.pos_y ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: row {
    label: "Row Label"
    type: string
    sql: ${TABLE}.row ;;
  }

  dimension: section_id {
    type: number
    sql: ${TABLE}.section_id ;;
  }

  measure: count {
    type: count
    drill_fields: [seat_id]
  }
}
