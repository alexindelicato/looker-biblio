view: sel_tags_to_events {
  sql_table_name: SelectAWS_service.tags_to_events ;;
  drill_fields: [tags_to_eventsid]

  dimension: tags_to_eventsid {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.tags_to_eventsid ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: eventid {
    hidden: yes
    type: string
    sql: ${TABLE}.eventid ;;
  }

  dimension: tagid {
    hidden: yes
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.tagid ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [tags_to_eventsid, tags.tagid, tags.name]
  }
}
