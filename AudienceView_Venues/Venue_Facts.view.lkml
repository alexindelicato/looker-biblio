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
    performance_series_name,
    performance_short_description,
    performance_name,
    performance_start_date,
    cast( performance_start_date as TIMESTAMP) as performance_time,
    SUM(capacity) as capacity,
    SUM(sold_count) as sold_count
    FROM
    (
      SELECT
      UUID,
      'Unlimited' as product_name,
      client_name,
      sf_account_name,
      sf_account_id,
      venue_name,
      performance_series_name,
      performance_short_description,
      performance_name,
      performance_start_date,
      cast( performance_start_date as TIMESTAMP) as performance_time,
      capacity,
      sold_count
      FROM `fivetran-ovation-tix-warehouse.audienceview.venue_facts_new`

      UNION ALL

      SELECT
      inv_event as UUID,
      'Select' as product_name,
      members.organizationname as client_name,
      NULL as sf_account_name,
      members.memberid as sf_account_id,
      venues.name as venue_name,
      events.title as performance_series_name,
      events.title as performance_short_description,
      events.title as performance_name,
      CASE WHEN events.timezone != 'none' THEN
        DATETIME( TIMESTAMP_MICROS(performance_event.starttime*1000000), events.timezone)
      ELSE
        DATETIME( TIMESTAMP_MICROS(performance_event.starttime*1000000), 'US/Pacific')
      END as performance_time,
      CASE WHEN events.timezone != 'none' THEN
        TIMESTAMP_MICROS(performance_event.starttime*1000000)
      ELSE
        TIMESTAMP_MICROS(performance_event.starttime*1000000)
      END as performance_start_date,
      sum( in_event_inventory + in_event_sold + in_event_held ) as capacity,
      sum(in_event_sold) as sold_count,
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
      and DATETIME( TIMESTAMP_MICROS(performance_event.starttime*1000000) ) > '2020-01-01T00:00:00'
      group by
      inv_event,
      members.organizationname,
      members.memberid,
      venues.name,
      events.title, events.timezone,
      performance_event.starttime

    )as t1
    GROUP BY
    UUID,
    product_name,
    client_name,
    sf_account_name,
    sf_account_id,
    venue_name,
    performance_series_name,
    performance_short_description,
    performance_name,
    performance_start_date
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

  dimension: venue_name {
    type: string
    sql: ${TABLE}.venue_name ;;
  }

  measure:total_sold_count { type: sum sql: ${TABLE}.sold_count ;; drill_fields: [venue_facts*] }
  measure:total_capacity_count { type: sum sql: ${TABLE}.capacity ;; drill_fields: [venue_facts*] }
  measure:total_performance_count { type: count_distinct sql: ${TABLE}.UUID ;; drill_fields: [venue_facts*] }

  set: venue_facts {
    fields: [
      client_name,
      venue_name,
      performance_series_name
    ]
  }

}
