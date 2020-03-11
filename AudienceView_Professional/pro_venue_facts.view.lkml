view: pro_venue_facts {
  derived_table: {
    sql:
    SELECT
    client_name,
    client.client_id,
    crm_name,
    prod_name,
    venue_location.venue_name as venue_name,
    venue_location.venue_address_street as venue_address_street,
    venue_location.venue_address_city as venue_address_city,
    venue_location.venue_address_state as venue_address_state,
    venue_location.venue_address_zip as venue_address_zip,
    venue_location.venue_address_country as venue_address_country,
    CAST( performance_id as STRING) as performance_id,
    cast( perf_start as TIMESTAMP) as perf_start,
    SUM(
      CASE WHEN status_id in ( 2, 9 ) THEN 1 ELSE 0 END
    ) as sold_count,
    (
      (SELECT COUNT(0) from `fivetran-ovation-tix-warehouse.trs_trs.orders` as current_orders
      INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.order_detail` as current_order_detail on current_order_detail.order_id = current_orders.order_id
      WHERE current_order_detail.status_id in ( 2, 9 )
      AND current_orders.client_id = client.client_id
      AND CAST(current_orders.time as DATE) BETWEEN DATE_SUB(current_date(), INTERVAL 1 MONTH) and current_date()
      GROUP BY client.client_id)
    ) as sold_current_month,
    (
      (SELECT COUNT(0) from `fivetran-ovation-tix-warehouse.trs_trs.orders` as past_orders
      INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.order_detail` as past_order_detail on past_order_detail.order_id = past_orders.order_id
      WHERE past_order_detail.status_id in ( 2, 9 )
      AND past_orders.client_id = client.client_id
      AND CAST(past_orders.time as DATE) BETWEEN '2019-01-01' and '2020-01-01'
      GROUP BY client.client_id)
    ) as sold_prev_year,

    SUM(
      CASE WHEN status_id = 2 THEN 1 ELSE 0 END
    ) as printed_count,
    SUM(
      CASE WHEN status_id = 9 THEN 1 ELSE 0 END
    ) as scanned_count

    FROM `fivetran-ovation-tix-warehouse.trs_trs.order_detail`
    INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.performance` as performance on id = performance_id
    INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.production` as production on production.production_id = performance.production_id
    INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.client` as client on client.client_id = production.client_id
    INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.report_crm` as crm on crm.id = client.report_crm_id
    LEFT JOIN `fivetran-ovation-tix-warehouse.audienceview.venue_location` as venue_location on venue_location.venue_name = production.venue_name

    where performance_id in
    (
    select distinct(performance_id)
    from `fivetran-ovation-tix-warehouse.trs_trs.order_detail`
    where type = 'TCK'
    and status_id =  9
    )
    group by
    client_name,
    client.client_id,
    crm_name,
    prod_name,
    venue_location.venue_name,
    venue_address_street,
    venue_address_city,
    venue_address_state,
    venue_address_zip,
    venue_address_country,
    performance_id,
    perf_start

               ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: prod_name {
    type: string
    sql: ${TABLE}.prod_name ;;
  }

  dimension: crm_name {
    type: string
    sql: ${TABLE}.crm_name ;;
  }

  dimension: venue_name {
    type: string
    sql: ${TABLE}.venue_name ;;
  }

  dimension: venue_address_street {
    type: string
    sql: ${TABLE}.venue_address_street ;;
  }

  dimension: venue_address_city {
    type: string
    sql: ${TABLE}.venue_address_city ;;
  }

  dimension: venue_address_state {
    type: string
    sql: ${TABLE}.venue_address_state ;;
  }

  dimension: venue_address_zip {
    type: string
    sql: ${TABLE}.venue_address_zip ;;
  }

  dimension: venue_address_country {
    type: string
    sql: ${TABLE}.venue_address_country ;;
  }

  dimension: performance_id {
    type: string
    sql: ${TABLE}.performance_id ;;
  }

  dimension_group: perf_start {
    type: time
    sql: ${TABLE}.perf_start  ;;
  }

  dimension: sold_count {
    type: number
    sql: ${TABLE}.sold_count ;;
  }

  dimension: sold_current_month {
    type: number
    sql: ${TABLE}.sold_current_month ;;
  }

  dimension: sold_prev_year {
    type: number
    sql: ${TABLE}.sold_prev_year ;;
  }


  dimension: printed_count {
    type: number
    sql: ${TABLE}.printed_count ;;
  }

  dimension: scanned_count {
    type: number
    sql: ${TABLE}.scanned_count ;;
  }

  measure:total_sold_count { type: sum sql: ${TABLE}.sold_count ;; drill_fields: [venue_facts*] }
  #measure:total_sold_current_month { type: sum sql: ${TABLE}.sold_current_month ;; drill_fields: [venue_facts*] }
  #measure:total_sold_prev_year { type: sum sql: ${TABLE}.sold_prev_year ;; drill_fields: [venue_facts*] }
  measure:total_performance_count { type: count_distinct sql: ${TABLE}.performance_id ;; drill_fields: [venue_facts*] }
  measure:total_scanned_count { type: sum sql: ${TABLE}.scanned_count ;; drill_fields: [venue_facts*] }
  measure:non_attendance_rate{ type: number  sql:1 - ((${total_scanned_count} / ${total_sold_count}*1)) ;; value_format_name: percent_2 drill_fields: [venue_facts*] }

  measure: is_active_selling {
    type: yesno
    sql:${sold_current_month} != 0 and ${sold_prev_year} != 0 ;;
  }


  set: venue_facts {
    fields: [
      crm_name,
      performance_id,
      prod_name,
      perf_start_date,
      total_scanned_count,
      total_sold_count,
      non_attendance_rate
    ]
  }

  }
