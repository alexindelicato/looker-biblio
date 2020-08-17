view: inf_experiences {
  sql_table_name: `fivetran-ovation-tix-warehouse.infinity_public.experiences`
    ;;
  drill_fields: [experience_id]

  dimension: experience_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.experience_id ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: maximum_price {
    type: number
    value_format_name: usd
    sql: ${TABLE}.maximum_price ;;
  }

  dimension: minimum_price {
    type: number
    value_format_name: usd
    sql: ${TABLE}.minimum_price ;;
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

  dimension: place_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.place_id ;;
  }

  dimension: place_organization_id {
    type: string
    sql: ${TABLE}.place_organization_id ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: thumbnail {
    type: string
    sql: ${TABLE}.thumbnail ;;
  }

  dimension: ticketing_url {
    type: string
    sql: ${TABLE}.ticketing_url ;;
  }

  dimension: zone_id {
    type: string
    sql: ${TABLE}.zone_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      experience_id,
      name,
      organizations.organization_id,
      places.name,
      places.place_id,
      experiences_to_sources.count,
      listings.count,
      experiences_types.count
    ]
  }
}
