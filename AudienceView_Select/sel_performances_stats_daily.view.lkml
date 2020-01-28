view: sel_performances_stats_daily {
  sql_table_name: mysql_service.performances_stats_daily ;;

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

  dimension: channel {
    type: number
    sql: ${TABLE}.channel ;;
  }

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: eventhashid {
    type: number
    value_format_name: id
    sql: ${TABLE}.eventhashid ;;
  }

  dimension: eventid {
    type: string
    sql: ${TABLE}.eventid ;;
  }

  dimension: last_oj_id {
    type: number
    sql: ${TABLE}.last_oj_id ;;
  }

  dimension: membernumid {
    type: number
    value_format_name: id
    sql: ${TABLE}.membernumid ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: performancehashid {
    type: number
    value_format_name: id
    sql: ${TABLE}.performancehashid ;;
  }

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  dimension: saledate {
    type: number
    sql: ${TABLE}.saledate ;;
  }

  dimension: ticketsgross {
    type: number
    sql: ${TABLE}.ticketsgross ;;
  }

  dimension: ticketssold {
    type: number
    sql: ${TABLE}.ticketssold ;;
  }

  dimension: tipjardonations {
    type: number
    sql: ${TABLE}.tipjardonations ;;
  }

  dimension: totaldollars {
    type: number
    sql: ${TABLE}.totaldollars ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
