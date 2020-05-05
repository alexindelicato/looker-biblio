view: unlimited_sold_admissions {
  derived_table: {
    sql:
SELECT
  admissions.UUID as UUID,
  admissions.client_name as client_name,
  audit_time,
  cast(audit_time as TIMESTAMP) as audit_date_time,
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
      WHEN orderadmission_sale_action = 1 THEN admission_count
      ELSE 0
  END) as sales_count,
  SUM(CASE
      WHEN orderadmission_sale_action = 1 THEN NET
      ELSE 0
  END)/100.00 as sales_net,

  SUM(CASE
      WHEN orderadmission_sale_action = 2 OR ( orderadmission_sale_action = 0 AND GROSS != 0 ) THEN admission_count
      ELSE 0
  END) as changes_count,
  SUM(CASE
      WHEN orderadmission_sale_action = 2 OR ( orderadmission_sale_action = 0 AND GROSS != 0 ) THEN NET
      ELSE 0
  END)/100.00 as changes_net,

  SUM(CASE
      WHEN orderadmission_sale_action = 3 THEN admission_count
      ELSE 0
  END) as returns_count,
  SUM(CASE
      WHEN orderadmission_sale_action =3 THEN NET
      ELSE 0
  END)/100.00 as returns_net,

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
  END) as exchange_out_count,
  facts.default_currency as default_currency,
    SUM(CASE
      WHEN facts.default_currency = 'CAD' THEN GROSS * 0.76
      WHEN facts.default_currency = 'COP' THEN GROSS * 0.00029
      WHEN facts.default_currency = 'GBP' THEN GROSS * 1.32
      WHEN facts.default_currency = 'PHP' THEN GROSS * 0.020
      WHEN facts.default_currency = 'USD' THEN GROSS * 1
      ELSE 0
  END)/100 as GROSS_USD,
      SUM(CASE
      WHEN facts.default_currency = 'CAD' THEN NET * 0.76
      WHEN facts.default_currency = 'COP' THEN NET * 0.00029
      WHEN facts.default_currency = 'GBP' THEN NET * 1.32
      WHEN facts.default_currency = 'PHP' THEN NET * 0.020
      WHEN facts.default_currency = 'USD' THEN NET * 1
      ELSE 0
  END)/100 as NET_USD
FROM audienceview.unlimited_sold_admissions as admissions
INNER JOIN audienceview.unlimited_client_facts as facts on facts.client_name = admissions.client_name
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
  orderadmission_record_state_description,
  facts.default_currency
           ;;

      sql_trigger_value: select max(audit_time) from `fivetran-ovation-tix-warehouse.audienceview.unlimited_sold_admissions`;;
    }

  dimension:  UUID  { type: string sql: ${TABLE}.UUID  ;; }
  dimension:  client_name { type: string sql: ${TABLE}.client_name ;; }
  dimension:  audit_time  { type: string sql: ${TABLE}.audit_time  ;; }
  dimension_group: audit_date_time { type: time sql: ${TABLE}.audit_date_time ;; }

#  dimension:  YEAR  { type: string sql: ${TABLE}. YEAR  ;; }
#  dimension:  quarter { type: string sql: ${TABLE}. quarter ;; }
  dimension:  userrole_name { type: string sql: ${TABLE}.userrole_name ;; }
  dimension:  userrole_group  { type: string sql: ${TABLE}.userrole_group  ;; }
  dimension:  orderadmission_sale_action  { type: number sql: ${TABLE}.orderadmission_sale_action  ;; }
  dimension:  orderadmission_record_state { type: string sql: ${TABLE}.orderadmission_record_state ;; }
  dimension:  orderadmission_sale_action_description  { type: string sql: ${TABLE}.orderadmission_sale_action_description  ;; }
  dimension:  orderadmission_record_state_description { type: string sql: ${TABLE}.orderadmission_record_state_description ;; }


  dimension: sales_count { type: number label: "Sales Count" sql: ${TABLE}.sales_count ;; }
  dimension: changes_count { type: number label: "Changes Count" sql: ${TABLE}.changes_count ;; }
  dimension: returns_count { type: number label: "Returns Count" sql: ${TABLE}.returns_count ;; }

  dimension: sales_net { type: number value_format_name: usd label: "Sales Net" sql: ${TABLE}.sales_net ;; }
  dimension: changes_net { type: number value_format_name: usd label: "Changes Net" sql: ${TABLE}.changes_net ;; }
  dimension: returns_net { type: number value_format_name: usd label: "Returns Net" sql: ${TABLE}.returns_net ;; }

  dimension:  default_currency { type: string sql: ${TABLE}.default_currency ;; }
  dimension:  GROSS_USD { type: number value_format_name: usd sql: ${TABLE}.GROSS_USD ;; }
  dimension:  GROSS { type: number value_format_name: usd sql: ${TABLE}.GROSS ;; }
  dimension:  NET_USD { type: number value_format_name: usd sql: ${TABLE}.NET_USD ;; }
  dimension:  NET { type: number value_format_name: usd sql: ${TABLE}.NET ;; }

  measure:  total_GROSS_USD { type: sum value_format_name: usd label: "Total GROSS USD" sql: ${TABLE}.GROSS_USD ;; }
  measure:  total_GROSS { type: sum value_format_name: usd label: "Total GROSS" sql: ${TABLE}.GROSS ;; }

  measure:  total_NET_USD { type: sum value_format_name: usd label: "Total NET USD" sql: ${TABLE}.NET_USD ;; }
  measure:  total_NET { type: sum value_format_name: usd label: "Total NET" sql: ${TABLE}.NET ;; }


  measure:  total_sales_net { type: sum value_format_name: usd label: "Total Sales Net" sql: ${TABLE}.sales_net ;; }
  measure:  total_sales_count { type: sum label: "Total Sales Count" sql: ${TABLE}.sales_count ;; }
  measure:  total_changes_net { type: sum value_format_name: usd label: "Total Changes Net" sql: ${TABLE}.changes_net ;; }
  measure:  total_changes_count { type: sum label: "Total Changes Count" sql: ${TABLE}.changes_count ;; }
  measure:  total_returns_net { type: sum value_format_name: usd label: "Total Returns Net" sql: ${TABLE}.returns_net ;; }
  measure:  total_returns_count { type: sum label: "Total Returns Count" sql: ${TABLE}.returns_count ;; }

  measure:  total_exchange_in_net { type: sum value_format_name: usd label: "Total Value Exchange (In) Net" sql: ${TABLE}.exchange_in_net ;; }
  measure:  total_exchange_in_count { type: sum label: "Total Tickets Exchange (In)" sql: ${TABLE}.exchange_in_count ;; }
  measure:  total_exchange_out_net { type: sum value_format_name: usd label: "Total Value Exchange (Out) Net" sql: ${TABLE}.exchange_out_net ;; }
  measure:  total_exchange_out_count { type: sum label: "Total Tickets Exchange (Out)" sql: ${TABLE}.exchange_out_count ;; }

  measure: 2019_total_sales {
    type: sum
    label: "2019 Total Sold Amount (USD)"
    value_format_name: usd
    sql:  ${TABLE}.sales_net  ;;


    filters: {
      field: audit_date_time_year
      value: "2019"
    }
  }


  measure: 2020_total_sales {
    type: sum
    label: "2020 Total Sold Amount (USD)"
    value_format_name: usd
    sql:  ${TABLE}.sales_net  ;;

    filters: {
      field: audit_date_time_week_of_year
      value: "2020"
    }
  }

#  measure: count {
#    type: count
#    drill_fields: [userrole_name, client_name]
#  }
}
