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
    sql:case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableconveniencefee as FLOAT64), 2)*0.7673
         when  ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableconveniencefee as FLOAT64), 2)*1 END ;;
  }

  measure: 2019_total_commissionableconveniencefee {
    label: "2019 Revenue Convenience Fee (VMA)"
    type: sum_distinct
    value_format_name: usd
    sql:case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableconveniencefee as FLOAT64), 2)*0.7673
         when  ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableconveniencefee as FLOAT64), 2)*1 END ;;
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: junetodec_total_commissionableconveniencefee {
    label: "June 2019 to Dec 2019 Revenue Convenience Fee (VMA)"
    type: sum_distinct
    value_format_name: usd
    sql:case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableconveniencefee as FLOAT64), 2)*0.7673
      when  ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableconveniencefee as FLOAT64), 2)*1 END ;;
    filters: {
      field: date_date
      value: "2019/06/01 to 2020/01/01"
    }
  }

  measure: 2019_cc_processing_convenience_fee {
    label: "2019 CC Proceessing Convinence Fee (VMA)"
    type: number
    value_format_name: usd
    sql: ${2019_arr_conveniencefee}-${2019_total_commissionableconveniencefee} ;;
  }


  measure: junetodec_cc_processing_convenience_fee {
    label: "June 2019 to Dec 2019 CC Proceessing Convinence Fee (VMA)"
    type: number
    value_format_name: usd
    sql: ${junetodec_arr_conveniencefee}-${junetodec_total_commissionableconveniencefee} ;;
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
    sql:  case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*0.7673
          when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*1 END  ;;
  }

  measure: junetodec_total_commissionableservicefee {
    label: "June 2019 to Dec 2019 Revenue Service Fee (VMA)"
    type: sum_distinct
    value_format_name: usd
    sql:case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*0.7673
      when  ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*1 END ;;
    filters: {
      field: date_date
      value: "2019/06/01 to 2020/01/01"
    }
  }

  measure: 2019_total_commissionableservicefee {
    label: "2019 Revenue Service Fee (VMA)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*0.7673
           when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*1 END ;;
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2019_cc_processing_service_fee {
    label: "2019 CC Proceessing Service Fee (VMA)"
    type: number
    value_format_name: usd
    sql: ${2019_total_arr_servicefee}-${2019_total_commissionableservicefee} ;;
  }

  measure: junetodec_cc_processing_service_fee {
    label: "June 2019 to Dec 2019 CC Proceessing Service Fee (VMA)"
    type: number
    value_format_name: usd
    sql: ${junetodec_total_arr_servicefee}-${junetodec_total_commissionableservicefee} ;;
  }


  measure: 2019_net_arr {
    label: "2019 NET ARR (USD)"
    type: number
    value_format_name: usd
    sql: case when  ${sel_members.useinternetma} = "Y" and ${sel_members.useretailma} = "Y" then ${2019_arr}
         when  ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "Y" then ${2019_arr}
         when  ${sel_members.useinternetma} = "Y" and ${sel_members.useretailma} = "N" then ${2019_arr}
         else ${2019_total_commissionableconveniencefee}+${2019_total_commissionableservicefee} + ${sel_donations.2019_commissionableservicefee} + ${sel_giftcardissued.2019_commissionableservicefee} + ${sel_orders_misclineitems.2019_commissionableservicefee} end ;;
         required_fields: [sel_members.useinternetma, sel_members.useretailma]
  }

  measure: junetodec_net_arr {
    label: "June 2019 to Dec 2019 NET ARR (USD)"
    type: number
    value_format_name: usd
    sql: case when  ${sel_members.useinternetma} = "Y" and ${sel_members.useretailma} = "Y" then ${2019_arr_junetodec}
         when  ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "Y" then ${2019_arr_junetodec}
         when  ${sel_members.useinternetma} = "Y" and ${sel_members.useretailma} = "N" then ${2019_arr_junetodec}
         else ${junetodec_total_commissionableconveniencefee}+${junetodec_total_commissionableservicefee} + ${sel_donations.junetodec_total_commissionableservicefee} + ${sel_giftcardissued.junetodec_total_commissionableservicefee} + ${sel_orders_misclineitems.junetodec_total_commissionableservicefee} end ;;
    required_fields: [sel_members.useinternetma, sel_members.useretailma]
  }

  measure: junetodec_total_cc_processing_fee {
    label: "June 2019 to Dec 2019 Total CC Proceessing Fee (VMA)"
    type: number
    value_format_name: usd
    sql: ${junetodec_cc_processing_service_fee}+${junetodec_cc_processing_convenience_fee}+${sel_donations.junetodec_cc_processing_service_fee}+${sel_giftcardissued.junetodec_cc_processing_service_fee} + ${sel_orders_misclineitems.junetodec_cc_processing_service_fee} ;;
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
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
            when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
            else 0 end ;;
  }

  measure: 2019_total_conveniencefee_usd {
    label: "2019 Total Convenience Fee (USD)"
    type: number
    value_format_name: usd
    sql: ${2019_arr_conveniencefee}+${sel_memberships_sales.2019_arr_conveniencefee} ;;
  }

  measure: total_arr_conveniencefee {
    label: "Rolling ARR Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
           when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
            else 0 end ;;
      filters: {
    field: date_date
    value: "12 months ago for 12 months"
  }
  }

  measure: 2019_arr_conveniencefee {
    label: "2019 Ticket Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
    }

  measure: 2019_without_comps_conveniencefee {
    label: "2019 Ticket Convenience Fee (USD/Without COmps)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
    filters: {
      field: transactiontype
      value: "Not 4"
    }
  }

  measure: 2019_comp_conveniencefee {
    label: "2019 Comp Ticket Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
    filters: {
      field: transactiontype
      value: "4"
    }
  }

  measure: 2018_arr_conveniencefee {
    label: "2018 Ticket Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: 2018_without_comps_conveniencefee {
    label: "2018 Ticket Convenience Fee (USD/Without Comps)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2018"
    }
    filters: {
      field: transactiontype
      value: "NOT 4"
    }
  }

  measure: 2018_comp_conveniencefee {
    label: "2018 Comp Ticket Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2018"
    }
    filters: {
      field: transactiontype
      value: "4"
    }
  }

    measure: 2020_arr_conveniencefee {
      label: "2020 Ticket Convenience Fee (USD)"
      type: sum_distinct
      value_format_name: usd
      sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
      filters: {
        field: date_year
        value: "2020"
      }
    }

  measure: junetodec_arr_conveniencefee {
    label: "June 2019 to Dec 2019 Rolling ARR Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_date
      value: "2019/06/01 to 2020/01/01"
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

  measure: Earliest_Transaction_date {
    label: "Earliest Transaction Date"
    type: date
    sql: MIN(${date_date}) ;;
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
    label: "Ticket Price"
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.price as FLOAT64), 2) ;;
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

  measure: total_gross_quantity {
    label: "# of Gross Tickets"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;
  }

  measure: total_quantity {
    label: "# of Tickets"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;
    filters: {
      field: voided
      value: "NULL"
    }
  }

  measure: 2020_total_quantity {
    label: "2020 Number of Tickets"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;
    filters: {
      field: voided
      value: "NULL"
    }

  filters: {
    field: date_year
    value: "2020"
  }
  }

  measure: 2019_total_quantity {
    label: "2019 Number of Tickets"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;
    filters: {
      field: voided
      value: "NULL"
    }
    filters: {
      field: date_year
      value: "2019"
    }
  }


  measure: 2019_total_quantity_no_comps {
    label: "2019 Number of Tickets (Without Comps)"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;
    filters: {
      field: voided
      value: "NULL"
    }
    filters: {
      field: date_year
      value: "2019"
    }
  filters: {
    field: transactiontype
    value: "NOT 4"
  }
  }

  measure: 2019_total_comps {
    type: number
    sql: ${2019_total_quantity}-${2019_total_quantity_no_comps} ;;
  }

  measure: total_future_ticket {
    label: "Number of Tickets for a Future Performance"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;
    filters: {
      field: voided
      value: "NULL"
    }
    filters: {
      field: sel_performances.starttime_date
      value: "after today"
    }
  }

  measure: total_past_ticket {
    label: "Number of Tickets for a Past Performance"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;
    filters: {
      field: voided
      value: "NULL"
    }
    filters: {
      field: sel_performances.starttime_date
      value: "before today"
    }
  }

  measure: 2018_total_quantity {
    label: "2018 Number of Tickets"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;
    filters: {
      field: voided
      value: "NULL"
    }
    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: 2018_total_quantity_without_comps {
    label: "2018 Number of Tickets (Without Comps)"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;
    filters: {
      field: voided
      value: "NULL"
    }
    filters: {
      field: date_year
      value: "2018"
    }
    filters: {
      field: transactiontype
      value: "NOT 4"
    }
  }

  measure: 2018_total_comps {
    type: number
    sql: ${2018_total_quantity}-${2018_total_quantity_without_comps} ;;
  }

  measure: total_quantity_refunded {
    label: "# of Tickets Refunded"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;

    filters: {
      field: sel_transactions_refunds.transactionid
      value: "-NULL"
    }
  }

  measure: 2020_total_quantity_refunded {
    label: "2020 # of Tickets Refunded"
    type: sum_distinct
    sql: ${TABLE}.quantity ;;

    filters: {
      field: sel_transactions_refunds.transactionid
      value: "-NULL"
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
      field: sel_transactions_refunds.transactionid
      value: "-NULL"
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
    sql: ${total_servicefee_usd} + ${total_conveniencefee_usd} ;;
  }

  measure: total_arr_local {
    label: "Total ARR (Local Currency)"
    type: number
    value_format_name: usd
    sql: ${total_servicefee} + ${total_conveniencefee} + ${sel_orders_misclineitems.total_servicefee} + ${sel_memberships_sales.total_membership_arr} + ${sel_donations.donation_servicefee} ;;
  }

  measure: total_arr {
    label: "Total ARR (USD)"
    type: number
    value_format_name: usd
    sql: ${total_servicefee_usd} + ${total_conveniencefee_usd} + ${sel_orders_misclineitems.total_servicefee_usd} + ${sel_memberships_sales.total_membership_arr_usd} + ${sel_donations.donation_servicefee_usd} ;;
  }

  measure: rolling_arr {
    label: "Rolling ARR (USD)"
    type: number
    value_format_name: usd
    sql: ${total_arr_servicefee} + ${total_arr_conveniencefee} + ${sel_orders_misclineitems.total_arr_servicefee} + ${sel_memberships_sales.rolling_total_membership_arr} + ${sel_giftcardissued.rolling_arr_servicefee_usd} + ${sel_donations.rollimg_donation_servicefee} ;;
    }

  measure: 2019_arr {
    label: "2019 ARR (USD)"
    type: number
    value_format_name: usd
    sql: case when ${sf_accounts.additional_data_import_information_c} = "new" then ${sf_accounts.annual_contract_value}
         when ${sf_accounts.measure_annual_subscription_fee_c} is NOT NULL then  ${2019_total_arr_servicefee} + ${2019_arr_conveniencefee} + ${sel_orders_misclineitems.2019_total_arr_servicefee} + ${sel_memberships_sales.2019_total_membership_arr} + ${sel_giftcardissued.2019_total_servicefee_usd} + ${sel_donations.2019_donation_servicefee} + ${sf_accounts.measure_annual_subscription_fee_c}
         else ${2019_total_arr_servicefee} + ${2019_arr_conveniencefee} + ${sel_orders_misclineitems.2019_total_arr_servicefee} + ${sel_memberships_sales.2019_total_membership_arr} + ${sel_giftcardissued.2019_total_servicefee_usd} + ${sel_donations.2019_donation_servicefee} end;;
    required_fields: [sf_accounts.annual_subscription_fee_c,sf_accounts.additional_data_import_information_c]
 }

  measure: 2018_arr {
    label: "2018 ARR (USD)"
    type: number
    value_format_name: usd
    sql: case when ${sf_accounts.additional_data_import_information_c} = "new" then ${sf_accounts.annual_contract_value}
         when ${sf_accounts.measure_annual_subscription_fee_c} is NOT NULL then  ${2018_total_arr_servicefee} + ${2018_arr_conveniencefee} + ${sel_orders_misclineitems.2018_total_arr_servicefee} + ${sel_memberships_sales.2018_total_membership_arr} + ${sel_giftcardissued.2018_total_servicefee_usd} + ${sel_donations.2018_donation_servicefee} + ${sf_accounts.measure_annual_subscription_fee_c}
         else ${2018_total_arr_servicefee} + ${2018_arr_conveniencefee} + ${sel_orders_misclineitems.2018_total_arr_servicefee} + ${sel_memberships_sales.2018_total_membership_arr} + ${sel_giftcardissued.2018_total_servicefee_usd} + ${sel_donations.2018_donation_servicefee} end;;
    required_fields: [sf_accounts.annual_subscription_fee_c,sf_accounts.additional_data_import_information_c]
  }

  measure: 2019_arr_junetodec {
    label: "June 2019 to Dec 2019 ARR (USD)"
    type: number
    value_format_name: usd
    sql: case when ${sf_accounts.measure_annual_subscription_fee_c} is NOT NULL then  ${junetodec_total_arr_servicefee} + ${junetodec_arr_conveniencefee} + ${sel_orders_misclineitems.junetodec_total_arr_servicefee} + ${sel_memberships_sales.junetodec_total_membership_arr} + ${sel_giftcardissued.junetodec_total_arr_servicefee} + ${sel_donations.junetodec_total_arr_servicefee} + ${sf_accounts.measure_annual_subscription_fee_c}
      else ${junetodec_total_arr_servicefee} + ${junetodec_arr_conveniencefee} + ${sel_orders_misclineitems.junetodec_total_arr_servicefee} + ${sel_memberships_sales.junetodec_total_membership_arr} + ${sel_giftcardissued.junetodec_total_arr_servicefee} + ${sel_donations.junetodec_total_arr_servicefee} end;;
    required_fields: [sf_accounts.annual_subscription_fee_c]
  }


  measure: 2019_net_arr_junetodec {
    label: "2019 NET ARR Prorated (USD)"
    type: number
    value_format_name: usd
    sql:  case when ${sf_accounts.additional_data_import_information_c} = "new" and ${sel_members.useinternetma} = "N" then ${sf_accounts.annual_contract_value}*0.72
          when  ${sf_accounts.additional_data_import_information_c} = "new" and ${sel_members.useinternetma} = "Y" then ${sf_accounts.annual_contract_value}
          when  ${sel_members.useinternetma} = "Y" and ${sel_members.useretailma} = "Y" then ${2019_arr}
          when  ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "Y" then ${2019_arr}
          when  ${sel_members.useinternetma} = "Y" and ${sel_members.useretailma} = "N" then ${2019_arr}
          when  ${2019_arr_junetodec} = 0 or ${2019_net_arr} = 0 then ${2019_arr}
          else (${junetodec_net_arr}/${2019_arr_junetodec})* ${2019_arr} END ;;
          required_fields: [sf_accounts.additional_data_import_information_c]
  }


  measure: total_servicefee_usd {
    label: "Total Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
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
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
    when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
    else 0 end ;;
    filters: {
      field: date_date
      value: "12 months ago for 12 months"
    }
  }

  measure: 2019_total_arr_servicefee {
    label: "2019 Ticket Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2019_total_without_servicefee {
    label: "2019 Ticket Service Fee (USD/Without Comps)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
    filters: {
      field: transactiontype
      value: "NOT 4"
    }
  }

  measure: 2019_total_comp_servicefee {
    label: "2019 Comp Ticket Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
    filters: {
      field: transactiontype
      value: "4"
    }
  }

  measure: 2018_total_arr_servicefee {
    label: "2018 Ticket Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: 2018_total_arr_without_comps_servicefee {
    label: "2018 Ticket Service Fee (USD/Without Comps)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2018"
    }
    filters: {
      field: transactiontype
      value: "Not 4"
    }
  }

  measure: 2018_total_comp_servicefee {
    label: "2018 Comp Ticket Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2018"
    }
    filters: {
      field: transactiontype
      value: "4"
    }
  }

  measure: 2020_total_arr_servicefee {
    label: "2020 Ticket Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2020"
    }
  }

  measure: junetodec_total_arr_servicefee {
    label: "June 2019 to Dec 2019 ARR Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_date
      value: "2019/06/01 to 2020/01/01"
    }
  }

  dimension_group: settled {
    type: time
    sql: timestamp_seconds(${TABLE}.settled) ;;
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
      value: "NOT 4"
    }
    filters: {
      field: sel_transactions_refunds.transactionid
      value: "NULL"
    }
  }

  measure: nonvoided_total_amount {
    label: "Non-Voided Earned Income (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
      else round(safe_cast(${TABLE}.total as FLOAT64), 2)*1 End ;;
    filters: {
      field: transactiontype
      value: "not 4"
    }
    filters: {
      field: voided
      value: "NULL"
    }
  }


  measure: 2019_nonvoided_total_amount {
    label: "2019 Non-Voided Earned Income (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
      else round(safe_cast(${TABLE}.total as FLOAT64), 2)*1 End ;;
    filters: {
      field: date_year
      value: "2019"
    }
    filters: {
      field: transactiontype
      value: "not 4"
    }
    filters: {
      field: voided
      value: "NULL"
    }
  }


    measure: 2020_nonvoided_total_amount {
      label: "2020 Non-Voided Earned Income (USD)"
      type: sum_distinct
      value_format_name: usd
      sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
        else round(safe_cast(${TABLE}.total as FLOAT64), 2)*1 End ;;
      filters: {
        field: date_year
        value: "2020"
      }
      filters: {
        field: transactiontype
        value: "not 4"
      }
      filters: {
        field: voided
        value: "NULL"
      }
  }

  measure: total_amount_usd {
    label: "Total Admission Amount (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
         else round(safe_cast(${TABLE}.total as FLOAT64), 2)*1 End ;;
    filters: {
      field: transactiontype
      value: "NOT 4"
    }
  }

  measure: refund_total_amount {
    label: "Total Refund Admission Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;

    filters: {
      field: sel_transactions_refunds.transactionid
      value: "-NULL"
    }
  }

  measure: 2020_refund_total_amount {
    label: "2020 Total Refund Admission Amount"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;

    filters: {
      field: sel_transactions_refunds.transactionid
      value: "-NULL"
    }
    filters: {
      field: date_year
      value: "2020"
    }
  }

  measure: 2019_total_amount {
    label: "2019 Earned Income (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
      else round(safe_cast(${TABLE}.total as FLOAT64), 2)*1 End ;;
    filters: {
      field: date_year
      value: "2019"
    }
    filters: {
      field: transactiontype
      value: "not 4"
    }
  }

  measure: 2018_total_amount {
    label: "2018 Earned Income (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
      else round(safe_cast(${TABLE}.total as FLOAT64), 2)*1 End ;;
    filters: {
      field: date_year
      value: "2018"
    }
    filters: {
      field: transactiontype
      value: "not 4"
    }
  }

  measure: 2020_total_amount {
    label: "2020 Earned Income (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
         else round(safe_cast(${TABLE}.total as FLOAT64), 2)*1 End ;;
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

  measure: count_type {
    label: "# of Price Types Sold"
    type: count_distinct
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
