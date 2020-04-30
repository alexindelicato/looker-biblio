view: sel_finance_arr {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.finance_arr`
    ;;

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

  dimension: _previous {
    type: number
    sql: ${TABLE}._previous ;;
  }

  dimension: adjustment_source_currency {
    type: number
    sql: ${TABLE}.adjustment_source_currency ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: current_arr {
    type: number
    value_format_name: usd
    sql: ${TABLE}.current_arr ;;
  }

  dimension: last_month_arr {
    type: number
    value_format_name: usd
    sql: ${TABLE}.last_month_arr ;;
  }

  dimension: member_name {
    type: string
    sql: ${TABLE}.member_name ;;
  }

  dimension: revalued_arr {
    type: number
    value_format_name: usd
    sql: ${TABLE}.revalued_arr ;;
  }

  dimension: segment {
    type: string
    hidden: yes
    sql: ${TABLE}.segment ;;
  }

  dimension: vam_member_id {
    type: string
    hidden: yes
    sql: ${TABLE}.vam_member_id ;;
  }

  dimension: vertical {
    type: string
    hidden: yes
    sql: ${TABLE}.vertical ;;
  }

  measure: count {
    type: count
    drill_fields: [member_name]
  }
}