view: ct_ar_showdatevenues {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_showdatevenues`
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

  dimension: ar_showdateid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ar_showdateid ;;
  }

  dimension: clientid {
    type: number
    value_format_name: id
    sql: ${TABLE}.clientid ;;
  }

  dimension: clientname {
    type: string
    sql: ${TABLE}.clientname ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension_group: showdate {
    type: time
    sql: timestamp_seconds(${TABLE}.showdate) ;;
  }

  dimension: venueid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venueid ;;
  }

  dimension: venuename {
    type: string
    sql: ${TABLE}.venuename ;;
  }

  measure: count {
    type: count
    drill_fields: [venuename, clientname]
  }
}
