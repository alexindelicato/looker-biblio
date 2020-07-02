view: sel_donation_campaigns_facts {
  sql_table_name: `fivetran-ovation-tix-warehouse.sel_fact_sheet.sel_donation_campaigns`
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

  dimension: number_of_donation_campaigns_created {
    type: number
    sql: case when ${TABLE}.number_of_donation_campaigns_created IS NULL then 0
    else ${TABLE}.number_of_donation_campaigns_created end ;;
  }

  dimension: number_of_donation_campaigns_created_last_3_years_ {
    type: number
    sql: case when ${TABLE}.number_of_donation_campaigns_created_last_3_years_ is null then 0
         else ${TABLE}.number_of_donation_campaigns_created_last_3_years_ end;;
  }

  dimension: sf_accounts_salesforce_id {
    type: string
    sql: ${TABLE}.sf_accounts_salesforce_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
