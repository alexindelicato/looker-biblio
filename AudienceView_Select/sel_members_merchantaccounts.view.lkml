view: sel_members_merchantaccounts {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.members_merchantaccounts`
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

  dimension: accountname {
    type: string
    sql: ${TABLE}.accountname ;;
  }

  dimension: bankname {
    type: string
    sql: ${TABLE}.bankname ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: failover {
    type: string
    sql: ${TABLE}.failover ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: membermerchantaccountid {
    type: number
    value_format_name: id
    sql: ${TABLE}.membermerchantaccountid ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: gateway {
    type: string
    sql: case when ${TABLE}.name is NULL and ${sel_members.country} = "CA" then "Paysafe VMA"
         when ${TABLE}.name is NULL and ${sel_members.country} = "US" then "Heartland VMA"
         else ${TABLE}.name end ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  dimension: usecvc {
    type: string
    sql: ${TABLE}.usecvc ;;
  }

  dimension: verified {
    type: string
    sql: ${TABLE}.verified ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  measure: count {
    type: count
    drill_fields: [accountname, name, bankname]
  }
}
