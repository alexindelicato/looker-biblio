view: order_fact_sheet {
  sql_table_name: `fivetran-ovation-tix-warehouse.sel_fact_sheet.order_fact_sheet`
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

  dimension: av_select_donations_2019_donation_income_usd_ {
    type: number
    sql: ${TABLE}.av_select_donations_2019_donation_income_usd_ ;;
  }

  dimension: av_select_donations_donation_income_last_3_years_ {
    type: number
    sql: ${TABLE}.av_select_donations_donation_income_last_3_years_ ;;
  }

  dimension: av_select_donations_of_patrons_with_recurring_donations {
    type: number
    sql: ${TABLE}.av_select_donations_of_patrons_with_recurring_donations ;;
  }

  dimension: av_select_donations_of_patrons_with_recurring_donations_last_3_years_ {
    type: number
    sql: ${TABLE}.av_select_donations_of_patrons_with_recurring_donations_last_3_years_ ;;
  }

  dimension: av_select_orders_count_past_orders {
    type: number
    sql: ${TABLE}.av_select_orders_count_past_orders ;;
  }

  dimension: av_select_orders_count_present_orders {
    type: number
    sql: ${TABLE}.av_select_orders_count_present_orders ;;
  }

  dimension: av_select_performances_future_performance {
    type: number
    sql: ${TABLE}.av_select_performances_future_performance ;;
  }

  dimension: av_select_performances_past_performance {
    type: number
    sql: ${TABLE}.av_select_performances_past_performance ;;
  }

  dimension: av_select_scans_scan_count_in_2019 {
    type: number
    sql: ${TABLE}.av_select_scans_scan_count_in_2019 ;;
  }

  dimension: av_select_transactions_2019_number_of_tickets {
    type: number
    sql: ${TABLE}.av_select_transactions_2019_number_of_tickets ;;
  }

  dimension: av_select_transactions_number_of_tickets_for_a_future_performance {
    type: number
    sql: ${TABLE}.av_select_transactions_number_of_tickets_for_a_future_performance ;;
  }

  dimension: av_select_transactions_number_of_tickets_for_a_past_performance {
    type: number
    sql: ${TABLE}.av_select_transactions_number_of_tickets_for_a_past_performance ;;
  }

  dimension: sf_accounts_salesforce_id {
    type: string
    sql: ${TABLE}.sf_accounts_salesforce_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
