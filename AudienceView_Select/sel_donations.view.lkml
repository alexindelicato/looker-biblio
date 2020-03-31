view: sel_donations {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.donations`
    ;;
  drill_fields: [donationid]

  dimension: donationid {
    primary_key: yes
    type: number
    sql: ${TABLE}.donationid ;;
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

  dimension: agentid {
    type: string
    sql: ${TABLE}.agentid ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: commissionableservicefee {
    type: number
    sql: ${TABLE}.commissionableservicefee ;;
  }

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: donationcampaignid {
    type: string
    # hidden: yes
    sql: ${TABLE}.donationcampaignid ;;
  }

  dimension: donationrecurringid {
    type: string
    sql: ${TABLE}.donationrecurringid ;;
  }

  dimension: employermatch {
    type: string
    sql: ${TABLE}.employermatch ;;
  }

  dimension: employermatchstatus {
    type: string
    sql: ${TABLE}.employermatchstatus ;;
  }

  dimension: fundid {
    type: string
    sql: ${TABLE}.fundid ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.orderid ;;
  }

  dimension: patronid {
    type: string
    sql: ${TABLE}.patronid ;;
  }

  dimension: recognitiondescription {
    type: string
    sql: ${TABLE}.recognitiondescription ;;
  }

  dimension: recognitiontype {
    type: string
    sql: ${TABLE}.recognitiontype ;;
  }

  dimension: refundid {
    type: number
    value_format_name: id
    sql: ${TABLE}.refundid ;;
  }

  dimension: servicefee {
    type: string
    sql: ${TABLE}.servicefee ;;
  }

  dimension: settled {
    type: number
    sql: ${TABLE}.settled ;;
  }

  dimension: tender {
    type: number
    sql: ${TABLE}.tender ;;
  }

  dimension: tenderdescription {
    type: string
    sql: ${TABLE}.tenderdescription ;;
  }

  dimension: testmode {
    type: string
    sql: ${TABLE}.testmode ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [donationid, donationcampaigns.donationcampaignid, donationcampaigns.name, payments_donations.count]
  }
}