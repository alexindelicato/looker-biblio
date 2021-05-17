view: sel_performances_tickettypes_tieredprices {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.performances_tickettypes_tieredprices`
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

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: tickettypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tickettypeid ;;
  }

  dimension: tieredpriceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tieredpriceid ;;
  }

  dimension: tierid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tierid ;;
  }

  measure: count_tiers {
    label: "# of Tier Pricing"
    type: count_distinct
    sql: ${TABLE}.tierid ;;
    drill_fields: []
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
