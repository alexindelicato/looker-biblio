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
    sql_on: ${sf_accounts.id}=${sf_case.account_id} AND ${sf_case.is_deleted} = FALSE;;
  }

  join: sf_contact {
    view_label: "Salesforce Contact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_contact.id}=${sf_case.contact_id} ;;
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

# salesforce campaign explore as primary table
explore: sf_campaign_member {
  label: "Salesforce Campaign Member"
  group_label: "Project Biblio"
  view_label: "Salesforce Campaign Member"
  fields: [ALL_FIELDS*]
  sql_always_where: ${sf_campaign_member.is_deleted}= FALSE;;

  join: sf_lead {
    view_label: "SalesFoce Lead"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_lead.id} = ${sf_campaign_member.lead_id} AND ${sf_lead.is_deleted} = FALSE ;;
  }

  join: sf_campaign {
    view_label: "SalesFoce Campaigns"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_campaign.id} = ${sf_campaign_member.campaign_id} AND ${sf_campaign.is_deleted} = FALSE ;;
  }

  join: sf_user {
    view_label: "Salesforce Users"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_user.id}=${sf_lead.owner_id};;
  }
  }

explore: pro_venue_facts {
  label: "AV Pro Venue Facts"
  group_label: "Project Biblio"
  view_label: "AV Pro Orders"
  fields: [ALL_FIELDS*]
#  sql_on: ${pro_venue_facts.performance_id}=${ot_order_detail.performance_id} ;;

}


