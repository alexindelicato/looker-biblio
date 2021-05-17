view: sel_tickettypes {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.tickettypes`
    ;;
  drill_fields: [tickettypeid]

  dimension: tickettypeid {
    primary_key: yes
    type: number
    sql: ${TABLE}.tickettypeid ;;
  }

  measure: count_tickettypeid {
    label: "Number of Ticket Types Created"
    type: count_distinct
    sql: ${TABLE}.tickettypeid ;;
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

  dimension: allowagentsale {
    type: string
    label: "Allow Agent Sale"
    sql: ${TABLE}.allowagentsale ;;
  }

  dimension: allowwebsale {
    type: string
    label: "Allow Web Sale"
    sql: ${TABLE}.allowwebsale ;;
  }

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: displaypriority {
    type: number
    sql: ${TABLE}.displaypriority ;;
  }

  dimension: eventid {
    type: string
    sql: ${TABLE}.eventid ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count_name {
    label: "Number of Unique Price Types"
    type: count_distinct
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [tickettypeid, name]
  }
}
