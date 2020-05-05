view: ct_arr {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.ct_arr`
    ;;

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

  dimension: adjustment {
    type: number
    sql: ${TABLE}.adjustment ;;
  }

  dimension: client_id {
    label: "Client ID"
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: current_arr {
    label: "Rolling ARR (USD)"
    type: number
    value_format_name: usd
    sql: ${TABLE}.current_arr ;;
  }

  dimension: customer {
    label: "Client Name"
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: fx {
    type: number
    sql: ${TABLE}.fx ;;
  }

  dimension: net_arr {
    type: number
    sql: ${TABLE}.net_arr ;;
  }

  dimension: previous_percentage_change {
    type: number
    sql: ${TABLE}.previous_percentage_change ;;
  }

  dimension: prior_period_arr {
    type: number
    sql: ${TABLE}.prior_period_arr ;;
  }

#   dimension: revalued_arr {
#     type: number
#     sql: ${TABLE}.revalued_arr ;;
#   }

  measure: count {
    type: count
    drill_fields: []
  }
}
