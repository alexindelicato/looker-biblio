connection: "fivetran-bigquery"

include: "/*/*.view"


explore: unlimited_client_facts {
  label: "Unlimited Order Transactions"
  group_label: "Project Biblio"
  view_label:  "Unlimited Order Transactions"

  join: unlimited_admission_transactions {
    view_label: "Admission Transactions"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unlimited_client_facts.client_name}=${unlimited_admission_transactions.client_name} ;;
  }

#  join: sf_accounts {
#    view_label: "SF Accounts"
#    type: left_outer
#    relationship: one_to_one
#    sql_on: ${unlimited_client_facts.sf_account_id}=${sf_accounts.looker_join_id_c} AND ${sf_accounts.is_deleted}= FALSE ;;
#  }

}
#--------------------------
