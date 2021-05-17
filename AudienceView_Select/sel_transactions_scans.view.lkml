view: sel_transactions_scans {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.transactions_scans`
    ;;
  drill_fields: [transactions_scansid]

  dimension: transactions_scansid {
    primary_key: yes
    type: number
    sql: ${TABLE}.transactions_scansid ;;
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

  dimension_group: lastscan {
    type: time
    sql: timestamp_seconds(${TABLE}.lastscan) ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.orderid ;;
  }

  dimension: redeemed {
    type: string
    sql: ${TABLE}.redeemed ;;
  }

  measure: count {
    type: count
    drill_fields: [transactions_scansid]
  }
  measure: count_scans {
    type: count_distinct
    sql: ${TABLE}.transactions_scansid  ;;
    drill_fields: [transactions_scansid]
  }
}
