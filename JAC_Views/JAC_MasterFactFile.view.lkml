# If necessary, uncomment the line below to include explore_source.

# include: "JAC_model.model.lkml"

view: JAC_MasterFactFile {
  derived_table: {
    explore_source: JAC_MasterFactFile_1 {
      column: net_prorated_arr_2019 {}
      column: number_of_days_inactive {}
      column: max_last_login_date {}
      column: gateway {}
      column: count_patrongroupid {}
      column: count {}
      column: count_created_patrons {}
      column: id {}

      column: count_GA_venues_types { field: JAC_MasterFactFile_2.count_GA_venues_types }
      column: count_mixed_venues_types { field: JAC_MasterFactFile_2.count_mixed_venues_types }
      column: count_reserved_venues_types { field: JAC_MasterFactFile_2.count_reserved_venues_types }
      column: active_members { field: JAC_MasterFactFile_2.active_members }
      column: count_active_memberships { field: JAC_MasterFactFile_2.count_active_memberships }

      column: count_GA_events_types { field: JAC_MasterFactFile_4.count_GA_events_types }
      column: count_mixed_events_types { field: JAC_MasterFactFile_4.count_mixed_events_types }
      column: count_reserved_events_types { field: JAC_MasterFactFile_4.count_reserved_events_types }

      column: count_campaigns { field: JAC_MasterFactFile_3.sel_emailcampaigns_count_campaigns }
      column: total_sent_count { field: JAC_MasterFactFile_3.sel_email_campaigns_stats_total_sent_count }
    }
    sql_trigger_value: SELECT date_sub(CURRENT_DATE(), INTERVAL MOD(EXTRACT(DAYOFWEEK FROM CURRENT_DATE())+4,7) DAY) ;;
  }
  dimension: net_prorated_arr_2019 {
    label: "2019 Net Prorated ARR"
    value_format: "$#,##0.00"
    type: number
  }
  dimension: number_of_days_inactive {
    label: "# of Days Inactive"
    type: number
  }

  dimension_group: max_last_login_date {
    label: "Last login Date"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
  }
  dimension: gateway {
    label: "Gateway"
  }
  dimension: count_patrongroupid {
    label: "# Of Patron Tags"
    value_format: "0"
    type: number
  }
  dimension: count {
    label: "Total # of Patrons"
    type: number
  }
  dimension: count_created_patrons {
    label: "Total # of Patrons (Past 3 Years)"
    type: number
  }
  dimension: billing_country {
    label: "Country"
  }
  dimension: id {
    label: "Salesforce ID"
  }
  dimension: count_GA_venues_types {
    label: "# of GA Venues"
    type: number
  }
  dimension: count_mixed_venues_types {
    label: "# of Mixed Venues"
    type: number
  }

  dimension: count_reserved_venues_types {
    label: "# of Reserved Venues"
    type: number
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

  dimension: count_campaigns {
    label: "# Of Campaign Emails Sent"
    type: number
  }
  dimension: total_sent_count {
    label: "# of Total Emails Sent to Patrons"
    type: number
  }

  dimension: active_members {
    label: "# of Active Members"
    type: number
  }

  dimension: count_active_memberships {
    label: "Total # of Active Memberships"
    type: number
  }
}
