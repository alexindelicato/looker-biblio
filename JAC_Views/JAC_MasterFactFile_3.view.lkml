# If necessary, uncomment the line below to include explore_source.

# include: "biblio.model.lkml"

view: JAC_MasterFactFile_3 {
  derived_table: {
    explore_source: sel_members {
      column: id { field: sf_accounts.id }
      column: count_campaigns { field: sel_emailcampaigns.count_campaigns }
      column: total_sent_count { field: sel_email_campaigns_stats.total_sent_count }
      filters: {
        field: sf_accounts.type
        value: "Client - AudienceView Select"
      }
    }
  }
  dimension: id {
    label: "SF Accounts Salesforce ID"
  }
  dimension: count_campaigns {
    label: "AV Select Email Campaigns # Of Email Campaigns Sent"
    type: number
  }
  dimension: total_sent_count {
    label: "AV Select Email Stats Total Sent Count"
    type: number
  }
}
