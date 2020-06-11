view: sel_ticket_scans {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.ticket_scans`
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

  dimension: agentid {
    type: string
    sql: ${TABLE}.agentid ;;
  }

  dimension_group: date {
    type: time
    sql: timestamp_seconds(${TABLE}.date) ;;
  }

  dimension: inout {
    type: string
    sql: ${TABLE}.inout ;;
  }

  dimension: scannerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.scannerid ;;
  }

  dimension: scantype {
    type: string
    sql: ${TABLE}.scantype ;;
  }

  dimension: ticketid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ticketid ;;
  }

  dimension: ticketscanid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ticketscanid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_ticket_scans {
    type: count_distinct
    sql: ${TABLE}.ticketscanid ;;
    drill_fields: []
  }
}
