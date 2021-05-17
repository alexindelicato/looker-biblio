view: sel_donationcampaigns {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.donationcampaigns`
    ;;
  drill_fields: [donationcampaignid]

  dimension: donationcampaignid {
    primary_key: yes
    type: string
    sql: ${TABLE}.donationcampaignid ;;
  }

  measure: count_campaigns {
    label: "Number of Donation Campaigns Created"
    type: count_distinct
    sql: ${TABLE}.donationcampaignid ;;
  }

  measure: count_campaigns_three_years {
    label: "Number of Donation Campaigns Created (Last 3 Years)"
    type: count_distinct
    sql: ${TABLE}.donationcampaignid ;;
   filters: {
    field: created_year
    value: "3 years"
  }
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

  dimension: captcharequired {
    type: string
    sql: ${TABLE}.captcharequired ;;
  }

  dimension: companylogoid {
    type: string
    sql: ${TABLE}.companylogoid ;;
  }

  dimension_group: created {
    type: time
    sql: timestamp_seconds(${TABLE}.created) ;;
  }



  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: employermatchdescription {
    type: string
    sql: ${TABLE}.employermatchdescription ;;
  }

  dimension: lastcompletedwizardstep {
    type: number
    sql: ${TABLE}.lastcompletedwizardstep ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: offerdonateanonymously {
    type: string
    sql: ${TABLE}.offerdonateanonymously ;;
  }

  dimension: offeremployermatch {
    type: string
    sql: ${TABLE}.offeremployermatch ;;
  }

  dimension: offerinhonorof {
    type: string
    sql: ${TABLE}.offerinhonorof ;;
  }

  dimension: offerinkind {
    type: string
    sql: ${TABLE}.offerinkind ;;
  }

  dimension: offerinmemoryof {
    type: string
    sql: ${TABLE}.offerinmemoryof ;;
  }

  dimension: offeronemonthrecurring {
    type: string
    sql: ${TABLE}.offeronemonthrecurring ;;
  }

  dimension: offeronetime {
    type: string
    sql: ${TABLE}.offeronetime ;;
  }

  dimension: offeronetimearbitrary {
    type: string
    sql: ${TABLE}.offeronetimearbitrary ;;
  }

  dimension: offeronetimedesignated {
    type: string
    sql: ${TABLE}.offeronetimedesignated ;;
  }

  dimension: offerplanned {
    type: string
    sql: ${TABLE}.offerplanned ;;
  }

  dimension: offerrecognizemeas {
    type: string
    sql: ${TABLE}.offerrecognizemeas ;;
  }

  dimension: offerrecurring {
    type: string
    sql: ${TABLE}.offerrecurring ;;
  }

  dimension: offersixmonthrecurring {
    type: string
    sql: ${TABLE}.offersixmonthrecurring ;;
  }

  dimension: offerstockoptions {
    type: string
    sql: ${TABLE}.offerstockoptions ;;
  }

  dimension: offerthreemonthrecurring {
    type: string
    sql: ${TABLE}.offerthreemonthrecurring ;;
  }

  dimension: offertwelvemonthrecurring {
    type: string
    sql: ${TABLE}.offertwelvemonthrecurring ;;
  }

  dimension: offervolunteer {
    type: string
    sql: ${TABLE}.offervolunteer ;;
  }

  dimension: receiptcustomizationid {
    type: number
    value_format_name: id
    sql: ${TABLE}.receiptcustomizationid ;;
  }

  dimension: showbillid {
    type: string
    sql: ${TABLE}.showbillid ;;
  }

  dimension: suspended {
    type: number
    sql: ${TABLE}.suspended ;;
  }

  dimension: thankyou {
    type: string
    sql: ${TABLE}.thankyou ;;
  }

  dimension: themeid {
    type: string
    sql: ${TABLE}.themeid ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [donationcampaignid, name, donations.count]
  }
}
