view: created_orders {
  derived_table: {
    sql:

SELECT
UUID,
product_name,
client_name,
venue_name,
performance_series_name,
performance_short_description,
performance_name,
performance_date,
performance_start_date,
order_create_date,
order_create_audit_time,
default_currency,
SUM(orders_created) as orders_created,
SUM(admissions_sold) as admissions_sold,
SUM(admissions_sold_amount) as admissions_sold_amount,
SUM(admissions_sold_amount_usd) as admissions_sold_amount_usd

FROM
(
SELECT
      orders.UID as UUID,
      'Unlimited' as product_name,
      orders.client_name as client_name,
venue_name,
performance_series_name,
performance_short_description,
performance_name,
performance_start_date,
cast(performance_start_date as TIMESTAMP) as performance_date,
order_create_audit_time,
cast(order_create_audit_time as TIMESTAMP) as order_create_date,
SUM( orders_created ) as orders_created,
SUM( admisisons_sold ) as admissions_sold,
SUM( admissions_sold_amount / 100.00 ) as admissions_sold_amount,
facts.default_currency as default_currency,
        SUM(CASE
          WHEN facts.default_currency = 'CAD' THEN admissions_sold_amount * 0.76
          WHEN facts.default_currency = 'COP' THEN admissions_sold_amount * 0.00029
          WHEN facts.default_currency = 'GBP' THEN admissions_sold_amount * 1.32
          WHEN facts.default_currency = 'PHP' THEN admissions_sold_amount * 0.020
          WHEN facts.default_currency = 'USD' THEN admissions_sold_amount * 1
          ELSE 0
      END)/100 as admissions_sold_amount_usd
    FROM audienceview.unlimited_orders_summary as orders
    INNER JOIN audienceview.unlimited_client_facts as facts on facts.client_name = orders.client_name

    WHERE 1 = 1

    GROUP BY
UUID,
product_name,
client_name,
venue_name,
performance_series_name,
performance_short_description,
performance_name,
performance_date,
performance_start_date,
order_create_date,
order_create_audit_time,
default_currency

UNION ALL

SELECT
    CAST(performance.id as STRING) as UUID,
    'Professional' as product_name,
    client_name,
    '' as venue_name,
    prod_name as performance_series_name,
    prod_name as performance_short_description,
    prod_name as performance_name,
    CAST( perf_start as DATETIME) as performance_start_date,
    CAST( perf_start as TIMESTAMP) as performance_date,
    CAST(DATE( time )as DATETIME) as order_create_audit_time,
    CAST(DATE( time )as TIMESTAMP) as order_create_date,
    COUNT(DISTINCT orders.order_id ) as orders_created,

    SUM(
      CASE WHEN order_detail.status_id in ( 2, 9 ) THEN 1 ELSE 0 END
    ) as admissions_sold,
    SUM( orders.total ) as admissions_sold_amount,
    'USD' as  default_currency,
    SUM( orders.total ) as admissions_sold_amount_usd

FROM trs_trs.orders
LEFT JOIN trs_trs.client ON client.client_id = orders.client_id
LEFT JOIN trs_trs.order_detail ON order_detail.order_id = orders.order_id
LEFT JOIN trs_trs.performance ON performance.id = order_detail.performance_id
INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.production` as production on production.production_id = performance.production_id

WHERE
1 = 1

AND (client.demo=0 and client.testing_mode=0 and client.active = 1 and orders.imported=0 and orders.is_test_mode=0 and orders.status_id != 11)

GROUP BY
UUID,
product_name,
client_name,
venue_name,
performance_series_name,
performance_short_description,
performance_name,
performance_date,
performance_start_date,
order_create_date,
order_create_audit_time,
default_currency

UNION ALL

SELECT
      purchase_stats.performanceid as UUID,
      'Select' as product_name,
      members.organizationname as client_name,
      '' as venue_name,
      events.title as performance_series_name,
      events.title as performance_short_description,
      events.title as performance_name,
    CAST( Performance_Date as DATETIME) as performance_start_date,
    CAST( Performance_Date as TIMESTAMP) as performance_date,
    CAST( Purchase_Date as DATETIME) as order_create_audit_time,
    CAST( Purchase_Date as TIMESTAMP) as order_create_date,

      SUM(Order_Count) as orders_created,
      SUM(Ticket_Quantity) as admissions_sold,
      SUM(Total_Sales__) as admissions_sold_amount,
      'USD' as default_currency,
      SUM(Total_Sales__) as admissions_sold_amount_usd

      FROM mysql_service.purchase_stats
      INNER JOIN mysql_service.performances on performances.performanceid = purchase_stats.performanceid
      INNER JOIN mysql_service.events on events.eventid = performances.eventid
      INNER JOIN mysql_service.members on members.memberid = purchase_stats.memberid
WHERE 1 = 1

GROUP BY
UUID,
product_name,
client_name,
venue_name,
performance_series_name,
performance_short_description,
performance_name,
performance_date,
performance_start_date,
order_create_date,
order_create_audit_time,
default_currency

UNION ALL

SELECT
      CAST(purchase_stats.clientID as STRING) as UUID,
      'CrowdTorch' as product_name,
      clientName as client_name,
      '' as venue_name,
      brandProperty as performance_series_name,
      showName as performance_short_description,
      showName as performance_name,
    CAST( showDateTime as DATETIME) as performance_start_date,
    CAST( showDateTime as TIMESTAMP) as performance_date,
    CAST( PurchaseDate as DATETIME) as order_create_audit_time,
    CAST( PurchaseDate as TIMESTAMP) as order_create_date,
      SUM(Order_Count) as orders_created,
      SUM(Quantity_tickets) as admissions_sold,
      SUM(Grand_Total) as admissions_sold_amount,
      billingCurrency as default_currency,
        SUM(CASE
          WHEN billingCurrency = 'CAD' THEN Grand_Total * 0.76
          WHEN billingCurrency = 'COP' THEN Grand_Total * 0.00029
          WHEN billingCurrency = 'GBP' THEN Grand_Total * 1.32
          WHEN billingCurrency = 'PHP' THEN Grand_Total * 0.020
          WHEN billingCurrency = 'USD' THEN Grand_Total * 1
          ELSE 0
      END) as admissions_sold_amount_usd

      FROM crowd_torch.purchase_stats
WHERE 1 = 1

GROUP BY
UUID,
product_name,
client_name,
venue_name,
performance_series_name,
performance_short_description,
performance_name,
performance_date,
performance_start_date,
order_create_date,
order_create_audit_time,
default_currency


) as t1

WHERE order_create_date >= '2020-01-01 00:00:00'
AND performance_date >= '2020-01-01 00:00:00'

GROUP BY

UUID,
product_name,
client_name,
venue_name,
performance_series_name,
performance_short_description,
performance_name,
performance_date,
performance_start_date,
order_create_date,
order_create_audit_time,
default_currency

ORDER BY order_create_date, performance_date

-- limit 100

            ;;

      sql_trigger_value: select max(order_create_audit_time) from `fivetran-ovation-tix-warehouse.audienceview.unlimited_orders_summary`;;
    }

    dimension:  UUID  { type: string sql: ${TABLE}.UUID  ;; }
    dimension:  client_name { type: string sql: ${TABLE}.client_name ;; }
    dimension:  product_name { type: string sql: ${TABLE}.product_name ;; }
    dimension:  venue_name { type: string sql: ${TABLE}.venue_name ;; }
    dimension:  performance_series_name { type: string sql: ${TABLE}.performance_series_name ;; }
    dimension:  performance_short_description { type: string sql: ${TABLE}.performance_short_description ;; }
    dimension:  performance_name { type: string sql: ${TABLE}.performance_name ;; }

    dimension:  performance_start_date  { type: string sql: ${TABLE}.performance_start_date  ;; }
    dimension_group: performance_date { type: time sql: ${TABLE}.performance_date ;; }

    dimension:  order_create_audit_time  { type: string sql: ${TABLE}.order_create_audit_time  ;; }
    dimension_group: order_create_date { type: time sql: ${TABLE}.order_create_date ;; }

    dimension: default_currency { type: string sql: ${TABLE}.default_currency ;; }
    dimension: orders_created { type: number label: "Orders Created" sql: ${TABLE}.orders_created ;; }
    dimension: admisisons_sold { type: number label: "Admissions Sold" sql: ${TABLE}.admisisons_sold ;; }
    dimension: admissions_sold_amount { type: number value_format_name: usd sql: ${TABLE}.admissions_sold_amount ;; }
    dimension: admissions_sold_amount_usd { type: number value_format_name: usd sql: ${TABLE}.admissions_sold_amount_usd ;; }

    measure: total_orders_created { type: sum label: "Total Orders Created" drill_fields: [order_summary_fields*]sql: ${TABLE}.orders_created ;;}
    measure: total_admissions_sold { type: sum label: "Total Admissions Sold" sql: ${TABLE}.admissions_sold ;; drill_fields: [order_summary_fields*]}
    measure: total_admissions_sold_amount { type: sum value_format_name: usd label: "Total Admissions Sold Amount" sql: ${TABLE}.admissions_sold_amount ;; drill_fields: [order_summary_fields*]}
    measure: total_admissions_sold_amount_usd { type: sum value_format_name: usd label: "Total Admissions Sold Amount (USD)" sql: ${TABLE}.admissions_sold_amount_usd ;; drill_fields: [order_summary_fields*]}

    dimension_group: current_time {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        month_name,
        quarter,
        quarter_of_year,
        week_of_year,
        year
      ]
      sql: CURRENT_TIMESTAMP() ;;
    }

  set: order_summary_fields {
    fields: [
      product_name,
      performance_date_month_name,
      total_orders_created,
      total_admissions_sold,
      total_admissions_sold_amount_usd
    ]
  }

#  measure: count {
#    type: count
#    drill_fields: [userrole_name, client_name]
#  }
  }
