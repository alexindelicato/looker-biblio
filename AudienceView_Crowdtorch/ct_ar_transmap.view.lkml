view: ct_ar_transmap {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_transmap`
    ;;

  dimension: _fivetran_deleted {
    type: yesno
    hidden: yes
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.ar_id ;;
  }

  dimension: datatransactionid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.datatransactionid ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
