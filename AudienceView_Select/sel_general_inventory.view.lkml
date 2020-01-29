view: sel_general_inventory {
  sql_table_name: mysql_service.general_inventory ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: initial {
    type: number
    sql: ${TABLE}.initial ;;
  }

  dimension: inventory {
    type: number
    sql: ${TABLE}.inventory ;;
  }

  dimension: notforsale {
    type: number
    sql: ${TABLE}.notforsale ;;
  }

  dimension: notified {
    type: string
    sql: ${TABLE}.notified ;;
  }

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  dimension: sold {
    type: number
    sql: ${TABLE}.sold ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
