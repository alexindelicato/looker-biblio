view: JAC_MasterFactFile_4 {
  derived_table: {
    explore_source: sel_members {
      column: id { field: sf_accounts.id }

      column: count_reserved_events_types { field: sel_events.count_reserved_events_types }
      column: count_mixed_events_types { field: sel_events.count_mixed_events_types }
      column: count_GA_events_types { field: sel_events.count_GA_events_types }

      filters: [sf_accounts.vam_member_id_c: "-NULL", sel_performances.starttime_date: "after 0 minutes ago"]
    }
  }
  dimension: id {
    label: "SF Accounts Salesforce ID"
  }

  dimension: count_reserved_events_types {
    label: "AV Select Future Events # of Reserved Venues"
    type: number
  }
  dimension: count_mixed_events_types {
    label: "AV Select Future Events # of Mixed Venues"
    type: number
  }
  dimension: count_GA_events_types {
    label: "AV Select Future Events # of GA Venues"
    type: number
  }
}
