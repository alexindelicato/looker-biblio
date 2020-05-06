view: ct_annual_sales {
  derived_table: {
    sql: SELECT
client_id,
client_name,
SUM(total_ticket_fees_2019) as total_ticket_fees_2019,
SUM(total_total_revenue_2019) as total_total_revenue_2019,
SUM(total_ticket_revenue_2019) as total_ticket_revenue_2019,
SUM(total_cc_fees_2019) as total_cc_fees_2019,
SUM(total_tickets_2019) as total_tickets_2019,
SUM(total_ticket_fees_2020) as total_ticket_fees_2020,
SUM(total_total_revenue_2020) as total_total_revenue_2020,
SUM(total_ticket_revenue_2020) as total_ticket_revenue_2020,
SUM(total_cc_fees_2020) as total_cc_fees_2020,
SUM(total_tickets_2020) as total_tickets_2020,
FROM
(
SELECT
client_id,
client_name,
trans_year_id,
SUM(ticket_fees) as total_ticket_fees_2019,
SUM(total_revenue) as total_total_revenue_2019,
SUM(ticket_revenue) as total_ticket_revenue_2019,
SUM(cc_fees) as total_cc_fees_2019,
SUM(tickets) as total_tickets_2019,
NULL as total_ticket_fees_2020,
NULL as total_total_revenue_2020,
NULL as total_ticket_revenue_2020,
NULL as total_cc_fees_2020,
NULL as total_tickets_2020
FROM `fivetran-ovation-tix-warehouse.crowdtorch_dbo.ct_monthly_report`
WHERE trans_year_id = 2019
GROUP BY
client_id,
client_name,
trans_year_id
UNION ALL
SELECT
client_id,
client_name,
trans_year_id,
NULL as total_ticket_fees_2019,
NULL as total_total_revenue_2019,
NULL as total_ticket_revenue_2019,
NULL as total_cc_fees_2019,
NULL as total_tickets_2019,
SUM(ticket_fees) as total_ticket_fees_2020,
SUM(total_revenue) as total_total_revenue_2020,
SUM(ticket_revenue) as total_ticket_revenue_2020,
SUM(cc_fees) as total_cc_fees_2020,
SUM(tickets) as total_tickets_2020
FROM `fivetran-ovation-tix-warehouse.crowdtorch_dbo.ct_monthly_report`
WHERE trans_year_id = 2020
GROUP BY
client_id,
client_name,
trans_year_id
) as t1
GROUP BY
client_id,
client_name
ORDER BY
client_name ;;

}


dimension: client_id {
  type: string
  sql: ${TABLE}.client_id ;;
}


  dimension: total_ticket_fees{
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: total_ticket_revenue_2019 {
    type: number
    label: "2019 Earned Income (USD)"
    value_format_name: usd
    sql:${TABLE}.total_ticket_revenue_2019 ;;
  }

  dimension: total_tickets_2019 {
    type: number
    label: "# of Tickets Sold (2019)"
    sql:${TABLE}.total_tickets_2019 ;;
  }

  measure: total_tickets_2019_measure {
    type: number
    label: "# of Tickets Sold (2019)"
    sql:${TABLE}.total_tickets_2019 ;;
    required_fields: [total_tickets_2019]
  }


  dimension: total_tickets_2020 {
    type: number
    label: "# of Tickets Sold (2020)"
    sql:${TABLE}.total_tickets_2020 ;;
  }

  measure: total_tickets_2020_measure {
    type: number
    label: "# of Tickets Sold (2020)"
    sql:${TABLE}.total_tickets_2020 ;;
    required_fields: [total_tickets_2020]
  }


  measure:: total_ticket_revenue_2019_measure {
    type: number
    label: "2019 Earned Income (USD)"
    value_format_name: usd
    sql:case when ${ct_transactions.currencycode} = "CAD" then ${TABLE}.total_ticket_revenue_2019 * 0.72
          when ${ct_transactions.currencycode} = "USD" then ${TABLE}.total_ticket_revenue_2019 * 1
          when ${ct_transactions.currencycode} = "GBP" then ${TABLE}.total_ticket_revenue_2019 * 0.81
             when ${ct_transactions.currencycode} = "EUR" then ${TABLE}.total_ticket_revenue_2019 * 0.92
          Else 0 End
         ;;
    required_fields: [total_ticket_revenue_2019,ct_transactions.currencycode]
  }

  dimension: total_ticket_revenue_2020 {
    type: number
    label: "2020 Earned Income"
    value_format_name: usd
    sql: ${TABLE}.total_ticket_revenue_2020
         ;;
  }

  measure:: total_ticket_revenue_2020_measure {
    type: number
    label: "2020 Earned Income (USD)"
    value_format_name: usd
    required_fields: [total_ticket_revenue_2020,ct_transactions.currencycode]
    sql:case when ${ct_transactions.currencycode} = "CAD" then ${TABLE}.total_ticket_revenue_2020 * 0.72
          when ${ct_transactions.currencycode} = "USD" then ${TABLE}.total_ticket_revenue_2020 * 1
           when ${ct_transactions.currencycode} = "GBP" then ${TABLE}.total_ticket_revenue_2019 * 0.81
             when ${ct_transactions.currencycode} = "EUR" then ${TABLE}.total_ticket_revenue_2019 * 0.92
          Else 0 End ;;
  }

}
