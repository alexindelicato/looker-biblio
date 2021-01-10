view: pro_production_experience_type {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.production_experience_type`
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

  dimension: experience_type_id {
    type: number
    hidden: yes
    # hidden: yes
    sql: ${TABLE}.experience_type_id ;;
  }

  dimension: production_id {
    hidden: yes
    type: number
    sql: ${TABLE}.production_id ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [experience_types.experience_type_id]
  }
}
