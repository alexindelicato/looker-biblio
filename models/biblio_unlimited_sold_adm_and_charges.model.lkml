connection: "fivetran-bigquery"

# include: "*.view.lkml"                       # include all views in this project

include: "/*/*.view"

# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: unlimited_client_facts {
  label: "Unlimited Sales Metrics"
  group_label: "Project Biblio"
  view_label:  "Unlimited Client Facts"

  join: unlimited_sold_admissions {
    view_label: "Sold Admissions"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unlimited_client_facts.client_name}=${unlimited_sold_admissions.client_name} ;;
  }

  join: unlimited_order_charges {
    view_label: "Order Charges"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unlimited_client_facts.client_name}=${unlimited_order_charges.client_name} ;;
  }

  join: unlimited_donations_summary {
    view_label: "Donations Summary"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unlimited_client_facts.client_name}=${unlimited_donations_summary.client_name} ;;
  }

  join: unlimited_sales_by_year {
    view_label: "Total Sales Summary"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unlimited_client_facts.client_name}=${unlimited_sales_by_year.client_name} ;;
  }


  join: unlimited_2019_admission_sales {
    view_label: "Total Admission Sales Summary"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unlimited_client_facts.client_name}=${unlimited_2019_admission_sales.client_name} ;;
  }

  join: unlimited_orders_summary {
    view_label: "Orders Summary"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unlimited_client_facts.client_name}=${unlimited_orders_summary.client_name} ;;
  }

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unlimited_client_facts.sf_account_id}=${sf_accounts.looker_join_id_c} AND ${sf_accounts.is_deleted}= FALSE ;;
  }

}
#--------------------------
