view: sel_genbysec_inventory {
  sql_table_name: mysql_service.genbysec_inventory ;;
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

  }

  measure: mix_held {
    type: sum
    sql: ${TABLE}.held ;;

  }

  dimension: inventory {
    type: number
    sql: ${TABLE}.inventory ;;

  }

  measure: mix_inventory {
    type: sum
    sql: ${TABLE}.inventory ;;

  }

  measure: mix_capacity {
    type: number
    sql: ${sum_sold}+${mix_inventory}+${mix_held} ;;

  }

  dimension: moreinfo {
    type: string
    sql: ${TABLE}.moreinfo ;;
    hidden: yes
  }

  dimension: notforsale {
    type: number
    sql: ${TABLE}.notforsale ;;
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

  }

  measure: sum_sold {
    type: sum
    sql: ${TABLE}.sold ;;

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
