connection: "fivetran-bigquery"

# include: "*.view.lkml"                       # include all views in this project

include: "/*/*.view"

# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: unlimited_client_facts {
  label: "Unlimited Client Facts"
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

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unlimited_client_facts.sf_account_id}=${sf_accounts.id} AND ${sf_accounts.is_deleted}= FALSE ;;
  }

}
#--------------------------
