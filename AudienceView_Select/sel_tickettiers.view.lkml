view: sel_tickettiers {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.tickettiers`
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

  dimension: blockpurchaserestriction {
    type: number
    sql: ${TABLE}.blockpurchaserestriction ;;
  }

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: displaypriority {
    type: number
    sql: ${TABLE}.displaypriority ;;
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

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  dimension: tierid {
    type: number
    value_format_name: id
    primary_key: yes
    sql: ${TABLE}.tierid ;;
  }

  dimension: tiervisibility {
    type: string
    sql: ${TABLE}.tiervisibility ;;
  }

  measure: count_tiers_with_rules {
    type: count_distinct
    sql: ${TABLE}.tierid ;;
    drill_fields: [name]
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
