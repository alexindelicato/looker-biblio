view: sel_performance_inventory {
    derived_table: {
      sql:
        SELECT
            performanceid as ID,
            members.organizationname as client_name,
            venues.name as venue_name,
            events.title as event_title,
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
            sum(in_event_inventory) as inventory,
            sum(in_event_notforsale) as notforsale,
            sum(in_event_held) as held,
            sum(in_event_inventory + in_event_sold + in_event_held ) as capacity,
            sum(in_event_sold) as sold_count,
            FROM (
                SELECT performanceid as ID, (inventory) as in_event_inventory, (sold) as in_event_sold, (held) as in_event_held, (notforsale) as in_event_notforsale, 'F'
                FROM mysql_service.genbysec_inventory
                UNION ALL
                SELECT performanceid as ID, (inventory) as in_event_inventory, (sold) as in_event_sold, 0, (notforsale) as in_event_notforsale, 'G'
                FROM mysql_service.general_inventory
                UNION ALL
                SELECT performanceid as ID, (inventory) as in_event_inventory, (sold) as in_event_sold, (held) as in_event_held, 0,  'R'
                FROM mysql_service.reserved_inventory
            ) t
            INNER JOIN mysql_service.performances as performance_event on performance_event.performanceid = ID
            INNER JOIN mysql_service.events on events.eventid = performance_event.eventid
            INNER JOIN mysql_service.venues on venues.venueid = events.venueid
            INNER JOIN mysql_service.members on members.memberid = events.memberid
            WHERE 1 = 1
            group by
            ID,
            client_name,
            venues.name,
            events.title, events.timezone,
            performance_event.starttime
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

    dimension: ID {
      primary_key: yes
      hidden: yes
      type: string
      sql: ${TABLE}.id ;;
    }

  measure: count_performances {
    type: count_distinct
    sql: ${TABLE}.id ;;
  }

    dimension: client_name {
      type: string
      sql: ${TABLE}.client_name ;;
    }

    dimension: capacity {
      type: number
      hidden: yes
      sql: ${TABLE}.capacity ;;
    }

    dimension: sold_count {
      type: number
      hidden: yes
      sql: ${TABLE}.sold_count ;;
    }

  dimension: inventory {
    type: number
    hidden: yes
    sql: ${TABLE}.inventory ;;
  }

  dimension: notforsale {
    type: number
    hidden: yes
    sql: ${TABLE}.notforsale ;;
  }

    dimension: venue_name {
      type: string
      sql: ${TABLE}.venue_name ;;
    }

    measure:total_sold_count { type: sum sql: ${TABLE}.sold_count ;; drill_fields: [venue_facts*] }
    measure:total_capacity_count { type: sum sql: ${TABLE}.capacity ;; drill_fields: [venue_facts*] }
    measure:total_inventory_count { type: sum sql: ${TABLE}.inventory ;; drill_fields: [venue_facts*] }
    measure:total_held_count { type: sum sql: ${TABLE}.held ;; drill_fields: [venue_facts*] }
    measure:total_not_for_sale_count { label:"Total Killed Seats" type: sum sql: ${TABLE}.notforsale ;; drill_fields: [venue_facts*] }
    measure:total_performance_count { type: count_distinct sql: ${TABLE}.id ;; drill_fields: [venue_facts*] }

    set: venue_facts {
      fields: [
        client_name,
        venue_name,
      ]
    }
    }
