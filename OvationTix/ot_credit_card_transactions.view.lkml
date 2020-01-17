view: ot_credit_card_transactions {
    derived_table: {
      sql: SELECT o.order_id, o.is_held_by_client, o.status_id, o.type, ot.cc_type, o.total
              FROM trs_trs.orders o
              JOIN trs_trs.orders_transaction ot ON o.order_id = ot.order_id
              WHERE o.is_test_mode = 0 AND o.payment_type_id IN (1, 2, 3)

              UNION ALL

              SELECT o.order_id, o.is_held_by_client, o.status_id, o.type, ps.cc_type, ps.amount
              FROM trs_trs.orders o
              JOIN trs_trs.payment_segment ps ON o.order_id = ps.order_id
              WHERE o.is_test_mode = 0 AND o.payment_type_id IN (999, 1000)
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: order_id {
      type: number
      sql: ${TABLE}.order_id ;;
      primary_key: yes
    }

    dimension: is_held_by_client {
      type: number
      sql: ${TABLE}.is_held_by_client ;;
    }

    dimension: status_id {
      type: number
      sql: ${TABLE}.status_id ;;
    }

    dimension: type {
      type: string
      sql: ${TABLE}.type ;;
    }

    dimension: cc_type {
      type: string
      sql: ${TABLE}.cc_type ;;
    }

    dimension: total {
      type: number
      sql: ${TABLE}.total ;;
    }

    measure: sum_total {
      type: sum
      sql: ${total} ;;
      value_format: "$#,##0.00"
      drill_fields: [detail*]
    }


    set: detail {
      fields: [
        order_id,
        is_held_by_client,
        status_id,
        type,
        cc_type,
        total
      ]
    }
  }
