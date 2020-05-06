view: ct_monthly_report {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.ct_monthly_report`
    ;;

  dimension: _file {
    type: string
    sql: ${TABLE}._file ;;
  }

  dimension: uuid {
    type: string
    primary_key: yes
    sql: ${TABLE}.uuid ;;
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
    value_format_name: usd
  }

  dimension: ticket_revenue {
    type: number
    sql: ${TABLE}.ticket_revenue ;;
    value_format_name: usd
  }

  measure: sum_ticket_revenue {
    label: "Earned Income"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.ticket_revenue ;;
  }

  measure: 2020_sum_ticket_revenue {
    label: "2020 Earned Income Total (USD)"
    value_format_name: usd
    type: sum
    sql:  case when ${ct_transactions.currencycode} = "CAD" then ${TABLE}.ticket_revenue * 0.72
          when ${ct_transactions.currencycode} = "USD" then ${TABLE}.ticket_revenue * 1
          else 0 End;;


    filters: {
      field: trans_year_id
      value: "2020"
    }
    }

  measure: 2019_sum_ticket_revenue {
    label: "2019 Earned Income Total (USD)"
    value_format_name: usd
    type: sum
    sql:  case when ${ct_transactions.currencycode} = "CAD" then ${TABLE}.ticket_revenue * 0.72
          when ${ct_transactions.currencycode} = "USD" then ${TABLE}.ticket_revenue * 1
          else 0 End;;


      filters: {
        field: trans_year_id
        value: "2019"
      }
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
    label: "MOR"
    type: yesno
    sql: ${TABLE}.trans_type = "Direct" ;;
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
