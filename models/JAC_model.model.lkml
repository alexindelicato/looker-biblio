#connection: "fivetran-bigquery"

# include all views from all folders
include: "/*/*.view"

explore: JAC_MasterFactFile_1 {
  label: "JAC_MasterFactFile in parts"
  group_label: "Test JAC Explores"
  view_label: "JAC_MasterFactFile"
  hidden: yes

  join: JAC_MasterFactFile_2 {
    view_label: "JAC_MasterFactFile Venues"
    type: inner
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile_1.id}=${JAC_MasterFactFile_2.id};;
  }

  join: JAC_MasterFactFile_3 {
    view_label: "JAC_MasterFactFile Emails"
    type: inner
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile_1.id}=${JAC_MasterFactFile_3.id};;
  }
}

#Select On JAC_MasterFactFile
explore: JAC_MasterFactFile {
  label: "JAC AV Select On-Boarding"
  group_label: "Test JAC Explores"
  view_label: "Select Client Fact"

  join: JAC_SelectOrders {
    view_label: "Select Order Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectOrders.id} ;;
  }
  join: JAC_SelectSiteLine {
    view_label: "Select Website Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectSiteLine.id} ;;
  }
  join: JAC_SelectLaughStub {
    view_label: "Select LaughStub Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectLaughStub.id} ;;
  }
  join: JAC_SelectDonations {
    view_label: "Select Donation Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectDonations.id} ;;
  }

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id}=${sf_accounts.id} AND ${sf_accounts.is_deleted}= FALSE ;;
  }

  join: sf_opportunity {
    view_label: "SF Opportunity"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_accounts.id}=${sf_opportunity.account_id}
      AND ${sf_opportunity.is_deleted} = FALSE
      AND ${sf_opportunity.BTI_Opp_c} = True
      AND ${sf_opportunity.not_in_current_bti_scope_c} = False ;;
  }

  join: sf_engagement_request{
    view_label: "SF Engagement Request"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_opportunity.id}=${sf_engagement_request.opportunity_id}
      AND ${sf_engagement_request.is_deleted} = FALSE
      AND ${sf_engagement_request.bti_opp} = True;;
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
  join: sf_bti_sequence {
    view_label: "SF BTI Onboarding Train"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_accounts.bti_onboarding_train}=${sf_bti_sequence.id} ;;
  }
}

#Select On JAC_MasterFactFile
explore:JAC_MasterFactFile_new {
  label: "JAC AV Select On-Boarding - Remastered"
  group_label: "Test JAC Explores"
  view_label: "SF Accounts"
  from: sf_accounts

  join: sf_opportunity {
    view_label: "SF Opportunity"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile_new.id}=${sf_opportunity.account_id}
      AND ${sf_opportunity.is_deleted} = FALSE;;
  }

  join: sf_engagement_request{
    view_label: "SF Engagement Request"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sf_opportunity.id}=${sf_engagement_request.opportunity_id}
      AND ${sf_engagement_request.is_deleted} = FALSE;;
  }

  join: sf_net_arr_2019 {
    view_label: "Salesforce 2019 NET ARR"
    type: left_outer
    relationship: one_to_many
    sql_on: ${JAC_MasterFactFile_new.id}=${sf_net_arr_2019.id} ;;
  }

  join: JAC_MasterFactFile {
    view_label: "Select Client Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id}=${JAC_MasterFactFile_new.id} AND ${JAC_MasterFactFile_new.is_deleted}= FALSE ;;
  }

  join: JAC_SelectOrders {
    view_label: "Select Order Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectOrders.id} ;;
  }
  join: JAC_SelectSiteLine {
    view_label: "Select Website Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectSiteLine.id} ;;
  }
  join: JAC_SelectLaughStub {
    view_label: "Select LaughStub Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectLaughStub.id} ;;
  }
  join: JAC_SelectDonations {
    view_label: "Select Donation Fact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile.id} = ${JAC_SelectDonations.id} ;;
  }
  join: sf_bti {
    view_label: "Salesforce BTI"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile_new.id}=${sf_bti.account_c} ;;
  }
  join: sf_bti_sequence {
    view_label: "SF BTI Onboarding Train"
    type: left_outer
    relationship: one_to_one
    sql_on: ${JAC_MasterFactFile_new.bti_onboarding_train}=${sf_bti_sequence.id} ;;
  }
}


