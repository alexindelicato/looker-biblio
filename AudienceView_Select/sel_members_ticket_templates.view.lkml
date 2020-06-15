view: sel_members_ticket_templates {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.members_ticket_templates`
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

  dimension: isdefault {
    type: string
    sql: ${TABLE}.isdefault ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: templateid {
    type: string
    sql: ${TABLE}.templateid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
