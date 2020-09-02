# If necessary, uncomment the line below to include explore_source.

# include: "biblio.model.lkml"

view: JAC_SelectDonations {
  derived_table: {
    explore_source: sel_members {
      column: count_campaigns { field: sel_donationcampaigns.count_campaigns }
      column: id { field: sf_accounts.id }
      column: count_campaigns_three_years { field: sel_donationcampaigns.count_campaigns_three_years }
      filters: {
        field: sf_accounts.type
        value: "Client - AudienceView Select"
      }
    }
    sql_trigger_value: SELECT date_sub(CURRENT_DATE(), INTERVAL MOD(EXTRACT(DAYOFWEEK FROM CURRENT_DATE())+4,7) DAY) ;;
  }
  dimension: count_campaigns {
    label: "Number of Donation Campaigns Created"
    type: number
  }
  dimension: id {
    label: "SF Accounts Salesforce ID"
  }
  dimension: count_campaigns_three_years {
    label: "Number of Donation Campaigns Created (Last 3 Years)"
    type: number
  }
}
