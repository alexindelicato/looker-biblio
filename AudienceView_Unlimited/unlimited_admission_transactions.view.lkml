view: unlimited_admission_transactions {
  derived_table: {
    sql:
    SELECT
      UUID,
      client_name,
      sf_account_name,
      sf_account_id,
      audit_time,
      cast(audit_time as TIMESTAMP) as audit_date_time,
      YEAR,
      quarter,
      userrole_name,
      userrole_group,
      single_admission_net_sold_amount,
      bundle_admission_net_sold_amount,
      single_admission_charge_amount,
      bundle_admission_charge_amount,
      single_admission_gross_sold_amount,
      bundle_admission_gross_sold_amount,
      single_admission_sold_volume,
      bundle_admission_sold_volume,
      single_admission_comp_volume,
      bundle_admission_comp_volume,
      orderadmission_sale_action,
      orderadmission_record_state,
      orderadmission_sale_action_description,
      orderadmission_record_state_description

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
    dimension:  orderadmission_record_state { type: string sql: ${TABLE}.orderadmission_record_state ;; }
    dimension:  orderadmission_sale_action_description  { type: string sql: ${TABLE}.orderadmission_sale_action_description ;; }
    dimension:  orderadmission_record_state_description { type: string sql: ${TABLE}.orderadmission_record_state_description ;; }

    dimension: single_admission_net_sold_amount { type: number label: "Single Admission Sold Amount" sql: ${TABLE}.single_admission_net_sold_amount ;; }
    dimension: bundle_admission_net_sold_amount { type: number label: "Bundle Admission Sold Amount" sql: ${TABLE}.bundle_admission_net_sold_amount ;; }
    dimension: single_admission_charge_amount { type: number label: "Single Admission Charge Amount" sql: ${TABLE}.single_admission_charge_amount ;; }
    dimension: bundle_admission_charge_amount { type: number label: "Bundle Admission Charge Amount" sql: ${TABLE}.bundle_admission_charge_amount ;; }
    dimension: single_admission_gross_sold_amount { type: number label: "Single Admission Gross Amount" sql: ${TABLE}.single_admission_charge_amount ;; }
    dimension: bundle_admission_gross_sold_amount { type: number label: "Bundle Admission Gross Amount" sql: ${TABLE}.bundle_admission_gross_sold_amount ;; }

    dimension: single_admission_sold_volume { type: number label: "Single Admission Sold Count" sql: ${TABLE}.single_admission_sold_volume ;; }
    dimension: bundle_admission_sold_volume { type: number label: "Bundle Admission Sold Count" sql: ${TABLE}.bundle_admission_sold_volume ;; }
    dimension: single_admission_comp_volume { type: number label: "Single Admission Comp Volume" sql: ${TABLE}.single_admission_comp_volume ;; }
    dimension: bundle_admission_comp_volume { type: number label: "Bundle Admission Comp Volume" sql: ${TABLE}.bundle_admission_comp_volume ;; }

  measure: single_admissions_total_sold {
    type: sum
    label: "Single Admissions Sold (Less Comps)"
    sql:  ${TABLE}.single_admission_sold_volume - ${TABLE}.single_admission_comp_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "1"
    }
  }

  measure: single_admissions_total_returned {
    type: sum
    label: "Single Admissions Returned (Less Comps)"
    sql:  ${TABLE}.single_admission_sold_volume - ${TABLE}.single_admission_comp_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }

  measure: single_admissions_total_sold_net_value {
    type: sum
    label: "Single Admissions Net Sold Value"
    filters: [orderadmission_sale_action: "0, 1, 2, 4, 5, 6"]
    sql:  ${TABLE}.single_admission_net_sold_amount ;;
  }

  measure: single_admissions_total_sold_gross_value {
    type: sum
    label: "Single Admissions Gross Sold Value"
    filters: [orderadmission_sale_action: "0, 1, 2, 4, 5, 6"]
    sql:  ${TABLE}.single_admission_gross_sold_amount ;;
  }

  measure: single_admissions_total_returned_net_value {
    type: sum
    label: "Single Admissions Returned Net Value"
    sql:  ${TABLE}.single_admission_net_sold_amount  ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }

  measure: single_admissions_total_returned_gross_value {
    type: sum
    label: "Single Admissions Returned Sold Value"
    filters: [orderadmission_sale_action: "3"]
    sql:  ${TABLE}.single_admission_gross_sold_amount ;;
  }

  measure: single_admissions_total_value {
    type: number
    label: "Single Admissions Total"
    sql:  ${single_admissions_total_sold_gross_value} + ${single_admissions_total_returned_gross_value} ;;
  }

  measure: single_admissions_total_sold_comps {
    type: sum
    label: "Single Admissions Comps"
    sql:  ${TABLE}.single_admission_comp_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "1"
    }
  }

  measure: single_admissions_total_sold_comps_returned {
    type: sum
    label: "Single Admissions Comps Returned"
    sql:  ${TABLE}.single_admission_comp_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }


  measure: bundle_admissions_total_sold {
    type: sum
    label: "Bundle Admissions Sold (Less Comps)"
    sql:  ${TABLE}.bundle_admission_sold_volume - ${TABLE}.bundle_admission_comp_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "1"
    }
  }

  measure: bundle_admissions_total_returned {
    type: sum
    label: "Bundle Admissions Returned (Less Comps)"
    sql:  ${TABLE}.bundle_admission_sold_volume - ${TABLE}.bundle_admission_comp_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }
  measure: bundle_admissions_total_returned_value {
    type: sum
    label: "Bundle Admissions Returned Value"
    sql:  ${TABLE}.bundle_admission_net_sold_amount ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }

  measure: bundle_admissions_total_sold_net_value {
    type: sum
    label: "Bundle Admissions Net Sold Value"
    filters: [orderadmission_sale_action: "0, 1, 2, 4, 5, 6"]
    sql:  ${TABLE}.bundle_admission_net_sold_amount ;;
  }

  measure: bundle_admissions_total_sold_gross_value {
    type: sum
    label: "Bundle Admissions Gross Sold Value"
    filters: [orderadmission_sale_action: "0, 1, 2, 4, 5, 6"]
    sql:  ${TABLE}.bundle_admission_gross_sold_amount ;;
  }

  measure: bundle_admissions_total_returned_net_value {
    type: sum
    label: "Bundle Admissions Returned Net Value"
    sql:  ${TABLE}.bundle_admission_net_sold_amount  ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }

  measure: bundle_admissions_total_returned_gross_value {
    type: sum
    label: "Bundle Admissions Returned Sold Value"
    filters: [orderadmission_sale_action: "3"]
    sql:  ${TABLE}.bundle_admission_gross_sold_amount ;;
  }

  measure: bundle_admissions_total_value {
    type: number
    label: "Bundle Admissions Total"
    sql:  ${bundle_admissions_total_sold_gross_value} + ${bundle_admissions_total_returned_gross_value} ;;
  }

  measure: bundle_admissions_total_sold_comps {
    type: sum
    label: "Bundle Admissions Comps"
    sql:  ${TABLE}.bundle_admission_comp_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "1"
    }
  }

  measure: bundle_admissions_total_sold_comps_returned {
    type: sum
    label: "Bundle Admissions Comps Returned"
    sql:  ${TABLE}.bundle_admission_comp_volume ;;

    filters: {
      field: orderadmission_sale_action
      value: "3"
    }
  }

}
