view: sel_genbysec_inventory {
  sql_table_name: mysql_service.genbysec_inventory ;;
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

  dimension: held {
    type: number
    sql: ${TABLE}.held ;;
  }

  dimension: inventory {
    type: number
    sql: ${TABLE}.inventory ;;
  }

  dimension: moreinfo {
    type: string
    sql: ${TABLE}.moreinfo ;;
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

  measure: sum_sold {
    type: sum
    sql: ${TABLE}.sold ;;
  }

  dimension: venuemapid {
    type: string
    sql: ${TABLE}.venuemapid ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
