view: sel_thermalprinters_members {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.thermalprinters_members`
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

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: isdefault {
    type: string
    sql: ${TABLE}.isdefault ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension_group: modifieddate {
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
    sql: ${TABLE}.modifieddate ;;
  }

  dimension: thermalprinterid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.thermalprinterid ;;
  }

  measure: count {
    type: count
    drill_fields: [thermalprinters.name, thermalprinters.id]
  }
}
