view: ct_laughstub_venues {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.laughstub_venues`
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

  dimension: accname {
    type: string
    sql: ${TABLE}.accname ;;
  }

  dimension: accnumber {
    type: string
    sql: ${TABLE}.accnumber ;;
  }

  dimension: allowhostedby {
    type: yesno
    sql: ${TABLE}.allowhostedby ;;
  }

  dimension: allowmultiple {
    type: yesno
    sql: ${TABLE}.allowmultiple ;;
  }

  dimension: allowpremium {
    type: yesno
    sql: ${TABLE}.allowpremium ;;
  }

  dimension: allowupgrades {
    type: yesno
    sql: ${TABLE}.allowupgrades ;;
  }

  dimension: apinvoicebyshow {
    type: yesno
    sql: ${TABLE}.apinvoicebyshow ;;
  }

  dimension_group: apsetdate {
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
    sql: CAST(${TABLE}.apsetdate AS TIMESTAMP) ;;
  }

  dimension: apsetter {
    type: number
    sql: ${TABLE}.apsetter ;;
  }

  dimension: arinvoicebyshow {
    type: yesno
    sql: ${TABLE}.arinvoicebyshow ;;
  }

  dimension_group: arsetdate {
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
    sql: CAST(${TABLE}.arsetdate AS TIMESTAMP) ;;
  }

  dimension: arsetter {
    type: number
    sql: ${TABLE}.arsetter ;;
  }

  dimension: artistemailtext {
    type: string
    sql: ${TABLE}.artistemailtext ;;
  }

  dimension: automaticprinting {
    type: yesno
    sql: ${TABLE}.automaticprinting ;;
  }

  dimension: balanceamount {
    type: number
    sql: ${TABLE}.balanceamount ;;
  }

  dimension: bankbranch {
    type: string
    sql: ${TABLE}.bankbranch ;;
  }

  dimension: bankcity {
    type: string
    sql: ${TABLE}.bankcity ;;
  }

  dimension: bankcountry {
    type: string
    sql: ${TABLE}.bankcountry ;;
  }

  dimension: bankname {
    type: string
    sql: ${TABLE}.bankname ;;
  }

  dimension: bankstate {
    type: string
    sql: ${TABLE}.bankstate ;;
  }

  dimension: bankstreet {
    type: string
    sql: ${TABLE}.bankstreet ;;
  }

  dimension: bankzip {
    type: string
    sql: ${TABLE}.bankzip ;;
  }

  dimension: billcontactaddress1 {
    type: string
    sql: ${TABLE}.billcontactaddress1 ;;
  }

  dimension: billcontactaddress2 {
    type: string
    sql: ${TABLE}.billcontactaddress2 ;;
  }

  dimension: billcontactcity {
    type: string
    sql: ${TABLE}.billcontactcity ;;
  }

  dimension: billcontactcountry {
    type: string
    sql: ${TABLE}.billcontactcountry ;;
  }

  dimension: billcontactemail {
    type: string
    sql: ${TABLE}.billcontactemail ;;
  }

  dimension: billcontactname {
    type: string
    sql: ${TABLE}.billcontactname ;;
  }

  dimension: billcontactstate {
    type: string
    sql: ${TABLE}.billcontactstate ;;
  }

  dimension: billcontactzip {
    type: string
    sql: ${TABLE}.billcontactzip ;;
  }

  dimension: billingfrequency {
    type: number
    sql: ${TABLE}.billingfrequency ;;
  }

  dimension: billingnotes {
    type: string
    sql: ${TABLE}.billingnotes ;;
  }

  dimension: billingtype {
    type: number
    sql: ${TABLE}.billingtype ;;
  }

  dimension: businessname {
    type: string
    sql: ${TABLE}.businessname ;;
  }

  dimension: chargetaxonupgradefees {
    type: yesno
    sql: ${TABLE}.chargetaxonupgradefees ;;
  }

  dimension_group: commissionstartdate {
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
    sql: CAST(${TABLE}.commissionstartdate AS TIMESTAMP) ;;
  }

  dimension: constantcontactapikey {
    type: string
    sql: ${TABLE}.constantcontactapikey ;;
  }

  dimension: constantcontactpassword {
    type: string
    sql: ${TABLE}.constantcontactpassword ;;
  }

  dimension: constantcontactusername {
    type: string
    sql: ${TABLE}.constantcontactusername ;;
  }

  dimension: contactname {
    type: string
    sql: ${TABLE}.contactname ;;
  }

  dimension: currencyid {
    type: number
    value_format_name: id
    sql: ${TABLE}.currencyid ;;
  }

  dimension_group: dateinserted {
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
    sql: CAST(${TABLE}.dateinserted AS TIMESTAMP) ;;
  }

  dimension_group: deletedtime {
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
    sql: CAST(${TABLE}.deletedtime AS TIMESTAMP) ;;
  }

  dimension: deleteuserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.deleteuserid ;;
  }

  dimension: directdeposit {
    type: number
    sql: ${TABLE}.directdeposit ;;
  }

  dimension: gettingstartedcomplete {
    type: yesno
    sql: ${TABLE}.gettingstartedcomplete ;;
  }

  dimension: grouptermsconditions {
    type: string
    sql: ${TABLE}.grouptermsconditions ;;
  }

  dimension: iban {
    type: string
    sql: ${TABLE}.iban ;;
  }

  dimension: industrytypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.industrytypeid ;;
  }

  dimension: ipaddr {
    type: string
    sql: ${TABLE}.ipaddr ;;
  }

  dimension: isapproved {
    type: yesno
    sql: ${TABLE}.isapproved ;;
  }

  dimension: isdeleted {
    type: number
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: isregisteredw9 {
    type: number
    sql: ${TABLE}.isregisteredw9 ;;
  }

  dimension: isvalidated {
    type: yesno
    sql: ${TABLE}.isvalidated ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: letstatement {
    type: string
    sql: ${TABLE}.letstatement ;;
  }

  dimension: listingtype {
    type: number
    sql: ${TABLE}.listingtype ;;
  }

  dimension: logopath {
    type: string
    sql: ${TABLE}.logopath ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }

  dimension: marketingscore {
    type: number
    sql: ${TABLE}.marketingscore ;;
  }

  dimension: maxtix {
    type: number
    sql: ${TABLE}.maxtix ;;
  }

  dimension: maxtixcap {
    type: number
    sql: ${TABLE}.maxtixcap ;;
  }

  dimension: maxtixmsg {
    type: string
    sql: ${TABLE}.maxtixmsg ;;
  }

  dimension: merchantdescriptor {
    type: string
    sql: ${TABLE}.merchantdescriptor ;;
  }

  dimension: mobileticketing {
    type: yesno
    sql: ${TABLE}.mobileticketing ;;
  }

  dimension: oneticketperparty {
    type: yesno
    sql: ${TABLE}.oneticketperparty ;;
  }

  dimension_group: onsaleverifieddate {
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
    sql: CAST(${TABLE}.onsaleverifieddate AS TIMESTAMP) ;;
  }

  dimension: onsaleverifier {
    type: number
    sql: ${TABLE}.onsaleverifier ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}.`order` ;;
  }

  dimension: oversellcap {
    type: number
    sql: ${TABLE}.oversellcap ;;
  }

  dimension: paymentaddress {
    type: string
    sql: ${TABLE}.paymentaddress ;;
  }

  dimension: paymentterms {
    type: string
    sql: ${TABLE}.paymentterms ;;
  }

  dimension: paymenttype {
    type: number
    sql: ${TABLE}.paymenttype ;;
  }

  dimension_group: paymentupdateddate {
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
    sql: CAST(${TABLE}.paymentupdateddate AS TIMESTAMP) ;;
  }

  dimension: premiumcharge {
    type: number
    sql: ${TABLE}.premiumcharge ;;
  }

  dimension: printtixpassword {
    type: string
    sql: ${TABLE}.printtixpassword ;;
  }

  dimension: purchasepolicy {
    type: string
    sql: ${TABLE}.purchasepolicy ;;
  }

  dimension: refundpassword {
    type: string
    sql: ${TABLE}.refundpassword ;;
  }

  dimension_group: revieweddate {
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
    sql: CAST(${TABLE}.revieweddate AS TIMESTAMP) ;;
  }

  dimension: revieweruserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.revieweruserid ;;
  }

  dimension: routingnumber {
    type: string
    sql: ${TABLE}.routingnumber ;;
  }

  dimension: saleamount {
    type: number
    sql: ${TABLE}.saleamount ;;
  }

  dimension: salesforceid {
    type: string
    sql: ${TABLE}.salesforceid ;;
  }

  dimension: seatingcapacity {
    type: number
    sql: ${TABLE}.seatingcapacity ;;
  }

  dimension: seatingchart {
    type: yesno
    sql: ${TABLE}.seatingchart ;;
  }

  dimension: sendrefundlinkinticketemail {
    type: yesno
    sql: ${TABLE}.sendrefundlinkinticketemail ;;
  }

  dimension: showconfirmation {
    type: yesno
    sql: ${TABLE}.showconfirmation ;;
  }

  dimension: showsperweek {
    type: number
    sql: ${TABLE}.showsperweek ;;
  }

  dimension_group: signingdate {
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
    sql: CAST(${TABLE}.signingdate AS TIMESTAMP) ;;
  }

  dimension: slabisvalidated {
    type: yesno
    sql: ${TABLE}.slabisvalidated ;;
  }

  dimension_group: slabrevieweddate {
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
    sql: CAST(${TABLE}.slabrevieweddate AS TIMESTAMP) ;;
  }

  dimension: slabrevieweruserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.slabrevieweruserid ;;
  }

  dimension: startday {
    type: number
    sql: ${TABLE}.startday ;;
  }

  dimension: stopticketsales {
    type: number
    sql: ${TABLE}.stopticketsales ;;
  }

  dimension: stopticketsalesmessage {
    type: string
    sql: ${TABLE}.stopticketsalesmessage ;;
  }

  dimension: swiftcode {
    type: string
    sql: ${TABLE}.swiftcode ;;
  }

  dimension: taxpercent {
    type: number
    sql: ${TABLE}.taxpercent ;;
  }

  dimension: taxtype {
    type: number
    sql: ${TABLE}.taxtype ;;
  }

  dimension: ticketmessage {
    type: string
    sql: ${TABLE}.ticketmessage ;;
  }

  dimension: ticketsidebarbanner {
    type: string
    sql: ${TABLE}.ticketsidebarbanner ;;
  }

  dimension: tickettermsconditions {
    type: string
    sql: ${TABLE}.tickettermsconditions ;;
  }

  dimension: timedifference {
    type: number
    sql: ${TABLE}.timedifference ;;
  }

  dimension: timezoneid {
    type: string
    sql: ${TABLE}.timezoneid ;;
  }

  dimension: transfercharges {
    type: number
    sql: ${TABLE}.transfercharges ;;
  }

  dimension: upgradecharge {
    type: number
    sql: ${TABLE}.upgradecharge ;;
  }

  dimension: upgradename {
    type: string
    sql: ${TABLE}.upgradename ;;
  }

  dimension: userid {
    type: number
    value_format_name: id
    sql: ${TABLE}.userid ;;
  }

  dimension: usingbooking {
    type: yesno
    sql: ${TABLE}.usingbooking ;;
  }

  dimension: venueaddress {
    type: string
    sql: ${TABLE}.venueaddress ;;
  }

  dimension: venueaddress2 {
    type: string
    sql: ${TABLE}.venueaddress2 ;;
  }

  dimension: venuecity {
    type: string
    sql: ${TABLE}.venuecity ;;
  }

  dimension: venuecountry {
    type: string
    sql: ${TABLE}.venuecountry ;;
  }

  dimension: venuecreatedby {
    type: number
    sql: ${TABLE}.venuecreatedby ;;
  }

  dimension: venuedescription {
    type: string
    sql: ${TABLE}.venuedescription ;;
  }

  dimension: venueemail {
    type: string
    sql: ${TABLE}.venueemail ;;
  }

  dimension: venuefacebook {
    type: string
    sql: ${TABLE}.venuefacebook ;;
  }

  dimension: venuefax {
    type: string
    sql: ${TABLE}.venuefax ;;
  }

  dimension: venueflickr {
    type: string
    sql: ${TABLE}.venueflickr ;;
  }

  dimension: venuegenericurl {
    type: string
    sql: ${TABLE}.venuegenericurl ;;
  }

  dimension: venuegoogleplus {
    type: string
    sql: ${TABLE}.venuegoogleplus ;;
  }

  dimension: venueid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venueid ;;
  }

  dimension: venueinstagram {
    type: string
    sql: ${TABLE}.venueinstagram ;;
  }

  dimension: venuemyspace {
    type: string
    sql: ${TABLE}.venuemyspace ;;
  }

  dimension: venuename {
    type: string
    sql: ${TABLE}.venuename ;;
  }

  dimension: venuenickname {
    type: string
    sql: ${TABLE}.venuenickname ;;
  }

  dimension: venuenote {
    type: string
    sql: ${TABLE}.venuenote ;;
  }

  dimension: venuephone {
    type: string
    sql: ${TABLE}.venuephone ;;
  }

  dimension: venuesoundcloud {
    type: string
    sql: ${TABLE}.venuesoundcloud ;;
  }

  dimension: venuesoundcloudapiurl {
    type: string
    sql: ${TABLE}.venuesoundcloudapiurl ;;
  }

  dimension: venuestate {
    type: string
    sql: ${TABLE}.venuestate ;;
  }

  dimension: venuetwitter {
    type: string
    sql: ${TABLE}.venuetwitter ;;
  }

  dimension: venuetypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venuetypeid ;;
  }

  dimension: venueuid {
    type: string
    sql: ${TABLE}.venueuid ;;
  }

  dimension: venueurl {
    type: string
    sql: ${TABLE}.venueurl ;;
  }

  dimension: venuewebsite {
    type: string
    sql: ${TABLE}.venuewebsite ;;
  }

  dimension: venueweight {
    type: number
    sql: ${TABLE}.venueweight ;;
  }

  dimension: venueyoutube {
    type: string
    sql: ${TABLE}.venueyoutube ;;
  }

  dimension: venuezip {
    type: string
    sql: ${TABLE}.venuezip ;;
  }

  dimension: waitlist {
    type: yesno
    sql: ${TABLE}.waitlist ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      venuenickname,
      accname,
      businessname,
      upgradename,
      venuename,
      contactname,
      constantcontactusername,
      billcontactname,
      bankname
    ]
  }
}
