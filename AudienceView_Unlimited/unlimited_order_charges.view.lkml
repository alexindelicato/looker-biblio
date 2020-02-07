view: unlimited_order_charges {
  derived_table: {
    sql:

SELECT
  UUID,
  client_name,
  audit_time,
  cast(concat(audit_time, ':00') as TIMESTAMP) as audit_date_time,
  --cast( audit_time as TIMESTAMP) as audit_date_time,
  YEAR,
  quarter,
  userrole_name,
  userrole_group,
  servicecharge_name,
  servicecharge_type,
  servicecharge_pricing_type,
  servicecharge_on_exchange_action,
  servicecharge_description,
  sum(ordercharge_net_sold)/100.00 as ordercharge_net_sold,
  sum(ordercharge_net_paid)/100.00 as ordercharge_net_paid,
  sum(charge1_paid)/100.00 as charge1_paid,
  sum(charge2_paid)/100.00 as charge2_paid,
  sum(charge3_paid)/100.00 as charge3_paid,
  sum(charge4_paid)/100.00 as charge4_paid,
  sum(charge5_paid)/100.00 as charge5_paid,
  sum(charge1_sold)/100.00 as charge1_sold,
  sum(charge2_sold)/100.00 as charge2_sold,
  sum(charge3_sold)/100.00 as charge3_sold,
  sum(charge4_sold)/100.00 as charge4_sold,
  sum(charge5_sold)/100.00 as charge5_sold,
  servicecharge_type_description,
  servicecharge_pricing_type_description,
  servicecharge_on_exchange_action_description
FROM audienceview.unlimited_order_charges
GROUP BY
  UUID,
  client_name,
  audit_time,
  YEAR,
  quarter,
  userrole_name,
  userrole_group,
  servicecharge_name,
  servicecharge_type,
  servicecharge_pricing_type,
  servicecharge_on_exchange_action,
  servicecharge_description,
  servicecharge_type_description,
  servicecharge_pricing_type_description,
  servicecharge_on_exchange_action_description

           ;;

      sql_trigger_value: select max(client_metric_date_time) from `fivetran-ovation-tix-warehouse.audienceview.qbr_data`;;
    }

  dimension_group: audit_date_time {
    type: time
    sql: ${TABLE}.audit_date_time ;;
  }

  dimension: audit_time {
    type: string
    sql: ${TABLE}.audit_time ;;
  }

dimension:UUID{ type: string sql: ${TABLE}.UUID;; }
dimension:client_name{ type: string sql: ${TABLE}.client_name;; }
dimension:YEAR{ type: string sql: ${TABLE}.YEAR;; }
dimension:quarter{ type: string sql: ${TABLE}.quarter;; }
dimension:userrole_name{ type: string sql: ${TABLE}.userrole_name;; }
dimension:userrole_group{ type: string sql: ${TABLE}.userrole_group;; }
dimension:servicecharge_name{ type: string sql: ${TABLE}.servicecharge_name;; }
dimension:servicecharge_type{ type: string sql: ${TABLE}.servicecharge_type;; }
dimension:servicecharge_pricing_type{ type: string sql: ${TABLE}.servicecharge_pricing_type;; }
dimension:servicecharge_on_exchange_action{ type: string sql: ${TABLE}.servicecharge_on_exchange_action;; }
dimension:servicecharge_description{ type: string sql: ${TABLE}.servicecharge_description;; }
dimension:servicecharge_type_description{ type: string sql: ${TABLE}.servicecharge_type_description;; }
dimension:servicecharge_pricing_type_description{ type: string sql: ${TABLE}.servicecharge_pricing_type_description;; }
dimension:servicecharge_on_exchange_action_description  { type: string sql: ${TABLE}.servicecharge_on_exchange_action_description  ;; }

measure:total_ordercharge_net_sold{ type:  sum  value_format_name: usd label: "Total Net Sold" sql: ${TABLE}.ordercharge_net_sold;; }
measure:total_ordercharge_net_paid{ type:  sum  value_format_name: usd label: "Total Balancing Charge Amount" sql: ${TABLE}.ordercharge_net_paid;; }
measure:total_charge1_paid{ type:  sum  value_format_name: usd label: "Total Charge 1 Paid" sql: ${TABLE}.charge1_paid;; }
measure:total_charge2_paid{ type:  sum  value_format_name: usd label: "Total Charge 2 Paid" sql: ${TABLE}.charge2_paid;; }
measure:total_charge3_paid{ type:  sum  value_format_name: usd label: "Total Charge 3 Paid" sql: ${TABLE}.charge3_paid;; }
measure:total_charge4_paid{ type:  sum  value_format_name: usd label: "Total Charge 4 Paid" sql: ${TABLE}.charge4_paid;; }
measure:total_charge5_paid{ type:  sum  value_format_name: usd label: "Total Charge 5 Paid" sql: ${TABLE}.charge5_paid;; }
measure:total_charge1_sold{ type:  sum  value_format_name: usd label: "Total Charge 1 Sold" sql: ${TABLE}.charge1_sold;; }
measure:total_charge2_sold{ type:  sum  value_format_name: usd label: "Total Charge 2 Sold" sql: ${TABLE}.charge2_sold;; }
measure:total_charge3_sold{ type:  sum  value_format_name: usd label: "Total Charge 3 Sold" sql: ${TABLE}.charge3_sold;; }
measure:total_charge4_sold{ type:  sum  value_format_name: usd label: "Total Charge 4 Sold" sql: ${TABLE}.charge4_sold;; }
measure:total_charge5_sold{ type:  sum  value_format_name: usd label: "Total Charge 5 Sold" sql: ${TABLE}.charge5_sold;; }


#  measure: count {
#    type: count
#    drill_fields: [client_name, servicecharge_name, userrole_name]
#  }
}
