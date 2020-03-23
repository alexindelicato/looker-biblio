view: pro_reporting_orders1 {
   derived_table: {
     sql: SELECT
 order1_.is_held_by_client as is_held_by_client,
 clientacco0_.flags as client_flags,
 clientacco0_.amount as client_amount,
 order1_.type as order1_type,
 order1_.payment_type_id as order1_payment_type,
 clientacco0_.id as client_account_id,
 clientacco0_.client_id as client_account_client_id,
 clientacco0_.tx_date as client_transaction_date,
clientacco0_.date as client_account_date
from `fivetran-ovation-tix-warehouse.trs_trs.client_account` clientacco0_
left outer join `fivetran-ovation-tix-warehouse.trs_trs.orders` order1_ on clientacco0_.order_id=order1_.order_id
   and (order1_.status_id<>11)
left outer join `fivetran-ovation-tix-warehouse.trs_trs.orders_pii` order1_1_ on order1_.order_id=order1_1_.order_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.order_sales_channel` order1_2_ on order1_.order_id=order1_2_.order_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.orders_notes` order1_3_ on order1_.order_id=order1_3_.order_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.orders_transaction` order1_4_ on order1_.order_id=order1_4_.order_id

cross join `fivetran-ovation-tix-warehouse.trs_trs.client` client2_
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_customization` client2_1_ on client2_.client_id=client2_1_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_catch_all_venue` client2_2_ on client2_.client_id=client2_2_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_fraud_protection` client2_3_ on client2_.client_id=client2_3_.client_id
inner join `fivetran-ovation-tix-warehouse.trs_trs.client_hard_ticket` client2_4_ on client2_.client_id=client2_4_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_fee_structure` client2_5_ on client2_.client_id=client2_5_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_whos_coming_plus_one` client2_6_ on client2_.client_id=client2_6_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_enabled_feature` client2_7_ on client2_.client_id=client2_7_.client_id
--left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_html_skin` client2_8_ on client2_.client_id=client2_8_.client_id

where
clientacco0_.client_id=client2_.client_id
and client2_.active=1
--and clientacco0_.date<='2020-03-20 00:00:00'
and CAST(clientacco0_.type_payment as INT64) = 0
and (clientacco0_.flags & 16<>0 or clientacco0_.flags & 64<>0)
and clientacco0_.flags & 4=0
and (clientacco0_.payment_id is null)


--and clientacco0_.client_id = 209
       ;;
   }


   dimension: is_held_by_client {
     type: number
     sql: ${TABLE}.is_held_by_client ;;
   }

  dimension: client_flags {
    type: number
    sql: ${TABLE}.client_flags ;;
  }

  dimension: client_amount {
    type: number
    sql: ${TABLE}.client_amount ;;
  }

  dimension: order1_type {
    type: number
    sql: ${TABLE}.order1_type ;;
  }

  dimension: order1_payment_type {
    type: number
    sql: ${TABLE}.order1_payment_type ;;
  }

  dimension: client_account_id {
    type: number
    sql: ${TABLE}.client_account_id ;;
  }

  dimension: client_account_client_id {
    type: number
    sql: ${TABLE}.client_account_client_id ;;
  }

  dimension: client_transaction_date {
    type: string
    sql: ${TABLE}.client_transaction_date ;;
  }

  dimension: client_account_date {
    type: string
    sql: ${TABLE}.client_account_date ;;
  }

  dimension_group: client_transaction_date {
    type: time
    sql: ${TABLE}.client_transaction_date ;;
  }

  dimension_group: client_account_date {
    type: time
    sql: ${TABLE}.client_account_date ;;
  }

}
