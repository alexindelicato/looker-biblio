view: sel_etickettemplates {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.etickettemplates`
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

  dimension_group: created {
    type: time
    sql: timestamp_seconds(${TABLE}.created) ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension_group: modified {
    type: time
    sql: timestamp_seconds(${TABLE}.modified) ;;
  }

  dimension: template1 {
    type: string
    sql: ${TABLE}.template1 ;;
  }

  dimension: template2 {
    type: string
    sql: ${TABLE}.template2 ;;
  }

  dimension: templatedescription {
    type: string
    sql: ${TABLE}.templatedescription ;;
  }

  dimension: templateid {
    type: string
    sql: ${TABLE}.templateid ;;
  }

  dimension: templatename {
    type: string
    sql: ${TABLE}.templatename ;;
  }

  measure: count {
    type: count
    drill_fields: [templatename]
  }

  measure: count_ticket_template {
    type: count_distinct
    sql: ${TABLE}.templateid ;;
    drill_fields: [templatename]
  }
}
