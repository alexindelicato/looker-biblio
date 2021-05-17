view: sel_tickettiers_quantityrules {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.tickettiers_quantityrules`
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

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: effectivethresholdqty {
    type: number
    sql: ${TABLE}.effectivethresholdqty ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: quantityruleid {
    type: number
    value_format_name: id
    sql: ${TABLE}.quantityruleid ;;
  }

  dimension: rulevisibility {
    type: string
    sql: ${TABLE}.rulevisibility ;;
  }

  dimension: tierid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tierid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
