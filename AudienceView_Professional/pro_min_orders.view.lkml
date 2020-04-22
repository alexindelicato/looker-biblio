view: pro_min_orders {
  derived_table: {
    sql:
    SELECT
  ot_client.client_id
    min(ot_orders.time) as min_order_date

    FROM `fivetran-ovation-tix-warehouse.trs_trs.orders` as ot_orders
    LEFT JOIN trs_trs.client  AS ot_client ON ot_orders.client_id=ot_client.client_id

    where (ot_client.demo=0 and ot_client.testing_mode=0 and ot_client.active = 1 and ot_orders.imported=0 and ot_orders.is_test_mode=0 and ot_orders.status_id != 11)

    GROUP BY 1
  ORDER BY 2 DESC
    LIMIT 1

               ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id  ;;
  }

  dimension_group: min_order_date {
    type: time
    sql: ${TABLE}.min_order_date  ;;
  }

  }
