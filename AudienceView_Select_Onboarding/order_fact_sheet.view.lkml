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
    label: "219 Donation Income (USD)"
    type: number
    value_format_name: usd
    sql: ${TABLE}.av_select_donations_2019_donation_income_usd_ ;;
  }

  dimension: av_select_donations_donation_income_last_3_years_ {
    label: "Donation Income (Last 3 Years)"
    type: number
    value_format_name: usd
    sql: ${TABLE}.av_select_donations_donation_income_last_3_years_ ;;
  }

  dimension: av_select_donations_of_patrons_with_recurring_donations {
    label: "# of Patrons with Recurring Donations"
    type: number
    sql: ${TABLE}.av_select_donations_of_patrons_with_recurring_donations ;;
  }

  dimension: av_select_donations_of_patrons_with_recurring_donations_last_3_years_ {
    label: "# of Patrons with Recurring Donations (last 3 years)"
    type: number
    sql: ${TABLE}.av_select_donations_of_patrons_with_recurring_donations_last_3_years_ ;;
  }

  dimension: av_select_orders_count_past_orders {
    label: "# of Past Orders"
    type: number
    sql: ${TABLE}.av_select_orders_count_past_orders ;;
  }

  dimension: av_select_orders_count_present_orders {
    label: "# of Orders with Future Performances"
    type: number
    sql: ${TABLE}.av_select_orders_count_present_orders ;;
  }

  dimension: av_select_performances_future_performance {
    label: "# of Future Performances"
    type: number
    sql: ${TABLE}.av_select_performances_future_performance ;;
  }

  dimension: av_select_performances_past_performance {
    label: "# of Past Performances"
    type: number
    sql: ${TABLE}.av_select_performances_past_performance ;;
  }

  dimension: av_select_scans_scan_count_in_2019 {
    label: "2019 Total Scan Count"
    type: number
    sql: ${TABLE}.av_select_scans_scan_count_in_2019 ;;
  }

  dimension: av_select_transactions_2019_number_of_tickets {
    label: "2019 Number of Tickets"
    type: number
    sql: ${TABLE}.av_select_transactions_2019_number_of_tickets ;;
  }

  dimension: av_select_transactions_number_of_tickets_for_a_future_performance {
    label: "Number of Tickets for Future Performances"
    type: number
    sql: ${TABLE}.av_select_transactions_number_of_tickets_for_a_future_performance ;;
  }

  dimension: av_select_transactions_number_of_tickets_for_a_past_performance {
    label: "Number of Tickets for Past Perfomances"
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
