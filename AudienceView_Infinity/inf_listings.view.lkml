view: inf_listings {
  sql_table_name: `fivetran-ovation-tix-warehouse.infinity_public.listings`
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

  dimension: consumer_site {
    type: string
    sql: ${TABLE}.consumer_site ;;
  }

  dimension: experience_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.experience_id ;;
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

  dimension: listing_url {
    type: string
    sql: ${TABLE}.listing_url ;;
  }

  dimension: organization_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [experiences.experience_id, experiences.name, organizations.organization_id]
  }
}
