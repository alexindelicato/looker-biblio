view: ganalytics_ot {
  derived_table: {
    sql:
    SELECT
    _fivetran_id,
    date,
    profile,
    item_quantity,
    item_revenue,
    segment,
    transaction_id,
    cast(substr(trim(transaction_id), 3, length(transaction_id)-2)as INT64) as ot_transaction_id,
    product_name,
    product_sku,
    sum(item_quantity) as sum_quantity,
    sum(item_revenue) as sum_revenue
    FROM `fivetran-ovation-tix-warehouse.ganalytics_ot.ganalytics_ot` as ganalytics_ot
    where date =
    (
      select max(date) from `fivetran-ovation-tix-warehouse.ganalytics_ot.ganalytics_ot` as ga_dateq
      where ga_dateq.transaction_id = ganalytics_ot.transaction_id
    )
    group by 1,2,3,4,5,6,7,8,9,10
    ;;
    sql_trigger_value: select max(date) from `fivetran-ovation-tix-warehouse.ganalytics_ot.ganalytics_ot`;;
  }


  dimension: hacky_primary_key {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}._fivetran_id ;;
  }


  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: item_quantity {
    type: number
    sql: ${TABLE}.item_quantity ;;
  }

  measure: total_item_quantity {
    type: sum
    sql:  ${TABLE}.sum_quantity ;;
  }


  dimension: item_revenue {
    type: number
    value_format: "$#,##0.00"
    sql: ${TABLE}.item_revenue ;;
    drill_fields: [detail*]
  }

  measure: total_item_revenue {
    type: sum
    value_format: "$#,##0.00"
    sql:  ${TABLE}.sum_revenue ;;
    drill_fields: [detail*]
  }

  measure: average_revenue {
    type: average
    value_format: "$#,##0.00"
    sql:  ${TABLE}.item_revenue ;;
  }

  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: ot_transaction_id {
    type: number
    sql: ${TABLE}.ot_transaction_id ;;
  }

  measure: count_transaction_id {
    type: count_distinct
    sql:  ${ot_transaction_id} ;;
    drill_fields: [detail*]
    }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
# ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      ot_order.id,
      ot_client.client_id,
      ot_client.client_name,
      ot_orders.order_id,
      ot_production.prod_name,
      ot_client.merchant_name,
      ot_client.lastname,
      ot_client.perspective_name,
      ot_client.firstname,
      ot_client.client_name,
      ot_client.verisign_username,
      ot_time.date,
      ot_orders.sum_total_distinct,
      ot_order_detail.count_ticket_id
    ]
  }
}
