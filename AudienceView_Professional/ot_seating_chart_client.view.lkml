view: ot_seating_chart_client {
  sql_table_name: trs_trs.seating_chart_client ;;

  dimension: _fivetran_deleted {
    type: yesno
    hidden: yes
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: seating_chart_id {
    type: number
    hidden: yes
    sql: ${TABLE}.seating_chart_id ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [seating_chart.seating_chart_id, seating_chart.name]
  }
}
