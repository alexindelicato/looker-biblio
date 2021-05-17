view: sel_members_scanners {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.members_scanners`
    ;;

  dimension: _fivetran_deleted {
    type: yesno
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: allowcheckout {
    type: string
    hidden: yes
    sql: ${TABLE}.allowcheckout ;;
  }

  dimension: createdate {
    type: number
    hidden: yes
    sql: ${TABLE}.createdate ;;
  }

  dimension: deleted {
    type: number
    hidden: yes
    sql: ${TABLE}.deleted ;;
  }

  dimension: forcelogout {
    type: string
    hidden: yes
    sql: ${TABLE}.forcelogout ;;
  }

  dimension: lastvisit {
    type: number
    hidden: yes
    sql: ${TABLE}.lastvisit ;;
  }

  dimension: macaddress {
    type: string
    hidden: yes
    sql: ${TABLE}.macaddress ;;
  }

  dimension: memberid {
    type: string
    hidden: yes
    sql: ${TABLE}.memberid ;;
  }

  dimension: nickname {
    type: string
    hidden: yes
    sql: ${TABLE}.nickname ;;
  }

  dimension: numvisits {
    type: number
    hidden: yes
    sql: ${TABLE}.numvisits ;;
  }

  dimension: scannerid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.scannerid ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [nickname]
  }
}