#--OVATIONTIX JOINS--
# OvationTix Orders as primary table
explore: ot_orders {
  label: "AV Pro Orders"
  group_label: "Project Biblio"
  view_label: "AV Pro Orders"
  fields: [ALL_FIELDS*]
  sql_always_where: ${ot_client.demo}=0 and ${ot_client.testing_mode}=0 and ${ot_client.active} = 1 and ${imported}=0 and ${is_test_mode}=0 and ${status_id} != 11;;

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


  join: pro_ticket {
    view_label: "AV Pro Tickets"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_order_detail.ticket_id} = ${pro_ticket.ticket_id} ;;
  }

  join: pro_ticket_barcode {
    view_label: "AV Pro Tickets Barcode"
    type: left_outer
    relationship: one_to_one
    sql_on: ${pro_ticket.ticket_id} = ${pro_ticket_barcode.ticket_id} ;;
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

  join: ot_client_statement {
    view_label: "AV Pro Client Statement"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_client.client_id}=${ot_client_statement.client_id};;
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
  join: pro_client_type {
    view_label: "AV Pro Client Type"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_report_crm.client_type_id}= ${pro_client_type.client_type_id};;
  }
  join: pro_production_genre {
    view_label: "AV Pro Production Genre"
    type:  left_outer
    relationship: one_to_one
    sql_on: ${pro_production_genre.production_id}=${ot_production.production_id} ;;
  }
  join: pro_genres {
    view_label: "AV Pro Genre"
    type:  left_outer
    relationship: one_to_one
    sql_on: ${pro_production_genre.genre_id}=${pro_genres.genre_id} ;;
  }
  join: sf_accounts {
    view_label: "SF Account"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_accounts.salesforce_account_id_c} = ${ot_report_crm.crm_id} AND ${sf_accounts.is_deleted}= FALSE;;
  }
  join: sf_contact {
    view_label: "SF Contact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_accounts.id} = ${sf_contact.account_id} ;;
  }
  join: sf_case {
    view_label: "SF Case"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_contact.id} = ${sf_case.contact_id} ;;
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
  sql_always_where: ${ot_client.demo}=0 and ${ot_client.testing_mode}=0 and ${ot_client.active} = 1 ;;

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
    sql_on: ${ot_seating_chart_client.seating_chart_id}=${ot_seating_chart.seating_chart_id} and ${ot_seating_chart.deleted} = 'F' ;;
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
  join: pro_client_type {
    view_label: "AV Pro Client Type"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_report_crm.client_type_id}= ${pro_client_type.client_type_id};;
  }
  join: pro_department {
    view_label: "AV Pro Department"
    type: left_outer
    relationship: one_to_one
    sql_on: ${pro_department.client_id}= ${ot_client.client_id};;
  }

  join: ot_client_enabled_feature {
    view_label: "AV Pro Client Features"
    type:left_outer
    relationship: one_to_one
    sql_on: ${ot_client_enabled_feature.client_id}=${ot_client.client_id} ;;
  }

  join: ot_accounting_client_daily_sales {
    view_label: "AV Pro Client Accounting Daily Sales"
    type: inner
    relationship: many_to_many
    sql_on: ${ot_accounting_client_daily_sales.client_id}=${ot_client.client_id} ;;
  }

  join: ot_client_account {
    view_label: "AV Pro Client Account"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_client.client_id}=${ot_client_account.client_id};;
  }

  join: ot_client_statement {
    view_label: "AV Pro Client Statement"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ot_client.client_id}=${ot_client_statement.client_id};;
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
  label: "AV Unlimited"
  group_label: "Project Biblio"
  view_label: "AV Unlimited"

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
  label: "AV Select Client"
  group_label: "Project Biblio"
  view_label: "AV Select Client"
  sql_always_where: ${testmode}="N" and ${active}="Y" ;;

  join: sel_members_merchantaccounts {
    view_label: "AV Select Marchant Accountss"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sel_members.memberid}=${sel_members_merchantaccounts.memberid}  ;;
  }

  join: sel_payments_donations {
    view_label: "AV Select Payment Donations"
    type: inner
    relationship: one_to_many
    sql_on: ${sel_members.memberid}=${sel_payments_donations.memberid} AND round(safe_cast(${sel_payments_donations.amountheld} as FLOAT64),2) != 0 AND ${sel_payments_donations.settled} IS NULL ;;
  }

  join: sel_donations {
    view_label: "AV Select Donations"
    type: inner
    relationship: many_to_one
    sql_on: ${sel_donations.donationid}=${sel_payments_donations.donationid} ;;
  }

  join: sel_donationcampaigns {
    view_label: "AV Select Donations Campaigns"
    type: inner
    relationship: one_to_one
    sql_on: ${sel_donationcampaigns.donationcampaignid}= ${sel_donations.donationcampaignid}  ;;
  }

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sel_members.memberid}=${sf_accounts.vam_member_id_c} AND ${sf_accounts.is_deleted}= FALSE ;;
  }

  join: sel_events {
    view_label: "AV Select Series"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sel_members.memberid}=${sel_events.memberid} AND  ${sel_performances.deleted} IS NULL ;;
  }

  join: sel_tags_to_events {
    view_label: "AV Select Event Tag Join"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sel_tags_to_events.eventid}=${sel_events.eventid} ;;
  }

  join: sel_tags {
    view_label: "AV Select Performance Tags"
    type: left_outer
    relationship: many_to_many
    sql_on: ${sel_tags_to_events.tagid}=${sel_tags.tagid} AND ${sel_tags.deleted} IS NULL ;;
  }

  join: sel_performances {
    view_label: "AV Select Performances"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sel_events.eventid}=${sel_performances.eventid} AND  ${sel_performances.deleted} IS NULL  ;;
  }

  join: sel_performance_inventory {
    view_label: "AV Select Performance Inventory"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sel_performances.performanceid}=${sel_performance_inventory.ID} AND  ${sel_performances.deleted} IS NULL  ;;
  }

  join: sel_venues {
    view_label: "AV Select Venues"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sel_events.venueid}=${sel_venues.venueid} AND  ${sel_venues.deleted} IS NULL ;;
  }
  }

  #Select performance stats explore for settlement issue
  explore: sel_performance_stats {
    label: "AV Select Peformance Stats"
    group_label: "Project Biblio"
    view_label: "AV Select Performance Stats"

    join: sel_members {
      view_label: "AV Select Members"
      type: left_outer
      relationship: one_to_many
      sql_on: ${sel_members.memberid}=${sel_performance_stats.memberid} ;;
    }

    join: sf_accounts {
      view_label: "SF Accounts"
      type: left_outer
      relationship: one_to_one
      sql_on: ${sel_members.memberid}=${sf_accounts.vam_member_id_c} AND ${sf_accounts.is_deleted}= FALSE ;;
    }

    join: sf_contact {
      view_label: "SF Contact"
      type: left_outer
      relationship: one_to_one
      sql_on: ${sf_accounts.id} = ${sf_contact.account_id} ;;
    }
    join: sf_case {
      view_label: "SF Case"
      type: left_outer
      relationship: one_to_many
      sql_on: ${sf_contact.id} = ${sf_case.contact_id} ;;
    }

    join: sel_performances {
      view_label: "AV Select Performances"
      type: left_outer
      relationship: one_to_many
      sql_on: ${sel_performance_stats.performanceid}=${sel_performances.performanceid}  ;;
    }

    join: sel_events {
      view_label: "AV Select Series"
      type: left_outer
      relationship: one_to_many
      sql_on: ${sel_performances.eventid}=${sel_events.eventid} ;;
    }
    }

  #GA Conversion rate
  explore: ga_pro_conversion {
    label: "GA Pro Conversion"
    group_label: "Project Biblio"
    view_label: "GA Pro Conversion"
    }


#CrowdTorch Performance Stats Settlement Issue
explore: ct_performance_stats {
  label: "CT Performance Stats"
  group_label: "Project Biblio"
  view_label: "CT Performance Stats"

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ct_performance_stats.client_id}=${sf_accounts.ct_client_id_c} AND ${sf_accounts.is_deleted}= FALSE ;;
  }

  join: sf_contact {
    view_label: "SF Contact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_accounts.id} = ${sf_contact.account_id} ;;
  }
  join: sf_case {
    view_label: "SF Case"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_contact.id} = ${sf_case.contact_id} ;;
  }
}

explore: ct_clients {
  label: "CT Clients"
  group_label: "Project Biblio"
  view_label: "CT Clients"

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${ct_clients.client_id}=${sf_accounts.ct_client_id_c} AND ${sf_accounts.is_deleted}= FALSE ;;
  }
  join: sf_contact {
    view_label: "SF Contact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_accounts.id} = ${sf_contact.account_id} ;;
  }
  }


  #-----------------------
