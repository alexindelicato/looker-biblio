view: unlimited_sold_admissions {
  derived_table: {
    sql:

SELECT
  UUID,
  client_name,
  audit_time,
  cast(concat(audit_time, ':00') as TIMESTAMP) as audit_date_time,
  YEAR,
  quarter,
  userrole_name,
  userrole_group,
  orderadmission_sale_action,
  orderadmission_record_state,
  sum(admission_count) as admission_count,
  sum(NET) as NET,
  sum(CHG2) as CHG2,
  sum(CHG3) as CHG3,
  sum(CHG5) as CHG5,
  sum(CHG4) as CHG4,
  sum(CHG1) as CHG1,
  sum(GROSS) as GROSS,
  orderadmission_sale_action_description,
  orderadmission_record_state_description
FROM audienceview.unlimited_sold_admissions
GROUP BY
  UUID,
  client_name,
  audit_time,
  YEAR,
  quarter,
  userrole_name,
  userrole_group,
  orderadmission_sale_action,
  orderadmission_record_state,
  orderadmission_sale_action_description,
  orderadmission_record_state_description
           ;;

      sql_trigger_value: select max(client_metric_date_time) from `fivetran-ovation-tix-warehouse.audienceview.qbr_data`;;
    }

  dimension:  UUID  { type: string sql: ${TABLE}. UUID  ;; }
  dimension:  client_name { type: string sql: ${TABLE}. client_name ;; }
  dimension:  audit_time  { type: string sql: ${TABLE}. audit_time  ;; }
  dimension_group: audit_date_time { type: time sql: ${TABLE}.audit_date_time ;; }

  dimension:  YEAR  { type: string sql: ${TABLE}. YEAR  ;; }
  dimension:  quarter { type: string sql: ${TABLE}. quarter ;; }
  dimension:  userrole_name { type: string sql: ${TABLE}. userrole_name ;; }
  dimension:  userrole_group  { type: string sql: ${TABLE}. userrole_group  ;; }
  dimension:  orderadmission_sale_action  { type: string sql: ${TABLE}. orderadmission_sale_action  ;; }
  dimension:  orderadmission_record_state { type: string sql: ${TABLE}. orderadmission_record_state ;; }
  dimension:  orderadmission_sale_action_description  { type: string sql: ${TABLE}. orderadmission_sale_action_description  ;; }
  dimension:  orderadmission_record_state_description { type: string sql: ${TABLE}. orderadmission_record_state_description ;; }

  measure:  total_admission_count { type:  sum   label: "Total Count Sold" sql: ${TABLE}. admission_count ;; }
  measure:  total_NET { type:  sum  value_format_name: usd label: "Total Net Sold" sql: ${TABLE}. NET ;; }
  measure:  total_CHG2  { type:  sum  value_format_name: usd label: "Total CHG2 Sold" sql: ${TABLE}.  CHG2  ;; }
  measure:  total_CHG3  { type:  sum  value_format_name: usd label: "Total CHG3 Sold" sql: ${TABLE}.  CHG3  ;; }
  measure:  total_CHG5  { type:  sum  value_format_name: usd label: "Total CHG5 Sold" sql: ${TABLE}.  CHG5  ;; }
  measure:  total_CHG4  { type:  sum  value_format_name: usd label: "Total CHG4 Sold" sql: ${TABLE}.  CHG4  ;; }
  measure:  total_CHG1  { type:  sum  value_format_name: usd label: "Total CHG1 Sold" sql: ${TABLE}.  CHG1  ;; }
  measure:  total_GROSS { type:  sum  value_format_name: usd label: "Total GROSS Sold" sql: ${TABLE}. GROSS ;; }

  measure: count {
    type: count
    drill_fields: [userrole_name, client_name]
  }
}
