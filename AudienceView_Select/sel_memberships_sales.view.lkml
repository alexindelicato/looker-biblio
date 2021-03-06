view: sel_memberships_sales {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.memberships_sales`
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

  dimension: agentid {
    type: string
    sql: ${TABLE}.agentid ;;
  }

  dimension: amount {
    type: number
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;
  }

  measure: sum_membership_amount {
    label: "Total Membership Amount"
    value_format_name: usd
    type: sum_distinct
    sql: round(safe_cast(${TABLE}.amount as FLOAT64), 2) ;;
  }

  measure: sum_membership_amount_usd {
    label: "Total Membership Amount (USD)"
    value_format_name: usd
    type: sum_distinct
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*1
                else 0 end ;;
  }

  measure: 2019_sum_amount {
    label: "2019 Membership Sales (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*1
                else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2018_sum_amount {
    label: "2018 Membership Sales (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*1
                else 0 end ;;
    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: 2020_sum_amount {
    label: "2020 Membership Sales (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:  case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*0.72
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.amount as FLOAT64), 2)*1
                else 0 end ;;
    filters: {
      field: date_year
      value: "2020"
    }
  }

  dimension: conveniencefee {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2) ;;
  }

  measure: total_conveniencefee {
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2) ;;
  }

  measure: total_conveniencefee_usd {
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
  }

  measure: 2019_arr_conveniencefee {
    label: "2019 Total Membership Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2018_arr_conveniencefee {
    label: "2018 Total Membership Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: 2020_arr_conveniencefee {
    label: "2020 Total Membership Convenience Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2020"
    }
  }

  measure: junetodec_total_arr_conveniencefee {
    label: "June 2019 to Dec 2019 ARR Conveniencefee Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql:   case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_date
      value: "2019/06/01 to 2020/01/01"
    }
  }

  measure: rolling_arr_conveniencefee {
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.conveniencefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_date
      value: "12 months ago for 12 months"
    }
  }


  dimension_group: date {
    type: time
    sql: timestamp_seconds(${TABLE}.date) ;;
  }

  dimension: declinebenefits {
    type: string
    sql: ${TABLE}.declinebenefits ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: membershipid {
    type: string
    sql: ${TABLE}.membershipid ;;
  }

  dimension: membershiplevelid {
    type: string
    sql: ${TABLE}.membershiplevelid ;;
  }

  dimension: membershipsaleid {
    type: string
    primary_key: yes
    sql: ${TABLE}.membershipsaleid ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
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

  dimension: settled {
    type: string
    sql: ${TABLE}.settled ;;
  }

  dimension: servicefee {
    type: number
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;
  }

  measure: total_servicefee {
    type: sum_distinct
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.servicefee as FLOAT64), 2) ;;
  }

  measure: total_servicefee_usd {
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
  }

  measure: 2019_arr_servicefee {
    label: "2019 Total Membership Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2018_arr_servicefee {
    label: "2018 Total Membership Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: 2020_arr_servicefee {
    label: "2020 Total Membership Service Fee (USD)"
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_year
      value: "2020"
    }
  }

  measure: rolling_arr_servicefee {
    type: sum_distinct
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*0.7673
          when ${sel_members.currency} = "USD" then round(safe_cast(${TABLE}.servicefee as FLOAT64), 2)*1
          else 0 end ;;
    filters: {
      field: date_date
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
      field: date_date
      value: "2019/06/01 to 2020/01/01"
    }
  }

  measure: total_membership_arr {
    type: number
    value_format_name: usd
    sql: ${total_conveniencefee}+${total_servicefee} ;;
  }

  measure: total_membership_arr_usd {
    type: number
    value_format_name: usd
    sql: ${total_conveniencefee_usd}+${total_servicefee_usd} ;;
  }

  measure: 2019_total_membership_arr {
    type: number
    value_format_name: usd
    sql: ${2019_arr_conveniencefee}+${2019_arr_servicefee} ;;
  }

  measure: 2018_total_membership_arr {
    type: number
    value_format_name: usd
    sql: ${2018_arr_conveniencefee}+${2018_arr_servicefee} ;;
  }

  measure: junetodec_total_membership_arr {
    type: number
    value_format_name: usd
    sql: ${junetodec_total_arr_conveniencefee}+${junetodec_total_arr_servicefee} ;;
  }

  measure: rolling_total_membership_arr {
    type: number
    value_format_name: usd
    sql: ${rolling_arr_conveniencefee}+${rolling_arr_servicefee} ;;
  }


  dimension: settledaily {
    type: string
    sql: ${TABLE}.settledaily ;;
  }

  dimension: taxableamount {
    type: string
    sql: ${TABLE}.taxableamount ;;
  }

  dimension: testmode {
    type: string
    sql: ${TABLE}.testmode ;;
  }

  dimension: voidbenefits {
    type: string
    sql: ${TABLE}.voidbenefits ;;
  }
  measure: 2020_count {
    label: "2020 Number of Membership Sales"
    type: count_distinct
    sql: ${membershipid} ;;
    filters: {
      field: date_year
      value: "2020"
    }
  }

  measure: 2019_count {
    label: "2019 Number of Membership Sales"
    type: count_distinct
    sql: ${membershipid} ;;
    filters: {
      field: date_year
      value: "2019"
    }
  }

  measure: 2018_count {
    label: "2018 Number of Membership Sales"
    type: count_distinct
    sql: ${membershipid} ;;
    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: count_membership_sales {
    label: "# of Memberships Sold"
    type: count_distinct
    sql: ${TABLE}.membershipsaleid ;;
    drill_fields: [orderid]
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
