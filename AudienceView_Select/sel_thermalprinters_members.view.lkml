view: sel_thermalprinters_members {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.thermalprinters_members`
    ;;

  dimension: _fivetran_deleted {
    type: yesno
    hidden: yes
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.created ;;
  }

  dimension: deleted {
    type: number
    hidden: yes
    sql: ${TABLE}.deleted ;;
  }

  dimension: isdefault {
    type: string
    hidden: yes
    sql: ${TABLE}.isdefault ;;
  }

  dimension: memberid {
    type: string
    hidden: yes
    sql: ${TABLE}.memberid ;;
  }

  dimension_group: modifieddate {
    type: time
    hidden: yes
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
     hidden: yes
    sql: ${TABLE}.thermalprinterid ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [thermalprinters.name, thermalprinters.id]
  }
}
