view: sel_performances_tickettypes_prices {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.performances_tickettypes_prices`
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


  measure: count_price {
    label: "Count of Unqiue Pricing"
    type: count_distinct
    sql: ${TABLE}.price ;;
  }

  dimension: priceid {
    type: number
    primary_key: yes
    value_format_name: id
    sql: ${TABLE}.priceid ;;
  }

  measure: count_priceid {
    label: "Count of Price IDs"
    type: count_distinct
    value_format_name: id
    sql: ${TABLE}.priceid ;;
  }

  dimension: tickettypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tickettypeid ;;
  }

  measure: count_tickettypeid {
    label: "Count of Ticket Types"
    type: count_distinct
    value_format_name: id
    sql: ${TABLE}.tickettypeid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
