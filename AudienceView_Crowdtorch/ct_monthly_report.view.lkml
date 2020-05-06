view: ct_monthly_report {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.ct_monthly_report`
    ;;

  dimension: _file {
    type: string
    sql: ${TABLE}._file ;;
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

  dimension: _line {
    type: number
    sql: ${TABLE}._line ;;
  }

  dimension: cc_fees {
    type: number
    sql: ${TABLE}.cc_fees ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: ticket_fees {
    type: number
    sql: ${TABLE}.ticket_fees ;;
  }

  dimension: ticket_revenue {
    type: number
    sql: ${TABLE}.ticket_revenue ;;
  }

  dimension: tickets {
    type: number
    sql: ${TABLE}.tickets ;;
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.total_revenue ;;
  }

  dimension: trans_period_id {
    type: number
    sql: ${TABLE}.trans_period_id ;;
  }

  dimension: trans_type {
    type: string
    sql: ${TABLE}.trans_type ;;
  }

  dimension: trans_year_id {
    type: number
    sql: ${TABLE}.trans_year_id ;;
  }

  dimension: vertical {
    type: string
    sql: ${TABLE}.vertical ;;
  }

  measure: count {
    type: count
    drill_fields: [client_name]
  }
}
