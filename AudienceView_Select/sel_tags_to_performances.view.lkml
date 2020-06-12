view: sel_tags_to_performances {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.tags_to_performances`
    ;;
  drill_fields: [tags_to_performancesid]

  dimension: tags_to_performancesid {
    primary_key: yes
    type: number
    sql: ${TABLE}.tags_to_performancesid ;;
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

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  dimension: performancestagid {
    type: number
    value_format_name: id
    sql: ${TABLE}.performancestagid ;;
  }

  measure: count {
    type: count
    drill_fields: [tags_to_performancesid]
  }
}
