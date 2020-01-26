connection: "fivetran-bigquery"

# include: "*.view.lkml"                       # include all views in this project

include: "/*/*.view"

# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
# AudienceView QBR-------
explore: unlim_venue_facts {
  label: "AudienceView Venue Facts"
  group_label: "Project Biblio"
  view_label: "AudienceView Venue Facts"

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unlim_venue_facts.sf_account_id}=${sf_accounts.id} AND ${sf_accounts.is_deleted}= FALSE ;;
  }

}
#--------------------------
