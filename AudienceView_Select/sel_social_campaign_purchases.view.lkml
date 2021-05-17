view: sel_social_campaign_purchases {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.social_campaign_purchases`
    ;;
  drill_fields: [social_campaign_purchasesid]

  dimension: social_campaign_purchasesid {
    primary_key: yes
    type: number
    sql: ${TABLE}.social_campaign_purchasesid ;;
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

  dimension_group: created {
    type: time
    sql: timestamp_seconds(${TABLE}.created) ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.orderid ;;
  }

  dimension: packageid {
    type: string
    sql: ${TABLE}.packageid ;;
  }

  dimension: patronid {
    type: string
    sql: ${TABLE}.patronid ;;
  }

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  dimension: purchaseamount {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.purchaseamount as FLOAT64),2) ;;
  }

  measure: total_purchaseamount {
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.purchaseamount as FLOAT64),2) ;;
  }

  dimension: referrerpatronid {
    type: string
    sql: ${TABLE}.referrerpatronid ;;
  }

  dimension: referrertype {
    type: string
    sql: ${TABLE}.referrertype ;;
  }

  dimension: socialcampaignpurchasesid {
    type: string
    sql: ${TABLE}.socialcampaignpurchasesid ;;
  }

  measure: count_orders {
    type: count_distinct
    sql: safe_cast(${TABLE}.orderid as INT64) ;;
    drill_fields: [social_campaign_purchasesid]
  }

  measure: count {
    type: count
    drill_fields: [social_campaign_purchasesid]
  }
}
