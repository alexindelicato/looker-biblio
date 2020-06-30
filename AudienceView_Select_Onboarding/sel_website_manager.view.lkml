view: sel_website_manager {
  sql_table_name: `fivetran-ovation-tix-warehouse.sel_fact_sheet.sel_website_manager`
    ;;

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

  dimension: av_select_feature_name {
    type: string
    sql: ${TABLE}.av_select_feature_name ;;
  }

  dimension: has_website_manager {
    label: "Has Website Manager"
    type: yesno
    sql: ${TABLE}.av_select_feature_name = 'SiteLine 2.0' ;;
  }

  dimension: sf_accounts_salesforce_id {
    type: string
    sql: ${TABLE}.sf_accounts_salesforce_id ;;
  }

  measure: count {
    type: count
    drill_fields: [av_select_feature_name]
  }
}
