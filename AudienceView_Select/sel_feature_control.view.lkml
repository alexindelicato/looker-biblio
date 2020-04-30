view: sel_feature_control {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.feature_control`
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

  dimension: featurecontrolid {
    type: number
    value_format_name: id
    sql: ${TABLE}.featurecontrolid ;;
  }

  dimension: isbetaon {
    type: string
    sql: ${TABLE}.isbetaon ;;
  }

  dimension: isglobalon {
    type: string
    sql: ${TABLE}.isglobalon ;;
  }

  dimension: istestmodememberon {
    type: string
    sql: ${TABLE}.istestmodememberon ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
