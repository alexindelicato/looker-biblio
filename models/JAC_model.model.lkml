#connection: "fivetran-bigquery"

# include all views from all folders
include: "/*/*.view"

explore: JAC_MasterFactFile_1 {
  label: "JAC_MasterFactFile in parts"
  group_label: "Test JAC Explores"
  view_label: "JAC_MasterFactFile"
  hidden: yes

  join: JAC_MasterFactFile_2 {
    view_label: "JAC_MasterFactFile Venues"
    type: inner
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile_1.id}=${JAC_MasterFactFile_2.id};;
  }

  join: JAC_MasterFactFile_3 {
    view_label: "JAC_MasterFactFile Emails"
    type: inner
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile_1.id}=${JAC_MasterFactFile_3.id};;
  }
}

#Select On JAC_MasterFactFile
explore: JAC_MasterFactFile {
  label: "JAC AV Select On-Boarding"
  group_label: "Test JAC Explores"
  view_label: "Select Client Fact"

  join: JAC_SelectOrders {
    view_label: "Select Order Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectOrders.id} ;;
  }
  join: JAC_SelectSiteLine {
    view_label: "Select Website Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectSiteLine.id} ;;
  }
  join: JAC_SelectLaughStub {
    view_label: "Select LaughStub Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectLaughStub.id} ;;
  }
  join: JAC_SelectDonations {
    view_label: "Select Donation Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectDonations.id} ;;
  }
}
