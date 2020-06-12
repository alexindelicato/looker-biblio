view: sel_performances_tags {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.performances_tags`
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

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: performancestagid {
    type: number
    primary_key: yes
    value_format_name: id
    sql: ${TABLE}.performancestagid ;;
  }

  measure: count_performancetag {
    type: count_distinct
    sql: ${TABLE}.performancestagid ;;
    drill_fields: [name]
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
