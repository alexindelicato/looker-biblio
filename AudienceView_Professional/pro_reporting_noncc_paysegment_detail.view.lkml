view: pro_reporting_noncc_paysegment_detail {
  derived_table: {
    sql: SELECT
 order0_.client_id as order_payment_detail_nonCC_segment_client_id,
 paymentseg1_.payment_date as order_payment_detail_nonCC_segment_payment_date,
 paymentseg1_.amount as order_payment_detail_nonCC_segment_payment_amount

from `fivetran-ovation-tix-warehouse.trs_trs.orders` order0_
left outer join `fivetran-ovation-tix-warehouse.trs_trs.orders_pii` order0_1_ on order0_.order_id=order0_1_.order_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.order_sales_channel` order0_2_ on order0_.order_id=order0_2_.order_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.orders_notes` order0_3_ on order0_.order_id=order0_3_.order_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.orders_transaction` order0_4_ on order0_.order_id=order0_4_.order_id
inner join `fivetran-ovation-tix-warehouse.trs_trs.payment_segment` paymentseg1_ on order0_.order_id=paymentseg1_.order_id

where (order0_.payment_type_id in (999 , 1000))
  and (paymentseg1_.cc_type is null)
  and paymentseg1_.payment_date<'2020-03-20 00:00:00'
and paymentseg1_.payment_date>=
coalesce(
    (
      select max(clientacco2_.date)
      from `fivetran-ovation-tix-warehouse.trs_trs.client_account` clientacco2_
      where CAST(clientacco2_.type_payment as INT64) = 1
      and clientacco2_.client_id=order0_.client_id
      and clientacco2_.date<='2020-03-20 00:00:00'
    ),
  '1900-01-01 00:00:00.723'
  )
      and order0_.client_id in
      (
      209
      )

             ;;
  }

  dimension: order_payment_detail_nonCC_segment_client_id {
    type: number
    sql: ${TABLE}.order_payment_detail_nonCC_segment_client_id ;;
  }

  dimension_group: order_payment_detail_nonCC_segment_payment_date {
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
    sql: CAST(${TABLE}.order_payment_detail_nonCC_segment_payment_date AS TIMESTAMP) ;;
  }

  dimension: order_payment_detail_nonCC_segment_payment_amount {
    type: number
    sql: ${TABLE}.order_payment_detail_nonCC_segment_payment_amount ;;
  }
}
