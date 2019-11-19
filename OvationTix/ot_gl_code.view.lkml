view: gl_code {
  sql_table_name: trs_trs.gl_code ;;
  drill_fields: [gl_code_id]

  dimension: gl_code_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.gl_code_id ;;
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

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension_group: create {
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
    sql: ${TABLE}.create_date ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: description_1 {
    type: string
    sql: ${TABLE}.description_1 ;;
  }

  dimension: description_2 {
    type: string
    sql: ${TABLE}.description_2 ;;
  }

  dimension_group: last_updated {
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
    sql: ${TABLE}.last_updated ;;
  }

  dimension: marketing_data_1 {
    type: string
    sql: ${TABLE}.marketing_data_1 ;;
  }

  dimension: marketing_data_2 {
    type: string
    sql: ${TABLE}.marketing_data_2 ;;
  }

  dimension: marketing_data_3 {
    type: string
    sql: ${TABLE}.marketing_data_3 ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      gl_code_id,
      client.client_id,
      client.client_display_name,
      client.merchant_name,
      client.lastname,
      client.perspective_name,
      client.firstname,
      client.client_name,
      client.verisign_username
    ]
  }
}
