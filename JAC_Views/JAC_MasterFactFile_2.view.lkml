view: JAC_MasterFactFile_2 {
  derived_table: {
    explore_source: sel_members {
      column: id { field: sf_accounts.id }
      column: count_reserved_venues_types { field: sel_venues.count_reserved_venues_types }
      column: count_mixed_venues_types { field: sel_venues.count_mixed_venues_types }
      column: count_GA_venues_types { field: sel_venues.count_GA_venues_types }
      column: active_members { field: sel_members.active_count }

      filters: {
        field: sf_accounts.vam_member_id_c
        value: "-NULL"
      }
    }
  }
  dimension: id {
    label: "SF Accounts Salesforce ID"
  }
  dimension: count_reserved_venues_types {
    label: "AV Select Venues # of Reserved Venues"
    type: number
  }
  dimension: count_mixed_venues_types {
    label: "AV Select Venues # of Mixed Venues"
    type: number
  }
  dimension: count_GA_venues_types {
    label: "AV Select Venues # of GA Venues"
    type: number
  }

  dimension: active_members {
    label: "# of Active Members"
    type: number
  }
}
