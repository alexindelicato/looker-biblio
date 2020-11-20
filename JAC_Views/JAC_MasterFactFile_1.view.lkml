# This report holds a lot of un-needed data from salesforce as it can be merged with salesforce in a later explore



include: "/models/biblio.model.lkml"

view: JAC_MasterFactFile_1 {
  derived_table: {
    explore_source: sel_members {
      column: id { field: sf_accounts.id }
      column: gateway { field: sel_members_merchantaccounts.gateway }
      column: number_of_days_inactive { field: sel_max_login.number_of_days_inactive }
      column: max_last_login_date { field: sel_max_login.max_last_login_date }
      column: net_prorated_arr_2019 { field: sel_arr.net_prorated_arr_2019 }
      column: count { field: sel_patrons.count }
      column: count_created_patrons { field: sel_patrons.count_created_patrons }
      column: count_patrongroupid { field: sel_patrons_groups.count_patrongroupid }
      filters: {
        field: sf_accounts.vam_member_id_c
        value: "-NULL"
      }
    }
  }
  dimension: id {
    label: "SF Accounts Salesforce ID"
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
  dimension: count_patrongroupid {
    label: "AV Select Patron Groups Join Number of Patron Groups"
    value_format: "0"
    type: number
  }
}
