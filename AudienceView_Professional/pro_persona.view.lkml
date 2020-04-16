view: pro_persona {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.persona`
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: display_element {
    type: string
    sql: ${TABLE}.display_element ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}.display_order ;;
  }

  dimension: is_client {
    type: string
    sql: ${TABLE}.is_client ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: persona_group {
    type: string
    sql: ${TABLE}.persona_group ;;
  }

  dimension: user_type {
    type: number
    sql: ${TABLE}.user_type ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
