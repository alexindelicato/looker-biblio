view: pro_client_type {
  sql_table_name: trs_trs.client_type ;;
  drill_fields: [client_type_id]

  dimension: client_type_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.client_type_id ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
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

  dimension: description {
    type: string
    hidden: yes
    sql: ${TABLE}.description ;;
  }

  dimension: type {
    type: string
    hidden: yes
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [client_type_id]
  }
}
