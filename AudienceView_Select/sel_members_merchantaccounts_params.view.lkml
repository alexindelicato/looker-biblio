view: sel_members_merchantaccounts_params {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.members_merchantaccounts_params`
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

  dimension: membermerchantaccountid {
    type: number
    value_format_name: id
    sql: ${TABLE}.membermerchantaccountid ;;
  }

  dimension: membermerchantaccountparamid {
    type: number
    value_format_name: id
    sql: ${TABLE}.membermerchantaccountparamid ;;
  }

  dimension: paramname {
    type: string
    sql: ${TABLE}.paramname ;;
  }

  dimension: paramvalue {
    type: string
    sql: ${TABLE}.paramvalue ;;
  }

  measure: count {
    type: count
    drill_fields: [paramname]
  }
}