#
explore: JAC_FutureOrders {
  label: "JAC Future Event Orders"
  group_label: "Test JAC Explores"
  view_label: "Select Order Fact"

  join: sel_performances {
    view_label: "Select Performances"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sel_performances.performanceid} = ${JAC_FutureOrders.performanceid} ;;
  }

  join: sel_events {
    view_label: "Select Events"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sel_events.eventid} = ${sel_performances.eventid} ;;
  }

  join: sel_tickettypes {
    view_label: "Select Ticket Types"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sel_tickettypes.eventid} = ${sel_events.eventid} and ${sel_tickettypes.memberid} = ${sel_events.memberid};;
  }

  join: sel_members {
    view_label: "AV Select Members"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sel_members.memberid}=${JAC_FutureOrders.memberid} and ${sel_members.memberid} NOT IN ("4619e330fb68df17f017b1e89057d833", "211753f41b97e0700b33a570bde6c596", "6af4c79db09e0fb21d5f1b00095eaff8","4d8371bfae939dd32c7e10ff635b70bc","9e56c4935eea00caf287798718dfc94e","0d3536aad4341dcc256094c4c0bb0d6d","0fa0bb4fafbdb4cf5809433d80ab51e6","2a9dbca455e8b90c6b948bcb13939091","1df0aa9f217bb395fca282649811ec1e","af1ddb0b66213b3fa5ca8fa2f1f4d6ba", "45b4785ab727fd298943870f04dfcb8e","baae585e07764146b3692d35e7d2168d","e5d9bd60769bbf7b081349d50aa6b9c3","067da8bb66a30bdb73e10bde13bce8fb","8deca3b0ee8e883b6f89168e406cab12","dc7e2f44ca288588308940db1b45d4be","fe70ab1c75ffc4925639c07e0891a482","0806de427b3d1058a38169a25fce337f","f7d254de2d3506db04ef6eb89704fc28","c42dd251cd9381a73c5a0757fb77f5e9","0323d533228fc21ef9bdc14ba294e710","3ffe0a5e424b75967aa5d3fd326e4443","00d44100179c9b77eb6a06f46c85fa1e","ac43989129cab86b2f66eafbe84e639d","4ae6e9ab6d914b85eee46299348e163a","e7d0920b0ce8b6f293ff9c7d687466a9","a832a73fa655d6916d9d19f04aa47eb7","f5a0c859439061492b2f5d4d8c5552d2","2f6f48ca11bf79cb041f29517b3984bb","382d8d9d16f86d68c7b9ce9ae33933a8","1ac4cf3b7d79c3fd4593de81abd9e998","649d4c4f1bec4ce34dc9b1e03105d07b","75de64085f3d6cc501f5d3de02f16372","b5cc0907683f20463f2f084c6a3cd682","02217573d59983f801339bccb8b6869c","245515b655d69a0085b1f0096a0c6056","485902522b820b1d2315146956fd5325","b4bc3d66c4cb9051547a0ad897c9690d", "1410de8f55455590cca95acd53a8b97d","fb7ade9ed08721d8d1dd9b3a5eaf1482","85fbf43f381373e4f59033acb72c8b3a","4a2e13fb185fdaf7fad8ffdb9211f307") ;;
    # and  ${sel_members.testmode}="N" and ${sel_members.active}="Y"
  }

  join: sf_accounts {
    view_label: "SF Accounts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sel_members.memberid}=${sf_accounts.vam_member_id_c} AND ${sf_accounts.is_deleted}= FALSE ;;
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

  join: sel_venues {
    view_label: "AV Select Venues"
    type: left_outer
    relationship: one_to_one
    sql_on: ${sel_events.venueid}=${sel_venues.venueid} AND  ${sel_venues.deleted} IS NULL ;;
  }
}
