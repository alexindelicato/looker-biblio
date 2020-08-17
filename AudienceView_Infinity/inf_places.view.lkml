view: inf_places {
  sql_table_name: `fivetran-ovation-tix-warehouse.infinity_public.places`
    ;;
  drill_fields: [place_id]

  dimension: place_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.place_id ;;
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

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: organization_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: street_address {
    type: string
    sql: ${TABLE}.street_address ;;
  }

  dimension: subdivision {
    type: string
    sql: ${TABLE}.subdivision ;;
  }

  measure: count {
    type: count
    drill_fields: [place_id, name, organizations.organization_id, places_to_sources.count, experiences.count]
  }
}
