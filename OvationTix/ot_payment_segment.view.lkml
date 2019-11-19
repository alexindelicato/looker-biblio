view: payment_segment {
  sql_table_name: trs_trs.payment_segment ;;
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

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: auth_code {
    type: string
    sql: ${TABLE}.auth_code ;;
  }

  dimension: cc_name {
    type: string
    sql: ${TABLE}.cc_name ;;
  }

  dimension: cc_number_last_4_digits {
    type: string
    sql: ${TABLE}.cc_number_last_4_digits ;;
  }

  dimension: cc_type {
    type: string
    sql: ${TABLE}.cc_type ;;
  }

  dimension: gateway_ref {
    type: string
    sql: ${TABLE}.gateway_ref ;;
  }

  dimension: is_encrypted {
    type: number
    sql: ${TABLE}.is_encrypted ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: original_payment_fk {
    type: number
    sql: ${TABLE}.original_payment_fk ;;
  }

  dimension_group: payment {
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
    sql: ${TABLE}.payment_date ;;
  }

  dimension: payment_type_custom_id {
    type: string
    sql: ${TABLE}.payment_type_custom_id ;;
  }

  dimension: payment_type_id {
    type: number
    sql: ${TABLE}.payment_type_id ;;
  }

  dimension: pn_ref {
    type: string
    sql: ${TABLE}.pn_ref ;;
  }

  dimension: resp_msg {
    type: string
    sql: ${TABLE}.resp_msg ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}.result ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [id, cc_name, orders.order_id]
  }
}
