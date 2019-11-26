view: ot_client_account_sale_refund {
  derived_table: {
    sql:
      SELECT
        MAX(ot_client_account.id) as id,
       ot_client_account.orderdetail_id,
       ot_client_account.client_id as client_id,
        CASE WHEN ot_client_account.flags & 1 <> 0 AND ot_client_account.flags & 2048 = 0 THEN 1 ELSE 0 END AS is_sale,
        CASE WHEN ot_client_account.flags & 8 <> 0 AND ot_client_account.flags & 2048 = 0 THEN 1 ELSE 0 END AS is_refund,
        MAX(ot_client_account.tx_date) as tx_date
      FROM trs_trs.client_account ot_client_account
      WHERE
        ( (ot_client_account.flags & 1 <> 0 AND ot_client_account.flags & 2048 = 0) OR (ot_client_account.flags & 8 <> 0 AND ot_client_account.flags & 2048 = 0))
        AND orderdetail_id IS NOT NULL
      GROUP BY 2,3,4,5 ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: orderdetail_id {
    type: number
    sql: ${TABLE}.orderdetail_id ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: is_sale {
    type:  number
    sql: ${TABLE}.is_sale ;;
  }

  dimension: is_refund {
    type:  number
    sql: ${TABLE}.is_refund ;;
  }

  dimension: tx_date {
    type:  date_raw
    sql: cast(${TABLE}.tx_date as TIMESTAMP) ;;
  }

}
