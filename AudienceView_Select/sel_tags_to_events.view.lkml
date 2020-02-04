view: sel_tags_to_events {
  sql_table_name: mysql_service.tags_to_events ;;
  drill_fields: [tags_to_eventsid]

  dimension: tags_to_eventsid {
    primary_key: yes
    type: number
    sql: ${TABLE}.tags_to_eventsid ;;
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

  dimension: eventid {
    type: string
    sql: ${TABLE}.eventid ;;
  }

  dimension: tagid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.tagid ;;
  }

  measure: count {
    type: count
    drill_fields: [tags_to_eventsid, tags.tagid, tags.name]
  }
}
