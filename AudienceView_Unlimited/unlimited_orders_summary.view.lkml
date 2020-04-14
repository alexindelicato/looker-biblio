view: unlimited_orders_summary {
  derived_table: {
    sql:
    SELECT
      orders.UID as UUID,
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
SUM( admisisons_sold ) as admisisons_sold,
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
    GROUP BY
orders.UID,
orders.client_name,
venue_name,
performance_series_name,
performance_short_description,
performance_name,
performance_start_date,
order_create_audit_time,
facts.default_currency               ;;

      sql_trigger_value: select max(order_create_audit_time) from `fivetran-ovation-tix-warehouse.audienceview.unlimited_orders_summary`;;
    }

  dimension:  UUID  { type: string sql: ${TABLE}.UUID  ;; }
  dimension:  client_name { type: string sql: ${TABLE}.client_name ;; }
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

  measure: total_orders_created { type: sum label: "Total Orders Created" drill_fields: [client_name,performance_short_description,performance_date_date,order_create_date_date]sql: ${TABLE}.orders_created ;;}
  measure: total_admissions_sold_amount { type: sum value_format_name: usd label: "Total Sold Amount" sql: ${TABLE}.admissions_sold_amount ;; }
  measure: total_admissions_sold_amount_usd { type: sum value_format_name: usd label: "Total Sold Amount (USD)" sql: ${TABLE}.admissions_sold_amount_usd ;; }

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

#  measure: count {
#    type: count
#    drill_fields: [userrole_name, client_name]
#  }
  }
