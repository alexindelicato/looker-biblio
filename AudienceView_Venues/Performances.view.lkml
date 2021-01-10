view: performances {
  derived_table: {
    sql:
WITH Unlimited AS (
  SELECT 'Unlimited' as product_name
    ,UUID PerformanceId
    ,capacity
  FROM `audienceview.venue_facts`

),trs AS (
  SELECT 'Professional' as product_name
    ,CAST(performance_id AS STRING) PerformanceId
    ,SUM(total_seat_count) capacity
  FROM `trs_trs.performance_stats_total`
  where _fivetran_deleted   = false
  GROUP BY performance_id
),sel AS (
  SELECT 'Select' as product_name
    ,performanceid PerformanceId
    ,sum( in_event_inventory + in_event_sold + in_event_held )
  FROM (
          SELECT performanceid, (inventory) as in_event_inventory, (sold) as in_event_sold, (held) as in_event_held, (notforsale) as in_event_notforsale, 'F'
          FROM mysql_service.genbysec_inventory
          UNION ALL
          SELECT performanceid , (inventory) as in_event_inventory, (sold) as in_event_sold, 0, (notforsale) as in_event_notforsale, 'G'
          FROM mysql_service.general_inventory
          UNION ALL
          SELECT performanceid, (inventory) as in_event_inventory, (sold) as in_event_sold, (held) as in_event_held, 0,  'R'
          FROM mysql_service.reserved_inventory
      ) t
  GROUP BY performanceid
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

)
SELECT product_name
  , PerformanceId
  , Capacity
FROM Combined_records;;
  }

  dimension: product_name {}
  dimension: PerformanceId {}

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: concat(${TABLE}.product_name, ${TABLE}.PerformanceId) ;;
  }

  dimension: capacity {}
  measure: total_capacity {
    type:sum_distinct
    sql: ${capacity} ;;
  }

}
