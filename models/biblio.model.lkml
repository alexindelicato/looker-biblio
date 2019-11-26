connection: "fivetran-bigquery"

# include all views from all folders
include: "/*/*.view"

datagroup: biblio_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: biblio_default_datagroup

#--SALESFORCE JOINS--
# salesforce account explore as primary table
explore: sf_accounts {
  label: "Salesforce Accounts"
  group_label: "Project Biblio"
  view_label: "Salesforce Accounts"
  fields: [ALL_FIELDS*]
  sql_always_where: ${sf_accounts.is_deleted}= FALSE;;

  join: sf_opportunity {
    view_label: "Salesforce Opportunitiy"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_accounts.id}=${sf_opportunity.account_id} AND  ${sf_opportunity.is_deleted}= FALSE;;
  }

  join: sf_case {
    view_label: "Salesforce Support Cases"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_accounts.id}=${sf_case.account_id};;
  }

  join: sf_user {
    view_label: "Salesforce Users"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_user.id}=${sf_accounts.owner_id};;
  }
}

# salesforce opportunity explore as primary table
explore: sf_opportunity {
  label: "Salesforce Opportunity"
  group_label: "Project Biblio"
  view_label: "Salesforce Opportunity"
  fields: [ALL_FIELDS*]
  sql_always_where: ${sf_opportunity.is_deleted}= FALSE;;
}


#--OVATIONTIX JOINS--
# OvationTix Orders as primary table
explore: ot_orders {
  label: "OT Orders"
  group_label: "Project Biblio"
  view_label: "OT Orders"
  fields: [ALL_FIELDS*]
  sql_always_where: ${ot_client.demo}=0 and ${ot_client.testing_mode}=0 and ${imported}=0 and ${is_test_mode}=0 and ${status_id} != 11;;

  join: ot_client {
    view_label: "OT Client"
    type:left_outer
    relationship: many_to_one
    sql_on: ${ot_orders.client_id}=${ot_client.client_id} ;;
  }
  join: ot_client_fee_structure {
    view_label: "OT Client Fee Structure"
    type:left_outer
    relationship: one_to_one
    sql_on: ${ot_client_fee_structure.client_id}=${ot_client.client_id} ;;
  }
  join: ot_client_enabled_feature {
    view_label: "OT Client Features"
    type:left_outer
    relationship: one_to_one
    sql_on: ${ot_client_enabled_feature.client_id}=${ot_client.client_id} ;;
  }
  join: ot_order_detail {
    view_label: "OT Orders Detail"
    type: left_outer
    relationship: one_to_many
    sql_on: ${ot_orders.order_id}=${ot_order_detail.order_id} ;;
  }
  join: ot_order_detail_ticket {
    view_label: "OT Order Detail Tickets"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_order_detail_ticket.orderdetail_id}=${ot_order_detail.orderdetail_id} ;;
  }
  join: ot_client_account {
    view_label: "OT Client Account"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_client.client_id}=${ot_client_account.client_id};;
  }
  join: ot_client_account_sale_refund {
    view_label: "OT Clent Sale/Refund"
    type: inner
    sql_on: ${ot_order_detail.orderdetail_id}=${ot_client_account_sale_refund.orderdetail_id} ;;
    relationship: many_to_many
  }
  join: ot_accounting_client_daily_sales {
    view_label: "OT Client Accounting"
    type: inner
    relationship: many_to_many
    sql_on: ${ot_accounting_client_daily_sales.orderdetail_id}=${ot_client_account_sale_refund.orderdetail_id} ;;
  }

  join: ot_performance {
    view_label: "OT Performance"
    type: inner
    relationship: one_to_one
    sql_on: ${ot_performance.id}=${ot_order_detail.performance_id} ;;
  }
  join: ot_production {
    view_label: "OT Production"
    type: inner
    relationship: one_to_one
    sql_on: ${ot_production.production_id}=${ot_performance.production_id} ;;
  }

  join: ot_payment_segment {
    view_label: "OT Payment"
    type: left_outer
    relationship: many_to_one
    sql_on: ${ot_payment_segment.order_id}=${ot_orders.order_id};;
  }
  join: ot_report_crm {
    view_label: "OT Report CRM"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_report_crm.id}= ${ot_client.report_crm_id} AND ${ot_client.demo}=0 AND  ${ot_client.testing_mode}=0;;
  }
  join: sf_accounts {
    view_label: "SF Account"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_accounts.salesforce_account_id_c} = ${ot_report_crm.crm_id} AND ${sf_accounts.is_deleted}= FALSE;;
  }
}

explore: ot_accounting_client_daily_sales {
  label: "Alex Test"
  group_label: "Project Biblio"
  view_label: "Salesforce Accounts"
  }
