# connection: "fivetran-bigquery"

include: "/*/*.view"

 explore: unlimited_order_transactions {
   label: "Unlimited Order Transactions"
   group_label: "Project Biblio"
   view_label:  "Unlimited Order Transactions"

  join: unlimited_expiring_client_facts {
     view_label: "Expiring Client List"
     type: inner
     relationship: many_to_one
     sql_on: ${unlimited_expiring_client_facts.expiring_client_name}=${unlimited_order_transactions.client_name}
     ;;
  }

  # join: sf_accounts {
  #   view_label: "SF Accounts"
  #   type: left_outer
  #   relationship: one_to_one
  #   sql_on: ${unlimited_client_facts.sf_account_id}=${sf_accounts.looker_join_id_c} AND ${sf_accounts.is_deleted}= FALSE ;;
  # }
}

explore: unlimited_order_transactions_params {
  label: "Unlimited Order Transactions (Params)"
  group_label: "Project Biblio"
  view_label:  "Unlimited Order Transactions (Params)"

  # join: unlimited_expiring_client_facts {
  #   view_label: "Expiring Client List"
  #   type: inner
  #   relationship: many_to_one
  #   sql_on: ${unlimited_expiring_client_facts.expiring_client_name}=${unlimited_order_transactions_params.client_name}
  #   ;;
  # }

}
