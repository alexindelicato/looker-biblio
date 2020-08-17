view: inf_sources {
  sql_table_name: `fivetran-ovation-tix-warehouse.infinity_public.sources`
    ;;
  drill_fields: [source_id]

  dimension: source_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.source_id ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [source_id, name, places_to_sources.count, organizations.count, experiences_to_sources.count]
  }
}
