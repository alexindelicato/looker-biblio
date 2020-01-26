view: unlim_venue_facts {
  derived_table: {
    sql:
SELECT
UUID,
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

  set: venue_facts {
    fields: [
      client_name,
      venue_name
    ]
  }

}
