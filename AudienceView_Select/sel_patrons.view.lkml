view: sel_patrons {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.patrons`
    ;;
  drill_fields: [patronid]

  dimension: patronid {
    primary_key: yes
    type: string
    sql: ${TABLE}.patronid ;;
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

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: patronnumid {
    type: number
    value_format_name: id
    sql: ${TABLE}.patronnumid ;;
  }

  measure: count_created_patrons {
    label: "Total # of Patrons (Past 3 Years)"
    type: count
    drill_fields: [patronid]

    filters: {
      field: created_year
      value: "3 years"
    }
  }

  measure: count {
    label: "Total # of Patrons"
    type: count
    drill_fields: [patronid]
  }
}
