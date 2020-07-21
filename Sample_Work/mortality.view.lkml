view: mortality {
  sql_table_name: `fivetran-ovation-tix-warehouse.sample.mortality`
    ;;

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
    primary_key: yes
    sql: ${TABLE}.case_id ;;
  }

  dimension: case_id_3 {
    type: string
    sql: ${TABLE}.case_id_3 ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: date_death_report {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_death_report ;;
  }

  dimension: death_id {
    type: number
    sql: ${TABLE}.death_id ;;
  }

  dimension: death_source {
    type: string
    sql: ${TABLE}.death_source ;;
  }

  dimension: health_region {
    type: string
    sql: ${TABLE}.health_region ;;
  }

  dimension: canada_population {
    type: number
    sql: 37590000 ;;
  }

  measure: mortality_rate {
    type: number
    sql: (${count_cases} / ${canada_population})*1000000 ;;
    value_format_name: decimal_2
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: province_death_id {
    type: number
    sql: ${TABLE}.province_death_id ;;
  }

  dimension: sex {
    type: string
    sql: ${TABLE}.sex ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_cases {
    type: count_distinct
    sql: ${case_id} ;;
    drill_fields: []
  }
}
