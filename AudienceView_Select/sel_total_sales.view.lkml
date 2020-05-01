view: sel_total_sales {
    derived_table: {
      sql:
SELECT
  sel_members.memberid  AS memberid,
  sel_members.currency as currency,
  COALESCE(SUM(CASE WHEN (((sel_purchase_stats.Purchase_Date ) >= ((DATE(TIMESTAMP_TRUNC(CAST(TIMESTAMP('2020-01-01 00:00:00') AS TIMESTAMP), DAY)))) AND (sel_purchase_stats.Purchase_Date ) < ((DATE(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP('2020-01-01 00:00:00') AS DATE), INTERVAL 1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP('2020-01-01 00:00:00') AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), DAY)))))) THEN round(safe_cast(sel_purchase_stats.Total_Sales__ as FLOAT64),2)  ELSE NULL END), 0) AS total_sales
FROM `fivetran-ovation-tix-warehouse.mysql_service.purchase_stats`
     AS sel_purchase_stats
LEFT JOIN mysql_service.members  AS sel_members ON sel_members.memberid=sel_purchase_stats.memberid

GROUP BY 1,2 ;;
    }

    dimension: member_id {
      type: string
      label: "Member ID"
      sql: ${TABLE}.memberid ;;
    }

  dimension: currency {
    type: string
    label: "Currency"
    sql: ${TABLE}.currency ;;
  }

  dimension: total_sales {
    type: number
    label: "2020 Total Sales"
    value_format_name: usd
    sql: ${TABLE}.total_sales ;;
  }

  measure: measure_total_sales {
    type: number
    label: "2020 Total Sales"
    value_format_name: usd
    sql: ${TABLE}.total_sales ;;
    required_fields: [total_sales]
  }

  dimension: total_sales_converted{
    label: "2020 Total Sales (USD)"
    type: number
    value_format_name: usd
    sql: case when ${currency} = "CAD" then ${TABLE}.total_sales * 0.72
         when ${currency} = "USD" then ${TABLE}.total_sales * 1
         else 0 End;;
  }


  measure: measure_total_sales_converted{
    label: "2020 Total Sales (USD)"
    type: number
    value_format_name: usd
    sql: case when ${currency} = "CAD" then ${TABLE}.total_sales * 0.72
         when ${currency} = "USD" then ${TABLE}.total_sales * 1
         else 0 End;;
    required_fields: [total_sales, currency]
  }

    }
