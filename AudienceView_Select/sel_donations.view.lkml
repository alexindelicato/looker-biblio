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
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;
  }

  measure: sum_donation_amount {
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;
  }

  measure: 2019_sum_donation_amount {
    label: "2019 Contributed Income (USD)"
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;

    filters: {
      field: created_year
      value: "2019"
    }
  }

  measure: total_donation_amoount{
    label: "Total Donations (including tipjar)"
    type: number
    value_format_name: usd
    sql: ${sum_donation_amount}+${sel_orders_misclineitems.total_tipjar} ;;
  }

  measure: 2019_total_donation_amoount{
    label: "2019 Total Donations (including tipjar)"
    type: number
    value_format_name: usd
    sql: ${2019_sum_donation_amount}+${sel_orders_misclineitems.2019_total_tipjar} ;;
  }

  measure: 2020_total_donation_amoount{
    label: "2020 Total Donations (including tipjar)"
    type: number
    value_format_name: usd
    sql: ${2019_sum_donation_amount}+${sel_orders_misclineitems.2020_total_tipjar} ;;
  }


  measure: 2020_sum_donation_amount {
    label: "2020 Contributed Income (USD)"
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;

    filters: {
      field: created_year
      value: "2020"
    }
  }

  dimension: commissionableservicefee {
    type: number
    sql: ${TABLE}.commissionableservicefee ;;
  }

  dimension_group: created {
    type: time
    sql: timestamp_seconds(${TABLE}.created) ;;
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
