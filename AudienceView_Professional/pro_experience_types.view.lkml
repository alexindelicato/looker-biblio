view: pro_experience_types {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.experience_types`
    ;;
  drill_fields: [experience_type_id]

  dimension: experience_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.experience_type_id ;;
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

  dimension: experience_type {
    type: string
    sql: ${TABLE}.experience_type ;;
  }

  measure: count {
    type: count
    drill_fields: [experience_type_id, production_experience_type.count]
  }
}
