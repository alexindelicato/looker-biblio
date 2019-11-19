view: order_detail {
  sql_table_name: trs_trs.order_detail ;;

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

  dimension: consumer_fee {
    type: number
    sql: ${TABLE}.consumer_fee ;;
  }

  dimension: consumer_pac_id {
    type: number
    sql: ${TABLE}.consumer_pac_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: donation_id {
    type: number
    sql: ${TABLE}.donation_id ;;
  }

  dimension: group_discount_id {
    type: number
    sql: ${TABLE}.group_discount_id ;;
  }

  dimension_group: last_tx {
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
    sql: ${TABLE}.last_tx_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: orderdetail_id {
    type: number
    sql: ${TABLE}.orderdetail_id ;;
  }

  dimension: paid_amount {
    type: number
    sql: ${TABLE}.paid_amount ;;
  }

  dimension: pct_off {
    type: number
    sql: ${TABLE}.pct_off ;;
  }

  dimension: performance_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.performance_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: price_level_id {
    type: number
    sql: ${TABLE}.price_level_id ;;
  }

  dimension: processing_fee {
    type: number
    sql: ${TABLE}.processing_fee ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: promotion_code {
    type: string
    sql: ${TABLE}.promotion_code ;;
  }

  dimension: promotion_id {
    type: number
    sql: ${TABLE}.promotion_id ;;
  }

  dimension: promotion_name {
    type: string
    sql: ${TABLE}.promotion_name ;;
  }

  dimension: service_fee {
    type: number
    sql: ${TABLE}.service_fee ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  dimension: tax {
    type: number
    sql: ${TABLE}.tax ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: ticket_type_id {
    type: number
    sql: ${TABLE}.ticket_type_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [promotion_name, name, performance.id, orders.order_id]
  }
}
