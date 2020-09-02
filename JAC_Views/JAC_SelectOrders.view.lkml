# If necessary, uncomment the line below to include explore_source.

# include: "biblio.model.lkml"

view: JAC_SelectOrders {
  derived_table: {
    explore_source: sel_orders {
      column: id { field: sf_accounts.id }
      column: count_recurring_patronid { field: sel_donations.count_recurring_patronid }
      column: count_recurring_patronid_three_years { field: sel_donations.count_recurring_patronid_three_years }
      column: sum_donation_amount_2019 { field: sel_donations.2019_sum_donation_amount }
      column: sum_donation_amount_three_years { field: sel_donations.sum_donation_amount_three_years }
      column: count_past_orders {}
      column: count_present_orders {}
      column: total_quantity_2019 { field: sel_transactions.2019_total_quantity }
      column: total_future_ticket { field: sel_transactions.total_future_ticket }
      column: total_past_ticket { field: sel_transactions.total_past_ticket }
      column: count_future_performanceid { field: sel_performances.count_future_performanceid }
      column: count_past_performanceid { field: sel_performances.count_past_performanceid }
      column: count_ticket_scans_2019 { field: sel_ticket_scans.count_ticket_scans_2019 }
      filters: {
        field: sf_accounts.type
        value: "Client - AudienceView Select"
      }
    }
    sql_trigger_value: SELECT date_sub(CURRENT_DATE(), INTERVAL MOD(EXTRACT(DAYOFWEEK FROM CURRENT_DATE())+4,7) DAY) ;;
  }
  dimension: id {
    label: "SF Accounts Salesforce ID"
  }
  dimension: count_recurring_patronid {
    label: "AV Select Donations # of Patrons with Recurring Donations"
    type: number
  }
  dimension: count_recurring_patronid_three_years {
    label: "AV Select Donations # of Patrons with Recurring Donations (Last 3 years)"
    type: number
  }
  dimension: sum_donation_amount_2019 {
    label: "AV Select Donations 2019 Donation Income (USD)"
    value_format: "$#,##0.00"
    type: number
  }
  dimension: sum_donation_amount_three_years {
    label: "AV Select Donations Donation Income (Last 3 Years)"
    value_format: "$#,##0.00"
    type: number
  }
  dimension: count_past_orders {
    label: "AV Select Orders Count Past Orders"
    type: number
  }
  dimension: count_present_orders {
    label: "AV Select Orders Count Present Orders"
    type: number
  }
  dimension: total_quantity_2019 {
    label: "AV Select Transactions 2019 Number of Tickets"
    type: number
  }
  dimension: total_future_ticket {
    label: "AV Select Transactions Number of Tickets for a Future Performance"
    type: number
  }
  dimension: total_past_ticket {
    label: "AV Select Transactions Number of Tickets for a Past Performance"
    type: number
  }
  dimension: count_future_performanceid {
    label: "AV Select Performances Future Performance"
    type: number
  }
  dimension: count_past_performanceid {
    label: "AV Select Performances Past Performance"
    type: number
  }
  dimension: count_ticket_scans_2019 {
    label: "AV Select Scans Scan Count in 2019"
    type: number
  }
}
