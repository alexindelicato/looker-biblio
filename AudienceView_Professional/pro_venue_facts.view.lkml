view: pro_venue_facts {
  derived_table: {
    sql:
    SELECT
    CAST( performance_id as STRING) as performance_id,
    cast( perf_start as TIMESTAMP) as perf_start,
    SUM(
      CASE WHEN status_id in ( 2, 9 ) THEN 1 ELSE 0 END
    ) as sold_count,
    SUM(
      CASE WHEN status_id = 2 THEN 1 ELSE 0 END
    ) as printed_count,
    SUM(
      CASE WHEN status_id = 9 THEN 1 ELSE 0 END
    ) as scanned_count

    FROM `fivetran-ovation-tix-warehouse.trs_trs.order_detail`
    INNER JOIN `fivetran-ovation-tix-warehouse.trs_trs.performance` on id = performance_id
    where performance_id in
    (
    select distinct(performance_id)
    from `fivetran-ovation-tix-warehouse.trs_trs.order_detail`
    where type = 'TCK'
    and status_id in ( 2, 9 )
    )
    group by performance_id, perf_start

               ;;
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

  dimension: printed_count {
    type: number
    sql: ${TABLE}.printed_count ;;
  }

  dimension: scanned_count {
    type: number
    sql: ${TABLE}.scanned_count ;;
  }

  measure:total_sold_count { type: sum sql: ${TABLE}.sold_count ;; drill_fields: [venue_facts*] }
  measure:total_performance_count { type: count_distinct sql: ${TABLE}.performance_id ;; drill_fields: [venue_facts*] }
  measure:total_scanned_count { type: sum sql: ${TABLE}.scanned_count ;; drill_fields: [venue_facts*] }
  measure:non_attendance_rate{ type: number  sql:1 - ((${total_scanned_count} / ${total_sold_count}*1)) ;; value_format_name: percent_2 drill_fields: [venue_facts*] }

  set: venue_facts {
    fields: [
      performance_id
    ]
  }

  }
