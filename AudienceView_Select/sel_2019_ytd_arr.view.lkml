view: sel_2019_ytd_arr {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.sel_2019_ytd_arr`
    ;;

  dimension: _2019_arr_usd {
    type: number
    value_format_name: usd
    sql: ${TABLE}._2019_arr_usd ;;
  }

  measure: 2019_arr_usd {
    label: "2019 ARR (USD)"
    type: number
    value_format_name: usd
    sql: ${TABLE}._2019_arr_usd ;;
    required_fields: [_2019_arr_usd]
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

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension_group: live {
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
    sql: ${TABLE}.live_date ;;
  }

  dimension: member_id {
    type: string
    sql: ${TABLE}.member_id ;;
  }

  dimension: revenuefile {
    type: number
    sql: ${TABLE}.revenuefile ;;
  }

  dimension: sum_of_total_usd {
    type: number
    value_format_name: usd
    sql: ${TABLE}.sum_of_total_usd ;;
  }

  dimension: variance_over_arr {
    type: number
    value_format_name: usd
    sql: ${TABLE}.variance_over_arr ;;
  }

  dimension: variance_yoy {
    type: number
    value_format_name: usd
    sql: ${TABLE}.variance_yoy ;;
  }

  measure: count {
    type: count
    drill_fields: [client_name]
  }
}
