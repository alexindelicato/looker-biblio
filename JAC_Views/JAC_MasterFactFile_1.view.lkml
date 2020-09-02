# If necessary, uncomment the line below to include explore_source.



include: "/models/biblio.model.lkml"

view: JAC_MasterFactFile_1 {
  derived_table: {
    explore_source: sel_members {
      column: id { field: sf_accounts.id }
      column: name { field: sf_accounts.name }
      column: type { field: sf_accounts.type }
      column: vertical_new_c { field: sf_accounts.vertical_new_c }
      column: segment_new_c { field: sf_accounts.segment_new_c }
      column: cohorts { field: sf_accounts.cohorts }
      column: cohort_id { field: sf_accounts.cohort_id }
      column: preferred_language_c { field: sf_accounts.preferred_language_c }
      column: state { field: sf_accounts.state }
      column: billing_country { field: sf_accounts.billing_country }
      column: gateway { field: sel_members_merchantaccounts.gateway }
      column: number_of_days_inactive { field: sel_max_login.number_of_days_inactive }
      column: max_last_login_date { field: sel_max_login.max_last_login_date }
      column: net_prorated_arr_2019 { field: sel_arr.net_prorated_arr_2019 }
      column: count { field: sel_patrons.count }
      column: count_created_patrons { field: sel_patrons.count_created_patrons }
      column: tl_gateway_c { field: sf_accounts.tl_gateway_c }
      column: Default_Migration_Path { field: sf_accounts.Default_Migration_Path__c }
      column: count_patrongroupid { field: sel_patrons_groups.count_patrongroupid }
      filters: {
        field: sf_accounts.type
        value: "Client - AudienceView Select"
      }
    }
  }
  dimension: id {
    label: "SF Accounts Salesforce ID"
  }
  dimension: name {
    label: "SF Accounts Client Name"
  }
  dimension: type {
    label: "SF Accounts Type"
  }
  dimension: vertical_new_c {
    label: "SF Accounts Vertical"
  }
  dimension: segment_new_c {
    label: "SF Accounts Segment"
  }
  dimension: cohorts {
    label: "SF Accounts Cohorts"
  }
  dimension: cohort_id {
    label: "SF Accounts Cohort ID"
  }
  dimension: preferred_language_c {
    label: "SF Accounts Preferred Language"
  }
  dimension: state {
    label: "SF Accounts Region/State"
  }
  dimension: billing_country {
    label: "SF Accounts Country"
  }
  dimension: gateway {
    label: "AV Select Merchant Accounts Gateway"
  }
  dimension: number_of_days_inactive {
    label: "AV Select Login Days Inactive"
    type: number
  }
  dimension: max_last_login_date {
    label: "AV Select Login Last Login Date"
    type: date
  }
  dimension: net_prorated_arr_2019 {
    label: "AV Select ARR Net Prorated Arr 2019"
    value_format: "$#,##0.00"
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
  dimension: tl_gateway_c {
    label: "SF Accounts Payment Processing"
  }
  dimension: Default_Migration_Path {
    label: "Default Migration Path"
  }
  dimension: count_patrongroupid {
    label: "AV Select Patron Groups Join Number of Patron Groups"
    value_format: "0"
    type: number
  }
}
