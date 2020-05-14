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
    type: string
    sql: ${TABLE}.discount ;;
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
    label: "Total ARR"
    type: number
    value_format_name: usd
    sql: ${total_servicefee} + ${total_conveniencefee} ;;
  }

  measure: total_servicefee {
    label: "Total Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;
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
