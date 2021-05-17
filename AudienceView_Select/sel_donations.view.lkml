view: sel_donations {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.donations`
    ;;
  drill_fields: [donationid]

  dimension: donationid {
    primary_key: yes
    type: number
    sql: ${TABLE}.donationid ;;
  }

  measure: count_donationid {
    label: "# of Donations"
    type: count_distinct
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
    label: "Total Donation Amount"
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;
  }

  measure: sum_donation_amount_net {
    label: "Total Donation Amount Earned"
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;

    filters: {
      field: refundid
      value: "NULL"
    }
  }

  measure: sum_donation_amount_refunds {
    label: "Total Donation Refund Amount"
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;

    filters: {
      field: refundid
      value: "NOT NULL"
    }
  }

  measure: sum_donation_amount_usd {
    label: "Total Donation Amount (USD)"
    type: sum
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)* 0.72
      else round(safe_cast(${TABLE}.amount as FLOAT64), 2) *1 END ;;
  }

  measure: sum_donation_amount_usd_Earned {
    label: "Total Donation Amount Earned (USD)"
    type: sum
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)* 0.72
      else round(safe_cast(${TABLE}.amount as FLOAT64), 2) *1 END ;;

    filters: {
      field: refundid
      value: "NULL"
    }
  }

  measure: 2019_sum_donation_amount {
    label: "2019 Donation Income (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)* 0.72
         else round(safe_cast(${TABLE}.amount as FLOAT64), 2) *1 END ;;

    filters: {
      field: created_year
      value: "2019"
    }
  }

  measure: 2018_sum_donation_amount {
    label: "2018 Donation Income (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)* 0.72
      else round(safe_cast(${TABLE}.amount as FLOAT64), 2) *1 END ;;

    filters: {
      field: created_year
      value: "2018"
    }
  }

  measure: sum_donation_amount_three_years {
    label: "Donation Income (Last 3 Years)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)* 0.72
      else round(safe_cast(${TABLE}.amount as FLOAT64), 2) *1 END ;;

    filters: {
      field: created_year
      value: "3 years"
    }
  }


  measure: total_donation_amoount{
    label: "Total Donations (including tipjar)"
    type: number
    value_format_name: usd
    sql: ${sum_donation_amount}+${sel_orders_misclineitems.total_tipjar} ;;
  }

  measure: 2019_total_donation_amoount{
    label: "2019 Contributed Income (USD)"
    type: number
    value_format_name: usd
    sql: ${2019_sum_donation_amount}+${sel_orders_misclineitems.2019_total_tipjar} ;;
  }

  measure: 2018_total_donation_amoount{
    label: "2018 Contributed Income (USD)"
    type: number
    value_format_name: usd
    sql: ${2018_sum_donation_amount}+${sel_orders_misclineitems.2018_total_tipjar} ;;
  }

  measure: 2020_total_donation_amoount{
    label: "2020 Contributed Income (USD)"
    type: number
    value_format_name: usd
    sql: ${2020_sum_donation_amount}+${sel_orders_misclineitems.2020_total_tipjar} ;;
  }


  measure: 2020_sum_donation_amount {
    label: "2020 Donation Income (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)* 0.72
         else round(safe_cast(${TABLE}.amount as FLOAT64), 2) *1 END;;

    filters: {
      field: created_year
      value: "2020"
    }
  }

  dimension: commissionableservicefee {
    type: number
    sql: round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2) ;;
  }

  measure: sum_commissionableservicefee {
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*0.7673
          when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*1 END ;;
  }

  measure: 2019_commissionableservicefee {
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*0.7673
         when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*1 END ;;
    filters: {
      field: created_year
      value: "2019"
    }
  }

  measure: 2018_commissionableservicefee {
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*0.7673
      when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*1 END ;;
    filters: {
      field: created_year
      value: "2018"
    }
  }

  measure: junetodec_total_commissionableservicefee {
    label: "June 2019 to Dec 2019 Revenue Service Fee (VMA)"
    type: sum_distinct
    value_format_name: usd
    sql:case when ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*0.7673
      when  ${sel_members.useinternetma} = "N" and ${sel_members.useretailma} = "N"  and ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.commissionableservicefee as FLOAT64), 2)*1 END ;;
    filters: {
      field: created_date
      value: "2019/06/01 to 2020/01/01"
    }
  }

  measure: 2019_cc_processing_service_fee {
    type: number
    value_format_name: usd
    sql: ${2019_donation_servicefee}-${2019_commissionableservicefee} ;;
  }

  measure: 2018_cc_processing_service_fee {
    type: number
    value_format_name: usd
    sql: ${2019_donation_servicefee}-${2019_commissionableservicefee} ;;
  }

  measure: junetodec_cc_processing_service_fee {
    type: number
    value_format_name: usd
    sql: ${junetodec_total_arr_servicefee}-${junetodec_total_commissionableservicefee} ;;
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

  measure: count_donation_orders {
    label: "Count 2019 Orders with Donations"
    type: count_distinct
    value_format_name: id
    sql: ${TABLE}.orderid ;;
    filters: {
      field: created_year
      value: "2019"
    }
  }

  dimension: patronid {
    type: string
    sql: ${TABLE}.patronid ;;
  }

  measure: count_patronid {
    type: count_distinct
    sql: ${TABLE}.patronid ;;
    drill_fields: [sel_members.organizationname,orderid,amount]
  }

  measure: count_recurring_patronid {
    label: "# of Patrons with Recurring Donations"
    type: count_distinct
    sql: ${TABLE}.patronid ;;
    drill_fields: [sel_members.organizationname,orderid,amount]
    filters: {
      field: donation_type
      value: "Recurring Donation"
    }
  }

  measure: count_recurring_patronid_three_years {
    label: "# of Patrons with Recurring Donations (Last 3 years)"
    type: count_distinct
    sql: ${TABLE}.patronid ;;
    drill_fields: [sel_members.organizationname,orderid,amount]
    filters: {
      field: donation_type
      value: "Recurring Donation"
    }
    filters: {
      field: created_year
      value: "3 years"
    }
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
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;
  }

  measure: donation_servicefee {
    label: "Total Donation Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;
  }

  measure: donation_servicefee_usd {
    label: "Total Donation Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
            when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
            else 0 end ;;
  }

  measure: 2019_donation_servicefee {
    label: "2019 Donation Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
            when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
            else 0 end;;
    filters: {
      field: created_year
      value: "2019"
    }
  }

  measure: 2018_donation_servicefee {
    label: "2018 Donation Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
            when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
            else 0 end;;
    filters: {
      field: created_year
      value: "2018"
    }
  }

  measure: 2020_donation_servicefee {
    label: "2020 Donation Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
            when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
            else 0 end;;
    filters: {
      field: created_year
      value: "2020"
    }
  }

  measure: 2019_total_donation_service_fee{
    label: "2019 Contributed Income Service Fee (USD)"
    type: number
    value_format_name: usd
    sql: ${2019_donation_servicefee}+${sel_orders_misclineitems.2019_total_tipjar_servicefee} ;;
  }

  measure: 2020_total_donation_service_fee{
    label: "2020 Contributed Income Service Fee (USD)"
    type: number
    value_format_name: usd
    sql: ${2020_donation_servicefee}+${sel_orders_misclineitems.2020_total_tipjar_servicefee} ;;
  }

  measure: rollimg_donation_servicefee {
    label: "Rolling Donation Service Fee"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
            when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
            else 0 end;;
    filters: {
      field: created_date
      value: "12 months ago for 12 months"
    }
  }

  measure: junetodec_total_arr_servicefee {
    label: "June 2019 to Dec 2019 ARR Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: created_date
      value: "2019/06/01 to 2020/01/01"
    }
  }

  dimension: settled {
    type: number
    sql: ${TABLE}.settled ;;
  }

  dimension: tender {
    type: number
    sql: ${TABLE}.tender ;;
  }

  dimension: payment_type {
    label: "Payment Type"
    type: string
    sql: case when ${tender} = 1 then "Credt Card"
         when ${tender} = 2 then "Cash"
         when ${tender} = 3 then "Check"
        when ${tender} = 10 then "Payment in Kind"
        when ${tender} = 11 then "Donation Stock Options"
        when ${tender} = 12 then "Donation Volunteer"
        when ${tender} = 13 then "Donation Planned Giving"
        else "Research" end;;
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

  dimension: donation_type {
    type: string
    sql: case when ${TABLE}.type = "1" then "One Time Donation"
         when ${TABLE}.type = "2" then "Recurring Donation" Else "Research" End;;
  }

  measure: count_2019_donations {
    type: count_distinct
    sql: ${donationid} ;;
    filters: {
      field: created_year
      value: "2019"
    }
  }

  measure: count_2020_donations {
    type: count_distinct
    sql: ${donationid} ;;
    filters: {
      field: created_year
      value: "2020"
    }
  }

  measure: count_2018_donations {
    type: count_distinct
    sql: ${donationid} ;;
    filters: {
      field: created_year
      value: "2018"
    }
  }

  measure: 2018_total_number_donations {
    type:  number
    sql:  ${count_2018_donations} + ${sel_orders_misclineitems.count_2018_tipjar};;
  }

  measure: 2019_total_number_donations {
    type:  number
    sql:  ${count_2019_donations} + ${sel_orders_misclineitems.count_2019_tipjar};;
  }

  measure: 2020_total_number_donations {
    type:  number
    sql:  ${count_2020_donations} + ${sel_orders_misclineitems.count_2020_tipjar};;
  }

  measure: count {
    type: count
    drill_fields: [donationid, donationcampaigns.donationcampaignid, donationcampaigns.name, payments_donations.count]
  }
}
