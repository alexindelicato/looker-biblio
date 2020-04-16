view: pro_persona_user {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.persona_user`
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

  dimension: persona_name {
    type: string
    sql: ${TABLE}.persona_name ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [persona_name, user.last_name, user.user_id, user.first_name]
  }
}
