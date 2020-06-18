view: sel_social_campaign_purchases {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.social_campaign_purchases`
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

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: orderid {
    type: string
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
    type: string
    sql: ${TABLE}.purchaseamount ;;
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

  measure: count {
    type: count
    drill_fields: [social_campaign_purchasesid]
  }
}
