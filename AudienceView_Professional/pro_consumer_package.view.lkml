view: pro_consumer_package {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.consumer_package`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension_group: benefits_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.benefits_start_date AS TIMESTAMP) ;;
  }

  dimension: bundled_package_group_id {
    type: number
    sql: ${TABLE}.bundled_package_group_id ;;
  }

  dimension_group: buy {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.buy_date AS TIMESTAMP) ;;
  }

  dimension: consumer_id {
    type: number
    sql: ${TABLE}.consumer_id ;;
  }

  dimension: cp_name {
    type: string
    sql: ${TABLE}.cp_name ;;
  }

  dimension_group: expiration {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.expiration_date AS TIMESTAMP) ;;
  }

  dimension: flagged_home_seat {
    type: number
    sql: ${TABLE}.flagged_home_seat ;;
  }

  dimension: never_expires {
    type: number
    sql: ${TABLE}.never_expires ;;
  }

  dimension: orig_seat_id {
    type: number
    sql: ${TABLE}.orig_seat_id ;;
  }

  dimension: package_id {
    type: number
    sql: ${TABLE}.package_id ;;
  }

  dimension: package_price_point_id {
    type: number
    sql: ${TABLE}.package_price_point_id ;;
  }

  dimension: price_point_name {
    type: string
    sql: ${TABLE}.price_point_name ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [id, price_point_name, cp_name]
  }
}
