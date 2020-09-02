view: JAC_SelectLaughStub {
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
        value: "LaughStub sale channel"
      }
    }
    sql_trigger_value: SELECT date_sub(CURRENT_DATE(), INTERVAL MOD(EXTRACT(DAYOFWEEK FROM CURRENT_DATE())+4,7) DAY) ;;
  }

  dimension: Has_LaughStub_Integration {
    label: "Has LaughStub Integration"
    type: yesno
    sql: ${TABLE}.name = 'LaughStub sale channel' ;;
  }
  dimension: id {
    label: "SF Accounts Salesforce ID"
  }
  dimension: name {
    label: "AV Select Feature Name"
  }
}
