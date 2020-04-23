view: audienceview_venue_facts {
  derived_table: {
    sql:
    SELECT
    UUID,
    product_name,
    client_name,
    sf_account_name,
    sf_account_id,
    venue_name,
    venue_address_street,
    venue_address_city,
    venue_address_state,
    venue_address_country,
    venue_address_zip,
    performance_series_name,
    performance_short_description,
    performance_name,
    cast( performance_start_date as TIMESTAMP) as performance_time,
    performance_start_date,
    SUM(capacity) as capacity,
    SUM(sold_count) as sold_count,
    SUM(printed_count) as printed_count,
    SUM(unprinted_count) as unprinted_count,
    SUM(scanned_count) as scanned_count,
    sold_current_month as sold_current_month,
    sold_prev_year as sold_prev_year,
    CASE WHEN SUM(sold_count) != 0 THEN
        SUM(scanned_count) / SUM (sold_count)
      ELSE
        0
      END as nonattendrate,
    CASE WHEN sold_current_month != 0 and sold_prev_year != 0
      THEN 1 ELSE 0
    END as isActive

    FROM
    (
      SELECT
      events.UUID as UUID,
      'Unlimited' as product_name,
      client_name,
      events.sf_account_name as sf_account_name,
      events.sf_account_id as sf_account_id,
      events.venue_name as venue_name,
      venue_location.venue_address_street as venue_address_street,
      venue_location.venue_address_city as venue_address_city,
      venue_location.venue_address_state as venue_address_state,
      venue_location.venue_address_zip as venue_address_zip,
      venue_location.venue_address_country as venue_address_country,
      performance_series_name,
      performance_short_description,
      performance_name,
      cast( performance_start_date as TIMESTAMP) as performance_time,
      performance_start_date,
      capacity,
      sold_count,
      1 as sold_current_month,
      1 as sold_prev_year,
      printed_count,
      unprinted_count,
      scanned_count
      FROM `fivetran-ovation-tix-warehouse.audienceview.venue_facts` as events
      LEFT JOIN `fivetran-ovation-tix-warehouse.audienceview.venue_location` as venue_location on venue_location.venue_name = events.venue_name
      where sold_count >= scanned_count
UNION ALL

      SELECT
      inv_event as UUID,
      'Select' as product_name,
      members.organizationname as client_name,
      NULL as sf_account_name,
      members.memberid as sf_account_id,
      venues.name as venue_name,
      venues.street as venue_address_street,
      venues.city as venue_address_city,
      venues.state as venue_address_state,
      venues.zip as venue_address_zip,
      venues.country as venue_address_country,
      events.title as performance_series_name,
      events.title as performance_short_description,
      events.title as performance_name,
      CAST(
      CASE WHEN events.timezone != 'none' THEN
        DATETIME( TIMESTAMP_MICROS(performance_event.starttime*1000000), events.timezone)
      ELSE
        DATETIME( TIMESTAMP_MICROS(performance_event.starttime*1000000), 'US/Pacific')
      END
      as TIMESTAMP) as performance_time,

      CASE WHEN events.timezone != 'none' THEN
        DATETIME(TIMESTAMP_MICROS(performance_event.starttime*1000000))
      ELSE
        DATETIME(TIMESTAMP_MICROS(performance_event.starttime*1000000))
      END as performance_start_date,

      sum( in_event_inventory + in_event_sold + in_event_held ) as capacity,
      sum(in_event_sold) as sold_count,
      1 as sold_current_month,
      1 as sold_prev_year,
      0 as printed_count,
      0 as unprinted_count,
      0 as scanned_count
      FROM (
          SELECT performanceid as inv_event, (inventory) as in_event_inventory, (sold) as in_event_sold, (held) as in_event_held, (notforsale) as in_event_notforsale, 'F'
          FROM mysql_service.genbysec_inventory
          UNION ALL
          SELECT performanceid as inv_event, (inventory) as in_event_inventory, (sold) as in_event_sold, 0, (notforsale) as in_event_notforsale, 'G'
          FROM mysql_service.general_inventory
          UNION ALL
          SELECT performanceid as inv_event, (inventory) as in_event_inventory, (sold) as in_event_sold, (held) as in_event_held, 0,  'R'
          FROM mysql_service.reserved_inventory
      ) t
      INNER JOIN mysql_service.performances as performance_event on performance_event.performanceid = inv_event
      INNER JOIN mysql_service.events on events.eventid = performance_event.eventid
      INNER JOIN mysql_service.venues on venues.venueid = events.venueid
      INNER JOIN mysql_service.members on members.memberid = events.memberid
      WHERE 1 = 1
      and DATETIME( TIMESTAMP_MICROS(performance_event.starttime*1000000) ) > '2016-01-01T00:00:00'
      group by
      inv_event,
      members.organizationname,
      members.memberid,
      venues.name,
      venues.street,
      venues.city,
      venues.state,
      venues.zip,
      venues.country,
      events.title, events.timezone,
      performance_event.starttime

UNION ALL

    SELECT
    CAST(performance_id as STRING) as UUID,
    'Professional' as product_name,
    client_name,
    NULL as sf_account_name,
    crm_id as sf_account_id,
    venue_location.venue_name as venue_name,
    venue_location.venue_address_street as venue_address_street,
    venue_location.venue_address_city as venue_address_city,
    venue_location.venue_address_state as venue_address_state,
    venue_location.venue_address_zip as venue_address_zip,
    venue_location.venue_address_country as venue_address_country,
    prod_name as performance_series_name,
    prod_name as performance_short_description,
    prod_name as performance_name,
    perf_start as performance_time,
    CAST( perf_start as DATETIME ) as performance_start_date,
    0 as capacity,
    SUM(
      CASE WHEN status_id in ( 2, 9 ) THEN 1 ELSE 0 END
    ) as sold_count,
    (
      SELECT APPROX_COUNT_DISTINCT(pro_client_id)
      from `fivetran-ovation-tix-warehouse.trs_trs.pro_orders_summary` as current_orders
        where pro_client_id = production.client_id
        AND current_orders.pro_orders_year = EXTRACT( YEAR FROM CURRENT_DATE())
        AND current_orders.pro_orders_month = EXTRACT( MONTH FROM CURRENT_DATE())
      GROUP BY pro_client_id
    ) as sold_current_month,
    (
      SELECT APPROX_COUNT_DISTINCT(pro_client_id)
      from `fivetran-ovation-tix-warehouse.trs_trs.pro_orders_summary` as prev_orders
        where prev_orders.pro_client_id = production.client_id
        AND prev_orders.pro_orders_year = 2019
      GROUP BY pro_client_id
    ) as sold_prev_year,
    SUM(
      CASE WHEN status_id = 2 THEN 1 ELSE 0 END
    ) as printed_count,
    0 as unprinted_count,
    SUM(
      CASE WHEN status_id = 9 THEN 1 ELSE 0 END
    ) as scanned_count

    FROM `fivetran-ovation-tix-warehouse.trs_trs.order_detail`
    INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.performance` as performance on id = performance_id
    INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.production` as production on production.production_id = performance.production_id
    INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.client` as client on client.client_id = production.client_id
    INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.report_crm` as crm on crm.id = client.report_crm_id
    LEFT JOIN `fivetran-ovation-tix-warehouse.audienceview.venue_location` as venue_location on venue_location.venue_name = production.venue_name

    where 1 = 1
    AND CAST( perf_start as DATETIME ) > '2016-01-01'

    group by
    performance_id,
    client_name,
--    client.client_id,
    production.client_id,
    crm.id,
    sf_account_id,
    venue_location.venue_name,
    venue_location.venue_address_street,
    venue_location.venue_address_city,
    venue_location.venue_address_state,
    venue_location.venue_address_country,
    venue_location.venue_address_zip,
    prod_name,
    perf_start

    )as t1
    GROUP BY
    UUID,
    product_name,
    client_name,
    sf_account_name,
    sf_account_id,
    venue_name,
    venue_address_street,
    venue_address_city,
    venue_address_state,
    venue_address_country,
    venue_address_zip,
    performance_series_name,
    performance_short_description,
    performance_name,
    performance_start_date,
    sold_current_month,
    sold_prev_year
    ORDER BY
    cast( performance_start_date as TIMESTAMP) ASC,
    client_name,
    performance_series_name
               ;;
  }


#  dimension: performance_start_date {
#    type: date
#    sql: ${TABLE}.performance_start_date  ;;
#  }

  dimension_group: performance_time {
    type: time
    sql: ${TABLE}.performance_time  ;;
  }

  dimension: UUID {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: nonattendrate {
    type: number
    sql: ${TABLE}.nonattendrate ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: performance_name {
    type: string
    sql: ${TABLE}.performance_name ;;
  }


  dimension: performance_series_name {
    type: string
    sql: ${TABLE}.performance_series_name ;;
  }

  dimension: performance_short_description {
    type: string
    sql: ${TABLE}.performance_short_description ;;
  }

  dimension: sf_account_id {
    type: string
    sql: ${TABLE}.sf_account_id ;;
  }

  dimension: sf_account_name {
    type: string
    sql: ${TABLE}.sf_account_name ;;
  }

  dimension: capacity {
    type: number
    sql: ${TABLE}.capacity ;;
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

  dimension: isActive {
    type: number
    sql: ${TABLE}.isActive ;;
  }


  dimension: printed_count {
    type: number
    sql: ${TABLE}.printed_count ;;
  }

  dimension: unprinted_count {
    type: number
    sql: ${TABLE}.unprinted_count ;;
  }

  dimension: scanned_count {
    type: number
    sql: ${TABLE}.scanned_count ;;
  }

  dimension: venue_name {
    type: string
    sql: ${TABLE}.venue_name ;;
  }

  dimension: venue_address_city {
    type: string
    sql: ${TABLE}.venue_address_city ;;
  }

  dimension: venue_address_state {
    type: string
    sql: ${TABLE}.venue_address_state ;;
  }


  measure:total_sold_count { type: sum sql: ${TABLE}.sold_count ;; drill_fields: [venue_facts*] }
  measure:total_capacity_count { type: sum sql: ${TABLE}.capacity ;; drill_fields: [venue_facts*] }
  measure:total_performance_count { type: count_distinct sql: ${TABLE}.UUID ;; drill_fields: [venue_facts*] }
  measure:total_scanned_count { type: sum sql: ${TABLE}.scanned_count ;; drill_fields: [venue_facts*] }
  measure:non_attendance_rate{ type: average  sql:1-${TABLE}.nonattendrate ;; value_format_name: percent_2 drill_fields: [venue_facts*] }
  measure:attendance_rate{ type: number  sql:1 - ((${total_scanned_count} / ${total_sold_count}*1)) ;; value_format_name: percent_2 drill_fields: [venue_facts*] }

#  measure: is_active_selling {
#    type: yesno
#    sql:${sold_current_month} != 0 and ${sold_prev_year} != 0 ;;
#  }

  set: venue_facts {
    fields: [
      client_name,
      venue_name,
      performance_series_name
    ]
  }

}
