view: sel_thermalprinters {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.thermalprinters`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: border {
    type: number
    sql: ${TABLE}.border ;;
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

  dimension: jsondata {
    type: string
    sql: ${TABLE}.jsondata ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: pixelsperinch {
    type: number
    sql: ${TABLE}.pixelsperinch ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, thermalprinters_members.count]
  }
}
