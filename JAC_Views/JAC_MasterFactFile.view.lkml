# If necessary, uncomment the line below to include explore_source.

# include: "JAC_model.model.lkml"

view: JAC_MasterFactFile {
  derived_table: {
    explore_source: JAC_MasterFactFile_1 {
      column: net_prorated_arr_2019 {}
      column: number_of_days_inactive {}
      column: max_last_login_date {}
      column: gateway {}
      column: count_patrongroupid {}
      column: count {}
      column: count_created_patrons {}
      column: name {}
      column: cohort_id {}
      column: cohorts {}
      column: billing_country {}
      column: tl_gateway_c {}
      column: preferred_language_c {}
      column: state {}
      column: id {}
      column: segment_new_c {}
      column: type {}
      column: vertical_new_c {}
      column: count_GA_venues_types { field: JAC_MasterFactFile_2.count_GA_venues_types }
      column: count_mixed_venues_types { field: JAC_MasterFactFile_2.count_mixed_venues_types }
      column: count_reserved_venues_types { field: JAC_MasterFactFile_2.count_reserved_venues_types }
      column: count_campaigns { field: JAC_MasterFactFile_3.count_campaigns }
      column: total_sent_count { field: JAC_MasterFactFile_3.total_sent_count }
    }
    sql_trigger_value: SELECT date_sub(CURRENT_DATE(), INTERVAL MOD(EXTRACT(DAYOFWEEK FROM CURRENT_DATE())+4,7) DAY) ;;
  }
  dimension: net_prorated_arr_2019 {
    label: "AV Select ARR Net Prorated Arr 2019"
    value_format: "$#,##0.00"
    type: number
  }
  dimension: number_of_days_inactive {
    label: "AV Select Login Days Inactive"
    type: number
  }
  dimension: max_last_login_date {
    label: "AV Select Login Last Login Date"
    type: date
  }
  dimension: gateway {
    label: "AV Select Merchant Accounts Gateway"
  }
  dimension: count_patrongroupid {
    label: "AV Select Patron Groups Join Number of Patron Groups"
    value_format: "0"
    type: number
  }
  dimension: count {
    label: "AV Select Patron Total # of Patrons"
    type: number
  }
  dimension: count_created_patrons {
    label: "AV Select Patron Total # of Patrons (Past 3 Years)"
    type: number
  }
  dimension: name {
    label: "Client Name"
  }
  dimension: cohort_id {
    label: "Cohort ID"
  }
  dimension: cohorts {
    label: "Cohorts"
  }
  dimension: billing_country {
    label: "Country"
  }
  dimension: tl_gateway_c {
    label: "Payment Processing"
  }
  dimension: preferred_language_c {
    label: "Preferred Language"
  }
  dimension: state {
    label: "Region/State"
  }
  dimension: id {
    label: "SF Accounts Salesforce ID"
  }
  dimension: segment_new_c {
    label: "Segment"
  }
  dimension: type {
    label: "Type"
  }
  dimension: vertical_new_c {
    label: "Vertical"
  }
  dimension: count_GA_venues_types {
    label: "Venues AV Select Venues # of GA Venues"
    type: number
  }
  dimension: count_mixed_venues_types {
    label: "Venues AV Select Venues # of Mixed Venues"
    type: number
  }
  dimension: count_reserved_venues_types {
    label: "Venues AV Select Venues # of Reserved Venues"
    type: number
  }
  dimension: count_campaigns {
    label: "Emails AV Select Email Campaigns # Of Email Campaigns Sent"
    type: number
  }
  dimension: total_sent_count {
    label: "Emails AV Select Email Stats Total Sent Count"
    type: number
  }
}
