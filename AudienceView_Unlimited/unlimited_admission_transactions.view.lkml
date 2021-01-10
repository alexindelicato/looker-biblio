view: unlimited_admission_transactions {
  derived_table: {
    sql:
    SELECT
      UUID,
      client_name,
      sf_account_name,
      sf_account_id,
      cast(audit_time as TIMESTAMP) as audit_date_time,
      YEAR,
      quarter,
      userrole_name,
      userrole_group,
      single_admission_net_sold_amount,
      bundle_admission_net_sold_amount,
      single_admission_sold_volume,
      bundle_admission_sold_volume,
      single_admission_net_paid_amount,
      bundle_admission_net_paid_amount,
      single_admission_paid_volume,
      bundle_admission_paid_volume,
      single_admission_comp_volume,
      bundle_admission_comp_volume,
      total_admission_comp_volume,
      total_admission_sold_volume,
      total_admission_net_sold_amount,
      CHG1,
      CHG2,
      CHG3,
      CHG4,
      CHG5,
      total_admission_gross_sold_amount,
      orderadmission_sale_action,
      orderadmission_paid_action,
      orderadmission_record_state,
      orderadmission_sale_action_description,
      orderadmission_paid_action_description,
      orderadmission_record_state_description,
      GROSS_USD
    FROM audienceview.unlimited_admission_transactions as admissions
--    INNER JOIN audienceview.unlimited_client_facts as facts on facts.client_name = admissions.client_name

      ;;

      sql_trigger_value: select max(audit_time) from `fivetran-ovation-tix-warehouse.audienceview.unlimited_admission_transactions`;;
    }


    dimension:  UUID  { type: string sql: ${TABLE}.UUID ;; }
    dimension:  client_name { type: string sql: ${TABLE}.client_name ;; }
    dimension:  audit_time  { type: string sql: ${TABLE}.audit_time ;; }
    dimension_group: audit_date_time { type: time sql: ${TABLE}.audit_date_time ;; }

    dimension:  YEAR  { type: string sql: ${TABLE}. YEAR  ;; }
    dimension:  quarter { type: string sql: ${TABLE}. quarter ;; }
    dimension:  userrole_name { type: string sql: ${TABLE}.userrole_name ;; }
    dimension:  userrole_group  { type: string sql: ${TABLE}.userrole_group ;; }

    dimension:  orderadmission_sale_action  { type: number sql: ${TABLE}.orderadmission_sale_action ;; }
    dimension:  orderadmission_paid_action  { type: number sql: ${TABLE}.orderadmission_paid_action ;; }
    dimension:  orderadmission_record_state { type: string sql: ${TABLE}.orderadmission_record_state ;; }
    dimension:  orderadmission_sale_action_description  { type: string sql: ${TABLE}.orderadmission_sale_action_description ;; }
    dimension:  orderadmission_paid_action_description  { type: string sql: ${TABLE}.orderadmission_paid_action_description ;; }
    dimension:  orderadmission_record_state_description { type: string sql: ${TABLE}.orderadmission_record_state_description ;; }

    dimension: single_admission_sold_volume { type: number label: "Single Admission Sold Count" sql: ${TABLE}.single_admission_sold_volume ;; }
    dimension: single_admission_paid_volume { type: number label: "Single Admission Paid Count" sql: ${TABLE}.single_admission_paid_volume ;; }
    dimension: bundle_admission_sold_volume { type: number label: "Bundle Admission Sold Count" sql: ${TABLE}.bundle_admission_sold_volume ;; }
    dimension: bundle_admission_paid_volume { type: number label: "Bundle Admission Paid Count" sql: ${TABLE}.bundle_admission_paid_volume ;; }

    dimension: single_admission_sold_amount { type: number label: "Single Admission Sold Amount" sql: ${TABLE}.single_admission_sold_amount ;; }
    dimension: single_admission_paid_amount { type: number label: "Single Admission Paid Amount" sql: ${TABLE}.single_admission_net_paid_amount ;; }
    dimension: bundle_admission_sold_amount { type: number label: "Bundle Admission Sold Amount" sql: ${TABLE}.bundle_admission_net_sold_amount ;; }
    dimension: bundle_admission_paid_amount { type: number label: "Bundle Admission Paid Amount" sql: ${TABLE}.bundle_admission_net_paid_amount ;; }

    dimension: single_admission_comp_volume { type: number label: "Single Admission Comp Volume" sql: ${TABLE}.single_admission_comp_volume ;; }
    dimension: bundle_admission_comp_volume { type: number label: "Bundle Admission Comp Volume" sql: ${TABLE}.bundle_admission_comp_volume ;; }

    dimension: total_admission_comp_volume { type: number label: "Total Admission Comp Volume" sql: ${TABLE}.single_admission_comp_volume ;; }
    dimension: total_admission_sold_volume { type: number label: "Total Admission Sold Volume" sql: ${TABLE}.bundle_admission_comp_volume ;; }
    dimension: total_admission_net_sold_amount { type: number label: "Total Admission Sold Amount (NET)" sql: ${TABLE}.single_admission_sold_amount ;; }
    dimension: total_admission_gross_sold_amount { type: number label: "Total Admission Sold Amount (GROSS)" sql: ${TABLE}.total_admission_gross_sold_amount ;; }

    measure: total_sold {
      type: sum
      label: "Total Sold"
      sql:  SUM( ${TABLE}.total_admission_sold_volume + ${TABLE}.total_admission_comp_volume ) ;;

      filters: {
        field: orderadmission_sale_action
        value: "1"
      }
    }

    measure: total_returned {
      type: sum
      label: "Total Returned"
      sql:  SUM( ${TABLE}.total_admission_sold_volume + ${TABLE}.total_admission_comp_volume ) ;;

      filters: {
        field: orderadmission_sale_action
        value: "3"
      }
    }

  measure: total_single_admission_sold {
    type: sum
    label: "Total Single Admission Sold"
    sql:  ${TABLE}.single_admission_sold_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "1"
    }
  }

  measure: total_single_admission_returned {
    type: sum
    label: "Total Single Admission Returned"
    sql:  ${TABLE}.single_admission_sold_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }

  measure: total_bundle_admission_sold {
    type: sum
    label: "Total Bundle Admission Sold"
    sql:  ${TABLE}.bundle_admission_sold_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "1"
    }
  }

  measure: total_bundle_admission_returned {
    type: sum
    label: "Total Bundle Admission Returned"
    sql:  ${TABLE}.bundle_admission_sold_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }


  measure: total_sold_amount {
    type: sum
    label: "Total Sold Amount"
    value_format_name: usd
    sql:  ${TABLE}.total_admission_sold_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "1"
    }
  }

  measure: total_returned_amount {
    type: sum
    label: "Total Returned Amount"
    value_format_name: usd
    sql:  ${TABLE}.total_admission_sold_amount  ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }

  measure: total_single_admission_sold_amount {
    type: sum
    label: "Total Single Admission Sold Amount"
    value_format_name: usd
    sql:  ${TABLE}.single_admission_sold_amount ;;

    filters: {
      field: orderadmission_sale_action
      value: "1"
    }
  }

  measure: total_single_admission_returned_amount {
    type: sum
    label: "Total Single Admission Returned Amount"
    value_format_name: usd
    sql:  ${TABLE}.single_admission_sold_amount ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }

  measure: total_bundle_admission_sold_amount {
    type: sum
    label: "Total Bundle Admission Sold Amount"
    sql:  ${TABLE}.bundle_admission_sold_amount ;;
    value_format_name: usd

    filters: {
      field: orderadmission_sale_action
      value: "1"
    }
  }

  measure: total_bundle_admission_returned_amount {
    type: sum
    label: "Total Bundle Admission Returned Amount"
    value_format_name: usd
    sql:  ${TABLE}.bundle_admission_sold_amount ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }


}
