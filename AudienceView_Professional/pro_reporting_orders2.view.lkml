view: pro_reporting_orders2 {
  derived_table: {
    sql: SELECT
 order2_.is_held_by_client as is_held_by_client,
 clientacco0_.flags as client_flags,
 clientacco0_.amount as client_amount,
 order2_.type as order2_type,
 order2_.payment_type_id as order2_payment_type_id,
 clientacco0_.id as client_account_id,
 clientacco0_.client_id as client_account_client_id,
 clientacco0_.service_fee as client_account_service_fee,
 clientacco0_.processing_fee as client_account_processing_fee,
 orderdetai3_.type as order_detail_type,
 orderdetai3_.consumer_fee as order_detail_consumer_fee,
 orderdetai3_.price as order_detail_price,
 orderdetai3_4_.facility_fee as order_detail_facility_fee,
 order2_.order_id as order_id,
 order2_4_.cc_type as order_cc_type,
 orderdetai3_.tax as order_detail_tax,
 orderdetai3_.orderdetail_id as order_detail_id,
-- patroncred4_.activity_action_id as col_17_0_,
 clientacco0_.tx_date as client_account_transaction_date,
 clientacco0_.date as client_account_date,
 performanc1_.perf_start as performance_start_date
from `fivetran-ovation-tix-warehouse.trs_trs.client_account` clientacco0_
left outer join `fivetran-ovation-tix-warehouse.trs_trs.performance` performanc1_ on clientacco0_.perf_id=performanc1_.id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.performance_whos_coming_note` performanc1_1_ on performanc1_.id=performanc1_1_.performance_id
inner join `fivetran-ovation-tix-warehouse.trs_trs.orders` order2_ on clientacco0_.order_id=order2_.order_id and (order2_.status_id<>11)
left outer join `fivetran-ovation-tix-warehouse.trs_trs.orders_pii` order2_1_ on order2_.order_id=order2_1_.order_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.order_sales_channel` order2_2_ on order2_.order_id=order2_2_.order_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.orders_notes` order2_3_ on order2_.order_id=order2_3_.order_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.orders_transaction` order2_4_ on order2_.order_id=order2_4_.order_id
inner join `fivetran-ovation-tix-warehouse.trs_trs.order_detail` orderdetai3_ on clientacco0_.orderdetail_id=orderdetai3_.orderdetail_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.bundled_package_ticket_od` orderdetai3_1_ on orderdetai3_.orderdetail_id=orderdetai3_1_.orderdetail_id
-- left outer join `fivetran-ovation-tix-warehouse.trs_trs.order_detail_ext` orderdetai3_2_ on orderdetai3_.orderdetail_id=orderdetai3_2_.orderdetail_id
-- left outer join `fivetran-ovation-tix-warehouse.trs_trs.patron_credit_tx_od` orderdetai3_3_ on orderdetai3_.orderdetail_id=orderdetai3_3_.orderdetail_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.order_detail_ticket` orderdetai3_4_ on orderdetai3_.orderdetail_id=orderdetai3_4_.orderdetail_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.order_detail_donation` orderdetai3_5_ on orderdetai3_.orderdetail_id=orderdetai3_5_.orderdetail_id
-- left outer join `fivetran-ovation-tix-warehouse.trs_trs.patron_credit_tx` patroncred4_ on orderdetai3_3_.patron_credit_tx_id=patroncred4_.patron_credit_tx_id

cross join `fivetran-ovation-tix-warehouse.trs_trs.client` client5_
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_customization` client5_1_ on client5_.client_id=client5_1_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_catch_all_venue` client5_2_ on client5_.client_id=client5_2_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_fraud_protection` client5_3_ on client5_.client_id=client5_3_.client_id
inner join `fivetran-ovation-tix-warehouse.trs_trs.client_hard_ticket` client5_4_ on client5_.client_id=client5_4_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_fee_structure` client5_5_ on client5_.client_id=client5_5_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_whos_coming_plus_one` client5_6_ on client5_.client_id=client5_6_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_enabled_feature` client5_7_ on client5_.client_id=client5_7_.client_id
--left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_html_skin` client5_8_ on client5_.client_id=client5_8_.client_id

where
clientacco0_.client_id=client5_.client_id
and client5_.active=1 and clientacco0_.date<='2020-03-20 00:00:00'
and CAST(clientacco0_.type_payment as INT64) = 0
and (clientacco0_.flags & 4=0 or clientacco0_.flags & 4<>0 and performanc1_.perf_start<='2020-03-20 00:00:00')
and clientacco0_.flags & 16=0 and (clientacco0_.payment_id is null)

limit 100

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

  dimension: order2_type {
    type: number
    sql: ${TABLE}.order2_type ;;
  }

  dimension: order2_payment_type_id {
    type: number
    sql: ${TABLE}.order2_payment_type_id ;;
  }

  dimension: client_account_id {
    type: number
    sql: ${TABLE}.client_account_id ;;
  }

  dimension: client_account_client_id {
    type: number
    sql: ${TABLE}.client_account_client_id ;;
  }



  dimension: client_account_service_fee {
    type: number
    sql: ${TABLE}.client_account_service_fee ;;
  }

  dimension: client_account_processing_fee {
    type: number
    sql: ${TABLE}.client_account_processing_fee ;;
  }

  dimension: order_detail_type {
    type: number
    sql: ${TABLE}.order_detail_type ;;
  }

  dimension: order_detail_consumer_fee {
    type: number
    sql: ${TABLE}.order_detail_consumer_fee ;;
  }

  dimension: order_detail_price {
    type: number
    sql: ${TABLE}.order_detail_price ;;
  }

  dimension: order_detail_facility_fee {
    type: number
    sql: ${TABLE}.order_detail_facility_fee ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_cc_type {
    type: number
    sql: ${TABLE}.order_cc_type ;;
  }

  dimension: order_detail_tax {
    type: number
    sql: ${TABLE}.order_detail_tax ;;
  }

  dimension: order_detail_id {
    type: number
    sql: ${TABLE}.order_detail_id ;;
  }


  dimension: client_account_transaction_date {
    type: string
    sql: ${TABLE}.client_account_transaction_date ;;
  }

  dimension: client_account_date {
    type: string
    sql: ${TABLE}.client_account_date ;;
  }

  dimension: performance_start_date {
    type: string
    sql: ${TABLE}.performance_start_date ;;
  }

  dimension_group: client_account_transaction_date {
    type: time
    sql: ${TABLE}.client_account_transaction_date ;;
  }

  dimension_group: client_account_date {
    type: time
    sql: ${TABLE}.client_account_date ;;
  }

  dimension_group: performance_start_date {
    type: time
    sql: ${TABLE}.performance_start_date ;;
  }

}
