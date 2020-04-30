view: sel_feature_control_members {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.feature_control_members`
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

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: featurecontrolid {
    type: number
    value_format_name: id
    sql: ${TABLE}.featurecontrolid ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
