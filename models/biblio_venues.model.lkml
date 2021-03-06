#connection: "fivetran-bigquery"


# include: "*.view.lkml"                       # include all views in this project

include: "/*/*.view"

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
  join: sf_net_arr_2019 {
    view_label: "Salesforce 2019 NET ARR"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_accounts.id}=${sf_net_arr_2019.id} ;;
  }
}

explore: created_orders {
  label: "AudienceView Created Orders"
  group_label: "Project Biblio"
  view_label: "AudienceView Created Orders"
}


explore: created_orders_new {
  label: "AudienceView Created Orders - New"
  group_label: "Project Biblio"
  view_label: "AudienceView Created Orders"

  join: performances {
    view_label: "Performances"
    type: left_outer
    relationship: many_to_one
    sql_on: ${created_orders_new.product_name}=${performances.product_name}
      AND  ${created_orders_new.performance_id}=${performances.PerformanceId};;
  }

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: many_to_one
    sql_on: ${created_orders_new.salesforceId}=${sf_accounts.id} AND ${sf_accounts.is_deleted}= FALSE ;;
  }

  join: sf_net_arr_2019 {
    view_label: "Salesforce 2019 NET ARR"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_accounts.id}=${sf_net_arr_2019.id} ;;
  }
  join: sf_bti {
    view_label: "Salesforce BTI"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_accounts.id}=${sf_bti.account_c} ;;
  }


}
explore: av_arr_acv {
  label: "AudienceView  ARR/ACV by State"
  group_label: "Project Biblio"
  view_label: "AudienceView  ARR/ACV by State"
}

explore: unlimited_payments_summary {
  label: "Unlimited Payments Summary"
  group_label: "Project Biblio"
  view_label: "Unlimited Payments Summary"
}

explore: pos_usage {
  label: "Unlimited POS Usage"
  group_label: "Project Biblio"
  view_label: "Unlimited POS Usage"
}

#--------------------------
