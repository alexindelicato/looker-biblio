view: pro_reporting_client {
   derived_table: {
     sql: SELECT
 client0_.client_id as client_id,
 client0_.client_name as client_name,
 client0_.testing_mode as testing_mode,
 client0_.private_merchant_account as private_merchant_account,
 client0_.payout_method as payout_method,
 client0_.payee as payee,
 client0_.payment_schedule as payment_schedule,
 taxrate1_.tax_rate_percentage as tax_rate_percentage,
 reportcrm2_.is_tax_exempt as is_tax_exempt
from `fivetran-ovation-tix-warehouse.trs_trs.client` client0_
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_customization` client0_1_ on client0_.client_id=client0_1_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_catch_all_venue` client0_2_ on client0_.client_id=client0_2_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_fraud_protection` client0_3_ on client0_.client_id=client0_3_.client_id
inner join `fivetran-ovation-tix-warehouse.trs_trs.client_hard_ticket` client0_4_ on client0_.client_id=client0_4_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_fee_structure` client0_5_ on client0_.client_id=client0_5_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_whos_coming_plus_one` client0_6_ on client0_.client_id=client0_6_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_enabled_feature` client0_7_ on client0_.client_id=client0_7_.client_id
-- left outer join `fivetran-ovation-tix-warehouse.trs_trs.client_html_skin` client0_8_ on client0_.client_id=client0_8_.client_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.tax_rates` taxrate1_ on client0_.service_fee_tax_rate_id=taxrate1_.tax_rate_id
left outer join `fivetran-ovation-tix-warehouse.trs_trs.report_crm` reportcrm2_ on client0_.report_crm_id=reportcrm2_.id
-- where client0_.client_id in
-- (
-- 209
-- )

       ;;
   }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: testing_mode {
    type: number
    sql: ${TABLE}.testing_mode ;;
  }

  dimension: private_merchant_account {
    type: string
    sql: ${TABLE}.private_merchant_account ;;
  }

  dimension: payout_method {
    type: string
    sql: ${TABLE}.payout_method ;;
  }

  dimension: payee {
    type: string
    sql: ${TABLE}.payee ;;
  }

  dimension: payment_schedule {
    type: string
    sql: ${TABLE}.payment_schedule ;;
  }

  dimension: tax_rate_percentage {
    type: number
    sql: ${TABLE}.tax_rate_percentage ;;
  }

  dimension: is_tax_exempt {
    type: number
    sql: ${TABLE}.is_tax_exempt  ;;
  }



#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
 }
