view: created_orders_new {
  derived_table: {
    sql:
WITH Unlimited AS (
  SELECT facts.sf_account_id salesforceId,
    orders.UID as performance_id,
    'Unlimited' as product_name,
    orders.client_name as client_name,
    venue_name,
    performance_series_name,
    performance_short_description,
    performance_name,
    IFNULL(performance_start_date, '2020-12-31') as performance_start_date,
    cast(IFNULL(performance_start_date, '2020-12-31' ) as TIMESTAMP) as performance_date,
    order_create_audit_time,
    cast(order_create_audit_time as TIMESTAMP) as order_create_date,
    (orders.orders_created ) as orders_created,
    (admisisons_sold ) as admissions_sold,
    (admissions_sold_amount / 100.00 ) as admissions_sold_amount,
    facts.default_currency as default_currency,
    (CASE
      WHEN facts.default_currency = 'CAD' THEN admissions_sold_amount * 0.76
      WHEN facts.default_currency = 'COP' THEN admissions_sold_amount * 0.00029
      WHEN facts.default_currency = 'GBP' THEN admissions_sold_amount * 1.32
      WHEN facts.default_currency = 'PHP' THEN admissions_sold_amount * 0.020
      WHEN facts.default_currency = 'USD' THEN admissions_sold_amount * 1
      ELSE 0
    END)/100 as admissions_sold_amount_usd,
    null as comps
  FROM audienceview.unlimited_orders_summary as orders
  INNER JOIN audienceview.unlimited_client_facts as facts on facts.client_name = orders.client_name
), trs as (
  SELECT sf_accounts.id salesforceId,
    CAST(performance.id as STRING) as performance_id,
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

    COUNTif(order_detail.status_id in ( 2, 9 )) as admissions_sold,


    COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(orders.total ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS admissions_sold_amount,
    'USD' as  default_currency,
    SUM(
      order_detail.price
    ) as admissions_sold_amount_usd,

    COUNTif(order_detail.status_id in ( 2, 9 ) AND price=0) as comps

  FROM trs_trs.orders
  INNER JOIN trs_trs.client ON client.client_id = orders.client_id
  INNER JOIN trs_trs.order_detail ON order_detail.order_id = orders.order_id
  INNER JOIN trs_trs.performance ON performance.id = order_detail.performance_id
  INNER JOIN trs_trs.production as production on production.production_id = performance.production_id
  LEFT JOIN trs_trs.report_crm  AS ot_report_crm ON ot_report_crm.id = client.report_crm_id
  LEFT JOIN new_salesforce.account  AS sf_accounts ON sf_accounts.salesforce_account_id_c = ot_report_crm.crm_id AND sf_accounts.is_deleted= FALSE

  WHERE (client.demo=0 and client.testing_mode=0 and client.active = 1 and orders.imported=0 and orders.is_test_mode=0 and orders.status_id != 11)

  GROUP BY
    sf_accounts.id,
    performance_id,
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

), sel as (
  SELECT sf_accounts.id salesforceId,
    sel_performances.performanceid as performance_id,
    'Select' as product_name,
    sel_members.organizationname as client_name,
    '' as venue_name,
    sel_events.title as performance_series_name,
    sel_events.title as performance_short_description,
    sel_events.title as performance_name,
    CAST( timestamp_seconds(sel_performances.starttime) as DATETIME) as performance_start_date,
    CAST( timestamp_seconds(sel_performances.starttime) as TIMESTAMP) as performance_date,
    CAST( timestamp_seconds(sel_orders.date) as DATETIME) as order_create_audit_time,
    CAST( timestamp_seconds(sel_orders.date) as TIMESTAMP) as order_create_date,
    COUNT(DISTINCT(sel_orders.id)) as orders_created,
    COUNT(DISTINCT(sel_transactions.transactionid)) as admissions_sold,
    SUM( SAFE_CAST( sel_transactions.total as FLOAT64 )) as admissions_sold_amount,
    'USD' as default_currency,
    SUM( SAFE_CAST( sel_transactions.total as FLOAT64 )) as admissions_sold_amount_usd,
    countif(SAFE_CAST( sel_transactions.total as FLOAT64 ) = 0) as comps

  FROM mysql_service.orders AS sel_orders
  INNER JOIN mysql_service.transactions AS sel_transactions
    ON sel_orders.id=sel_transactions.orderid and sel_orders.testmode = "N" --and sel_transactions.voided IS NULL
  INNER JOIN mysql_service.performances  AS sel_performances
    ON sel_transactions.performanceid=sel_performances.performanceid --AND  sel_performances.deleted IS NULL
  INNER JOIN mysql_service.events  AS sel_events
    ON sel_events.eventid = sel_performances.eventid
  LEFT JOIN mysql_service.members  AS sel_members
    ON sel_members.memberid=sel_orders.memberid AND sel_members.testmode="N" and sel_members.active="Y"
  LEFT JOIN new_salesforce.account  AS sf_accounts
    ON sel_members.memberid=sf_accounts.vam_member_id_c AND sf_accounts.is_deleted = FALSE

  GROUP BY
    sf_accounts.id,
    sel_performances.performanceid,
    sel_members.organizationname,
    sel_events.title,
    CAST( timestamp_seconds(sel_performances.starttime) as DATETIME),
    CAST( timestamp_seconds(sel_performances.starttime) as TIMESTAMP),
    CAST( timestamp_seconds(sel_orders.date) as DATETIME),
    CAST( timestamp_seconds(sel_orders.date) as TIMESTAMP)

), crowdtorch as (
  SELECT sf_accounts.id salesforceId,
    CAST(datatransactionid as string) as performance_id,
    'Crowdtorch' as product_name,
    data_transactions.clientname as client_name,
    data_transactions.venuename as venue_name,
    brandproperty as performance_series_name,
    showname as performance_short_description,
    showname as performance_name,
    CAST( showDateTime as DATETIME) as performance_start_date,
    CAST( showDateTime as TIMESTAMP) as performance_date,
    CAST( transactiontime as DATETIME) as order_create_audit_time,
    CAST( transactiontime as TIMESTAMP) as order_create_date,
    case when dataset = 'ticketOrder' then 1 else 0 end as orders_created,
    quantity as admissions_sold,
    grandtotal as admissions_sold_amount,
    currencycode as default_currency,
    CASE
      WHEN currencycode = 'CAD' THEN grandtotal * 0.76
      WHEN currencycode = 'COP' THEN grandtotal * 0.00029
      WHEN currencycode = 'GBP' THEN grandtotal * 1.32
      WHEN currencycode = 'PHP' THEN grandtotal * 0.020
      WHEN currencycode = 'USD' THEN grandtotal * 1
      ELSE 0
    END as admissions_sold_amount_usd,
    --SUMIF(quantity, grandtotal = 0) as comps
    null as comps

  FROM crowdtorch_dbo.data_transactions as data_transactions
  LEFT JOIN crowdtorch_dbo.tbl_ticketing_clientvenues AS ct_clientvenues
    ON data_transactions.clientid = ct_clientvenues.clientid and ct_clientvenues.venueid = data_transactions.venueid
  LEFT JOIN new_salesforce.account  AS sf_accounts
    ON data_transactions.clientid = cast(sf_accounts.ct_client_id_c as int64) AND sf_accounts.is_deleted = FALSE

  WHERE dataset IN
    (
    --'donationFund',
    --'donationFundRefund',
    'ticketOrder',
    'ticketRefundOrder'
    --'merchandiseRefundOrder',
    --'merchandiseOrder'
    )
    AND data_transactions.clientid NOT IN (15,10353725)

), Combined_records as (

    --Unlimited
    Select *
    FROM Unlimited

    UNION ALL

    Select *
    FROM trs

    UNION ALL

    Select *
    FROM sel

    UNION ALL

    Select *
    FROM crowdtorch

)

SELECT
  salesforceId,
  performance_id,
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
  DATE_DIFF(cast(performance_start_date as date), cast(order_create_audit_time as date), DAY) leadtime,
  default_currency,
  orders_created,
  admissions_sold,
  admissions_sold_amount,
  admissions_sold_amount_usd,
  comps
FROM Combined_records
WHERE order_create_date >= '2019-01-01 00:00:00';;

    sql_trigger_value: SELECT CAST(CURRENT_TIMESTAMP() AS DATE);;
  }

  dimension:  salesforceId  { type: string sql: ${TABLE}.salesforceId  ;; }
  dimension:  performance_id  { type: string sql: ${TABLE}.performance_id  ;; }
  dimension:  product_name { type: string sql: ${TABLE}.product_name ;; }
  dimension:  client_name { type: string sql: ${TABLE}.client_name ;; }
  dimension:  venue_name { type: string sql: ${TABLE}.venue_name ;; }
  dimension:  performance_series_name { type: string sql: ${TABLE}.performance_series_name ;; }
  dimension:  performance_short_description { type: string sql: ${TABLE}.performance_short_description ;; }
  dimension:  performance_name { type: string sql: ${TABLE}.performance_name ;; }

  dimension:  performance_start_date  { type: string sql: ${TABLE}.performance_start_date  ;; }
  dimension_group: performance_date { type: time sql: ${TABLE}.performance_date ;; }

  dimension:  order_create_audit_time  { type: string sql: ${TABLE}.order_create_audit_time  ;; }
  dimension_group: order_create_date { type: time sql: ${TABLE}.order_create_date ;; }

  dimension: OrderInPerformanceMonth{
    type: string
    sql: case when ${performance_date_month}=${order_create_date_month} Then 'Current'
              when ${performance_date_month}<${order_create_date_month} Then 'Before'
              else 'Future'
          end;;
  }

  dimension: default_currency { type: string sql: ${TABLE}.default_currency ;; }
  dimension: orders_created { type: number label: "Orders Created" sql: ${TABLE}.orders_created ;; }
  dimension: admisisons_sold { type: number label: "Admissions Sold" sql: ${TABLE}.admisisons_sold ;; }
  dimension: admissions_sold_amount { type: number value_format_name: usd sql: ${TABLE}.admissions_sold_amount ;; }
  dimension: admissions_sold_amount_usd { type: number value_format_name: usd sql: ${TABLE}.admissions_sold_amount_usd ;; }

  measure: total_orders_created { type: sum label: "Total Orders Created" drill_fields: [order_summary_fields*]sql: ${TABLE}.orders_created ;;}
  measure: total_admissions_sold { type: sum label: "Total Admissions Sold" sql: ${TABLE}.admissions_sold ;; drill_fields: [order_summary_fields*]}
  measure: total_admissions_sold_amount { type: sum value_format_name: usd label: "Total Admissions Sold Amount" sql: ${TABLE}.admissions_sold_amount ;; drill_fields: [order_summary_fields*]}
  measure: total_admissions_sold_amount_usd { type: sum value_format_name: usd label: "Total Admissions Sold Amount (USD)" sql: ${TABLE}.admissions_sold_amount_usd ;; drill_fields: [order_summary_fields*]}

  measure: current_total_orders_created { type: sum label: "Orders Created - Current Month" sql: ${orders_created};; filters:[OrderInPerformanceMonth: "Current"]}
  measure: current_total_admissions_sold { type: sum label: "Admissions Sold - Current Month" sql: ${TABLE}.admissions_sold;; filters:[OrderInPerformanceMonth: "Current"]}
  measure: current_total_admissions_sold_amount { type: sum value_format_name: usd label: "Admissions Sold Amount - Current Month" sql: ${TABLE}.admissions_sold_amount;; filters:[OrderInPerformanceMonth: "Current"]}
  measure: current_total_admissions_sold_amount_usd { type: sum value_format_name: usd label: "Admissions Sold Amount (USD) - Current Month" sql: ${TABLE}.admissions_sold_amount_usd ;; filters:[OrderInPerformanceMonth: "Current"]}

  measure: future_total_orders_created { type: sum label: "Orders Created - Future Month" sql: ${orders_created};; filters:[OrderInPerformanceMonth: "Future"]}
  measure: future_total_admissions_sold { type: sum label: "Admissions Sold - Future Month" sql: ${TABLE}.admissions_sold;; filters:[OrderInPerformanceMonth: "Future"]}
  measure: future_total_admissions_sold_amount { type: sum value_format_name: usd label: "Admissions Sold Amount - Future Month" sql: ${TABLE}.admissions_sold_amount;; filters:[OrderInPerformanceMonth: "Future"]}
  measure: future_total_admissions_sold_amount_usd { type: sum value_format_name: usd label: "Admissions Sold Amount (USD) - Future Month" sql: ${TABLE}.admissions_sold_amount_usd ;; filters:[OrderInPerformanceMonth: "Future"]}

  measure: Client_Count{ type: count_distinct label: "Total Clients" drill_fields: [order_summary_fields*] sql: ${TABLE}.client_name ;;}
  measure: Avg_LeadTime {
    type:average sql:
    ${TABLE}.leadtime ;;
    value_format: "0"
  }
  #removed until we can get correct values for all systems.
  #measure: comps { type: sum label: "Total Comp Admissions Sold" sql: ${TABLE}.comps ;; drill_fields: [order_summary_fields*]}

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
      client_name,
      performance_date_month_name,
      total_orders_created,
      total_admissions_sold,
      total_admissions_sold_amount_usd
    ]
  }
}
