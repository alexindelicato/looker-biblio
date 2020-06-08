view: sel_members_scanners {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.members_scanners`
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

  dimension: allowcheckout {
    type: string
    sql: ${TABLE}.allowcheckout ;;
  }

  dimension: createdate {
    type: number
    sql: ${TABLE}.createdate ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: forcelogout {
    type: string
    sql: ${TABLE}.forcelogout ;;
  }

  dimension: lastvisit {
    type: number
    sql: ${TABLE}.lastvisit ;;
  }

  dimension: macaddress {
    type: string
    sql: ${TABLE}.macaddress ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension: numvisits {
    type: number
    sql: ${TABLE}.numvisits ;;
  }

  dimension: scannerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.scannerid ;;
  }

  measure: count {
    type: count
    drill_fields: [nickname]
  }
}
