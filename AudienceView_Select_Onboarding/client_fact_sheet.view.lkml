view: client_fact_sheet {
  sql_table_name: `fivetran-ovation-tix-warehouse.sel_fact_sheet.client_fact_sheet`
    ;;

  dimension_group: _fivetran_synced {
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
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: av_select_arr_net_prorated_arr_2019 {
    label: "2019 NET Proated ARR"
    type: number
    sql: ${TABLE}.av_select_arr_net_prorated_arr_2019 ;;
  }

  dimension: av_select_email_campaigns_of_email_campaigns_sent {
    label: "# of Campaign Emails Sent"
    type: number
    sql: ${TABLE}.av_select_email_campaigns_of_email_campaigns_sent ;;
  }

  dimension: av_select_email_stats_total_sent_count {
    label: "# of Total Emails Sent to Patrons"
    type: number
    sql: ${TABLE}.av_select_email_stats_total_sent_count ;;
  }

  dimension: av_select_login_days_inactive {
    label: "# of Days Inactive"
    type: number
    sql: ${TABLE}.av_select_login_days_inactive ;;
  }

  dimension_group: av_select_login_last_login {
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
    sql: ${TABLE}.av_select_login_last_login_date ;;
  }

  dimension: av_select_merchant_accounts_gateway {
    label: "Gateway"
    type: string
    sql: ${TABLE}.av_select_merchant_accounts_gateway ;;
  }

  dimension: av_select_patron_groups_join_number_of_patron_groups {
    label: "# Of Patron Tags"
    type: number
    sql: ${TABLE}.av_select_patron_groups_join_number_of_patron_groups ;;
  }

  dimension: av_select_patron_total_of_patrons {
    label: "Total # of Patrons"
    type: number
    sql: ${TABLE}.av_select_patron_total_of_patrons ;;
  }

  dimension: av_select_patron_total_of_patrons_past_3_years_ {
    label: "Total # of Patrons (Last 3 Years)"
    type: number
    sql: ${TABLE}.av_select_patron_total_of_patrons_past_3_years_ ;;
  }

  dimension: av_select_venues_of_ga_venues {
    label: "# of GA Venues"
    type: number
    sql: ${TABLE}.av_select_venues_of_ga_venues ;;
  }

  dimension: av_select_venues_of_mixed_venues {
    label: "# of Mixed Venues"
    type: number
    sql: ${TABLE}.av_select_venues_of_mixed_venues ;;
  }

  dimension: av_select_venues_of_reserved_venues {
    label: "# of Reserved Venues"
    type: number
    sql: ${TABLE}.av_select_venues_of_reserved_venues ;;
  }

  dimension: sf_accounts_client_name {
    label: "CLient Name"
    type: string
    sql: ${TABLE}.sf_accounts_client_name ;;
  }

  dimension: sf_accounts_cohort_id {
    label: "Cohort ID"
    type: number
    sql: ${TABLE}.sf_accounts_cohort_id ;;
  }

  dimension: sf_accounts_cohorts {
    label: "Cohorts"
    type: string
    sql: ${TABLE}.sf_accounts_cohorts ;;
  }

  dimension: sf_accounts_country {
    label: "Country"
    type: string
    sql: ${TABLE}.sf_accounts_country ;;
  }

  dimension: sf_accounts_preferred_language {
    label: "Preferred Language"
    type: string
    sql: ${TABLE}.sf_accounts_preferred_language ;;
  }

  dimension: sf_accounts_region_state {
    label: "Region/State"
    type: string
    sql: ${TABLE}.sf_accounts_region_state ;;
  }

  dimension: sf_accounts_salesforce_id {
    label: "Salesforce ID"
    type: string
    sql: ${TABLE}.sf_accounts_salesforce_id ;;
  }

  dimension: sf_accounts_segment {
    label: "Segment"
    type: string
    sql: ${TABLE}.sf_accounts_segment ;;
  }

  dimension: sf_accounts_type {
    label: "Type"
    type: string
    sql: ${TABLE}.sf_accounts_type ;;
  }

  dimension: sf_accounts_vertical {
    label: "Verical"
    type: string
    sql: ${TABLE}.sf_accounts_vertical ;;
  }

  measure: count {
    type: count
    drill_fields: [sf_accounts_client_name]
  }
}
