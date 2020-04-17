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
    type: yesno
    sql: ${TABLE}.is_client = "T" ;;
  }

  dimension: name {
    type: string
    primary_key: yes
    sql: ${TABLE}.name ;;
  }

  measure: persona_list {
    type: list
    list_field: persona_group
  }

  dimension: persona_group {
    type: string
    sql: ${TABLE}.persona_group ;;
  }


  dimension: user_persona_group {
    type: string
    sql:case when ${TABLE}.persona_group = "administrative" and ${TABLE}.persona_group NOT IN ("box_office","developmennt_officer","patron_management") then "Admin"
         when ${TABLE}.persona_group = "administrative" and ${TABLE}.persona_group = "box_office" and ${TABLE}.persona_group NOT IN ("box_office","developmennt_officer","patron_management") then "Admin, Box Office"
    Else "Research" End;;
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
