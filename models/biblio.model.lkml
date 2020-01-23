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
  join: sf_task {
    view_label: "Salesforce Tasks"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_accounts.id}=${sf_task.account_id};;
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
  label: "AV Pro Orders"
  group_label: "Project Biblio"
  view_label: "AV Pro Orders"
  fields: [ALL_FIELDS*]
  sql_always_where: ${ot_client.demo}=0 and ${ot_client.testing_mode}=0 and ${imported}=0 and ${is_test_mode}=0 and ${status_id} != 11;;

  join: ot_client {
    view_label: "AV Pro Client"
    type:left_outer
    relationship: many_to_one
    sql_on: ${ot_orders.client_id}=${ot_client.client_id} ;;
  }
  join: ot_client_fee_structure {
    view_label: "AV Pro Client Fee Structure"
    type:left_outer
    relationship: one_to_one
    sql_on: ${ot_client_fee_structure.client_id}=${ot_client.client_id} ;;
  }
  join: ot_client_enabled_feature {
    view_label: "AV Pro Client Features"
    type:left_outer
    relationship: one_to_one
    sql_on: ${ot_client_enabled_feature.client_id}=${ot_client.client_id} ;;
  }
  join: ot_order_detail {
    view_label: "AV Pro Orders Detail"
    type: left_outer
    relationship: one_to_many
    sql_on: ${ot_orders.order_id}=${ot_order_detail.order_id} ;;
  }
  join: ot_order_detail_ticket {
    view_label: "AV Pro Order Detail Tickets"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_order_detail_ticket.orderdetail_id}=${ot_order_detail.orderdetail_id} ;;
  }
  join: ot_client_account {
    view_label: "AV Pro Client Account"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_client.client_id}=${ot_client_account.client_id};;
  }
  join: ot_client_account_sale_refund {
    view_label: "AV Pro Client Sale & Refund"
    type: inner
    relationship: many_to_many
    sql_on: ${ot_order_detail.orderdetail_id}=${ot_client_account_sale_refund.orderdetail_id} ;;
  }
  join: ot_accounting_client_daily_sales {
    view_label: "AV Pro Client Accounting Daily Sales"
    type: inner
    relationship: many_to_many
    sql_on: ${ot_accounting_client_daily_sales.orderdetail_id}=${ot_client_account_sale_refund.orderdetail_id} ;;
  }

  join: ot_performance {
    view_label: "AV Pro Performance"
    type: left_outer
    relationship: one_to_many
    sql_on: ${ot_performance.id}=${ot_order_detail.performance_id} ;;
  }
  join: ot_production {
    view_label: "AV Pro Production"
    type: left_outer
    relationship: one_to_many
    sql_on: ${ot_production.production_id}=${ot_performance.production_id} ;;
  }
  join: ot_performance_stats_total {
    view_label: "AV Pro Performance Seat Manifest"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_performance.id}=${ot_performance_stats_total.performance_id} AND ${ot_performance_stats_total._fivetran_deleted} = false ;;
  }
  join: ot_performance_stats_consumed {
    view_label: "AV Pro Performance Sold Seat Manifest"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_performance.id}=${ot_performance_stats_consumed.performance_id} AND ${ot_performance_stats_consumed._fivetran_deleted} = false ;;
  }

  join: ot_price_level {
    view_label: "AV Pro Performance Price Levels"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_performance_stats_total.price_level_id}=${ot_price_level.price_level_id} and ${ot_price_level._fivetran_deleted} = false;;
  }

  join: ot_payment_segment {
    view_label: "AV Pro Payment"
    type: left_outer
    relationship: many_to_one
    sql_on: ${ot_payment_segment.order_id}=${ot_orders.order_id};;
  }
  join: ot_report_crm {
    view_label: "AV Pro Report CRM"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_report_crm.id}= ${ot_client.report_crm_id};;
  }
  join: sf_accounts {
    view_label: "SF Account"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_accounts.salesforce_account_id_c} = ${ot_report_crm.crm_id} AND ${sf_accounts.is_deleted}= FALSE;;
  }
  join: ganalytics_ot {
    view_label: "GA Orders"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ganalytics_ot.ot_transaction_id}=${ot_orders.order_id};;
  }
  join: ot_credit_card_transactions {
    view_label: "AV Pro Credit Card Transactions"
    type:  left_outer
    relationship: one_to_many
    sql_on: ${ot_orders.order_id}=${ot_credit_card_transactions.order_id} ;;
  }
}

#AV Professional Client Facts
explore: ot_client {
  label: "AV Pro Client Fact"
  group_label: "Project Biblio"
  view_label: "AV Pro Client"
  fields: [ALL_FIELDS*]
  sql_always_where: ${ot_client.demo}=0 and ${ot_client.testing_mode}=0;;

  join: ot_seating_chart_client {
    view_label: "AV Pro Seatting Chart Client"
    type:left_outer
    relationship: many_to_one
    sql_on: ${ot_seating_chart_client.client_id}=${ot_client.client_id} ;;
    }

  join: ot_seating_chart {
    view_label: "AV Pro Seatting Chart Client"
    type:left_outer
    relationship: one_to_one
    sql_on: ${ot_seating_chart_client.seating_chart_id}=${ot_seating_chart.seating_chart_id} ;;
  }

  join: ot_section {
    view_label: "AV Pro Section"
    type:left_outer
    relationship: one_to_one
    sql_on: ${ot_section.seating_chart_id}=${ot_seating_chart.seating_chart_id} ;;
  }

  join: ot_report_crm {
    view_label: "AV Pro Report CRM"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_report_crm.id}= ${ot_client.report_crm_id};;
  }
  join: pro_department {
    view_label: "AV Pro Department"
    type: left_outer
    relationship: one_to_one
    sql_on: ${pro_department.client_id}= ${ot_client.client_id};;
  }

  join: sf_accounts {
    view_label: "SF Account"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_accounts.salesforce_account_id_c} = ${ot_report_crm.crm_id} AND ${sf_accounts.is_deleted}= FALSE;;
  }
  }
#------------------------

# AudienceView QBR-------
explore: av_qbr {
  label: "AV Unlimited QBR"
  group_label: "Project Biblio"
  view_label: "AV Unlimited QBR"

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${av_qbr.sf_client_id}=${sf_accounts.id} AND ${sf_accounts.is_deleted}= FALSE ;;
  }
  }
  #--------------------------

  # AudienceView Select-------
explore: sel_members {
  label: "AV Select"
  group_label: "Project Biblio"
  view_label: "AV Select"
  sql_always_where: ${testmode}="N" and ${active}="Y" ;;

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sel_members.memberid}=${sf_accounts.vam_member_id_c} AND ${sf_accounts.is_deleted}= FALSE ;;
  }
  }
  #-----------------------
