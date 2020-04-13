view: ot_section {
  sql_table_name: trs_trs.section ;;
  drill_fields: [section_id]

  dimension: section_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.section_id ;;
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

  dimension: curve {
    type: number
    sql: ${TABLE}.curve ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}.display_order ;;
  }

  dimension: entry_times_apply {
    type: number
    sql: ${TABLE}.entry_times_apply ;;
  }

  dimension: image_id {
    type: number
    sql: ${TABLE}.image_id ;;
  }

  dimension: image_map_coord {
    type: string
    sql: ${TABLE}.image_map_coord ;;
  }

  dimension: image_map_shape {
    type: string
    sql: ${TABLE}.image_map_shape ;;
  }

  dimension: layer {
    type: number
    sql: ${TABLE}.layer ;;
  }

  dimension: name {
    label: "Section Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: position_x {
    type: number
    sql: ${TABLE}.position_x ;;
  }

  dimension: position_y {
    type: number
    sql: ${TABLE}.position_y ;;
  }

  dimension: rank_end {
    type: number
    sql: ${TABLE}.rank_end ;;
  }

  dimension: rank_start {
    type: number
    sql: ${TABLE}.rank_start ;;
  }

  dimension: rotation {
    type: number
    sql: ${TABLE}.rotation ;;
  }

  dimension: row_end {
    type: number
    sql: ${TABLE}.row_end ;;
  }

  dimension: row_spacing {
    type: number
    sql: ${TABLE}.row_spacing ;;
  }

  dimension: row_start {
    type: number
    sql: ${TABLE}.row_start ;;
  }

  dimension: seat_align {
    type: string
    sql: ${TABLE}.seat_align ;;
  }

  dimension: seat_count {
    type: number
    sql: ${TABLE}.seat_count ;;
  }

  dimension: seat_end {
    type: number
    sql: ${TABLE}.seat_end ;;
  }

  dimension: seat_increment {
    type: number
    sql: ${TABLE}.seat_increment ;;
  }

  dimension: seat_start {
    type: number
    sql: ${TABLE}.seat_start ;;
  }

  dimension: seating_chart_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.seating_chart_id ;;
  }

  dimension: section_type {
    type: string
    sql: ${TABLE}.section_type ;;
  }

  dimension: short_code {
    type: string
    sql: ${TABLE}.short_code ;;
  }

  dimension: skew_x {
    type: number
    sql: ${TABLE}.skew_x ;;
  }

  dimension: skew_y {
    type: number
    sql: ${TABLE}.skew_y ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [section_id, name, seating_chart.seating_chart_id, seating_chart.name]
  }
}
