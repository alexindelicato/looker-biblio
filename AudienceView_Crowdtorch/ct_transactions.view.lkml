view: ct_transactions {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.data_transactions`
    ;;

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

  dimension: accountingid {
    type: string
    sql: ${TABLE}.accountingid ;;
  }

  dimension: additionalfee {
    type: number
    sql: ${TABLE}.additionalfee ;;
  }

  dimension: affiliateemail {
    type: string
    sql: ${TABLE}.affiliateemail ;;
  }

  dimension: affiliatefirstname {
    type: string
    sql: ${TABLE}.affiliatefirstname ;;
  }

  dimension: affiliateid {
    type: number
    value_format_name: id
    sql: ${TABLE}.affiliateid ;;
  }

  dimension: affiliatelastname {
    type: string
    sql: ${TABLE}.affiliatelastname ;;
  }

  dimension: affiliatetype {
    type: string
    sql: ${TABLE}.affiliatetype ;;
  }

  dimension: affiliateuserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.affiliateuserid ;;
  }

  dimension: alreadypaid {
    type: yesno
    sql: ${TABLE}.alreadypaid ;;
  }

  dimension: associatedpaymentid {
    type: number
    value_format_name: id
    sql: ${TABLE}.associatedpaymentid ;;
  }

  dimension: barcode {
    type: string
    sql: ${TABLE}.barcode ;;
  }

  dimension: billingadditionalfee {
    type: number
    sql: ${TABLE}.billingadditionalfee ;;
  }

#   dimension: billingcity {
#     type: string
#     sql: ${TABLE}.billingcity ;;
#   }
#
#   dimension: billingcountry {
#     type: string
#     sql: ${TABLE}.billingcountry ;;
#   }
#
#                         Round(sum(billingServiceFee + billingCreditCardProcessingFee), 2) as Revenue,
#                          Round(sum(billingServiceFee + billingCreditCardProcessingFee), 2) as AR_Amt


  dimension: billingcreditcardprocessingfee {
    type: number
    sql: ${TABLE}.billingcreditcardprocessingfee ;;
  }

  measure: billing_credit_card_fee {
    type: sum
    label: "Total Credit Card Fee"
    value_format_name: usd
    sql: ${TABLE}.billingcreditcardprocessingfee ;;
  }

  dimension: billingfeeslabmissing {
    type: yesno
    sql: ${TABLE}.billingfeeslabmissing ;;
  }

  dimension: billingrebate {
    type: number
    sql: ${TABLE}.billingrebate ;;
  }

  dimension: billingrecoupablefee {
    type: number
    sql: ${TABLE}.billingrecoupablefee ;;
  }

  dimension: billingsaletypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.billingsaletypeid ;;
  }

  dimension: billingservicefee {
    type: number
    sql: ${TABLE}.billingservicefee ;;
  }

  measure: billing_service_fee {
    type: sum
    label: "Total Service Fee"
    value_format_name: usd
    sql: ${TABLE}.billingservicefee ;;
  }

  measure: total_arr {
    label: "Total ARR"
    type: number
    value_format_name: usd
    sql: ${billing_service_fee} + ${billing_credit_card_fee} ;;

  }

#
#   dimension: billingstate {
#     type: string
#     sql: ${TABLE}.billingstate ;;
#   }
#
#   dimension: billingstreetaddress1 {
#     type: string
#     sql: ${TABLE}.billingstreetaddress1 ;;
#   }
#
#   dimension: billingstreetaddress2 {
#     type: string
#     sql: ${TABLE}.billingstreetaddress2 ;;
#   }

  dimension: billingzipcode {
    type: string
    sql: ${TABLE}.billingzipcode ;;
  }

  dimension: brandproperty {
    type: string
    sql: ${TABLE}.brandproperty ;;
  }

  dimension: cashgratuity {
    type: number
    sql: ${TABLE}.cashgratuity ;;
  }

  dimension: cashrevenue {
    type: number
    sql: ${TABLE}.cashrevenue ;;
  }

  dimension: cashservicefee {
    type: number
    sql: ${TABLE}.cashservicefee ;;
  }

  dimension: cashshipping {
    type: number
    sql: ${TABLE}.cashshipping ;;
  }

  dimension: cashtax {
    type: number
    sql: ${TABLE}.cashtax ;;
  }

  dimension: ccgratuity {
    type: number
    sql: ${TABLE}.ccgratuity ;;
  }
#
#   dimension: ccnumber {
#     type: string
#     sql: ${TABLE}.ccnumber ;;
#   }

  dimension: ccrevenue {
    type: number
    sql: ${TABLE}.ccrevenue ;;
  }

  dimension: ccservicefee {
    type: number
    sql: ${TABLE}.ccservicefee ;;
  }

#   dimension: ccshipping {
#     type: number
#     sql: ${TABLE}.ccshipping ;;
#   }

  dimension: cctax {
    type: number
    sql: ${TABLE}.cctax ;;
  }

  dimension: cctype {
    type: string
    sql: ${TABLE}.cctype ;;
  }

  dimension: clientchargeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.clientchargeid ;;
  }

  dimension: clientid {
    label: "Client Id"
    type: number
    value_format_name: id
    sql: ${TABLE}.clientid ;;
  }

  dimension: clientname {
    label: "Client Name"
    type: string
    sql: ${TABLE}.clientname ;;
  }

  dimension: clientrevenue {
    type: number
    sql: ${TABLE}.clientrevenue ;;
  }

  dimension: clientserviceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.clientserviceid ;;
  }

  dimension: couponcode {
    type: string
    sql: ${TABLE}.couponcode ;;
  }

  dimension: coupondiscount {
    type: number
    sql: ${TABLE}.coupondiscount ;;
  }

  dimension: couponid {
    type: number
    value_format_name: id
    sql: ${TABLE}.couponid ;;
  }

  dimension: couponname {
    type: string
    sql: ${TABLE}.couponname ;;
  }

  dimension: ctrevenue {
    label: "CT Revenue"
    value_format_name: usd
    type: number
    sql: ${TABLE}.ctrevenue ;;
  }

  dimension: currencycode {
    type: string
    sql: ${TABLE}.currencycode ;;
  }

  dimension: currencyid {
    type: number
    value_format_name: id
    sql: ${TABLE}.currencyid ;;
  }

  dimension: currencyname {
    type: string
    sql: ${TABLE}.currencyname ;;
  }

  dimension: currencyprefix {
    type: string
    sql: ${TABLE}.currencyprefix ;;
  }
#
#   dimension: customeremail {
#     type: string
#     sql: ${TABLE}.customeremail ;;
#   }
#
#   dimension: customerfirstname {
#     type: string
#     sql: ${TABLE}.customerfirstname ;;
#   }
#
#   dimension: customerlastname {
#     type: string
#     sql: ${TABLE}.customerlastname ;;
#   }

  dimension: customerservicefee {
    type: number
    sql: ${TABLE}.customerservicefee ;;
  }

  dimension: customerservicefeeperitem {
    type: number
    sql: ${TABLE}.customerservicefeeperitem ;;
  }

  dimension: customerservicefeeperorder {
    type: number
    sql: ${TABLE}.customerservicefeeperorder ;;
  }

  dimension: customeruserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.customeruserid ;;
  }

  dimension: dataset {
    type: string
    sql: ${TABLE}.dataset ;;
  }

  dimension: datatransactionid {
    type: number
    value_format_name: id
    sql: ${TABLE}.datatransactionid ;;
  }

  dimension: discountedrate {
    type: number
    sql: ${TABLE}.discountedrate ;;
  }

  dimension: discounttotal {
    type: number
    sql: ${TABLE}.discounttotal ;;
  }

  dimension: discrate {
    type: number
    sql: ${TABLE}.discrate ;;
  }

  dimension: donatedtoteammemberuserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.donatedtoteammemberuserid ;;
  }

  dimension: donationfunddetailid {
    type: number
    value_format_name: id
    sql: ${TABLE}.donationfunddetailid ;;
  }

  dimension: donationid {
    type: number
    value_format_name: id
    sql: ${TABLE}.donationid ;;
  }

  dimension: donationpaymentid {
    type: number
    value_format_name: id
    sql: ${TABLE}.donationpaymentid ;;
  }

  dimension: donationrefundid {
    type: number
    value_format_name: id
    sql: ${TABLE}.donationrefundid ;;
  }

  dimension_group: endshowdatetime {
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
    sql: CAST(${TABLE}.endshowdatetime AS TIMESTAMP) ;;
  }

  dimension: entitybonusid {
    type: number
    value_format_name: id
    sql: ${TABLE}.entitybonusid ;;
  }

  dimension: feetype {
    type: string
    sql: ${TABLE}.feetype ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: freeasbonus {
    type: yesno
    sql: ${TABLE}.freeasbonus ;;
  }

  dimension: fundid {
    type: number
    value_format_name: id
    sql: ${TABLE}.fundid ;;
  }

  dimension: fundname {
    type: string
    sql: ${TABLE}.fundname ;;
  }

  dimension: fundraisingpageid {
    type: number
    value_format_name: id
    sql: ${TABLE}.fundraisingpageid ;;
  }

  dimension: gcgratuity {
    type: number
    sql: ${TABLE}.gcgratuity ;;
  }

  dimension: gcrevenue {
    type: number
    sql: ${TABLE}.gcrevenue ;;
  }

  dimension: gcservicefee {
    type: number
    sql: ${TABLE}.gcservicefee ;;
  }

  dimension: gcshipping {
    type: number
    sql: ${TABLE}.gcshipping ;;
  }

  dimension: gctax {
    type: number
    sql: ${TABLE}.gctax ;;
  }

  dimension: gctransactionid {
    type: string
    sql: ${TABLE}.gctransactionid ;;
  }

  dimension: giftcardaddfundslogid {
    type: number
    value_format_name: id
    sql: ${TABLE}.giftcardaddfundslogid ;;
  }

  dimension: giftcardid {
    type: number
    value_format_name: id
    sql: ${TABLE}.giftcardid ;;
  }

  dimension: giftcardnumber {
    type: string
    sql: ${TABLE}.giftcardnumber ;;
  }

  dimension: giftcardpurchaseid {
    type: number
    value_format_name: id
    sql: ${TABLE}.giftcardpurchaseid ;;
  }

  dimension: giftcardrefundid {
    type: number
    value_format_name: id
    sql: ${TABLE}.giftcardrefundid ;;
  }

  dimension: giftcertgratuity {
    type: number
    sql: ${TABLE}.giftcertgratuity ;;
  }

  dimension: giftcertorderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.giftcertorderid ;;
  }

  dimension: giftcertrefundid {
    type: number
    value_format_name: id
    sql: ${TABLE}.giftcertrefundid ;;
  }

  dimension: giftcertrevenue {
    type: number
    sql: ${TABLE}.giftcertrevenue ;;
  }

  dimension: giftcertservicefee {
    type: number
    sql: ${TABLE}.giftcertservicefee ;;
  }

  dimension: giftcertshipping {
    type: number
    sql: ${TABLE}.giftcertshipping ;;
  }

  dimension: giftcerttax {
    type: number
    sql: ${TABLE}.giftcerttax ;;
  }

  dimension: glnumber {
    type: string
    sql: ${TABLE}.glnumber ;;
  }

  dimension: grandtotal {
    label: "Grand Total"
    value_format_name: usd
    type: number
    sql: ${TABLE}.grandtotal ;;
  }

  dimension: grandtotal_usd {
    label: "Grand Total (USD)"
    value_format_name: usd
    type: number
    sql: case when ${currencycode} = "CAD" then ${TABLE}.grandtotal * 0.72
        when ${currencycode} = "USD" then ${TABLE}.grandtotal * 1
        else 0 End;;
  }

  measure: sum_grand_total {
    label: "Sum Grand Total"
    value_format_name: usd
    type: sum
    sql: ${TABLE}.grandtotal ;;
  }

  measure: 2019_sum_grand_total {
    label: "2019 Earned Income Total (USD)"
    value_format_name: usd
    type: sum
    sql:case when ${currencycode} = "CAD" then ${TABLE}.grandtotal * 0.72
        when ${currencycode} = "USD" then ${TABLE}.grandtotal * 1
        else 0 End;;

    drill_fields: [transactionid,clientname,paymentid,showname,quantity,grandtotal_usd]

    filters: {
      field: transactiontime_year
      value: "2019"
    }

    filters: {
      field: dataset
      value: "ticketOrder"
    }
    }

  measure: 2020_sum_grand_total {
    label: "2020 Earned Income Total (USD)"
    value_format_name: usd
    type: sum
    sql:  case when ${currencycode} = "CAD" then ${TABLE}.grandtotal * 0.72
    when ${currencycode} = "USD" then ${TABLE}.grandtotal * 1
    else 0 End;;
    drill_fields: [transactionid,clientname,paymentid,showname,quantity,grandtotal_usd]

    filters: {
      field: transactiontime_year
      value: "2020"
    }

    filters: {
      field: dataset
      value: "ticketOrder"
    }
  }

  measure: 2019_donation_grand_total {
    label: "2019 Contributed Income Total (USD)"
    value_format_name: usd
    type: sum
    sql: case when ${currencycode} = "CAD" then ${TABLE}.grandtotal * 0.72
    when ${currencycode} = "USD" then ${TABLE}.grandtotal * 1
    else 0 End;;
    drill_fields: [transactionid,clientname,paymentid,showname,quantity,grandtotal_usd]

    filters: {
      field: transactiontime_year
      value: "2019"
    }

    filters: {
      field: dataset
      value: "donationFund"
    }
  }

  measure: 2020_donation_grand_total {
    label: "2020 Contributed Income Total (USD)"
    value_format_name: usd
    type: sum
    sql:   case when ${currencycode} = "CAD" then ${TABLE}.grandtotal * 0.72
    when ${currencycode} = "USD" then ${TABLE}.grandtotal * 1
    else 0 End;;
    drill_fields: [transactionid,clientname,paymentid,showname,quantity,grandtotal_usd]

    filters: {
      field: transactiontime_year
      value: "2020"
    }

    filters: {
      field: dataset
      value: "donationFund"
    }
  }

  dimension: gratuity {
    type: number
    sql: ${TABLE}.gratuity ;;
  }

  dimension: groupname {
    type: string
    sql: ${TABLE}.groupname ;;
  }

  dimension: grouppaymentid {
    type: number
    value_format_name: id
    sql: ${TABLE}.grouppaymentid ;;
  }

  dimension: guestquantity {
    type: number
    sql: ${TABLE}.guestquantity ;;
  }

  dimension: hardticketbarcodeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.hardticketbarcodeid ;;
  }

  dimension: hardticketsourceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.hardticketsourceid ;;
  }

  dimension: hardticketsourcename {
    type: string
    sql: ${TABLE}.hardticketsourcename ;;
  }

  dimension: individualtickets {
    type: yesno
    sql: ${TABLE}.individualtickets ;;
  }

  dimension: installmentcount {
    type: number
    sql: ${TABLE}.installmentcount ;;
  }

  dimension: ipaddress {
    type: string
    sql: ${TABLE}.ipaddress ;;
  }

  dimension: ischargeback {
    type: yesno
    sql: ${TABLE}.ischargeback ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: isequipment {
    type: yesno
    sql: ${TABLE}.isequipment ;;
  }

  dimension: isfreeguest {
    type: yesno
    sql: ${TABLE}.isfreeguest ;;
  }

  dimension: isgroupparty {
    type: yesno
    sql: ${TABLE}.isgroupparty ;;
  }

  dimension: isguestlist {
    type: yesno
    sql: ${TABLE}.isguestlist ;;
  }

  dimension: isimported {
    type: yesno
    sql: ${TABLE}.isimported ;;
  }

  dimension: ispackagetierticket {
    type: yesno
    sql: ${TABLE}.ispackagetierticket ;;
  }

  dimension: ispaid {
    type: yesno
    sql: ${TABLE}.ispaid ;;
  }

  dimension: ispartial {
    type: yesno
    sql: ${TABLE}.ispartial ;;
  }

  dimension: isperitemfee {
    type: yesno
    sql: ${TABLE}.isperitemfee ;;
  }

  dimension: isrecoupable {
    type: yesno
    sql: ${TABLE}.isrecoupable ;;
  }

  dimension: isrefunded {
    type: yesno
    sql: ${TABLE}.isrefunded ;;
  }

  dimension: isrefundtogiftcard {
    type: yesno
    sql: ${TABLE}.isrefundtogiftcard ;;
  }

  dimension: istmgateway {
    label: "Merchant of Record"
    type: yesno
    sql: ${TABLE}.istmgateway ;;
  }

  dimension: isvip {
    type: yesno
    sql: ${TABLE}.isvip ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: merchandiseorderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.merchandiseorderid ;;
  }

  dimension: merchandiseorderitemid {
    type: number
    value_format_name: id
    sql: ${TABLE}.merchandiseorderitemid ;;
  }

  dimension: nameoncard {
    type: string
    sql: ${TABLE}.nameoncard ;;
  }

  dimension: operatoremail {
    type: string
    sql: ${TABLE}.operatoremail ;;
  }

  dimension: operatorfirstname {
    type: string
    sql: ${TABLE}.operatorfirstname ;;
  }

  dimension: operatorlastname {
    type: string
    sql: ${TABLE}.operatorlastname ;;
  }

  dimension: operatoruserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.operatoruserid ;;
  }

  dimension: originalstatementid {
    type: number
    value_format_name: id
    sql: ${TABLE}.originalstatementid ;;
  }

  dimension: othergratuity {
    type: number
    sql: ${TABLE}.othergratuity ;;
  }

  dimension: otherrevenue {
    type: number
    sql: ${TABLE}.otherrevenue ;;
  }

  dimension: otherservicefee {
    type: number
    sql: ${TABLE}.otherservicefee ;;
  }

  dimension: othershipping {
    type: number
    sql: ${TABLE}.othershipping ;;
  }

  dimension: othertax {
    type: number
    sql: ${TABLE}.othertax ;;
  }

  dimension: pageowneruserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.pageowneruserid ;;
  }

  dimension: parentpackagetickettierid {
    type: number
    value_format_name: id
    sql: ${TABLE}.parentpackagetickettierid ;;
  }

  dimension: paymentamount {
    label: "Payment Amount"
    value_format_name: usd
    type: number
    sql: ${TABLE}.paymentamount ;;
  }

  dimension: paymentgatewaytype {
    type: string
    sql: ${TABLE}.paymentgatewaytype ;;
  }

  dimension: paymentgatewaytypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.paymentgatewaytypeid ;;
  }

  dimension: paymentgiftcardid {
    type: number
    value_format_name: id
    sql: ${TABLE}.paymentgiftcardid ;;
  }

  dimension: paymentgiftcardnumber {
    type: string
    sql: ${TABLE}.paymentgiftcardnumber ;;
  }

  dimension: paymentgiftcertificateid {
    type: string
    sql: ${TABLE}.paymentgiftcertificateid ;;
  }

  dimension: paymentgiftcertificatenumber {
    type: string
    sql: ${TABLE}.paymentgiftcertificatenumber ;;
  }

  dimension: paymentid {
    label: "Order Number"
    type: number
    value_format_name: id
    sql: ${TABLE}.paymentid ;;
  }

  dimension: paymenttype {
    type: string
    sql: ${TABLE}.paymenttype ;;
  }

  dimension: paymenttypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.paymenttypeid ;;
  }

  dimension: paymenttypes {
    type: string
    sql: ${TABLE}.paymenttypes ;;
  }

  dimension: postsettlementtransaction {
    type: yesno
    sql: ${TABLE}.postsettlementtransaction ;;
  }

  dimension: pricingamount {
    type: number
    label: "pricingamount"
    value_format_name: usd
    sql: ${TABLE}.pricingamount ;;
  }

  dimension: pricingpercent {
    type: number
    sql: ${TABLE}.pricingpercent ;;
  }

  dimension: pricingtype {
    type: string
    sql: ${TABLE}.pricingtype ;;
  }

  dimension: pricingtypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.pricingtypeid ;;
  }

  dimension: productid {
    type: number
    value_format_name: id
    sql: ${TABLE}.productid ;;
  }

  dimension: productname {
    type: string
    sql: ${TABLE}.productname ;;
  }

  dimension: productstockid {
    type: number
    value_format_name: id
    sql: ${TABLE}.productstockid ;;
  }

  dimension: publicdiscount {
    type: number
    sql: ${TABLE}.publicdiscount ;;
  }

  dimension: quantity {
    label: "# of Tickets"
    type: number
    sql: ${TABLE}.quantity ;;
  }

  measure: sum_of_tickets {
    label: "# of Tickets"
    type: sum
    sql: ${TABLE}.quantity ;;
  }

  measure: 2019_sum_of_tickets {
    label: "2019 # of Tickets"
    type: sum
    sql: ${TABLE}.quantity ;;
    drill_fields: [transactionid,clientname,paymentid,showname,quantity,grandtotal]

    filters: {
      field: transactiontime_year
      value: "2019"
    }


    filters: {
      field: dataset
      value: "ticketOrder"
    }
  }

  measure: 2020_sum_of_tickets {
    label: "2020 # of Tickets"
    type: sum
    sql: ${TABLE}.quantity ;;
    drill_fields: [transactionid,clientname,paymentid,showname,quantity,grandtotal]

    filters: {
      field: transactiontime_year
      value: "2020"
    }
    filters: {
      field: dataset
      value: "ticketOrder"
    }
  }

  dimension: rackrate {
    type: number
    sql: ${TABLE}.rackrate ;;
  }

  dimension: recognitionname {
    type: string
    sql: ${TABLE}.recognitionname ;;
  }

  dimension: recognitiontype {
    type: string
    sql: ${TABLE}.recognitiontype ;;
  }

  dimension: referralsourceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.referralsourceid ;;
  }

  dimension: referralsourcename {
    type: string
    sql: ${TABLE}.referralsourcename ;;
  }

  dimension: refundfeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.refundfeeid ;;
  }

  dimension: refundid {
    type: number
    value_format_name: id
    sql: ${TABLE}.refundid ;;
  }

  dimension: refunditemid {
    type: number
    value_format_name: id
    sql: ${TABLE}.refunditemid ;;
  }

  dimension: refundshowtickettierfeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.refundshowtickettierfeeid ;;
  }

  dimension: refundshowtickettierid {
    type: number
    value_format_name: id
    sql: ${TABLE}.refundshowtickettierid ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: saletype {
    type: string
    sql: ${TABLE}.saletype ;;
  }

  dimension: saletypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.saletypeid ;;
  }

  dimension: scanquantity {
    type: number
    sql: ${TABLE}.scanquantity ;;
  }

  dimension_group: scantime {
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
    sql: CAST(${TABLE}.scantime AS TIMESTAMP) ;;
  }

  dimension_group: scantimelocal {
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
    sql: CAST(${TABLE}.scantimelocal AS TIMESTAMP) ;;
  }

  dimension_group: secondarytransactiontime {
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
    sql: CAST(${TABLE}.secondarytransactiontime AS TIMESTAMP) ;;
  }

  dimension_group: secondarytransactiontimelocal {
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
    sql: CAST(${TABLE}.secondarytransactiontimelocal AS TIMESTAMP) ;;
  }

  dimension: serviceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.serviceid ;;
  }

  dimension: servicelevel {
    type: string
    sql: ${TABLE}.servicelevel ;;
  }

  dimension: servicename {
    type: string
    sql: ${TABLE}.servicename ;;
  }

  dimension: servicenameshort {
    type: string
    sql: ${TABLE}.servicenameshort ;;
  }

  dimension: serviceofferedmatrixid {
    type: number
    value_format_name: id
    sql: ${TABLE}.serviceofferedmatrixid ;;
  }

  dimension: serviceterm {
    type: string
    sql: ${TABLE}.serviceterm ;;
  }

  dimension: servicetime {
    type: number
    sql: ${TABLE}.servicetime ;;
  }

  dimension: shippingcharges {
    type: number
    sql: ${TABLE}.shippingcharges ;;
  }

  dimension: shippingmethod {
    type: string
    sql: ${TABLE}.shippingmethod ;;
  }

  dimension: shippingmethodid {
    type: number
    value_format_name: id
    sql: ${TABLE}.shippingmethodid ;;
  }

  dimension_group: showdatetime {
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
    sql: CAST(${TABLE}.showdatetime AS TIMESTAMP) ;;
  }

  dimension: showid {
    type: number
    value_format_name: id
    sql: ${TABLE}.showid ;;
  }

  dimension: showname {
    type: string
    sql: ${TABLE}.showname ;;
  }

  dimension: showticketfeesid {
    type: number
    value_format_name: id
    sql: ${TABLE}.showticketfeesid ;;
  }

  dimension: showtickettierfeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.showtickettierfeeid ;;
  }

  dimension: showtierid {
    type: number
    value_format_name: id
    sql: ${TABLE}.showtierid ;;
  }

  dimension: showtimingid {
    type: number
    value_format_name: id
    sql: ${TABLE}.showtimingid ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.size ;;
  }

  dimension: slabpackageid {
    type: number
    value_format_name: id
    sql: ${TABLE}.slabpackageid ;;
  }

  dimension: socialsharediscount {
    type: number
    sql: ${TABLE}.socialsharediscount ;;
  }

  dimension: socialsharediscounttype {
    type: string
    sql: ${TABLE}.socialsharediscounttype ;;
  }

  dimension: sourceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sourceid ;;
  }

  dimension: statementid {
    type: number
    value_format_name: id
    sql: ${TABLE}.statementid ;;
  }

  dimension: subtotal {
    type: number
    sql: ${TABLE}.subtotal ;;
  }

  dimension: successfultransaction {
    type: yesno
    sql: ${TABLE}.successfultransaction ;;
  }

  dimension: tablequantity {
    type: number
    sql: ${TABLE}.tablequantity ;;
  }

  dimension: tax {
    type: number
    sql: ${TABLE}.tax ;;
  }

  dimension: taxtype {
    type: number
    sql: ${TABLE}.taxtype ;;
  }

  dimension: teamid {
    type: number
    value_format_name: id
    sql: ${TABLE}.teamid ;;
  }

  dimension: templatesiteid {
    type: number
    value_format_name: id
    sql: ${TABLE}.templatesiteid ;;
  }

  dimension: ticketid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ticketid ;;
  }

  dimension: tickettierid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tickettierid ;;
  }

  dimension: tiername {
    type: string
    sql: ${TABLE}.tiername ;;
  }

  dimension: transactionid {
    type: string
    sql: ${TABLE}.transactionid ;;
  }

  dimension: transactionsettled {
    type: yesno
    sql: ${TABLE}.transactionsettled ;;
  }

  dimension: transactionsummary {
    type: string
    sql: ${TABLE}.transactionsummary ;;
  }

  dimension_group: transactiontime {
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
    sql: CAST(${TABLE}.transactiontime AS TIMESTAMP) ;;
  }

  measure: last_order_date {
    label: "Last Order Date"
    type: date
    sql: max(${transactiontime_raw}) ;;
    drill_fields: [paymentid,transactiontime_date,dataset]
  }

  dimension_group: transactiontimelocal {
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
    sql: CAST(${TABLE}.transactiontimelocal AS TIMESTAMP) ;;
  }

  dimension: transactiontype {
    label: "Transaction Type"
    type: string
    sql: ${TABLE}.transactiontype ;;
  }

  dimension: transferid {
    type: number
    value_format_name: id
    sql: ${TABLE}.transferid ;;
  }

  dimension: upgradeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.upgradeid ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: venuechargeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venuechargeid ;;
  }

  dimension: venueid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venueid ;;
  }

  dimension: venuelistitemid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venuelistitemid ;;
  }

  dimension: venuename {
    type: string
    sql: ${TABLE}.venuename ;;
  }

  dimension: venuepaymenttypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venuepaymenttypeid ;;
  }

  dimension: walkupdiscount {
    type: number
    sql: ${TABLE}.walkupdiscount ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      tiername,
      groupname,
      recognitionname,
      fundname,
      operatorlastname,
      firstname,
      venuename,
      affiliatefirstname,
      showname,
      productname,
      operatorfirstname,
      clientname,
      lastname,
      affiliatelastname,
      couponname,
      servicename,
      referralsourcename,
      hardticketsourcename,
      currencyname
    ]
  }
}
