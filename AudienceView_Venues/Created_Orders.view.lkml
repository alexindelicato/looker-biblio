view: created_orders {
  derived_table: {
    sql:

SELECT
UUID,
product_name,
client_name,
venue_name,
state,
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
IFNULL(facts.sf_billing_state, 'UK/Europe') as state,
performance_series_name,
performance_short_description,
performance_name,
IFNULL(performance_start_date, '2020-12-31') as performance_start_date,
cast(IFNULL(performance_start_date, '2020-12-31' ) as TIMESTAMP) as performance_date,
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
state,
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
    client.address_state  AS state,
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
--    SUM(
--      CASE WHEN order_detail.status_id in ( 2, 9 ) THEN order_detail.price ELSE 0 END
--    ) as admissions_sold_amount,

COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(orders.total ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS admissions_sold_amount,
/*
    SUM(
    order_detail.price
    ) as admissions_sold_amount,
    'USD' as  default_currency,
*/
-- COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(orders.total ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(orders.order_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS admissions_sold_amount_usd

    'USD' as  default_currency,
    SUM(
    order_detail.price
    ) as admissions_sold_amount_usd

FROM trs_trs.orders
INNER JOIN trs_trs.client ON client.client_id = orders.client_id
INNER JOIN trs_trs.order_detail ON order_detail.order_id = orders.order_id
INNER JOIN trs_trs.performance ON performance.id = order_detail.performance_id
INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.production` as production on production.production_id = performance.production_id

WHERE
1 = 1

AND (client.demo=0 and client.testing_mode=0 and client.active = 1 and orders.imported=0 and orders.is_test_mode=0 and orders.status_id != 11)

GROUP BY
UUID,
product_name,
client_name,
venue_name,
state,
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
      sel_performances.performanceid as UUID,
      'Select' as product_name,
      CAST( sel_orders.id as STRING) as client_name,
      '' as venue_name,
      sel_members.state  AS state,
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
      SUM( SAFE_CAST( sel_transactions.total as FLOAT64 )) as admissions_sold_amount_usd

FROM `fivetran-ovation-tix-warehouse.mysql_service.orders` AS sel_orders
LEFT JOIN `fivetran-ovation-tix-warehouse.mysql_service.transactions` AS sel_transactions
     ON sel_orders.id=sel_transactions.orderid and sel_orders.testmode = "N"
LEFT JOIN `fivetran-ovation-tix-warehouse.mysql_service.performances`  AS sel_performances
     ON sel_transactions.performanceid=sel_performances.performanceid AND  sel_performances.deleted IS NULL
LEFT JOIN `fivetran-ovation-tix-warehouse.mysql_service.events`  AS sel_events
     ON sel_events.eventid = sel_performances.eventid
LEFT JOIN mysql_service.members  AS sel_members
      ON sel_members.memberid=sel_orders.memberid and  sel_members.testmode="N" and sel_members.active="Y"

WHERE 1 = 1

GROUP BY
      sel_performances.performanceid,
      sel_orders.id,
      sel_events.title,
      state,
      CAST( timestamp_seconds(sel_performances.starttime) as DATETIME),
      CAST( timestamp_seconds(sel_performances.starttime) as TIMESTAMP),
      CAST( timestamp_seconds(sel_orders.date) as DATETIME),
      CAST( timestamp_seconds(sel_orders.date) as TIMESTAMP)


UNION ALL


SELECT
  CAST(datatransactionid as string) as UUID,
  'Crowdtorch' as product_name,
  data_transactions.clientname as client_name,
  data_transactions.venuename as venue_name,
  (Case when ct_clientvenues.venuestate = "Florida" then "FL"
   when ct_clientvenues.venuestate = "New York" then "NY"
   when ct_clientvenues.venuestate = "North Carolina" then "NC"
   when ct_clientvenues.venuestate = "Quebec" then "QC"
   when ct_clientvenues.venuestate = "Québec" then "QC"
   when ct_clientvenues.venuestate = "Quintana Roo" then "QROO"Else ct_clientvenues.venuestate END) as state,
  brandproperty as performance_series_name,
  showname as performance_short_description,
  showname as performance_name,
  CAST( showDateTime as DATETIME) as performance_start_date,
  CAST( showDateTime as TIMESTAMP) as performance_date,
  CAST( transactiontime as DATETIME) as order_create_audit_time,
  CAST( transactiontime as TIMESTAMP) as order_create_date,
  SUM(CASE
    WHEN dataset = 'ticketOrder' THEN 1
    ELSE 0
  END) as orders_created,
  SUM(quantity) as admissions_sold,
  SUM(grandtotal) as admissions_sold_amount,
  currencycode as default_currency,
  SUM(CASE
  WHEN currencycode = 'CAD' THEN grandtotal * 0.76
  WHEN currencycode = 'COP' THEN grandtotal * 0.00029
  WHEN currencycode = 'GBP' THEN grandtotal * 1.32
  WHEN currencycode = 'PHP' THEN grandtotal * 0.020
  WHEN currencycode = 'USD' THEN grandtotal * 1
  ELSE 0
  END) as admissions_sold_amount_usd

FROM `fivetran-ovation-tix-warehouse.crowdtorch_dbo.data_transactions` as data_transactions
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_clientvenues` AS ct_clientvenues
      ON data_transactions.clientid = ct_clientvenues.clientid and ct_clientvenues.venueid = data_transactions.venueid

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

GROUP BY
UUID,
product_name,
client_name,
venue_name,
state,
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


GROUP BY

UUID,
product_name,
client_name,
venue_name,
state,
performance_series_name,
performance_short_description,
performance_name,
performance_date,
performance_start_date,
order_create_date,
order_create_audit_time,
default_currency;;

      sql_trigger_value: select max(order_create_audit_time) from `fivetran-ovation-tix-warehouse.audienceview.unlimited_orders_summary`;;
    }

    dimension:  UUID  { type: string sql: ${TABLE}.UUID  ;; }
    dimension:  state  { type: string sql: ${TABLE}.state  ;; }
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
      client_name,
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
