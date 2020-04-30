view: sel_feature_control_members {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.feature_control_members`
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

  dimension: created {
    type: number
    hidden: yes
    sql: ${TABLE}.created ;;
  }

  dimension: featurecontrolid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.featurecontrolid ;;
  }

  dimension: memberid {
    type: string
    hidden: yes
    sql: ${TABLE}.memberid ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
