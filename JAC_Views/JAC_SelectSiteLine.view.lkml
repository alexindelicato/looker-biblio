view: JAC_SelectSiteLine {
  derived_table: {
    explore_source: sel_members {
      column: id { field: sf_accounts.id }
      column: name { field: sel_feature_control.name }
      filters: {
        field: sf_accounts.type
        value: "Client - AudienceView Select"
      }
      filters: {
        field: sel_feature_control.name
        value: "SiteLine 2.0"
      }
    }
    sql_trigger_value: SELECT date_sub(CURRENT_DATE(), INTERVAL MOD(EXTRACT(DAYOFWEEK FROM CURRENT_DATE())+4,7) DAY) ;;
  }

  dimension: has_website_manager {
    label: "Has Website Manager"
    type: yesno
    sql: ${TABLE}.av_select_feature_name = 'SiteLine 2.0' ;;
  }
  dimension: id {
    label: "SF Accounts Salesforce ID"
  }
  dimension: name {
    label: "AV Select Feature Name"
  }
}
