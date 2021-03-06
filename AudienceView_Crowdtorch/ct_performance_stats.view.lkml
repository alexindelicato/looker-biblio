view: ct_performance_stats {
  sql_table_name: fivetran-ovation-tix-warehouse.crowd_torch.performance_stats ;;

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: client_name {
  type: string
  sql: ${TABLE}.clientName ;;
  link: {
    label: "Insight Client Performance Listings"
    url: "https://audienceview.looker.com/explore/biblio/ct_performance_stats?fields=ct_performance_stats.client_id,ct_performance_stats.client_name,ct_performance_stats.brand_property,ct_performance_stats.billing_currency,ct_performance_stats.show_name,ct_performance_stats.show_date_time_time,ct_performance_stats.total_scan,ct_performance_stats.quantity_tickets,ct_performance_stats.cc_service_fee,ct_performance_stats.service_fee,ct_performance_stats.additional_fee,ct_performance_stats.grand_total,ct_performance_stats.ap_amount&f[ct_performance_stats.client_name]={{ filterable_value | url_encode }}&f[ct_performance_stats.show_date_time_date]=2020/03/02 to 2020/03/16"
    icon_url: "https://www.pngfind.com/pngs/m/383-3836953_overview-icon-wp-overview-icon-hd-png-download.png"
  }
  link: {
    label: "View Settlement Requests Dashboard"
    url: "/dashboards/61"
    icon_url: "https://st4.depositphotos.com/4799321/26935/v/1600/depositphotos_269359362-stock-illustration-insight-icon-in-transparent-style.jpg"
  }
  link: {
    label: "CrowdTorch Client Listing"
    url: "/looks/516"
    icon_url: "https://st4.depositphotos.com/4799321/26935/v/1600/depositphotos_269359362-stock-illustration-insight-icon-in-transparent-style.jpg"
  }
  link: {
    label: "Return to SMA Client Dashboard"
    url: "/dashboards/62"
    icon_url: "https://st4.depositphotos.com/4799321/26935/v/1600/depositphotos_269359362-stock-illustration-insight-icon-in-transparent-style.jpg"
  }
}

dimension: client_id {
  type: number
  sql: cast(${TABLE}.clientID as string) ;;
}

  measure: count_client_id {
    type: count_distinct
    sql: ${TABLE}.clientID  ;;
    drill_fields: [client_id,client_name]
  }

dimension: show_name {
  type: string
  sql: ${TABLE}.showName ;;
}

dimension_group: show_date_time {
  type: time
  sql: ${TABLE}.showDateTime ;;
}

  dimension: performance_settlement {
    type: string
    sql: case when ${show_date_time_week_of_year} = 10 then "March 2nd to March 8th"
         when ${show_date_time_week_of_year} = 11 then "March 9th to March 15th"
         when ${show_date_time_week_of_year} = 12 then "March 16th to March 22nd"
         when ${show_date_time_week_of_year} = 13 then "March 23rd to March 29th"
         when ${show_date_time_week_of_year} = 14 then "March 30th to April 5th"
         when ${show_date_time_week_of_year} = 15 then "April 6th to April 12th"
         when ${show_date_time_week_of_year} = 16 then "April 13th to April 19th"
        when ${show_date_time_week_of_year} = 17 then "April 20th to April 26th"
         when ${show_date_time_week_of_year} = 18 then "April 27th to May 3rd"
        when ${show_date_time_week_of_year} = 19 then "May 4th to May 10th"
    else "Research" End;;
  }

dimension: brand_property {
  type: string
  sql: ${TABLE}.brandProperty ;;
}

dimension: quantity_tickets {
  type: number
  sql: ${TABLE}.Quantity_tickets ;;
}

dimension: total_scan {
  type: number
  sql: ${TABLE}.totalScan ;;
}

  measure: sum_total_scan {
    type: sum
    sql: ${TABLE}.totalScan ;;
  }

dimension: grand_total {
  type: number
  value_format_name: usd
  sql: ${TABLE}.Grand_Total ;;
}

  measure: sum_grand_total {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Grand_Total ;;
  }

dimension: service_fee {
  type: number
  value_format_name: usd
  sql: ${TABLE}.Service_Fee ;;
}

dimension: cc_service_fee {
  type: number
  value_format_name: usd
  sql: ${TABLE}.CC_Service_Fee ;;
}

dimension: additional_fee {
  type: number
  value_format_name: usd
  sql: ${TABLE}.Additional_Fee ;;
}

dimension: ap_amount {
  type: number
  value_format_name: usd
  sql: ${TABLE}.AP_Amount ;;
}

  measure: sum_ap_amount {
    label: "Payout Amount"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.AP_Amount ;;
  }

dimension: billing_currency {
  type: string
  sql: ${TABLE}.billingCurrency ;;
}

dimension: usd_ap_amount {
  type: number
  sql: ${TABLE}.USD_AP_Amount ;;
}

set: detail {
  fields: [
    client_name,
    client_id,
    show_name,
    show_date_time_time,
    brand_property,
    quantity_tickets,
    total_scan,
    grand_total,
    service_fee,
    cc_service_fee,
    additional_fee,
    ap_amount,
    billing_currency,
    usd_ap_amount
  ]
}
}
