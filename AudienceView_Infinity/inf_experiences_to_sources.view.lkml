view: inf_experiences_to_sources {
  sql_table_name: `fivetran-ovation-tix-warehouse.infinity_public.experiences_to_sources`
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

  dimension: experience_id_in_source {
    type: string
    sql: ${TABLE}.experience_id_in_source ;;
  }

  dimension_group: last_update {
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
    sql: ${TABLE}.last_update ;;
  }

  dimension: organization_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: source_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.source_id ;;
  }

  measure: count {
    type: count
    drill_fields: [experiences.experience_id, experiences.name, organizations.organization_id, sources.name, sources.source_id]
  }
}
