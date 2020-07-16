view: sample {
  sql_table_name: `fivetran-ovation-tix-warehouse.sample.sample`
    ;;

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

  dimension: additional_info {
    type: string
    sql: ${TABLE}.additional_info ;;
  }

  dimension: additional_source {
    type: string
    sql: ${TABLE}.additional_source ;;
  }

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

  dimension: case_id {
    type: number
    sql: ${TABLE}.case_id ;;
  }

  dimension: case_source {
    type: string
    sql: ${TABLE}.case_source ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: date_report {
    type: time
    sql: ${TABLE}.date_report ;;
  }

  dimension: health_region {
    type: string
    sql: ${TABLE}.health_region ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: locally_acquired {
    type: string
    sql: ${TABLE}.locally_acquired ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: method_note {
    type: string
    sql: ${TABLE}.method_note ;;
  }

  dimension: map {
    type: location
    sql_latitude:  ${TABLE}.latitude  ;;
    sql_longitude:  ${TABLE}.longitude ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: provincial_case_id {
    type: number
    sql: ${TABLE}.provincial_case_id ;;
  }

  dimension: province_map {
    type: location
    sql_latitude:  ${TABLE}.provincial_latitude  ;;
    sql_longitude:  ${TABLE}.provincial_longitude ;;
  }

  dimension: provincial_latitude {
    type: number
    sql: ${TABLE}.provincial_latitude ;;
  }

  dimension: provincial_longitude {
    type: number
    sql: ${TABLE}.provincial_longitude ;;
  }

  dimension_group: report_week {
    type: time
    sql: ${TABLE}.report_week ;;
  }

  dimension: sex {
    type: string
    sql: ${TABLE}.sex ;;
  }

  dimension: travel_history_country {
    type: string
    sql: ${TABLE}.travel_history_country ;;
  }

  dimension: travel_yn {
    type: string
    sql: ${TABLE}.travel_yn ;;
  }

  measure: count_cases {
    type: count_distinct
    sql: ${TABLE}.case_id ;;
    drill_fields: [detail*]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  set: detail {
    fields: [
      case_id,
      age,
      country,
      date_report_date,
      health_region,
      locally_acquired,
      method_note,
      province,
      provincial_case_id,
      report_week_time,
      sex,
      travel_history_country,
      travel_yn,
      additional_info,
      additional_source,
      case_source
    ]
  }
}
