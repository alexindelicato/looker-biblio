view: sel_transactions {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.transactions`
    ;;
  drill_fields: [transactionid]

  dimension: transactionid {
    primary_key: yes
    type: number
    sql: ${TABLE}.transactionid ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
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
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: acquisitionfee {
    type: string
    sql: ${TABLE}.acquisitionfee ;;
  }

  dimension: acquisitionoption {
    type: string
    sql: ${TABLE}.acquisitionoption ;;
  }

  dimension: agentid {
    type: string
    sql: ${TABLE}.agentid ;;
  }

  dimension: auth_code {
    type: string
    sql: ${TABLE}.auth_code ;;
  }

  dimension: avs_code {
    type: string
    sql: ${TABLE}.avs_code ;;
  }

  dimension: billingreminded {
    type: string
    sql: ${TABLE}.billingreminded ;;
  }

  dimension: cctruncnumber {
    type: string
    sql: ${TABLE}.cctruncnumber ;;
  }

  dimension: cctype {
    type: string
    sql: ${TABLE}.cctype ;;
  }

  dimension: commissionableconveniencefee {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.commissionableconveniencefee as FLOAT64),2) ;;
  }

  measure: total_commissionableconveniencefee {
    label: "Revenue Convenience Fee (VMA)"
    type: sum_distinct
    value_format_name: usd
    sql:case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N" then round(safe_cast(${TABLE}.commissionableconveniencefee as FLOAT64), 2) END ;;
  }

  measure: cc_processing_convenience_fee {
    label: "CC Proceessing Convinence Fee (VMA)"
    type: number
    value_format_name: usd
    sql: ${total_conveniencefee}-${total_commissionableconveniencefee} ;;
  }

  dimension: commissionableservicefee {
    type: number
    sql: ${TABLE}.commissionableservicefee ;;
  }

  measure: total_commissionableservicefee {
    label: "Revenue Service Fee (VMA)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2) end;;
  }

  measure: cc_processing_service_fee {
    label: "CC Proceessing Service Fee (VMA)"
    type: number
    value_format_name: usd
    sql: ${total_servicefee}-${total_commissionableservicefee} ;;
  }

  dimension: conveniencefee {
    label: "Convenience Fee"
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2) ;;
  }

  measure: total_conveniencefee {
    label: "Total Convenience Fee"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2) ;;
  }

  measure: total_conveniencefee_usd {
    label: "Total Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.72
            when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
            else 0 end ;;
  }

  measure: total_arr_conveniencefee {
    label: "Rolling ARR Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.72
           when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
            else 0 end ;;
      filters: {
    field: date_date
    value: "12 months ago for 12 months"
  }
  }

  measure: 2019_arr_conveniencefee {
    label: "2019 Rolling ARR Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
  }

  dimension: conveniencefeesalestax {
    type: number
    sql: ${TABLE}.conveniencefeesalestax ;;
  }

  dimension: crow {
    type: number
    sql: ${TABLE}.crow ;;
  }

  dimension: cseat {
    type: number
    sql: ${TABLE}.cseat ;;
  }

  dimension_group: date {
    type: time
    sql: timestamp_seconds(${TABLE}.date) ;;
  }

  dimension: dateconsigneeinvoiced {
    type: number
    sql: ${TABLE}.dateconsigneeinvoiced ;;
  }

  dimension: deliveryid {
    type: string
    sql: ${TABLE}.deliveryid ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount {
    type: number
    sql: round(safe_cast(${TABLE}.discount as FLOAT64), 2) ;;
  }

  measure: sum_discount {
    label: "Total Discount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.discount as FLOAT64), 2) ;;
  }

  measure: 2020_sum_discount {
    label: "2020 Discount Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.discount as FLOAT64), 2) ;;
    filters: {
      field: date_year
      value: "2020"
      }
  }

  dimension: exchangedtransid {
    type: number
    value_format_name: id
    sql: ${TABLE}.exchangedtransid ;;
  }

  dimension: holdinventoryid {
    type: number
    value_format_name: id
    sql: ${TABLE}.holdinventoryid ;;
  }

  dimension: inventoryid {
    type: string
    sql: ${TABLE}.inventoryid ;;
  }

  dimension: inventorytype {
    type: string
    sql: ${TABLE}.inventorytype ;;
  }

  dimension: lastticketscanid {
    type: number
    value_format_name: id
    sql: ${TABLE}.lastticketscanid ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.orderid ;;
  }

  dimension: patronid {
    type: string
    sql: ${TABLE}.patronid ;;
  }

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  dimension: price {
    type: string
    sql: ${TABLE}.price ;;
  }

  dimension: pricescaleid {
    type: number
    value_format_name: id
    sql: ${TABLE}.pricescaleid ;;
  }

  dimension: printed {
    type: number
    sql: ${TABLE}.printed ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  measure: total_quantity {
    label: "# of Tickets"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;
  }

  measure: 2020_total_quantity {
    label: "2020 # of Tickets"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;

  filters: {
    field: date_year
    value: "2020"
  }
  }

  measure: 2019_total_quantity {
    label: "2019 # of Tickets"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;

    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: total_quantity_refunded {
    label: "# of Tickets Refunded"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;

    filters: {
      field: sel_refunds.refundid
      value: "NOT NULL"
    }
  }

  measure: 2020_total_quantity_refunded {
    label: "2020 # of Tickets Refunded"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;

    filters: {
      field: sel_refunds.refundid
      value: "NOT NULL"
    }

    filters: {
      field: date_year
      value: "2020"
    }
  }


  measure: 2019_total_quantity_refunded {
    label: "2019 # of Tickets Refunded"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;

    filters: {
      field: sel_refunds.refundid
      value: "NOT NULL"
    }

    filters: {
      field: date_year
      value: "2019"
    }
  }


  measure: 2020_net_total_quantity {
    label: "2020 NET # of Tickets"
    type: number
    sql: ${2020_total_quantity} - ${2020_total_quantity_refunded} ;;
  }

  measure: 2019_net_total_quantity {
    label: "2019 NET # of Tickets"
    type: number
    sql: ${2019_total_quantity} - ${2019_total_quantity_refunded} ;;
  }


  dimension: response_code {
    type: string
    sql: ${TABLE}.response_code ;;
  }

  dimension: response_reason_code {
    type: string
    sql: ${TABLE}.response_reason_code ;;
  }

  dimension: response_subcode {
    type: string
    sql: ${TABLE}.response_subcode ;;
  }

  dimension: row {
    type: string
    sql: ${TABLE}.row ;;
  }

  dimension: saletype {
    type: string
    sql: ${TABLE}.saletype ;;
  }

  dimension: seat {
    type: string
    sql: ${TABLE}.seat ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}.section ;;
  }

  dimension: sectionid {
    type: string
    sql: ${TABLE}.sectionid ;;
  }

  dimension: servicefee {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;
  }

  measure: total_ARR {
    label: "Total Transaction ARR (USD)"
    type: number
    value_format_name: usd
    sql: ${total_servicefee_usd} + ${total_conveniencefee} ;;
  }

  measure: total_arr {
    label: "Total ARR (USD)"
    type: number
    value_format_name: usd
    sql: ${total_servicefee_usd} + ${total_conveniencefee_usd} + ${sel_orders_misclineitems.total_servicefee_usd} + ${sel_memberships_sales.total_membership_arr_usd} ;;
  }

  measure: rolling_arr {
    label: "Rolling ARR (USD)"
    type: number
    value_format_name: usd
    sql: ${total_arr_servicefee} + ${total_arr_conveniencefee} + ${sel_orders_misclineitems.total_arr_servicefee} + ${sel_memberships_sales.rolling_total_membership_arr} ;;
    }

  measure: 2019_arr {
    label: "2019 ARR (USD)"
    type: number
    value_format_name: usd
    sql: ${2019_total_arr_servicefee} + ${2019_arr_conveniencefee} + ${sel_orders_misclineitems.2019_total_arr_servicefee} + ${sel_memberships_sales.2019_total_membership_arr} + ${sel_giftcardissued.2019_total_servicefee_usd} ;;
  }

  measure: total_servicefee_usd {
    label: "Total Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
            when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
            else 0 end;;
  }

  measure: total_servicefee {
    label: "Total Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql:  round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;

  }

  measure: total_arr_servicefee {
    label: "Rolling ARR Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
    when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
    else 0 end ;;
    filters: {
      field: date_date
      value: "12 months ago for 12 months"
    }
  }

  measure: 2019_total_arr_servicefee {
    label: "2019 Rolling ARR Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
  }

  dimension: settled {
    type: number
    sql: ${TABLE}.settled ;;
  }

  dimension: settledaily {
    type: string
    sql: ${TABLE}.settledaily ;;
  }

  dimension: testmode {
    type: string
    sql: ${TABLE}.testmode ;;
  }

  dimension: total {
    type: number
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;
  }

  measure: total_amount {
    label: "Total Admission Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;
    filters: {
      field: transactiontype
      value: "not 4"
    }
  }

  measure: refund_total_amount {
    label: "Total Refund Admission Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;

    filters: {
      field: sel_refunds.refundid
      value: "NOT NULL"
    }
  }

  measure: 2020_refund_total_amount {
    label: "2020 Total Refund Admission Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;

    filters: {
      field: sel_refunds.refundid
      value: "NOT NULL"
    }
    filters: {
      field: date_year
      value: "2020"
    }
  }


  measure: 2019_total_amount {
    label: "2019 Total Admission Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;
    filters: {
      field: date_year
      value: "2019"
    }
    filters: {
      field: transactiontype
      value: "not 4"
    }
  }

  measure: 2020_total_amount {
    label: "2020 Total Admission Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;
    filters: {
      field: date_year
      value: "2020"
    }
    filters: {
      field: transactiontype
      value: "not 4"
    }
  }

  measure: total_comp_amount {
    label: "Total Comp Admission Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;
    filters: {
      field: transactiontype
      value: "4"
    }
    }


  measure: 2020_total_comp_amount {
    label: "2020 Total Comp Admission Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;
    filters: {
      field: transactiontype
      value: "4"
    }
    filters: {
      field: date_year
      value: "2020"
    }
    drill_fields: [orderid]
  }

  measure: 2019_total_comp_amount {
    label: "2019 Total Comp Admission Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;
    filters: {
      field: transactiontype
      value: "4"
    }
    filters: {
      field: date_year
      value: "2019"
    }
    drill_fields: [orderid]
  }

  measure: net_admission_amount {
    label: "Total NET Admission Amount"
    type: number
    value_format_name: usd
    sql: ${total_amount} - ${refund_total_amount} - ${total_comp_amount} - ${sum_discount} ;;
  }

 measure: 2020_net_admission_amount {
    label: "2020 NET Admission Amount"
    type: number
    value_format_name: usd
    sql: ${2020_total_amount}  ;;
}

  measure: 2019_net_admission_amount {
    label: "2019 NET Admission Amount"
    type: number
    value_format_name: usd
    sql: ${2019_total_amount}  ;;
  }

  dimension: trans_id {
    type: string
    sql: ${TABLE}.trans_id ;;
  }

  dimension: transactiontype {
    type: number
    sql: ${TABLE}.transactiontype ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: venueid {
    type: string
    sql: ${TABLE}.venueid ;;
  }

  dimension: voided {
    type: number
    sql: ${TABLE}.voided ;;
  }

  dimension: voucherdiscount {
    type: string
    sql: ${TABLE}.voucherdiscount ;;
  }

  measure: count {
    type: count
    drill_fields: [transactionid, orders.id]
  }
}
