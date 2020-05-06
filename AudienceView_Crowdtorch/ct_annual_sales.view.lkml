view: ct_annual_sales {
  derived_table: {
    sql:SELECT
client_id,
client_name,
trans_year_id,
sum(ticket_fees) as total_ticket_fees,
sum(total_revenue) as total_total_revenue,
Case when trans_year_id  = 2019 then sum(ticket_revenue) End as ticket_revenue_2019,
Case when trans_year_id  = 2020 then sum(ticket_revenue) End as ticket_revenue_2020,
sum(cc_fees) as total_cc_fees
FROM `fivetran-ovation-tix-warehouse.crowdtorch_dbo.ct_monthly_report`
GROUP BY
client_id,
client_name,
trans_year_id ;; }


dimension: client_id{
  type: string
  sql: ${TABLE}.client_id ;;
}

  dimension: trans_year_id{
    type: number
    sql: ${TABLE}.trans_year_id ;;
  }


  dimension: total_ticket_fees{
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: 2019_ticket_revenue {
    type: number
    value_format_name: usd
    sql:${TABLE}.ticket_revenue_2019 ;;
  }

  measure:: 2019_ticket_revenue_measure {
    type: number
    value_format_name: usd
    sql:${TABLE}.ticket_revenue_2019 ;;
    required_fields: [2019_ticket_revenue]
  }


  dimension: 2020_ticket_revenue {
    type: number
    value_format_name: usd
    sql:${TABLE}.ticket_revenue_2020 ;;
  }

  measure: sum_ticket_revenue {
    label: "2019 Earned Income (USD)"
    type: number
    value_format_name: usd
    sql:${TABLE}.ticket_revenue ;;
  }
}
