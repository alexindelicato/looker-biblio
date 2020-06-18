view: sel_patrons {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.patrons`
    ;;
  drill_fields: [patronid]

  dimension: patronid {
    primary_key: yes
    type: string
    sql: ${TABLE}.patronid ;;
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

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: patronnumid {
    type: number
    value_format_name: id
    sql: ${TABLE}.patronnumid ;;
  }

  measure: count {
    type: count
    drill_fields: [patronid]
  }
}
