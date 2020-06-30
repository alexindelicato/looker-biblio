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
    type: number
    sql: ${TABLE}.av_select_arr_net_prorated_arr_2019 ;;
  }

  dimension: av_select_email_campaigns_of_email_campaigns_sent {
    type: number
    sql: ${TABLE}.av_select_email_campaigns_of_email_campaigns_sent ;;
  }

  dimension: av_select_email_stats_total_sent_count {
    type: number
    sql: ${TABLE}.av_select_email_stats_total_sent_count ;;
  }

  dimension: av_select_login_days_inactive {
    type: number
    sql: ${TABLE}.av_select_login_days_inactive ;;
  }

  dimension_group: av_select_login_last_login {
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
    type: string
    sql: ${TABLE}.av_select_merchant_accounts_gateway ;;
  }

  dimension: av_select_patron_groups_join_number_of_patron_groups {
    type: number
    sql: ${TABLE}.av_select_patron_groups_join_number_of_patron_groups ;;
  }

  dimension: av_select_patron_total_of_patrons {
    type: number
    sql: ${TABLE}.av_select_patron_total_of_patrons ;;
  }

  dimension: av_select_patron_total_of_patrons_past_3_years_ {
    type: number
    sql: ${TABLE}.av_select_patron_total_of_patrons_past_3_years_ ;;
  }

  dimension: av_select_venues_of_ga_venues {
    type: number
    sql: ${TABLE}.av_select_venues_of_ga_venues ;;
  }

  dimension: av_select_venues_of_mixed_venues {
    type: number
    sql: ${TABLE}.av_select_venues_of_mixed_venues ;;
  }

  dimension: av_select_venues_of_reserved_venues {
    type: number
    sql: ${TABLE}.av_select_venues_of_reserved_venues ;;
  }

  dimension: sf_accounts_client_name {
    type: string
    sql: ${TABLE}.sf_accounts_client_name ;;
  }

  dimension: sf_accounts_cohort_id {
    type: number
    sql: ${TABLE}.sf_accounts_cohort_id ;;
  }

  dimension: sf_accounts_cohorts {
    type: string
    sql: ${TABLE}.sf_accounts_cohorts ;;
  }

  dimension: sf_accounts_country {
    type: string
    sql: ${TABLE}.sf_accounts_country ;;
  }

  dimension: sf_accounts_preferred_language {
    type: string
    sql: ${TABLE}.sf_accounts_preferred_language ;;
  }

  dimension: sf_accounts_region_state {
    type: string
    sql: ${TABLE}.sf_accounts_region_state ;;
  }

  dimension: sf_accounts_salesforce_id {
    type: string
    sql: ${TABLE}.sf_accounts_salesforce_id ;;
  }

  dimension: sf_accounts_segment {
    type: string
    sql: ${TABLE}.sf_accounts_segment ;;
  }

  dimension: sf_accounts_type {
    type: string
    sql: ${TABLE}.sf_accounts_type ;;
  }

  dimension: sf_accounts_vertical {
    type: string
    sql: ${TABLE}.sf_accounts_vertical ;;
  }

  measure: count {
    type: count
    drill_fields: [sf_accounts_client_name]
  }
}
