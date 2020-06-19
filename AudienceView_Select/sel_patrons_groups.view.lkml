view: sel_patrons_groups {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.patrons_groups`
    ;;
  drill_fields: [patrons_groupsid]

  dimension: patrons_groupsid {
    primary_key: yes
    type: number
    sql: ${TABLE}.patrons_groupsid ;;
  }

  measure: count_patrons_groupsid {
    label: "Number of Patron Groups Created"
    type: count_distinct
    sql: ${TABLE}.patrons_groupsid ;;
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

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: patrongroupid {
    type: number
    value_format_name: id
    sql: ${TABLE}.patrongroupid ;;
  }

  dimension: patronid {
    type: string
    sql: ${TABLE}.patronid ;;
  }

  measure: count {
    type: count
    drill_fields: [patrons_groupsid]
  }
}
