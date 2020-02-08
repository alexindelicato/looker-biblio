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
  sum(NET)/100.00 as NET,
  sum(CHG2)/100.00 as CHG2,
  sum(CHG3)/100.00 as CHG3,
  sum(CHG5)/100.00 as CHG5,
  sum(CHG4)/100.00 as CHG4,
  sum(CHG1)/100.00 as CHG1,
  sum(GROSS)/100.00 as GROSS,
  orderadmission_sale_action_description,
  orderadmission_record_state_description,
  SUM(CASE
      WHEN orderadmission_sale_action in ( 1, 2, 3, 4, 5, 6 ) and orderadmission_record_state = 0 THEN NET
      ELSE 0
  END)/100.00 as sales_net,
  SUM(CASE
      WHEN orderadmission_sale_action = 2 OR ( orderadmission_sale_action = 0 AND GROSS != 0 ) THEN NET
      ELSE 0
  END)/100.00 as changes_net,
  SUM(CASE
      WHEN orderadmission_sale_action in ( 1, 2, 3, 4, 5, 6 ) and orderadmission_record_state = 3 THEN NET
      ELSE 0
  END)/100.00 as returns_net,
  SUM(CASE
      WHEN orderadmission_sale_action = 1 THEN admission_count
      ELSE 0
  END)/100.00 as sales_count,
  SUM(CASE
      WHEN orderadmission_sale_action = 2 OR ( orderadmission_sale_action = 0 AND GROSS != 0 ) THEN admission_count
      ELSE 0
  END)/100.00 as changes_count,
  SUM(CASE
      WHEN orderadmission_sale_action = 3 THEN admission_count
      ELSE 0
  END)/100.00 as returns_count,
  SUM(CASE
      WHEN orderadmission_sale_action in ( 4, 5, 6 ) and orderadmission_record_state = 0 THEN NET
      ELSE 0
  END)/100.00 as exchange_in_net,
  SUM(CASE
      WHEN orderadmission_sale_action in ( 4, 5, 6 ) and orderadmission_record_state != 0 THEN NET
      ELSE 0
  END)/100.00 as exchange_out_net,
  SUM(CASE
      WHEN orderadmission_sale_action in ( 4, 5, 6 ) and orderadmission_record_state = 0 THEN admission_count
      ELSE 0
  END) as exchange_in_count,
  SUM(CASE
      WHEN orderadmission_sale_action in ( 4, 5, 6 ) and orderadmission_record_state != 0 THEN admission_count
      ELSE 0
  END) as exchange_out_count
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

#  measure:  total_admission_count { type:  sum   label: "Total Count Sold" sql: ${TABLE}.admission_count ;; }
#  measure:  total_NET { type:  sum  value_format_name: usd label: "Total Net Sold" sql: ${TABLE}.NET ;; }
#  measure:  total_CHG2  { type:  sum  value_format_name: usd label: "Total CHG2 Sold" sql: ${TABLE}.CHG2  ;; }
#  measure:  total_CHG3  { type:  sum  value_format_name: usd label: "Total CHG3 Sold" sql: ${TABLE}.CHG3  ;; }
#  measure:  total_CHG5  { type:  sum  value_format_name: usd label: "Total CHG5 Sold" sql: ${TABLE}.CHG5  ;; }
#  measure:  total_CHG4  { type:  sum  value_format_name: usd label: "Total CHG4 Sold" sql: ${TABLE}.CHG4  ;; }
#  measure:  total_CHG1  { type:  sum  value_format_name: usd label: "Total CHG1 Sold" sql: ${TABLE}.CHG1  ;; }
  measure:  total_GROSS { type:  sum  value_format_name: usd label: "Total GROSS Sold" sql: ${TABLE}.GROSS ;; }

  measure:  total_sales_net { type: sum value_format_name: usd label: "Total Sales Net" sql: ${TABLE}.sales_net ;; }
  measure:  total_sales_count { type: sum label: "Total Sales Count" sql: ${TABLE}.sales_count ;; }
  measure:  total_changes_net { type: sum value_format_name: usd label: "Total Changes Net" sql: ${TABLE}.changes_net ;; }
  measure:  total_changes_count { type: sum label: "Total Changes Count" sql: ${TABLE}.changes_count ;; }
  measure:  total_returns_net { type: sum value_format_name: usd label: "Total Returns Net" sql: ${TABLE}.returns_net ;; }
  measure:  total_returns_count { type: sum label: "Total Returns Count" sql: ${TABLE}.returns_count ;; }

  measure:  total_exchange_in_net { type: sum value_format_name: usd label: "Total Exhchange In Net" sql: ${TABLE}.exchange_in_net ;; }
  measure:  total_exchange_in_count { type: sum label: "Total Exhchange In Count" sql: ${TABLE}.exchange_in_count ;; }
  measure:  total_exchange_out_net { type: sum value_format_name: usd label: "Total Exhchange Out Net" sql: ${TABLE}.exchange_out_net ;; }
  measure:  total_exchange_out_count { type: sum label: "Total Exhchange Out Count" sql: ${TABLE}.exchange_out_count ;; }


  measure:  total_admission_count_out {
    type:  sum
    label: "Total Count Exchnaged (Out)"
    sql: ${TABLE}. admission_count ;;
    filters: {
      field:  orderadmission_record_state_description
      value: "Delete,Update" }
  }

  measure:  total_admission_count_in {
    type:  sum
    label: "Total Count Exchnaged (IN)"
    sql: ${TABLE}. admission_count ;;
    filters: {
      field:  orderadmission_record_state_description
      value: "Insert" }
  }

  measure:  total_net_in {
    type:  sum
    value_format_name: usd
    label: "Total Net Sales Exchnaged (IN)"
    sql: ${TABLE}. NET ;;
    filters: {
      field:  orderadmission_record_state_description
      value: "Insert" }
  }

  measure:  total_net_out {
    type:  sum
    value_format_name: usd
    label: "Total Net Sales Exchnaged (Out)"
    sql: ${TABLE}. NET ;;
    filters: {
      field:  orderadmission_record_state_description
      value: "Delete,Update" }
  }

#  measure: count {
#    type: count
#    drill_fields: [userrole_name, client_name]
#  }
}
