view: ot_seating_chart {
  sql_table_name: trs_trs.seating_chart ;;
  drill_fields: [seating_chart_id]

  dimension: seating_chart_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.seating_chart_id ;;
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

  dimension: deleted {
    type: string
    sql: ${TABLE}.deleted ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: grid {
    type: string
    sql: ${TABLE}.grid ;;
  }

  dimension: height {
    type: number
    sql: ${TABLE}.height ;;
  }

  dimension: hide_legend {
    type: string
    sql: ${TABLE}.hide_legend ;;
  }

  dimension: image_id {
    type: number
    sql: ${TABLE}.image_id ;;
  }

  dimension: in_progress {
    type: string
    sql: ${TABLE}.in_progress ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: reserved_seating {
    type: string
    sql: ${TABLE}.reserved_seating ;;
  }

  dimension: width {
    type: number
    sql: ${TABLE}.width ;;
  }

  measure: count {
    type: count
    drill_fields: [seating_chart_id, name, seating_chart_client.count, section.count]
  }
}
