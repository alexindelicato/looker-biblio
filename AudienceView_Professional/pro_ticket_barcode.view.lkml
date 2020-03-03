view: pro_ticket_barcode {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.ticket_barcode` ;;
  drill_fields: [ticket_barcode_id]

  dimension: ticket_barcode_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ticket_barcode_id ;;
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

  dimension: barcode_string {
    type: string
    sql: ${TABLE}.barcode_string ;;
  }

  dimension_group: issue {
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
    sql: CAST(${TABLE}.issue_date AS TIMESTAMP) ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}.ticket_id ;;
  }

  measure: count {
    type: count
    drill_fields: [ticket_barcode_id]
  }
}
