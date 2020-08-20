view: sf_bti {
  sql_table_name: `fivetran-ovation-tix-warehouse.new_salesforce.bti_c`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

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

  dimension: account_c {
    type: string
    sql: ${TABLE}.account_c ;;
  }

  dimension: actual_2018_comp_convenience_fee_c {
    type: number
    sql: ${TABLE}.actual_2018_comp_convenience_fee_c ;;
  }

  dimension: actual_2018_comp_service_fee_c {
    type: number
    sql: ${TABLE}.actual_2018_comp_service_fee_c ;;
  }

  dimension: actual_2018_comp_ticket_convenience_fee_c {
    type: number
    sql: ${TABLE}.actual_2018_comp_ticket_convenience_fee_c ;;
  }

  dimension: actual_2018_comp_ticket_service_fee_c {
    type: number
    sql: ${TABLE}.actual_2018_comp_ticket_service_fee_c ;;
  }

  dimension: actual_2018_fee_revenue_ex_comps_c {
    type: number
    sql: ${TABLE}.actual_2018_fee_revenue_ex_comps_c ;;
  }

  dimension: actual_2018_non_paid_non_comp_fee_revenu_c {
    type: number
    sql: ${TABLE}.actual_2018_non_paid_non_comp_fee_revenu_c ;;
  }

  dimension: actual_2018_non_paid_non_comp_transactio_c {
    type: number
    sql: ${TABLE}.actual_2018_non_paid_non_comp_transactio_c ;;
  }

  dimension: actual_2018_number_of_comps_c {
    type: number
    sql: ${TABLE}.actual_2018_number_of_comps_c ;;
  }

  dimension: actual_2018_number_of_other_items_c {
    type: number
    sql: ${TABLE}.actual_2018_number_of_other_items_c ;;
  }

  dimension: actual_2018_number_of_tickets_c {
    type: number
    sql: ${TABLE}.actual_2018_number_of_tickets_c ;;
  }

  dimension: actual_2018_number_paid_and_other_items_c {
    type: number
    sql: ${TABLE}.actual_2018_number_paid_and_other_items_c ;;
  }

  dimension: actual_2018_number_tickets_c {
    type: number
    sql: ${TABLE}.actual_2018_number_tickets_c ;;
  }

  dimension: actual_2018_other_items_fee_revenue_c {
    type: number
    sql: ${TABLE}.actual_2018_other_items_fee_revenue_c ;;
  }

  dimension: actual_2018_paid_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.actual_2018_paid_ticket_fee_revenue_c ;;
  }

  dimension: actual_2018_total_comps_c {
    type: number
    sql: ${TABLE}.actual_2018_total_comps_c ;;
  }

  dimension: actual_2019_comp_convenience_fee_c {
    type: number
    sql: ${TABLE}.actual_2019_comp_convenience_fee_c ;;
  }

  dimension: actual_2019_comp_service_fee_c {
    type: number
    sql: ${TABLE}.actual_2019_comp_service_fee_c ;;
  }

  dimension: actual_2019_comp_ticket_convenience_fee_c {
    type: number
    sql: ${TABLE}.actual_2019_comp_ticket_convenience_fee_c ;;
  }

  dimension: actual_2019_comp_ticket_service_fee_c {
    type: number
    sql: ${TABLE}.actual_2019_comp_ticket_service_fee_c ;;
  }

  dimension: actual_2019_fee_revenue_ex_comps_a_c {
    type: number
    sql: ${TABLE}.actual_2019_fee_revenue_ex_comps_a_c ;;
  }

  dimension: actual_2019_fee_revenue_ex_comps_c {
    type: number
    sql: ${TABLE}.actual_2019_fee_revenue_ex_comps_c ;;
  }

  dimension: actual_2019_non_paid_non_comp_fee_revenu_c {
    type: number
    sql: ${TABLE}.actual_2019_non_paid_non_comp_fee_revenu_c ;;
  }

  dimension: actual_2019_non_paid_non_comp_transactio_c {
    type: number
    sql: ${TABLE}.actual_2019_non_paid_non_comp_transactio_c ;;
  }

  dimension: actual_2019_number_of_comps_c {
    type: number
    sql: ${TABLE}.actual_2019_number_of_comps_c ;;
  }

  dimension: actual_2019_number_of_other_items_c {
    type: number
    sql: ${TABLE}.actual_2019_number_of_other_items_c ;;
  }

  dimension: actual_2019_number_of_tickets_c {
    type: number
    sql: ${TABLE}.actual_2019_number_of_tickets_c ;;
  }

  dimension: actual_2019_number_paid_and_other_items_c {
    type: number
    sql: ${TABLE}.actual_2019_number_paid_and_other_items_c ;;
  }

  dimension: actual_2019_numer_tickets_c {
    type: number
    sql: ${TABLE}.actual_2019_numer_tickets_c ;;
  }

  dimension: actual_2019_other_items_fee_revenue_c {
    type: number
    sql: ${TABLE}.actual_2019_other_items_fee_revenue_c ;;
  }

  dimension: actual_2019_paid_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.actual_2019_paid_ticket_fee_revenue_c ;;
  }

  dimension: actual_2019_paid_ticket_non_paid_ticke_c {
    type: number
    sql: ${TABLE}.actual_2019_paid_ticket_non_paid_ticke_c ;;
  }

  dimension: actual_2019_total_comps_c {
    type: number
    sql: ${TABLE}.actual_2019_total_comps_c ;;
  }

  dimension: actual_2019_total_fee_revenue_c {
    type: number
    value_format_name: usd
    sql: ${TABLE}.actual_2019_total_fee_revenue_c ;;
  }

  dimension: actual_2020_fee_revenue_ex_comps_c {
    type: number
    sql: ${TABLE}.actual_2020_fee_revenue_ex_comps_c ;;
  }

  dimension: actual_2020_non_paid_non_comp_fee_revenu_c {
    type: number
    sql: ${TABLE}.actual_2020_non_paid_non_comp_fee_revenu_c ;;
  }

  dimension: actual_2020_non_paid_non_comp_transactio_c {
    type: number
    sql: ${TABLE}.actual_2020_non_paid_non_comp_transactio_c ;;
  }

  dimension: actual_2020_number_of_other_items_c {
    type: number
    sql: ${TABLE}.actual_2020_number_of_other_items_c ;;
  }

  dimension: actual_2020_number_of_tickets_c {
    type: number
    sql: ${TABLE}.actual_2020_number_of_tickets_c ;;
  }

  dimension: actual_2020_number_paid_and_other_items_c {
    type: number
    sql: ${TABLE}.actual_2020_number_paid_and_other_items_c ;;
  }

  dimension: actual_2020_number_tickes_c {
    type: number
    sql: ${TABLE}.actual_2020_number_tickes_c ;;
  }

  dimension: actual_2020_other_items_fee_revenue_c {
    type: number
    sql: ${TABLE}.actual_2020_other_items_fee_revenue_c ;;
  }

  dimension: actual_2020_paid_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.actual_2020_paid_ticket_fee_revenue_c ;;
  }

  dimension: admin_contact_c {
    type: string
    sql: ${TABLE}.admin_contact_c ;;
  }

  dimension: annual_per_ticket_rate_increase_renew_c {
    type: number
    sql: ${TABLE}.annual_per_ticket_rate_increase_renew_c ;;
  }

  dimension: annual_subscription_fee_acv_c {
    type: number
    sql: ${TABLE}.annual_subscription_fee_acv_c ;;
  }

  dimension: annual_subscription_rate_c {
    type: number
    sql: ${TABLE}.annual_subscription_rate_c ;;
  }

  dimension: av_select_transactions_2018_total_comps_c {
    type: number
    sql: ${TABLE}.av_select_transactions_2018_total_comps_c ;;
  }

  dimension: average_2018_2019_client_income_c {
    type: number
    sql: ${TABLE}.average_2018_2019_client_income_c ;;
  }

  dimension: average_2018_2019_non_ticket_transacti_c {
    type: number
    sql: ${TABLE}.average_2018_2019_non_ticket_transacti_c ;;
  }

  dimension: average_2018_2019_number_of_tickets_c {
    type: number
    sql: ${TABLE}.average_2018_2019_number_of_tickets_c ;;
  }

  dimension: average_2018_2019_tfr_per_ticket_c {
    type: number
    sql: ${TABLE}.average_2018_2019_tfr_per_ticket_c ;;
  }

  dimension: average_2018_2019_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.average_2018_2019_ticket_fee_revenue_c ;;
  }

  dimension: average_2018_2019_total_fee_revenue_c {
    type: number
    sql: ${TABLE}.average_2018_2019_total_fee_revenue_c ;;
  }

  dimension: average_2018_2019_total_non_ticket_fee_c {
    type: number
    sql: ${TABLE}.average_2018_2019_total_non_ticket_fee_c ;;
  }

  dimension: average_annual_earned_income_c {
    type: number
    sql: ${TABLE}.average_annual_earned_income_c ;;
  }

  dimension: average_annual_ratio_earned_to_total_c {
    type: number
    sql: ${TABLE}.average_annual_ratio_earned_to_total_c ;;
  }

  dimension: average_annual_total_income_c {
    type: number
    sql: ${TABLE}.average_annual_total_income_c ;;
  }

  dimension: average_historical_volume_c {
    type: number
    sql: ${TABLE}.average_historical_volume_c ;;
  }

  dimension: average_number_of_comps_c {
    type: number
    sql: ${TABLE}.average_number_of_comps_c ;;
  }

  dimension: average_number_of_donations_c {
    type: number
    sql: ${TABLE}.average_number_of_donations_c ;;
  }

  dimension: average_number_of_gift_cards_c {
    type: number
    sql: ${TABLE}.average_number_of_gift_cards_c ;;
  }

  dimension: average_number_of_memberships_c {
    type: number
    sql: ${TABLE}.average_number_of_memberships_c ;;
  }

  dimension: average_number_of_mli_c {
    type: number
    sql: ${TABLE}.average_number_of_mli_c ;;
  }

  dimension: average_number_of_non_ticket_transaction_c {
    type: number
    sql: ${TABLE}.average_number_of_non_ticket_transaction_c ;;
  }

  dimension: average_number_of_paid_tickets_c {
    type: number
    sql: ${TABLE}.average_number_of_paid_tickets_c ;;
  }

  dimension: average_ratio_comps_to_paid_tickets_c {
    type: number
    sql: ${TABLE}.average_ratio_comps_to_paid_tickets_c ;;
  }

  dimension: average_ratio_non_ticket_to_paid_ticket_c {
    type: number
    sql: ${TABLE}.average_ratio_non_ticket_to_paid_ticket_c ;;
  }

  dimension: average_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.average_ticket_fee_revenue_c ;;
  }

  dimension: base_include_ticket_volume_c {
    type: number
    sql: ${TABLE}.base_include_ticket_volume_c ;;
  }

  dimension: bt_rounded_down_2018_2019_c {
    type: number
    sql: ${TABLE}.bt_rounded_down_2018_2019_c ;;
  }

  dimension: bt_rounded_down_2020_c {
    type: number
    sql: ${TABLE}.bt_rounded_down_2020_c ;;
  }

  dimension: bt_rounded_down_c {
    type: number
    sql: ${TABLE}.bt_rounded_down_c ;;
  }

  dimension: bti_cohort_c {
    type: string
    sql: ${TABLE}.bti_cohort_c ;;
  }

  dimension: bti_cohort_name_c {
    type: string
    sql: ${TABLE}.bti_cohort_name_c ;;
  }

  dimension: bti_marketing_cohort_c {
    type: string
    sql: ${TABLE}.bti_marketing_cohort_c ;;
  }

  dimension: calculated_ptf_c {
    type: number
    sql: ${TABLE}.calculated_ptf_c ;;
  }

  dimension: client_signatory_c {
    type: string
    sql: ${TABLE}.client_signatory_c ;;
  }

  dimension: contract_type_c {
    type: string
    sql: ${TABLE}.contract_type_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension_group: date_of_signed_contract_c {
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
    sql: ${TABLE}.date_of_signed_contract_c ;;
  }

  dimension: diff_vs_201819_avg_fee_rev_inc_comps_c {
    type: number
    sql: ${TABLE}.diff_vs_201819_avg_fee_rev_inc_comps_c ;;
  }

  dimension: diff_vs_2018_2019_avg_fee_revenue_in_c {
    type: number
    sql: ${TABLE}.diff_vs_2018_2019_avg_fee_revenue_in_c ;;
  }

  dimension: difference_c {
    type: number
    sql: ${TABLE}.difference_c ;;
  }

  dimension: discount_c {
    type: number
    sql: ${TABLE}.discount_c ;;
  }

  dimension: entitled_ticket_volume_c {
    type: number
    sql: ${TABLE}.entitled_ticket_volume_c ;;
  }

  dimension: final_annual_fee_rate_c {
    type: number
    sql: ${TABLE}.final_annual_fee_rate_c ;;
  }

  dimension_group: first_order_date_date_c {
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
    sql: ${TABLE}.first_order_date_date_c ;;
  }

  dimension: first_order_year_c {
    type: string
    sql: ${TABLE}.first_order_year_c ;;
  }

  dimension: form_monthly_fee_text_c {
    type: string
    sql: ${TABLE}.form_monthly_fee_text_c ;;
  }

  dimension: form_per_ticket_fee_rate_c {
    type: string
    sql: ${TABLE}.form_per_ticket_fee_rate_c ;;
  }

  dimension: historical_arr_max_c {
    type: number
    sql: ${TABLE}.historical_arr_max_c ;;
  }

  dimension: historical_arr_min_c {
    type: number
    sql: ${TABLE}.historical_arr_min_c ;;
  }

  dimension: historical_fee_revenue_2018_for_referen_c {
    type: number
    sql: ${TABLE}.historical_fee_revenue_2018_for_referen_c ;;
  }

  dimension: historical_fee_revenue_2019_for_referen_c {
    type: number
    sql: ${TABLE}.historical_fee_revenue_2019_for_referen_c ;;
  }

  dimension: historical_ticket_volume_2018_for_refer_c {
    type: number
    sql: ${TABLE}.historical_ticket_volume_2018_for_refer_c ;;
  }

  dimension: historical_ticket_volume_2019_for_refer_c {
    type: number
    sql: ${TABLE}.historical_ticket_volume_2019_for_refer_c ;;
  }

  dimension: if_s_2_p_3_year_deal_to_waive_new_fixed_c {
    type: number
    sql: ${TABLE}.if_s_2_p_3_year_deal_to_waive_new_fixed_c ;;
  }

  dimension: included_ticket_volume_c {
    type: number
    sql: ${TABLE}.included_ticket_volume_c ;;
  }

  dimension: included_tickets_with_bonus_c {
    type: number
    sql: ${TABLE}.included_tickets_with_bonus_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_parent_c {
    type: yesno
    sql: ${TABLE}.is_parent_c ;;
  }

  dimension: is_standard_c {
    type: yesno
    sql: ${TABLE}.is_standard_c ;;
  }

  dimension: key_signing_contact_c {
    type: string
    sql: ${TABLE}.key_signing_contact_c ;;
  }

  dimension_group: last_activity {
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
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced {
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
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: measure_annual_subscription_fee_c {
    type: number
    sql: ${TABLE}.measure_annual_subscription_fee_c ;;
  }

  dimension: merchant_processing_fee_c {
    type: number
    sql: ${TABLE}.merchant_processing_fee_c ;;
  }

  dimension_group: min_order_date_date_c {
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
    sql: ${TABLE}.min_order_date_date_c ;;
  }

  dimension: min_order_date_year_c {
    type: number
    sql: ${TABLE}.min_order_date_year_c ;;
  }

  dimension: min_per_ticket_fee_c {
    type: number
    sql: ${TABLE}.min_per_ticket_fee_c ;;
  }

  dimension: min_ptf_c {
    type: number
    sql: ${TABLE}.min_ptf_c ;;
  }

  dimension: minimum_per_ticket_fee_c {
    type: number
    sql: ${TABLE}.minimum_per_ticket_fee_c ;;
  }

  dimension: monthly_access_fee_c {
    type: number
    sql: ${TABLE}.monthly_access_fee_c ;;
  }

  dimension: months_active_in_2018_c {
    type: number
    sql: ${TABLE}.months_active_in_2018_c ;;
  }

  dimension: months_active_in_2019_c {
    type: number
    sql: ${TABLE}.months_active_in_2019_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: new_access_fee_c {
    type: number
    sql: ${TABLE}.new_access_fee_c ;;
  }

  dimension: new_fee_rate_c {
    type: number
    sql: ${TABLE}.new_fee_rate_c ;;
  }

  dimension: new_paid_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.new_paid_ticket_fee_revenue_c ;;
  }

  dimension: new_per_paid_ticket_fee_rate_c {
    type: number
    sql: ${TABLE}.new_per_paid_ticket_fee_rate_c ;;
  }

  dimension: new_total_annual_fee_based_on_historica_c {
    type: number
    sql: ${TABLE}.new_total_annual_fee_based_on_historica_c ;;
  }

  dimension: new_total_annual_fee_c {
    type: number
    sql: ${TABLE}.new_total_annual_fee_c ;;
  }

  dimension: new_total_annual_fee_historical_tv_c {
    type: number
    sql: ${TABLE}.new_total_annual_fee_historical_tv_c ;;
  }

  dimension: new_total_annual_fee_historical_volume_c {
    type: number
    sql: ${TABLE}.new_total_annual_fee_historical_volume_c ;;
  }

  dimension: new_transactional_paid_ticket_fee_rate_c {
    type: number
    sql: ${TABLE}.new_transactional_paid_ticket_fee_rate_c ;;
  }

  dimension: nonprofit_c {
    type: yesno
    sql: ${TABLE}.nonprofit_c ;;
  }

  dimension: opportunity_c {
    type: string
    sql: ${TABLE}.opportunity_c ;;
  }

  dimension: outlier_c {
    type: yesno
    sql: ${TABLE}.outlier_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: parent_bti_rate_c {
    type: string
    sql: ${TABLE}.parent_bti_rate_c ;;
  }

  dimension_group: potential_signing_c {
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
    sql: ${TABLE}.potential_signing_c ;;
  }

  dimension: price_model_bti_band_c {
    type: string
    sql: ${TABLE}.price_model_bti_band_c ;;
  }

  dimension: price_model_bti_transaction_c {
    type: string
    sql: ${TABLE}.price_model_bti_transaction_c ;;
  }

  dimension: pricing_cohort_c {
    type: string
    sql: ${TABLE}.pricing_cohort_c ;;
  }

  dimension: pricing_sub_cohort_c {
    type: string
    sql: ${TABLE}.pricing_sub_cohort_c ;;
  }

  dimension: pro_rated_18_19_fee_per_sum_of_paid_no_c {
    type: number
    sql: ${TABLE}.pro_rated_18_19_fee_per_sum_of_paid_no_c ;;
  }

  dimension: pro_rated_2018_19_avg_number_of_paid_t_c {
    type: number
    sql: ${TABLE}.pro_rated_2018_19_avg_number_of_paid_t_c ;;
  }

  dimension: pro_rated_2018_19_avg_paid_non_paid_tick_c {
    type: number
    sql: ${TABLE}.pro_rated_2018_19_avg_paid_non_paid_tick_c ;;
  }

  dimension: pro_rated_2018_non_paid_non_comp_fee_rev_c {
    type: number
    sql: ${TABLE}.pro_rated_2018_non_paid_non_comp_fee_rev_c ;;
  }

  dimension: pro_rated_2018_non_paid_non_comp_transact_c {
    type: number
    sql: ${TABLE}.pro_rated_2018_non_paid_non_comp_transact_c ;;
  }

  dimension: pro_rated_2018_number_of_tickets_c {
    type: number
    sql: ${TABLE}.pro_rated_2018_number_of_tickets_c ;;
  }

  dimension: pro_rated_2018_paid_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.pro_rated_2018_paid_ticket_fee_revenue_c ;;
  }

  dimension: pro_rated_2018_total_comp_fee_revenue_c {
    type: number
    sql: ${TABLE}.pro_rated_2018_total_comp_fee_revenue_c ;;
  }

  dimension: pro_rated_2018_total_comps_c {
    type: number
    sql: ${TABLE}.pro_rated_2018_total_comps_c ;;
  }

  dimension: pro_rated_2019_non_paid_non_comp_fee_rev_c {
    type: number
    sql: ${TABLE}.pro_rated_2019_non_paid_non_comp_fee_rev_c ;;
  }

  dimension: pro_rated_2019_non_paid_non_comp_transact_c {
    type: number
    sql: ${TABLE}.pro_rated_2019_non_paid_non_comp_transact_c ;;
  }

  dimension: pro_rated_2019_paid_non_paid_tick_com_c {
    type: number
    sql: ${TABLE}.pro_rated_2019_paid_non_paid_tick_com_c ;;
  }

  dimension: pro_rated_2019_paid_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.pro_rated_2019_paid_ticket_fee_revenue_c ;;
  }

  dimension: pro_rated_2019_total_comp_fee_revenue_c {
    type: number
    sql: ${TABLE}.pro_rated_2019_total_comp_fee_revenue_c ;;
  }

  dimension: pro_rated_2019_total_comps_c {
    type: number
    sql: ${TABLE}.pro_rated_2019_total_comps_c ;;
  }

  dimension: pro_rated_2020_avg_paid_non_paid_ticke_c {
    type: number
    sql: ${TABLE}.pro_rated_2020_avg_paid_non_paid_ticke_c ;;
  }

  dimension: pro_rated_2020_non_paid_non_comp_fee_rev_c {
    type: number
    sql: ${TABLE}.pro_rated_2020_non_paid_non_comp_fee_rev_c ;;
  }

  dimension: pro_rated_2020_non_paid_non_comp_transact_c {
    type: number
    sql: ${TABLE}.pro_rated_2020_non_paid_non_comp_transact_c ;;
  }

  dimension: pro_rated_2020_number_of_paid_tickets_c {
    type: number
    sql: ${TABLE}.pro_rated_2020_number_of_paid_tickets_c ;;
  }

  dimension: pro_rated_2020_paid_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.pro_rated_2020_paid_ticket_fee_revenue_c ;;
  }

  dimension: pro_rated_avg_2018_19_total_comp_fee_rev_c {
    type: number
    sql: ${TABLE}.pro_rated_avg_2018_19_total_comp_fee_rev_c ;;
  }

  dimension: pro_rated_fee_per_sum_of_paid_non_paid_c {
    type: number
    sql: ${TABLE}.pro_rated_fee_per_sum_of_paid_non_paid_c ;;
  }

  dimension: promo_1_c {
    type: yesno
    sql: ${TABLE}.promo_1_c ;;
  }

  dimension: promo_2_c {
    type: yesno
    sql: ${TABLE}.promo_2_c ;;
  }

  dimension: promo_3_c {
    type: yesno
    sql: ${TABLE}.promo_3_c ;;
  }

  dimension: prorate_2018_number_tickets_c {
    type: number
    sql: ${TABLE}.prorate_2018_number_tickets_c ;;
  }

  dimension: prorate_2019_number_tickets_c {
    type: number
    sql: ${TABLE}.prorate_2019_number_tickets_c ;;
  }

  dimension: prorate_2020_number_tickets_c {
    type: number
    sql: ${TABLE}.prorate_2020_number_tickets_c ;;
  }

  dimension: prorated_2018_19_fee_revenue_ex_comps_c {
    type: number
    sql: ${TABLE}.prorated_2018_19_fee_revenue_ex_comps_c ;;
  }

  dimension: prorated_2018_fee_revenue_ex_comps_c {
    type: number
    sql: ${TABLE}.prorated_2018_fee_revenue_ex_comps_c ;;
  }

  dimension: prorated_2018_number_of_comps_c {
    type: number
    sql: ${TABLE}.prorated_2018_number_of_comps_c ;;
  }

  dimension: prorated_2018_number_of_other_items_c {
    type: number
    sql: ${TABLE}.prorated_2018_number_of_other_items_c ;;
  }

  dimension: prorated_2018_number_of_tickets_c {
    type: number
    sql: ${TABLE}.prorated_2018_number_of_tickets_c ;;
  }

  dimension: prorated_2018_number_paid_and_other_item_c {
    type: number
    sql: ${TABLE}.prorated_2018_number_paid_and_other_item_c ;;
  }

  dimension: prorated_2018_other_items_fee_revenue_c {
    type: number
    sql: ${TABLE}.prorated_2018_other_items_fee_revenue_c ;;
  }

  dimension: prorated_2018_paid_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.prorated_2018_paid_ticket_fee_revenue_c ;;
  }

  dimension: prorated_2018_total_comp_fee_revenue_c {
    type: number
    sql: ${TABLE}.prorated_2018_total_comp_fee_revenue_c ;;
  }

  dimension: prorated_2018_total_comps_c {
    type: number
    sql: ${TABLE}.prorated_2018_total_comps_c ;;
  }

  dimension: prorated_2019_fee_revenue_ex_comps_a_c {
    type: number
    sql: ${TABLE}.prorated_2019_fee_revenue_ex_comps_a_c ;;
  }

  dimension: prorated_2019_fee_revenue_ex_comps_c {
    type: number
    sql: ${TABLE}.prorated_2019_fee_revenue_ex_comps_c ;;
  }

  dimension: prorated_2019_number_of_comps_c {
    type: number
    sql: ${TABLE}.prorated_2019_number_of_comps_c ;;
  }

  dimension: prorated_2019_number_of_other_items_c {
    type: number
    sql: ${TABLE}.prorated_2019_number_of_other_items_c ;;
  }

  dimension: prorated_2019_number_of_tickets_c {
    type: number
    sql: ${TABLE}.prorated_2019_number_of_tickets_c ;;
  }

  dimension: prorated_2019_number_paid_and_other_item_c {
    type: number
    sql: ${TABLE}.prorated_2019_number_paid_and_other_item_c ;;
  }

  dimension: prorated_2019_other_items_fee_revenue_c {
    type: number
    sql: ${TABLE}.prorated_2019_other_items_fee_revenue_c ;;
  }

  dimension: prorated_2019_paid_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.prorated_2019_paid_ticket_fee_revenue_c ;;
  }

  dimension: prorated_2019_total_comp_fee_revenue_c {
    type: number
    sql: ${TABLE}.prorated_2019_total_comp_fee_revenue_c ;;
  }

  dimension: prorated_2019_total_comps_c {
    type: number
    sql: ${TABLE}.prorated_2019_total_comps_c ;;
  }

  dimension: prorated_2019_total_fee_revenue_c {
    type: number
    sql: ${TABLE}.prorated_2019_total_fee_revenue_c ;;
  }

  dimension: prorated_2020_avg_fee_revenue_ex_comps_c {
    type: number
    sql: ${TABLE}.prorated_2020_avg_fee_revenue_ex_comps_c ;;
  }

  dimension: prorated_2020_fee_revenue_ex_comps_a_c {
    type: number
    sql: ${TABLE}.prorated_2020_fee_revenue_ex_comps_a_c ;;
  }

  dimension: prorated_2020_fee_revenue_ex_comps_c {
    type: number
    sql: ${TABLE}.prorated_2020_fee_revenue_ex_comps_c ;;
  }

  dimension: prorated_2020_number_of_other_items_c {
    type: number
    sql: ${TABLE}.prorated_2020_number_of_other_items_c ;;
  }

  dimension: prorated_2020_number_of_paid_tickets_c {
    type: number
    sql: ${TABLE}.prorated_2020_number_of_paid_tickets_c ;;
  }

  dimension: prorated_2020_number_of_tickets_c {
    type: number
    sql: ${TABLE}.prorated_2020_number_of_tickets_c ;;
  }

  dimension: prorated_2020_number_paid_and_other_a_c {
    type: number
    sql: ${TABLE}.prorated_2020_number_paid_and_other_a_c ;;
  }

  dimension: prorated_2020_number_paid_and_other_item_c {
    type: number
    sql: ${TABLE}.prorated_2020_number_paid_and_other_item_c ;;
  }

  dimension: prorated_2020_other_items_fee_revenue_c {
    type: number
    sql: ${TABLE}.prorated_2020_other_items_fee_revenue_c ;;
  }

  dimension: prorated_2020_paid_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.prorated_2020_paid_ticket_fee_revenue_c ;;
  }

  dimension: prorated_average_comp_fee_revenue_c {
    type: number
    sql: ${TABLE}.prorated_average_comp_fee_revenue_c ;;
  }

  dimension: prorated_average_fee_revenue_ex_comps_c {
    type: number
    sql: ${TABLE}.prorated_average_fee_revenue_ex_comps_c ;;
  }

  dimension: prorated_average_paid_tickets_c {
    type: number
    sql: ${TABLE}.prorated_average_paid_tickets_c ;;
  }

  dimension: py_ticket_estimate_c {
    type: number
    sql: ${TABLE}.py_ticket_estimate_c ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: renewal_annual_fee_increase_c {
    type: number
    sql: ${TABLE}.renewal_annual_fee_increase_c ;;
  }

  dimension: rounded_down_2018_19_to_nearest_0_05_fee_c {
    type: number
    sql: ${TABLE}.rounded_down_2018_19_to_nearest_0_05_fee_c ;;
  }

  dimension: rounded_down_2020_to_nearest_0_05_fee_c {
    type: number
    sql: ${TABLE}.rounded_down_2020_to_nearest_0_05_fee_c ;;
  }

  dimension: sports_campus_outliers_c {
    type: yesno
    sql: ${TABLE}.sports_campus_outliers_c ;;
  }

  dimension: sub_cohort_c {
    type: number
    sql: ${TABLE}.sub_cohort_c ;;
  }

  dimension_group: system_modstamp {
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
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: term_reference_c {
    type: number
    sql: ${TABLE}.term_reference_c ;;
  }

  dimension: term_text_c {
    type: string
    sql: ${TABLE}.term_text_c ;;
  }

  dimension: term_year_c {
    type: number
    sql: ${TABLE}.term_year_c ;;
  }

  dimension: total_2018_client_income_c {
    type: number
    sql: ${TABLE}.total_2018_client_income_c ;;
  }

  dimension: total_2019_client_income_c {
    type: number
    sql: ${TABLE}.total_2019_client_income_c ;;
  }

  dimension: total_historical_fee_revenue_c {
    type: number
    sql: ${TABLE}.total_historical_fee_revenue_c ;;
  }

  dimension: total_two_year_fee_revenue_c {
    type: number
    sql: ${TABLE}.total_two_year_fee_revenue_c ;;
  }

  dimension: total_two_year_historical_volume_c {
    type: number
    sql: ${TABLE}.total_two_year_historical_volume_c ;;
  }

  dimension: var_historical_vs_offer_c {
    type: number
    sql: ${TABLE}.var_historical_vs_offer_c ;;
  }

  dimension: volume_bonus_value_c {
    type: number
    sql: ${TABLE}.volume_bonus_value_c ;;
  }

  dimension: will_use_fundraising_tool_c {
    type: yesno
    sql: ${TABLE}.will_use_fundraising_tool_c ;;
  }

  dimension: x_2018_2019_average_fee_rate_c {
    type: number
    sql: ${TABLE}.x_2018_2019_average_fee_rate_c ;;
  }

  dimension: x_2018_2019_average_paid_ticket_revenue_c {
    type: number
    sql: ${TABLE}.x_2018_2019_average_paid_ticket_revenue_c ;;
  }

  dimension: x_2018_2019_total_ticket_fee_revenue_c {
    type: number
    sql: ${TABLE}.x_2018_2019_total_ticket_fee_revenue_c ;;
  }

  dimension: x_2018_donation_income_c {
    type: number
    sql: ${TABLE}.x_2018_donation_income_c ;;
  }

  dimension: x_2018_donation_income_usd_c {
    type: number
    sql: ${TABLE}.x_2018_donation_income_usd_c ;;
  }

  dimension: x_2018_donation_service_fee_c {
    type: number
    sql: ${TABLE}.x_2018_donation_service_fee_c ;;
  }

  dimension: x_2018_donation_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2018_donation_service_fee_usd_c ;;
  }

  dimension: x_2018_earned_income_c {
    type: number
    sql: ${TABLE}.x_2018_earned_income_c ;;
  }

  dimension: x_2018_earned_income_usd_c {
    type: number
    sql: ${TABLE}.x_2018_earned_income_usd_c ;;
  }

  dimension: x_2018_gift_card_amount_c {
    type: number
    sql: ${TABLE}.x_2018_gift_card_amount_c ;;
  }

  dimension: x_2018_gift_card_amount_usd_c {
    type: number
    sql: ${TABLE}.x_2018_gift_card_amount_usd_c ;;
  }

  dimension: x_2018_membership_sales_c {
    type: number
    sql: ${TABLE}.x_2018_membership_sales_c ;;
  }

  dimension: x_2018_membership_sales_usd_c {
    type: number
    sql: ${TABLE}.x_2018_membership_sales_usd_c ;;
  }

  dimension: x_2018_months_active_c {
    type: number
    sql: ${TABLE}.x_2018_months_active_c ;;
  }

  dimension: x_2018_number_of_gift_cards_c {
    type: number
    sql: ${TABLE}.x_2018_number_of_gift_cards_c ;;
  }

  dimension: x_2018_number_of_membership_sales_c {
    type: number
    sql: ${TABLE}.x_2018_number_of_membership_sales_c ;;
  }

  dimension: x_2018_number_of_mli_ex_tipjar_c {
    type: number
    sql: ${TABLE}.x_2018_number_of_mli_ex_tipjar_c ;;
  }

  dimension: x_2018_number_of_mli_excludes_tipjar_c {
    type: number
    sql: ${TABLE}.x_2018_number_of_mli_excludes_tipjar_c ;;
  }

  dimension: x_2018_number_of_tickets_c {
    type: number
    sql: ${TABLE}.x_2018_number_of_tickets_c ;;
  }

  dimension: x_2018_number_of_total_comps_c {
    type: number
    sql: ${TABLE}.x_2018_number_of_total_comps_c ;;
  }

  dimension: x_2018_ticket_convenience_fee_excl_comps_c {
    type: number
    sql: ${TABLE}.x_2018_ticket_convenience_fee_excl_comps_c ;;
  }

  dimension: x_2018_ticket_convenience_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2018_ticket_convenience_fee_usd_c ;;
  }

  dimension: x_2018_ticket_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2018_ticket_service_fee_usd_c ;;
  }

  dimension: x_2018_ticket_service_fee_without_comps_c {
    type: number
    sql: ${TABLE}.x_2018_ticket_service_fee_without_comps_c ;;
  }

  dimension: x_2018_total_fee_revenue_c {
    type: number
    sql: ${TABLE}.x_2018_total_fee_revenue_c ;;
  }

  dimension: x_2018_total_gift_card_service_fee_c {
    type: number
    sql: ${TABLE}.x_2018_total_gift_card_service_fee_c ;;
  }

  dimension: x_2018_total_gift_card_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2018_total_gift_card_service_fee_usd_c ;;
  }

  dimension: x_2018_total_membership_convenience_fee_c {
    type: number
    sql: ${TABLE}.x_2018_total_membership_convenience_fee_c ;;
  }

  dimension: x_2018_total_membership_service_fee_c {
    type: number
    sql: ${TABLE}.x_2018_total_membership_service_fee_c ;;
  }

  dimension: x_2018_total_membership_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2018_total_membership_service_fee_usd_c ;;
  }

  dimension: x_2018_total_mli_ex_tipjar_c {
    type: number
    sql: ${TABLE}.x_2018_total_mli_ex_tipjar_c ;;
  }

  dimension: x_2018_total_mli_misc_no_tip_c {
    type: number
    sql: ${TABLE}.x_2018_total_mli_misc_no_tip_c ;;
  }

  dimension: x_2018_total_mli_service_fee_c {
    type: number
    sql: ${TABLE}.x_2018_total_mli_service_fee_c ;;
  }

  dimension: x_2018_total_mli_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2018_total_mli_service_fee_usd_c ;;
  }

  dimension: x_2018_total_mli_usd_excludes_tipjar_c {
    type: number
    sql: ${TABLE}.x_2018_total_mli_usd_excludes_tipjar_c ;;
  }

  dimension: x_2018_total_number_donations_c {
    type: number
    sql: ${TABLE}.x_2018_total_number_donations_c ;;
  }

  dimension: x_2018_total_tipjar_donation_c {
    type: number
    sql: ${TABLE}.x_2018_total_tipjar_donation_c ;;
  }

  dimension: x_2018_total_tipjar_service_fee_c {
    type: number
    sql: ${TABLE}.x_2018_total_tipjar_service_fee_c ;;
  }

  dimension: x_2019_donation_income_c {
    type: number
    sql: ${TABLE}.x_2019_donation_income_c ;;
  }

  dimension: x_2019_donation_income_usd_c {
    type: number
    sql: ${TABLE}.x_2019_donation_income_usd_c ;;
  }

  dimension: x_2019_donation_service_fee_c {
    type: number
    sql: ${TABLE}.x_2019_donation_service_fee_c ;;
  }

  dimension: x_2019_donation_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2019_donation_service_fee_usd_c ;;
  }

  dimension: x_2019_earned_income_c {
    type: number
    sql: ${TABLE}.x_2019_earned_income_c ;;
  }

  dimension: x_2019_earned_income_usd_c {
    type: number
    sql: ${TABLE}.x_2019_earned_income_usd_c ;;
  }

  dimension: x_2019_gift_card_amount_c {
    type: number
    sql: ${TABLE}.x_2019_gift_card_amount_c ;;
  }

  dimension: x_2019_gift_card_amount_usd_c {
    type: number
    sql: ${TABLE}.x_2019_gift_card_amount_usd_c ;;
  }

  dimension: x_2019_membership_sales_c {
    type: number
    sql: ${TABLE}.x_2019_membership_sales_c ;;
  }

  dimension: x_2019_membership_sales_usd_c {
    type: number
    sql: ${TABLE}.x_2019_membership_sales_usd_c ;;
  }

  dimension: x_2019_months_active_c {
    type: number
    sql: ${TABLE}.x_2019_months_active_c ;;
  }

  dimension: x_2019_number_of_gift_cards_c {
    type: number
    sql: ${TABLE}.x_2019_number_of_gift_cards_c ;;
  }

  dimension: x_2019_number_of_membership_sales_c {
    type: number
    sql: ${TABLE}.x_2019_number_of_membership_sales_c ;;
  }

  dimension: x_2019_number_of_mli_ex_tipjar_c {
    type: number
    sql: ${TABLE}.x_2019_number_of_mli_ex_tipjar_c ;;
  }

  dimension: x_2019_number_of_mli_excludes_tipjar_c {
    type: number
    sql: ${TABLE}.x_2019_number_of_mli_excludes_tipjar_c ;;
  }

  dimension: x_2019_number_of_tickets_c {
    type: number
    sql: ${TABLE}.x_2019_number_of_tickets_c ;;
  }

  dimension: x_2019_number_of_total_comps_c {
    type: number
    sql: ${TABLE}.x_2019_number_of_total_comps_c ;;
  }

  dimension: x_2019_ticket_convenience_fee_excl_comps_c {
    type: number
    sql: ${TABLE}.x_2019_ticket_convenience_fee_excl_comps_c ;;
  }

  dimension: x_2019_ticket_convenience_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2019_ticket_convenience_fee_usd_c ;;
  }

  dimension: x_2019_ticket_service_fee_excl_comps_c {
    type: number
    sql: ${TABLE}.x_2019_ticket_service_fee_excl_comps_c ;;
  }

  dimension: x_2019_ticket_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2019_ticket_service_fee_usd_c ;;
  }

  dimension: x_2019_total_fee_revenue_c {
    type: number
    sql: ${TABLE}.x_2019_total_fee_revenue_c ;;
  }

  dimension: x_2019_total_gift_card_service_fee_c {
    type: number
    sql: ${TABLE}.x_2019_total_gift_card_service_fee_c ;;
  }

  dimension: x_2019_total_gift_card_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2019_total_gift_card_service_fee_usd_c ;;
  }

  dimension: x_2019_total_membership_convenience_fee_c {
    type: number
    sql: ${TABLE}.x_2019_total_membership_convenience_fee_c ;;
  }

  dimension: x_2019_total_membership_service_fee_c {
    type: number
    sql: ${TABLE}.x_2019_total_membership_service_fee_c ;;
  }

  dimension: x_2019_total_membership_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2019_total_membership_service_fee_usd_c ;;
  }

  dimension: x_2019_total_mli_ex_tipjar_c {
    type: number
    sql: ${TABLE}.x_2019_total_mli_ex_tipjar_c ;;
  }

  dimension: x_2019_total_mli_misc_no_tip_c {
    type: number
    sql: ${TABLE}.x_2019_total_mli_misc_no_tip_c ;;
  }

  dimension: x_2019_total_mli_service_fee_c {
    type: number
    sql: ${TABLE}.x_2019_total_mli_service_fee_c ;;
  }

  dimension: x_2019_total_mli_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2019_total_mli_service_fee_usd_c ;;
  }

  dimension: x_2019_total_mli_usd_excludes_tipjar_c {
    type: number
    sql: ${TABLE}.x_2019_total_mli_usd_excludes_tipjar_c ;;
  }

  dimension: x_2019_total_number_donations_c {
    type: number
    sql: ${TABLE}.x_2019_total_number_donations_c ;;
  }

  dimension: x_2019_total_tipjar_donation_c {
    type: number
    sql: ${TABLE}.x_2019_total_tipjar_donation_c ;;
  }

  dimension: x_2019_total_tipjar_service_fee_c {
    type: number
    sql: ${TABLE}.x_2019_total_tipjar_service_fee_c ;;
  }

  dimension: x_2020_donation_income_c {
    type: number
    sql: ${TABLE}.x_2020_donation_income_c ;;
  }

  dimension: x_2020_donation_income_usd_c {
    type: number
    sql: ${TABLE}.x_2020_donation_income_usd_c ;;
  }

  dimension: x_2020_donation_service_fee_c {
    type: number
    sql: ${TABLE}.x_2020_donation_service_fee_c ;;
  }

  dimension: x_2020_donation_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2020_donation_service_fee_usd_c ;;
  }

  dimension: x_2020_earned_income_c {
    type: number
    sql: ${TABLE}.x_2020_earned_income_c ;;
  }

  dimension: x_2020_earned_income_usd_c {
    type: number
    sql: ${TABLE}.x_2020_earned_income_usd_c ;;
  }

  dimension: x_2020_gift_card_amount_c {
    type: number
    sql: ${TABLE}.x_2020_gift_card_amount_c ;;
  }

  dimension: x_2020_gift_card_amount_usd_c {
    type: number
    sql: ${TABLE}.x_2020_gift_card_amount_usd_c ;;
  }

  dimension: x_2020_membership_sales_c {
    type: number
    sql: ${TABLE}.x_2020_membership_sales_c ;;
  }

  dimension: x_2020_membership_sales_usd_c {
    type: number
    sql: ${TABLE}.x_2020_membership_sales_usd_c ;;
  }

  dimension: x_2020_number_of_gift_cards_c {
    type: number
    sql: ${TABLE}.x_2020_number_of_gift_cards_c ;;
  }

  dimension: x_2020_number_of_membership_sales_c {
    type: number
    sql: ${TABLE}.x_2020_number_of_membership_sales_c ;;
  }

  dimension: x_2020_number_of_mli_ex_tipjar_c {
    type: number
    sql: ${TABLE}.x_2020_number_of_mli_ex_tipjar_c ;;
  }

  dimension: x_2020_number_of_mli_excludes_tipjar_c {
    type: number
    sql: ${TABLE}.x_2020_number_of_mli_excludes_tipjar_c ;;
  }

  dimension: x_2020_number_of_tickets_c {
    type: number
    sql: ${TABLE}.x_2020_number_of_tickets_c ;;
  }

  dimension: x_2020_ticket_convenience_fee_c {
    type: number
    sql: ${TABLE}.x_2020_ticket_convenience_fee_c ;;
  }

  dimension: x_2020_ticket_convenience_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2020_ticket_convenience_fee_usd_c ;;
  }

  dimension: x_2020_ticket_service_fee_c {
    type: number
    sql: ${TABLE}.x_2020_ticket_service_fee_c ;;
  }

  dimension: x_2020_ticket_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2020_ticket_service_fee_usd_c ;;
  }

  dimension: x_2020_total_gift_card_service_fee_c {
    type: number
    sql: ${TABLE}.x_2020_total_gift_card_service_fee_c ;;
  }

  dimension: x_2020_total_gift_card_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2020_total_gift_card_service_fee_usd_c ;;
  }

  dimension: x_2020_total_membership_convenience_fee_c {
    type: number
    sql: ${TABLE}.x_2020_total_membership_convenience_fee_c ;;
  }

  dimension: x_2020_total_membership_service_fee_c {
    type: number
    sql: ${TABLE}.x_2020_total_membership_service_fee_c ;;
  }

  dimension: x_2020_total_membership_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2020_total_membership_service_fee_usd_c ;;
  }

  dimension: x_2020_total_mli_ex_tipjar_c {
    type: number
    sql: ${TABLE}.x_2020_total_mli_ex_tipjar_c ;;
  }

  dimension: x_2020_total_mli_service_fee_c {
    type: number
    sql: ${TABLE}.x_2020_total_mli_service_fee_c ;;
  }

  dimension: x_2020_total_mli_service_fee_usd_c {
    type: number
    sql: ${TABLE}.x_2020_total_mli_service_fee_usd_c ;;
  }

  dimension: x_2020_total_mli_usd_excludes_tipjar_c {
    type: number
    sql: ${TABLE}.x_2020_total_mli_usd_excludes_tipjar_c ;;
  }

  dimension: x_2020_total_number_donations_c {
    type: number
    sql: ${TABLE}.x_2020_total_number_donations_c ;;
  }

  dimension: x_2020_total_tipjar_donation_c {
    type: number
    sql: ${TABLE}.x_2020_total_tipjar_donation_c ;;
  }

  dimension: x_2020_total_tipjar_service_fee_c {
    type: number
    sql: ${TABLE}.x_2020_total_tipjar_service_fee_c ;;
  }

  dimension: year_1_arr_as_of_client_rev_c {
    type: number
    sql: ${TABLE}.year_1_arr_as_of_client_rev_c ;;
  }

  dimension: year_1_arr_c {
    type: number
    sql: ${TABLE}.year_1_arr_c ;;
  }

  dimension: year_1_c {
    type: number
    sql: ${TABLE}.year_1_c ;;
  }

  dimension: year_2_arr_retention_calc_c {
    type: number
    sql: ${TABLE}.year_2_arr_retention_calc_c ;;
  }

  dimension: year_2_projected_transactional_revenue_c {
    type: number
    sql: ${TABLE}.year_2_projected_transactional_revenue_c ;;
  }

  dimension: year_2_system_access_fee_c {
    type: number
    sql: ${TABLE}.year_2_system_access_fee_c ;;
  }

  dimension: year_2_total_revenue_c {
    type: number
    sql: ${TABLE}.year_2_total_revenue_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
