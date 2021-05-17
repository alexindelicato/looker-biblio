view: sel_patrongroups {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.patrongroups`
    ;;
  drill_fields: [patrongroupid]

  dimension: patrongroupid {
    primary_key: yes
    type: number
    sql: ${TABLE}.patrongroupid ;;
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

  dimension: creation {
    type: number
    sql: ${TABLE}.creation ;;
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

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: name_list {
    type: list
    list_field: name
  }

  dimension: showta {
    type: string
    sql: ${TABLE}.showta ;;
  }

  dimension: tagtype {
    type: number
    sql: ${TABLE}.tagtype ;;
  }

  measure: count {
    type: count
    drill_fields: [patrongroupid, name]
  }
}
