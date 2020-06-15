view: sel_ticket_templates {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.ticket_templates`
    ;;
  drill_fields: [ticket_templatesid]

  dimension: ticket_templatesid {
    primary_key: yes
    type: number
    sql: ${TABLE}.ticket_templatesid ;;
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

  dimension: creation {
    type: number
    sql: ${TABLE}.creation ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: templateid {
    type: string
    sql: ${TABLE}.templateid ;;
  }

  measure: count {
    type: count
    drill_fields: [ticket_templatesid, name]
  }
}
