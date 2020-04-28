# If necessary, uncomment the line below to include explore_source.

# include: "ovationtix.model.lkml"

view: ot_accounting_client_daily_sales {
  derived_table: {
    explore_source: ot_orders {
      column: id { field: ot_client_account_sale_refund.id }
      column: orderdetail_id { field: ot_client_account_sale_refund.orderdetail_id }
      column: private_merchant_account { field: ot_client.private_merchant_account }
      column: crm_id { field: ot_report_crm.crm_id }
      column: crm_name { field: ot_report_crm.crm_name }
      column: is_sale { field: ot_client_account_sale_refund.is_sale }
      column: transaction_date { field: ot_client_account_sale_refund.tx_date }
      column: client_id { field: ot_client_account_sale_refund.client_id }
      column: is_ticket { field: ot_order_detail.isTicket }
      column: is_donation { field: ot_order_detail.isDonation }
      column: item_type { field: ot_order_detail.type }
      column: is_phone_order_fee { field: ot_order_detail.isPhoneOrderFee }
      column: item_price { field: ot_order_detail.price }
      column: item_tax { field: ot_order_detail.tax }
      column: item_convenience_fee { field: ot_order_detail.consumer_fee }
      column: item_facility_fee { field: ot_order_detail_ticket.facility_fee }
      column: item_credit_card_fee { field: ot_order_detail.service_fee }
      column: item_ovationtix_fee { field: ot_order_detail.processing_fee }
    }
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
  }

  dimension: orderdetail_id {
    type: number
    sql: ${TABLE}.orderdetail_id ;;
  }

  measure: count_orderdetail{
  type: count_distinct
  sql: ${TABLE}.orderdetail_id ;;
  }

  dimension: private_merchant_account {
    type: yesno
    sql: ${TABLE}.private_merchant_account;;
  }

  dimension: crm_id {
    type: string
    sql: ${TABLE}.crm_id ;;
  }

  dimension: crm_name {
    type: string
    sql: ${TABLE}.crm_name ;;
  }

  dimension: flags {
    type: number
    sql: ${TABLE}.flags ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: transaction_date {
    type: date_raw
    sql: ${TABLE}.transaction_date ;;
  }

  dimension_group: tx {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      quarter_of_year,
      year
    ]
    sql: ${transaction_date} ;;
  }

  dimension: is_sale {
    type: yesno
    sql: ${TABLE}.is_sale = 1;;
    hidden: yes
  }

  dimension: is_phone_order_fee {
    type: number
    sql: ${TABLE}.is_phone_order_fee ;;
    hidden: yes
  }

  dimension: is_ticket {
    type: number
    sql: ${TABLE}.is_ticket ;;
    hidden: yes
  }

  dimension: is_donation {
    type: number
    sql: ${TABLE}.is_donation ;;
    hidden: yes
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
    hidden: yes
  }

  dimension: item_price {
    type: number
    sql: ${TABLE}.item_price ;;
    value_format_name: usd_0
  }

  dimension: item_tax {
    type: number
    sql: ifnull(${TABLE}.item_tax,0) ;;
    value_format_name: usd_0
  }

  dimension: item_convenience_fee {
    type: number
    sql: ifnull(${TABLE}.item_convenience_fee,0) ;;
    value_format_name: usd_0
  }

  measure: sum_item_convenience_fee {
    type: sum
    sql: ifnull(${TABLE}.item_convenience_fee,0) ;;
    value_format_name: usd_0
  }

  dimension: item_facility_fee {
    type: number
    sql: ifnull(${TABLE}.item_facility_fee,0) ;;
    value_format_name: usd_0
  }

  dimension: item_credit_card_fee {
    type: number
    sql: ifnull(${TABLE}.item_credit_card_fee,0) ;;
    value_format_name: usd_0
  }

  dimension: item_ovationtix_fee {
    type: number
    sql: ifnull(${TABLE}.item_ovationtix_fee,0) ;;
    value_format_name: usd_0
  }

  measure: gross_ticket_count {
    type: sum
    sql: if(${is_ticket},if(${is_sale},1,0),0) ;;
  }

  measure: gross_other_count {
    type:  sum
    sql:  if(${is_ticket},0,if(${is_sale},1,0)) ;;
  }

  measure: gross_ticket_sales {
    type: sum
    sql:  if(${is_ticket}, if(${is_sale}, ${item_price} + ${item_tax} + ${item_convenience_fee} + ${item_facility_fee}, 0), 0);;
    value_format_name: usd_0
  }

  measure: gross_count_donation {
    type: sum
    sql: if(${is_sale}, if(${item_type} = 'DNT', 1, 0), 0) ;;
  }

  measure: gross_count_product {
    type: sum
    sql: if(${is_sale}, if(${item_type} = 'PRD', 1, 0), 0) ;;
  }

  measure: gross_count_gift_card {
    type: sum
    sql: if(${is_sale}, if(${item_type} = 'GC', 1, 0), 0) ;;
  }

  measure: gross_count_delivery_method {
    type: sum
    sql: if(${is_sale}, if(${item_type} = 'DLV', 1, 0), 0) ;;
  }

  measure: gross_count_phone_room_fee {
    type: sum
    sql: if(${is_sale}, if(${item_type} = 'PHF', 1, 0), 0) ;;
  }

  measure: gross_count_ticket_protection_fee {
    type:  sum
    sql: if(${is_sale}, if(${item_type} = 'INS', 1, 0), 0) ;;
  }

  measure: gross_other_sales {
    type:  sum
    sql:  if(${is_ticket}, 0, if(${is_sale}, ${item_price} + ${item_tax} + ${item_convenience_fee}, 0));;
    value_format_name: usd_0
  }

  measure: gross_donation_sales {
    type:  sum
    sql:  if(${is_donation}, ${item_price}, 0);;
    value_format_name: usd_0
  }

# ------------------------------------------DCL sum1
  measure: credit_card_fees {
    type: sum
    sql: if(${is_sale}, if(${is_phone_order_fee}, 0, ${item_credit_card_fee}), 0) ;;
    value_format_name: usd
  }

# Calculating ARR
 measure: arr_credit_card_fees {
   type:  sum
  sql: if(${is_sale}, if(${is_phone_order_fee}, 0, ${item_credit_card_fee}), 0) ;;
 hidden: yes
  filters: {
    field: tx_month
    value: "12 months ago for 12 months" }
  required_fields: [sf_accounts.license_type_c,sf_accounts.annual_subscription_fee_c]
}


measure: arr_ovationtix_service_fees {
  type:  sum
  sql: if(${is_sale}, ${item_ovationtix_fee}, 0) ;;
 hidden: yes
  filters: {
    field: tx_month
    value: "12 months ago for 12 months" }
  required_fields: [sf_accounts.license_type_c,sf_accounts.annual_subscription_fee_c]
}

measure: arr_ovationtix_phone_room_fees {
  type:  sum
  sql: if(${is_sale}, if(${is_phone_order_fee}, ${item_credit_card_fee}, 0), 0) ;;
 hidden: yes
  filters: {
    field: tx_month
    value: "12 months ago for 12 months" }
  required_fields: [sf_accounts.license_type_c,sf_accounts.annual_subscription_fee_c]
}

  measure: arr_refunded_ovationtix_service_fees {
    type: sum
    sql: if(${is_sale}, 0, ${item_ovationtix_fee}) ;;
    value_format_name: usd_0
    filters: {
      field: tx_month
      value: "12 months ago for 12 months" }
    required_fields: [sf_accounts.license_type_c,sf_accounts.annual_subscription_fee_c]
  }

  measure: arr_refunded_credit_card_fees {
    type: sum
    sql: if(${is_sale}, 0, ${item_credit_card_fee}) ;;
    value_format_name: usd_0
    filters: {
      field: tx_month
      value: "12 months ago for 12 months" }
    required_fields: [sf_accounts.license_type_c,sf_accounts.annual_subscription_fee_c]
  }


measure: annual_recurring_revenue {
  label: "ARR"
  type: number
  value_format_name: usd_0
  sql:  case when ${sf_accounts.license_type_c} = "License - Professional" then ${sf_accounts.annual_subscription_fee_c} + ${arr_ovationtix_phone_room_fees}+${arr_credit_card_fees}
         when ${sf_accounts.license_type_c} = "Hybrid - Professional" then ${sf_accounts.annual_subscription_fee_c} + ${arr_credit_card_fees}+${arr_ovationtix_service_fees}+${arr_ovationtix_phone_room_fees}-${arr_refunded_ovationtix_service_fees}-${arr_refunded_credit_card_fees}
        else  ${arr_credit_card_fees}+${arr_ovationtix_service_fees}+${arr_ovationtix_phone_room_fees}-${arr_refunded_ovationtix_service_fees}-${arr_refunded_credit_card_fees} END ;;
  required_fields: [sf_accounts.license_type_c,sf_accounts.annual_subscription_fee_c]
}

# ---------------------------------------------------------------------------------------------------

  measure: Total_fees {
    label: "Total Fees (Minus Refunds)"
    type: number
    sql:   ${credit_card_fees}+${ovationtix_service_fees}+${ovationtix_phone_room_fees}-${refunded_ovationtix_service_fees}-${refunded_credit_card_fees};;
    value_format_name: usd
    drill_fields: [ot_orders.order_id,credit_card_fees, ovationtix_service_fees,ovationtix_phone_room_fees, Total_fees]
  }

  measure: Total_fees_with_refunds {
    label: "Total Fees"
    type: number
    sql:   ${credit_card_fees}+${ovationtix_service_fees}+${ovationtix_phone_room_fees};;
    value_format_name: usd
    drill_fields: [ot_orders.order_id,credit_card_fees, ovationtix_service_fees,ovationtix_phone_room_fees, Total_fees]
  }

  measure: arr {
    label: "ARR update"
    type: number
    value_format_name: usd
    sql: case when ${sf_accounts.license_type_c} = "License - Professional" then ${sf_accounts.annual_subscription_fee_c} + ${ovationtix_phone_room_fees}+${credit_card_fees}
         when ${sf_accounts.license_type_c} = "Hybrid - Professional" then ${sf_accounts.annual_subscription_fee_c} + ${credit_card_fees}+${ovationtix_service_fees}+${ovationtix_phone_room_fees}-${refunded_ovationtix_service_fees}
        else  ${credit_card_fees}+${ovationtix_service_fees}+${ovationtix_phone_room_fees}-${refunded_ovationtix_service_fees} END ;;
    required_fields: [sf_accounts.license_type_c,sf_accounts.annual_subscription_fee_c]
  }

  measure: ovationtix_phone_room_fees {
    type: sum
    sql: if(${is_sale}, if(${is_phone_order_fee}, ${item_credit_card_fee}, 0), 0) ;;
    value_format_name: usd
  }

  measure: ovationtix_service_fees {
    type: sum
    sql: if(${is_sale}, ${item_ovationtix_fee}, 0) ;;
    value_format_name: usd
  }


  measure: refund_count_ticket {
    type: sum
    sql: if(${is_sale}, 0, if(${is_ticket}, 1, 0)) ;;
  }

  measure: refund_count_donation {
    type: sum
    sql: if(${is_sale}, 0, if(${item_type} = 'DNT', 1, 0)) ;;
  }

  measure: refund_count_product {
    type: sum
    sql: if(${is_sale}, 0, if(${item_type} = 'PRD', 1, 0)) ;;
  }

  measure: refund_count_gift_card {
    type: sum
    sql: if(${is_sale}, 0, if(${item_type} = 'GC', 1, 0)) ;;
  }

  measure: refund_count_delivery_method {
    type: sum
    sql: if(${is_sale}, 0, if(${item_type} = 'DLV', 1, 0)) ;;
  }

  measure: refund_count_phone_room_fee {
    type: sum
    sql: if(${is_sale}, 0, if(${item_type} = 'PHF', 1, 0)) ;;
  }

  measure: refund_count_ticket_protection_fee {
    type:  sum
    sql: if(${is_sale}, 0, if(${item_type} = 'INS', 1, 0)) ;;
  }

  measure: refund_count {
    type: sum
    sql: if(${is_sale}, 0, 1) ;;
  }

  measure: refunds {
    type: sum
    sql: if(${is_sale}, 0, ${item_price} + ${item_tax} + ${item_convenience_fee} + ${item_facility_fee}) ;;
    drill_fields: [ot_orders.order_id]
    value_format_name: usd_0
  }

  measure: refunded_ovationtix_service_fees {
    type: sum
    sql: if(${is_sale}, 0, ${item_ovationtix_fee}) ;;
    value_format_name: usd_0
  }

  measure: refunded_credit_card_fees {
    type: sum
    sql: if(${is_sale}, 0, ${item_credit_card_fee}) ;;
    value_format_name: usd_0
  }

  measure: net_sales_count {
    type: number
    sql: ${gross_ticket_count} + ${gross_other_count} - ${refund_count} ;;
  }

  measure: net_sales {
    type: number
    sql: ${gross_ticket_sales} + ${gross_other_sales} - ${refunds} ;;
    value_format_name: usd_0
  }

  measure: net_ovationtix_service_fees {
    type: number
    sql: ${ovationtix_service_fees} - ${refunded_ovationtix_service_fees} ;;
    value_format_name: usd_0
  }

}
