view: inf_experiences_types {
  sql_table_name: `fivetran-ovation-tix-warehouse.infinity_public.experiences_types`
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

  dimension: experience_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.experience_id ;;
  }

  dimension: organization_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [experiences.experience_id, experiences.name, organizations.organization_id]
  }
}
