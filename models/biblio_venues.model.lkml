connection: "fivetran-bigquery"

# include: "*.view.lkml"                       # include all views in this project

include: "/*/*.view"

# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: audienceview_venue_facts {
  label: "AudienceView Venue Facts"
  group_label: "Project Biblio"
  view_label: "AudienceView Venue Facts"

  join: sf_accounts {
    view_label: "SF Accounts"
    type: inner
    relationship: one_to_one
    sql_on: ${audienceview_venue_facts.sf_account_id}=${sf_accounts.looker_join_id_c} AND ${sf_accounts.is_deleted}= FALSE ;;
  }

}

explore: created_orders {
  label: "AudienceView Created Orders"
  group_label: "Project Biblio"
  view_label: "AudienceView Created Orders"
  }

  explore: pos_usage {
    label: "Unlimited POS Usage"
    group_label: "Project Biblio"
    view_label: "Unlimited POS Usage"

  }

#--------------------------
