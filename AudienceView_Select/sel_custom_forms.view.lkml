view: sel_custom_forms {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.custom_forms`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: internalnote {
    type: string
    sql: ${TABLE}.internalnote ;;
  }

  dimension: isactive {
    type: string
    sql: ${TABLE}.isactive ;;
  }

  dimension: isshowoncepercheckout {
    type: string
    sql: ${TABLE}.isshowoncepercheckout ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: versionnumber {
    type: number
    sql: ${TABLE}.versionnumber ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
