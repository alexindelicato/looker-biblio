view: sel_venue_map_seat_views {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.venue_map_seat_views`
    ;;

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

  dimension: col {
    type: number
    sql: ${TABLE}.col ;;
  }

  dimension: fileid {
    type: number
    value_format_name: id
    primary_key: yes
    sql: ${TABLE}.fileid ;;
  }

  dimension: row {
    type: number
    sql: ${TABLE}.row ;;
  }

  dimension: seatviewid {
    type: number
    value_format_name: id
    sql: ${TABLE}.seatviewid ;;
  }

  measure: count_seatviewid {
    label: "Number of Seat Views"
    type: count_distinct
    value_format_name: id
    sql: ${TABLE}.seatviewid ;;
  }

  dimension: venuemapid {
    type: string
    sql: ${TABLE}.venuemapid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
