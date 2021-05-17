view: sel_select_audit {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.select_audit`
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

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: arr_service_fees_only_ {
    type: number
    value_format_name: usd
    label: "ARR Service Fees"
    sql: ${TABLE}.arr_service_fees_only_ ;;
  }

  dimension: arr_subscription_revenue_ {
    type: number
    value_format_name: usd
    label: "ARR Subscription Revenue"
    sql: ${TABLE}.arr_subscription_revenue_ ;;
  }

  dimension: audit_notes {
    type: string
    sql: ${TABLE}.audit_notes ;;
  }

  dimension: audit_status {
    type: string
    sql: ${TABLE}.audit_status ;;
  }

  dimension: auto_renew_clause_ {
    type: string
    sql: ${TABLE}.auto_renew_clause_ ;;
  }

  dimension: auto_renewal_term_years_ {
    type: number
    sql: ${TABLE}.auto_renewal_term_years_ ;;
  }

  dimension: bob {
    type: string
    sql: ${TABLE}.bob ;;
  }

  dimension: cancellation_window {
    type: string
    sql: ${TABLE}.cancellation_window ;;
  }

  dimension: client_fee_structure {
    type: string
    sql: ${TABLE}.client_fee_structure ;;
  }

  dimension: client_status {
    type: string
    sql: ${TABLE}.client_status ;;
  }

  dimension: contract_type {
    type: string
    value_format_name: usd
    sql: case when ${arr_subscription_revenue_} IS NOT NULL then "License + Fee"
    Else "Per Ticket Fee" END;;
  }

  dimension: total_arr {
    label: "ARR"
    value_format_name: usd
    type: number
    sql: case when ${contract_type} = "License + Fee" then ${sf_accounts.annual_contract_value_c} + cast(${arr_subscription_revenue_} as INT64)
         else ${sf_accounts.annual_contract_value_c} END;;
  }

  dimension: contract_expiration_month {
    type: number
    sql: ${TABLE}.contract_expiration_month ;;
  }

  dimension: contract_expiration_quarter {
    type: string
    sql: ${TABLE}.contract_expiration_quarter ;;
  }

  dimension: contract_expiration_quarter_v_2 {
    type: string
    sql: ${TABLE}.contract_expiration_quarter_v_2 ;;
  }

  dimension: contract_expiration_year {
    type: number
    sql: ${TABLE}.contract_expiration_year ;;
  }

  dimension: contract_expiration_year_v_2 {
    type: number
    sql: ${TABLE}.contract_expiration_year_v_2 ;;
  }

  dimension: contract_on_file_as_of_last_audit_date_ {
    type: string
    sql: ${TABLE}.contract_on_file_as_of_last_audit_date_ ;;
  }

  dimension_group: current_contract_end_date_dd_mm_yyyy_ {
    type: time
    label: "Contract End"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.current_contract_end_date_dd_mm_yyyy_ ;;
  }

  dimension: current_contract_term_length_years_ {
    type: string
    sql: ${TABLE}.current_contract_term_length_years_ ;;
  }

  dimension: currently_in_auto_renew_term_ {
    type: string
    sql: ${TABLE}.currently_in_auto_renew_term_ ;;
  }

  dimension: exclusivity_terms {
    type: string
    sql: ${TABLE}.exclusivity_terms ;;
  }

  dimension_group: last_audited {
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
    sql: ${TABLE}.last_audited ;;
  }

  dimension: merchant_processing_fee {
    type: string
    label: "Merchant Processing Fee"
    sql: ${TABLE}.merchant_processing_fee ;;
  }

  dimension: mor_ {
    type: string
    sql: ${TABLE}.mor_ ;;
  }

  dimension: mor_clients_total_merchant_processing_cc_fees_ {
    type: number
    label: "Total Merchant Processing CC Fees"
    value_format_name: usd
    sql: ${TABLE}.mor_clients_total_merchant_processing_cc_fees_ ;;
  }

  dimension_group: original_contract_end_date_dd_mm_yyyy_ {
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
    sql: ${TABLE}.original_contract_end_date_dd_mm_yyyy_ ;;
  }

  dimension_group: original_contract_start_date_dd_mm_yyyy_ {
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
    sql: ${TABLE}.original_contract_start_date_dd_mm_yyyy_ ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: salesforce_id {
    type: string
    sql: ${TABLE}.salesforce_id ;;
  }

  dimension: sfdc_customer_code {
    type: string
    sql: ${TABLE}.sfdc_customer_code ;;
  }

  dimension: term_length_years_ {
    type: number
    sql: ${TABLE}.term_length_years_ ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated_or_current_contract_start_date_dd_mm_yyyy_ {
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
    sql: ${TABLE}.updated_or_current_contract_start_date_dd_mm_yyyy_ ;;
  }

  dimension: vam_member_id {
    type: string
    sql: ${TABLE}.vam_member_id ;;
  }

  dimension: vertical {
    type: string
    sql: ${TABLE}.vertical ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name, product_name]
  }
}
