view: pro_min_orders {
  derived_table: {
    sql:
    SELECT
    ot_client.client_id as first_order_client_id,
    ot_client.client_name as first_order_client_name,
    min(ot_orders.time) as first_order_date,
    count(0) as total_orders_count

    FROM `fivetran-ovation-tix-warehouse.trs_trs.orders` as ot_orders
    LEFT JOIN trs_trs.client  AS ot_client ON ot_orders.client_id=ot_client.client_id

    where (ot_client.demo=0 and ot_client.testing_mode=0 and ot_client.active = 1 and ot_orders.imported=0 and ot_orders.is_test_mode=0 and ot_orders.status_id != 11)

    GROUP BY ot_client.client_id, ot_client.client_name
    ORDER BY ot_client.client_id

               ;;
  }

  dimension: first_order_client_id {
    type: string
    sql: ${TABLE}.first_order_client_id  ;;
  }

  dimension_group: first_order_date {
    type: time
    sql: ${TABLE}.first_order_date  ;;
  }

  }
