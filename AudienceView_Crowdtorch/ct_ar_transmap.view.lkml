view: ct_ar_transmap {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_transmap`
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

  dimension: ar_id {
    type: number
    sql: ${TABLE}.ar_id ;;
  }

  dimension: datatransactionid {
    type: number
    value_format_name: id
    sql: ${TABLE}.datatransactionid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
