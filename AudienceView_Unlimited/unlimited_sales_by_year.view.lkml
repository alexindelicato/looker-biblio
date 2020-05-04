view: unlimited_sales_by_year {
  derived_table: {
    sql:
      SELECT
      unlimited_orders_summary.client_name  AS client_name,
  COALESCE(SUM(CASE WHEN (((unlimited_orders_summary.order_create_date ) >= ((TIMESTAMP('2019-01-01 00:00:00'))) AND (unlimited_orders_summary.order_create_date ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP('2019-01-01 00:00:00') AS DATE), INTERVAL 1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP('2019-01-01 00:00:00') AS TIMESTAMP)) AS STRING))))))) THEN unlimited_orders_summary.admissions_sold_amount_usd   ELSE NULL END), 0) AS unlimited_orders_summary_2019_sold_amount,
  COALESCE(SUM(CASE WHEN (((unlimited_orders_summary.order_create_date ) >= ((TIMESTAMP('2020-01-01 00:00:00'))) AND (unlimited_orders_summary.order_create_date ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP('2020-01-01 00:00:00') AS DATE), INTERVAL 1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP('2020-01-01 00:00:00') AS TIMESTAMP)) AS STRING))))))) THEN unlimited_orders_summary.admissions_sold_amount_usd   ELSE NULL END), 0) AS unlimited_orders_summary_2020_sold_amount
FROM audienceview.unlimited_client_facts  AS unlimited_client_facts
LEFT JOIN looker_scratch.LR_TUPNK1588562295386_unlimited_orders_summary AS unlimited_orders_summary ON unlimited_client_facts.client_name=unlimited_orders_summary.client_name

GROUP BY 1 ;;
}



dimension: unlimited_orders_summary_2019_sold_amount{
type: number
value_format_name: usd
sql: ${TABLE}.unlimited_orders_summary_2019_sold_amount;;
}

  dimension: unlimited_orders_summary_2020_sold_amount{
    type: number
    value_format_name: usd
    sql: ${TABLE}.unlimited_orders_summary_2020_sold_amount;;
  }

  measure: 2020_sold_amount {
    label: "2020 Sold Amount (USD)"
    type: number
    value_format_name: usd
    sql: ${TABLE}.unlimited_orders_summary_2020_sold_amount;;
    required_fields: [unlimited_orders_summary_2020_sold_amount]
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name;;
  }


}
