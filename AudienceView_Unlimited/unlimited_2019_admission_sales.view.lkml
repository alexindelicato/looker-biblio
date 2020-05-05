view: unlimited_2019_admission_sales {
  derived_table: {
    sql:
SELECT
  unlimited_client_facts.client_name  AS client_name,
  COALESCE(SUM(CASE WHEN (((unlimited_sold_admissions.audit_date_time ) >= ((TIMESTAMP('2019-01-01 00:00:00'))) AND (unlimited_sold_admissions.audit_date_time ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP('2019-01-01 00:00:00') AS DATE), INTERVAL 1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP('2019-01-01 00:00:00') AS TIMESTAMP)) AS STRING))))))) THEN unlimited_sold_admissions.sales_net   ELSE NULL END), 0) AS unlimited_sold_admissions_2019_total_sales
FROM audienceview.unlimited_client_facts  AS unlimited_client_facts
LEFT JOIN looker_scratch.LR_TU2A11588561992867_unlimited_sold_admissions AS unlimited_sold_admissions ON unlimited_client_facts.client_name=unlimited_sold_admissions.client_name

GROUP BY 1 ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name;;
  }

  dimension: 2019_total_sales {
    type: number
    value_format_name: usd
    sql:  ${TABLE}.unlimited_sold_admissions_2019_total_sales ;;
  }

  measure: 2019_total_sales_sum {
    label: "2019 Earned Income (Ticket Sales - USD)"
    type: number
    value_format_name: usd
    sql:  ${TABLE}.unlimited_sold_admissions_2019_total_sales ;;
    required_fields: [2019_total_sales]
  }


  }
