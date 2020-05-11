view: pro_client_facts {
  derived_table: {
  sql: SELECT
  ot_client.client_id  AS client_id,
  ot_client.client_name  AS client_name,
  CAST(MIN(ot_orders.time)  AS DATE) AS min_order_date,
  CAST(MAX(ot_orders.time)  AS DATE) AS max_order_date,
  COUNT(*) AS ot_orders_count,
  sum(ot_client_statement.ovationtix_service_fees) as total_service_fees,
  sum (ot_client_statement.tkts_service_fees) as total_tkts_service_fees,
  sum(ot_client_statement.ovationtix_phone_fees) as ot_phone_fees,
  sum(ot_client_statement.credit_card_processing_fees) as total_credit_card_processing_fees
FROM trs_trs.orders  AS ot_orders
LEFT JOIN trs_trs.client  AS ot_client ON ot_orders.client_id=ot_client.client_id
LEFT JOIN trs_trs.client_statement  AS ot_client_statement ON ot_client.client_id=ot_client_statement.client_id

WHERE ot_client.demo=0 and ot_client.testing_mode=0 and ot_client.client_id NOT IN (35200,34918) and  ot_client.active = 1 and ot_orders.imported=0 and ot_orders.is_test_mode=0 and ot_orders.status_id != 11
GROUP BY 1,2 ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

# todo: total revenue measure
dimension: total_revenue {
  type: number
  sql: ${TABLE}.total_service_fees+${TABLE}.total_tkts_service_fees+${TABLE}.ot_phone_fees ;;
  value_format_name: usd_0
}

  measure: sum_total_revenue {
    type: sum
    sql: ${TABLE}.total_service_fees+${TABLE}.total_tkts_service_fees+${TABLE}.ot_phone_fees ;;
    value_format_name: usd_0
  }

  measure: count {
    type: count
  }

dimension: total_credit_card_processing_fees {
  type: number
  sql: ${TABLE}.total_credit_card_processing_fees ;;
  value_format_name: usd_0
}

dimension_group: max_order_date {
  type: time
  sql: ${TABLE}.max_order_date ;;
}

  dimension_group: min_order_date {
    type: time
    sql: ${TABLE}.min_order_date ;;
  }

  dimension: is_active {
    type: yesno
    sql: DATE_DIFF(current_date, ${TABLE}.max_order_date, month) < 13 ;;
  }

}
