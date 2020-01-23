view: sel_members {
  sql_table_name: mysql_service.members ;;
  drill_fields: [memberid]

  dimension: memberid {
    primary_key: yes
    type: string
    sql: ${TABLE}.memberid ;;
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

  dimension: accepthtmlemail {
    type: string
    sql: ${TABLE}.accepthtmlemail ;;
  }

  dimension: accountmanagerid {
    type: string
    sql: ${TABLE}.accountmanagerid ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.active ;;
  }

  dimension: agentconveniencefeename {
    type: string
    sql: ${TABLE}.agentconveniencefeename ;;
  }

  dimension: agentpackageservicefeename {
    type: string
    sql: ${TABLE}.agentpackageservicefeename ;;
  }

  dimension: agentrenewalservicefeename {
    type: string
    sql: ${TABLE}.agentrenewalservicefeename ;;
  }

  dimension: agentservicefeename {
    type: string
    sql: ${TABLE}.agentservicefeename ;;
  }

  dimension: allowbuyforsomeoneelse {
    type: string
    sql: ${TABLE}.allowbuyforsomeoneelse ;;
  }

  dimension: allowdonationmanagement {
    type: string
    sql: ${TABLE}.allowdonationmanagement ;;
  }

  dimension: allowholds {
    type: string
    sql: ${TABLE}.allowholds ;;
  }

  dimension: allowinvoicinggroupsalesta {
    type: string
    sql: ${TABLE}.allowinvoicinggroupsalesta ;;
  }

  dimension: allowmembership {
    type: string
    sql: ${TABLE}.allowmembership ;;
  }

  dimension: allowpatronsocialsharing {
    type: string
    sql: ${TABLE}.allowpatronsocialsharing ;;
  }

  dimension: allowpublicpublish {
    type: string
    sql: ${TABLE}.allowpublicpublish ;;
  }

  dimension: allowtlkeepshopping {
    type: string
    sql: ${TABLE}.allowtlkeepshopping ;;
  }

  dimension: allowtlmembershipredemption {
    type: string
    sql: ${TABLE}.allowtlmembershipredemption ;;
  }

  dimension: allowtlpickseats {
    type: string
    sql: ${TABLE}.allowtlpickseats ;;
  }

  dimension: allowvoucher {
    type: string
    sql: ${TABLE}.allowvoucher ;;
  }

  dimension: attn {
    type: string
    sql: ${TABLE}.attn ;;
  }

  dimension: authenticationkey {
    type: string
    sql: ${TABLE}.authenticationkey ;;
  }

  dimension: cashconveniencefeename {
    type: string
    sql: ${TABLE}.cashconveniencefeename ;;
  }

  dimension: cashservicefeename {
    type: string
    sql: ${TABLE}.cashservicefeename ;;
  }

  dimension: ccsignature {
    type: string
    sql: ${TABLE}.ccsignature ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: compservicefeename {
    type: string
    sql: ${TABLE}.compservicefeename ;;
  }

  dimension: consigneeinvoicenumbernext {
    type: string
    sql: ${TABLE}.consigneeinvoicenumbernext ;;
  }

  dimension: consigneeservicefeename {
    type: string
    sql: ${TABLE}.consigneeservicefeename ;;
  }

  dimension: continuitydate {
    type: number
    sql: ${TABLE}.continuitydate ;;
  }

  dimension: continuityfrequencydays {
    type: number
    sql: ${TABLE}.continuityfrequencydays ;;
  }

  dimension: conveniencefeename {
    type: string
    sql: ${TABLE}.conveniencefeename ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: cpmservicefeename {
    type: string
    sql: ${TABLE}.cpmservicefeename ;;
  }

  dimension: creation {
    type: number
    sql: ${TABLE}.creation ;;
  }

  dimension: cs_email {
    type: string
    sql: ${TABLE}.cs_email ;;
  }

  dimension: cs_ext {
    type: string
    sql: ${TABLE}.cs_ext ;;
  }

  dimension: cs_telephone {
    type: string
    sql: ${TABLE}.cs_telephone ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: dailysalesreports {
    type: string
    sql: ${TABLE}.dailysalesreports ;;
  }

  dimension: defaultpermissiongroupid {
    type: number
    value_format_name: id
    sql: ${TABLE}.defaultpermissiongroupid ;;
  }

  dimension: defaulttaeventview {
    type: string
    sql: ${TABLE}.defaulttaeventview ;;
  }

  dimension: defaulttimezone {
    type: string
    sql: ${TABLE}.defaulttimezone ;;
  }

  dimension: deliveryfeename {
    type: string
    sql: ${TABLE}.deliveryfeename ;;
  }

  dimension: demoextended {
    type: string
    sql: ${TABLE}.demoextended ;;
  }

  dimension: disbursementdelay {
    type: number
    sql: ${TABLE}.disbursementdelay ;;
  }

  dimension: displaypatronaddressonthermal {
    type: string
    sql: ${TABLE}.displaypatronaddressonthermal ;;
  }

  dimension: donationservicefeename {
    type: string
    sql: ${TABLE}.donationservicefeename ;;
  }

  dimension: donationtacashservicefeename {
    type: string
    sql: ${TABLE}.donationtacashservicefeename ;;
  }

  dimension: donationtaservicefeename {
    type: string
    sql: ${TABLE}.donationtaservicefeename ;;
  }

  dimension: donationtlservicefeename {
    type: string
    sql: ${TABLE}.donationtlservicefeename ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: emailfrom {
    type: string
    sql: ${TABLE}.emailfrom ;;
  }

  dimension: emailreports {
    type: string
    sql: ${TABLE}.emailreports ;;
  }

  dimension: emailtoothers {
    type: string
    sql: ${TABLE}.emailtoothers ;;
  }

  dimension: eticketlogo {
    type: string
    sql: ${TABLE}.eticketlogo ;;
  }

  dimension: exchangeconveniencefeename {
    type: string
    sql: ${TABLE}.exchangeconveniencefeename ;;
  }

  dimension: exchangegraceperiod {
    type: number
    sql: ${TABLE}.exchangegraceperiod ;;
  }

  dimension: exchangeservicefeename {
    type: string
    sql: ${TABLE}.exchangeservicefeename ;;
  }

  dimension: ext {
    type: string
    sql: ${TABLE}.ext ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: faxreports {
    type: string
    sql: ${TABLE}.faxreports ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: fiscalyearstart {
    type: number
    sql: ${TABLE}.fiscalyearstart ;;
  }

  dimension: forcedpatronlanguage {
    type: string
    sql: ${TABLE}.forcedpatronlanguage ;;
  }

  dimension: giftcardtaissuanceservicefeename {
    type: string
    sql: ${TABLE}.giftcardtaissuanceservicefeename ;;
  }

  dimension: giftcardtaredemptionservicefeename {
    type: string
    sql: ${TABLE}.giftcardtaredemptionservicefeename ;;
  }

  dimension: giftcardtlissuanceservicefeename {
    type: string
    sql: ${TABLE}.giftcardtlissuanceservicefeename ;;
  }

  dimension: giftcardtlredemptionservicefeename {
    type: string
    sql: ${TABLE}.giftcardtlredemptionservicefeename ;;
  }

  dimension: hasstandardmsa {
    type: string
    sql: ${TABLE}.hasstandardmsa ;;
  }

  dimension: instantreports {
    type: string
    sql: ${TABLE}.instantreports ;;
  }

  dimension: invoiceservicefeename {
    type: string
    sql: ${TABLE}.invoiceservicefeename ;;
  }

  dimension: invoicetlservicefeename {
    type: string
    sql: ${TABLE}.invoicetlservicefeename ;;
  }

  dimension: isticketagent {
    type: string
    sql: ${TABLE}.isticketagent ;;
  }

  dimension: last {
    type: number
    sql: ${TABLE}.last ;;
  }

  dimension: lastdonationdate {
    type: number
    sql: ${TABLE}.lastdonationdate ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}.leadsource ;;
  }

  dimension: leadsourceextra {
    type: string
    sql: ${TABLE}.leadsourceextra ;;
  }

  dimension: livemodedate {
    type: number
    sql: ${TABLE}.livemodedate ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: lowinventory {
    type: string
    sql: ${TABLE}.lowinventory ;;
  }

  dimension: maxnumcustompaymentmethods {
    type: number
    sql: ${TABLE}.maxnumcustompaymentmethods ;;
  }

  dimension: maxnumtickettypes {
    type: number
    sql: ${TABLE}.maxnumtickettypes ;;
  }

  dimension: membernumid {
    type: number
    value_format_name: id
    sql: ${TABLE}.membernumid ;;
  }

  dimension: membershipsagentconveniencefeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.membershipsagentconveniencefeeid ;;
  }

  dimension: membershipsagentservicefeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.membershipsagentservicefeeid ;;
  }

  dimension: membershipsconveniencefeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.membershipsconveniencefeeid ;;
  }

  dimension: membershipsservicefeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.membershipsservicefeeid ;;
  }

  dimension: misclineitemfeename {
    type: string
    sql: ${TABLE}.misclineitemfeename ;;
  }

  dimension: mobilephonenumber {
    type: string
    sql: ${TABLE}.mobilephonenumber ;;
  }

  dimension: msa_accept_date {
    type: number
    sql: ${TABLE}.msa_accept_date ;;
  }

  dimension: msa_version {
    type: number
    sql: ${TABLE}.msa_version ;;
  }

  dimension: nonprofit {
    type: string
    sql: ${TABLE}.nonprofit ;;
  }

  dimension: nonprofitexpiredate {
    type: number
    sql: ${TABLE}.nonprofitexpiredate ;;
  }

  dimension: nonprofittaxid {
    type: string
    sql: ${TABLE}.nonprofittaxid ;;
  }

  dimension: notifyofrefexch {
    type: string
    sql: ${TABLE}.notifyofrefexch ;;
  }

  dimension: notifyofvbounce {
    type: string
    sql: ${TABLE}.notifyofvbounce ;;
  }

  dimension: offerwalletini {
    type: string
    sql: ${TABLE}.offerwalletini ;;
  }

  dimension: organizationname {
    type: string
    sql: ${TABLE}.organizationname ;;
  }

  dimension: packageservicefeename {
    type: string
    sql: ${TABLE}.packageservicefeename ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: passwordchanged {
    type: number
    sql: ${TABLE}.passwordchanged ;;
  }

  dimension: passwordsalt {
    type: string
    sql: ${TABLE}.passwordsalt ;;
  }

  dimension: paytome {
    type: string
    sql: ${TABLE}.paytome ;;
  }

  dimension: pointaward {
    type: string
    sql: ${TABLE}.pointaward ;;
  }

  dimension: printsalestaxmliontickets {
    type: yesno
    sql: ${TABLE}.printsalestaxmliontickets ;;
  }

  dimension: raradminid {
    type: string
    sql: ${TABLE}.raradminid ;;
  }

  dimension: refundservicefeename {
    type: string
    sql: ${TABLE}.refundservicefeename ;;
  }

  dimension: rememberme {
    type: string
    sql: ${TABLE}.rememberme ;;
  }

  dimension: removevendinilogo {
    type: string
    sql: ${TABLE}.removevendinilogo ;;
  }

  dimension: renewalconveniencefeename {
    type: string
    sql: ${TABLE}.renewalconveniencefeename ;;
  }

  dimension: renewalservicefeename {
    type: string
    sql: ${TABLE}.renewalservicefeename ;;
  }

  dimension: requirevouchernumber {
    type: string
    sql: ${TABLE}.requirevouchernumber ;;
  }

  dimension: requirevoucherredemption {
    type: string
    sql: ${TABLE}.requirevoucherredemption ;;
  }

  dimension: reserveamount {
    type: number
    sql: ${TABLE}.reserveamount ;;
  }

  dimension: reservedelay {
    type: number
    sql: ${TABLE}.reservedelay ;;
  }

  dimension: salesreports {
    type: string
    sql: ${TABLE}.salesreports ;;
  }

  dimension: sendorderconfirmationta {
    type: string
    sql: ${TABLE}.sendorderconfirmationta ;;
  }

  dimension: sentconfirmation {
    type: string
    sql: ${TABLE}.sentconfirmation ;;
  }

  dimension: servicefeename {
    type: string
    sql: ${TABLE}.servicefeename ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: stayinformed {
    type: string
    sql: ${TABLE}.stayinformed ;;
  }

  dimension: street1 {
    type: string
    sql: ${TABLE}.street1 ;;
  }

  dimension: street2 {
    type: string
    sql: ${TABLE}.street2 ;;
  }

  dimension: supportteamid {
    type: number
    value_format_name: id
    sql: ${TABLE}.supportteamid ;;
  }

  dimension: telephone {
    type: string
    sql: ${TABLE}.telephone ;;
  }

  dimension: testmode {
    type: string
    sql: ${TABLE}.testmode ;;
  }

  dimension: ticketsperyear {
    type: number
    sql: ${TABLE}.ticketsperyear ;;
  }

  dimension: ticketstockinventory {
    type: number
    sql: ${TABLE}.ticketstockinventory ;;
  }

  dimension: tipjardonationfeename {
    type: string
    sql: ${TABLE}.tipjardonationfeename ;;
  }

  dimension: trialoptout {
    type: number
    sql: ${TABLE}.trialoptout ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: useinternetma {
    type: string
    sql: ${TABLE}.useinternetma ;;
  }

  dimension: useretailma {
    type: string
    sql: ${TABLE}.useretailma ;;
  }

  dimension: vendiniaccount {
    type: string
    sql: ${TABLE}.vendiniaccount ;;
  }

  dimension: visits {
    type: number
    sql: ${TABLE}.visits ;;
  }

  dimension: zeromembershipservicefeename {
    type: string
    sql: ${TABLE}.zeromembershipservicefeename ;;
  }

  dimension: zeroorderservicefeename {
    type: string
    sql: ${TABLE}.zeroorderservicefeename ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      memberid,
      donationtlservicefeename,
      giftcardtlredemptionservicefeename,
      giftcardtaredemptionservicefeename,
      cashservicefeename,
      lastname,
      organizationname,
      conveniencefeename,
      renewalconveniencefeename,
      cpmservicefeename,
      packageservicefeename,
      misclineitemfeename,
      exchangeservicefeename,
      agentservicefeename,
      zeromembershipservicefeename,
      renewalservicefeename,
      servicefeename,
      zeroorderservicefeename,
      donationtaservicefeename,
      agentpackageservicefeename,
      refundservicefeename,
      giftcardtlissuanceservicefeename,
      cashconveniencefeename,
      agentrenewalservicefeename,
      compservicefeename,
      firstname,
      exchangeconveniencefeename,
      agentconveniencefeename,
      giftcardtaissuanceservicefeename,
      donationservicefeename,
      donationtacashservicefeename,
      deliveryfeename,
      tipjardonationfeename,
      invoicetlservicefeename,
      consigneeservicefeename,
      invoiceservicefeename
    ]
  }
}
