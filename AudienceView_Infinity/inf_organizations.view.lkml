view: inf_organizations {
  sql_table_name: `fivetran-ovation-tix-warehouse.infinity_public.organizations`
    ;;
  drill_fields: [organization_id]

  dimension: organization_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.organization_id ;;
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

  dimension: remote_tenant_id {
    type: string
    sql: ${TABLE}.remote_tenant_id ;;
  }

  dimension: source_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.source_id ;;
  }

  measure: count {
    type: count
    drill_fields: [remote_tenant_id,sf_accounts.name,inf_exaperiences.name,inf_sources.name]
  }

  measure: count_organization {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    drill_fields: [remote_tenant_id,sf_accounts.name,inf_experiences.name,inf_sources.name]
  }

  measure: count_enhanced_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    drill_fields: [remote_tenant_id,sf_accounts.name,inf_experiences.name,inf_sources.name]
    filters: {
      field: inf_experiences.thumbnail
      value: "-NULL"
    }
    filters: {
      field: inf_experiences.status
      value: "PUBLISHED"
    }
  }

  dimension: client_count {
    type: string
    sql: "Total" ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      organization_id,
      sources.name,
      sources.source_id,
      places.count,
      places_to_sources.count,
      experiences.count,
      experiences_to_sources.count,
      listings.count,
      experiences_types.count
    ]
  }
}
