view: sel_members_ticket_templates {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.members_ticket_templates`
    ;;

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

  dimension: isdefault {
    type: string
    hidden: yes
    sql: ${TABLE}.isdefault ;;
  }

  dimension: memberid {
    type: string
    hidden: yes
    sql: ${TABLE}.memberid ;;
  }

  dimension: templateid {
    type: string
    hidden: yes
    sql: ${TABLE}.templateid ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
