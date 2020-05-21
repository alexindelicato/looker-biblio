view: sel_performances {
  sql_table_name: mysql_service.performances ;;
  drill_fields: [performanceid]

  dimension: performanceid {
    primary_key: yes
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  measure: count_performanceid {
    type: count_distinct
    sql: ${TABLE}.performanceid ;;
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

  measure: max_performance_date {
    type: time
    sql: max(${sel_performances.starttime_raw}) ;;
  }

  dimension_group: current_time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      quarter_of_year,
      week_of_year,
      year
    ]
    sql: CURRENT_TIMESTAMP() ;;
  }

  dimension: creation {
    type: number
    sql: ${TABLE}.creation ;;
  }

  dimension: customdatemessage {
    type: string
    sql: ${TABLE}.customdatemessage ;;
  }

  dimension: deleted {
    type: string
    sql: ${TABLE}.deleted ;;
  }

  dimension: endtime {
    type: number
    sql: ${TABLE}.endtime ;;
  }

  dimension: eventid {
    type: string
    # hidden: yes
    sql: ${TABLE}.eventid ;;
  }

  dimension: internalnote {
    type: string
    sql: ${TABLE}.internalnote ;;
  }

  dimension: inventory {
    type: number
    sql: ${TABLE}.inventory ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: notified {
    type: number
    sql: ${TABLE}.notified ;;
  }

  dimension: pricingmode {
    type: string
    sql: ${TABLE}.pricingmode ;;
  }

  dimension: resadmpricesid {
    type: string
    sql: ${TABLE}.resadmpricesid ;;
  }

  dimension: settled {
    type: number
    sql: ${TABLE}.settled ;;
  }

  dimension_group: starttime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
#     sql: DATETIME(TIMESTAMP_MICROS(${TABLE}.starttime*1000000), 'US/Pacific') ;;
    sql: timestamp_seconds(${TABLE}.starttime) ;;
  }

  dimension: ticketlimitperpatron {
    type: number
    sql: ${TABLE}.ticketlimitperpatron ;;
  }

  measure: count {
    type: count
    drill_fields: [performanceid, events.eventid]
  }
}
