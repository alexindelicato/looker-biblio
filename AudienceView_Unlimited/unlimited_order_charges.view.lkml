view: unlimited_order_charges {
  sql_table_name: audienceview.unlimited_order_charges ;;

  dimension: audit_time {
    type: string
    sql: ${TABLE}.audit_time ;;
  }

  dimension: charge1_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.charge1_paid ;;
  }

  dimension: charge1_sold {
    type: number
    sql: ${TABLE}.charge1_sold ;;
  }

  dimension: charge2_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.charge2_paid ;;
  }

  dimension: charge2_sold {
    type: number
    sql: ${TABLE}.charge2_sold ;;
  }

  dimension: charge3_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.charge3_paid ;;
  }

  dimension: charge3_sold {
    type: number
    sql: ${TABLE}.charge3_sold ;;
  }

  dimension: charge4_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.charge4_paid ;;
  }

  dimension: charge4_sold {
    type: number
    sql: ${TABLE}.charge4_sold ;;
  }

  dimension: charge5_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.charge5_paid ;;
  }

  dimension: charge5_sold {
    type: number
    sql: ${TABLE}.charge5_sold ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: ordercharge_net_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ordercharge_net_paid ;;
  }

  dimension: ordercharge_net_sold {
    type: number
    sql: ${TABLE}.ordercharge_net_sold ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.quarter ;;
  }

  dimension: servicecharge_description {
    type: string
    sql: ${TABLE}.servicecharge_description ;;
  }

  dimension: servicecharge_name {
    type: string
    sql: ${TABLE}.servicecharge_name ;;
  }

  dimension: servicecharge_on_exchange_action {
    type: number
    sql: ${TABLE}.servicecharge_on_exchange_action ;;
  }

  dimension: servicecharge_on_exchange_action_description {
    type: string
    sql: ${TABLE}.servicecharge_on_exchange_action_description ;;
  }

  dimension: servicecharge_pricing_type {
    type: number
    sql: ${TABLE}.servicecharge_pricing_type ;;
  }

  dimension: servicecharge_pricing_type_description {
    type: string
    sql: ${TABLE}.servicecharge_pricing_type_description ;;
  }

  dimension: servicecharge_type {
    type: string
    sql: ${TABLE}.servicecharge_type ;;
  }

  dimension: servicecharge_type_description {
    type: string
    sql: ${TABLE}.servicecharge_type_description ;;
  }

  dimension: userrole_group {
    type: string
    sql: ${TABLE}.userrole_group ;;
  }

  dimension: userrole_name {
    type: string
    sql: ${TABLE}.userrole_name ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.UUID ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.YEAR ;;
  }

  measure: count {
    type: count
    drill_fields: [client_name, servicecharge_name, userrole_name]
  }
}
