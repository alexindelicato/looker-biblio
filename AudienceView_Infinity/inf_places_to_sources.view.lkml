view: inf_places_to_sources {
  sql_table_name: `fivetran-ovation-tix-warehouse.infinity_public.places_to_sources`
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

  dimension_group: last_update {
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
    sql: ${TABLE}.last_update ;;
  }

  dimension: organization_id {
    type: string
    hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: place_id {
    type: string
    hidden: yes
    sql: ${TABLE}.place_id ;;
  }

  dimension: place_id_in_source {
    type: string
    hidden: yes
    sql: ${TABLE}.place_id_in_source ;;
  }

  dimension: source_id {
    type: string
    hidden: yes
    sql: ${TABLE}.source_id ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [organizations.organization_id, sources.name, sources.source_id, places.name, places.place_id]
  }
}
