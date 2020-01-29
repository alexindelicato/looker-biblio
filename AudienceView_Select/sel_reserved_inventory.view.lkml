view: sel_reserved_inventory {
  sql_table_name: mysql_service.reserved_inventory ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: held {
    type: number
    sql: ${TABLE}.held ;;
    hidden: yes
  }

  measure: res_held {
    type: number
    sql: ${TABLE}.held ;;
    hidden: yes
  }

  dimension: inventory {
    type: number
    sql: ${TABLE}.inventory ;;
    hidden: yes
  }

  measure: res_inventory {
    type: number
    sql: ${TABLE}.inventory ;;
    hidden: yes
  }

  measure: res_capacity {
    type: number
    sql: ${res_sold}+${res_inventory}+${res_held} ;;
    hidden: yes
  }

  dimension: notified {
    type: string
    sql: ${TABLE}.notified ;;
    hidden: yes
  }

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
    hidden: yes
  }

  dimension: sold {
    type: number
    sql: ${TABLE}.sold ;;
    hidden: yes
  }

  measure: res_sold {
    type: number
    sql: ${TABLE}.sold ;;
    hidden: yes
  }

  dimension: venuemap {
    type: string
    hidden: yes
    sql: ${TABLE}.venuemap ;;
  }

  dimension: venuemapid {
    type: string
    sql: ${TABLE}.venuemapid ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id]
    hidden: yes
  }
}
