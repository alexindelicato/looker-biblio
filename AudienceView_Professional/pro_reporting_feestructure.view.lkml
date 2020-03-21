view: pro_reporting_feestructure {
   derived_table: {
     sql:
select feestructure_id
   cap_pct,
   cap_point,
   charge_processing_fee_for_pac_purchase,
   charge_processing_fee_for_pac_redemption,
   charge_service_fee_for_flex_pack_purchase,
   charge_service_fee_for_flex_pack_redemption,
   comp_fee,
   currency,
   currency_symbol,
   package_comp_fee,
   flex_package_comp_fee,
   flex_pack_flat_fee,
   flex_pack_purchase_flat_fee,
   flex_pack_redemption_flat_fee,
   minimum_fee,
   per_order_fee_max,
   telephone_fee_bo,
   telephone_fee,
   telephone_fee_consumer,
   uncap_pct,
   version,
   walkup_cc_fee,
   walkup_fee
from feestructure

       ;;

# where this_.currency='USD';

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
