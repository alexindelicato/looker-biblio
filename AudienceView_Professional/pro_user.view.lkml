view: pro_user {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.user`
    ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
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

  dimension_group: create {
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
    sql: ${TABLE}.create_date ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted = 1 ;;
  }

  dimension: disabled {
    type: string
    sql: ${TABLE}.disabled ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: full_name {
    type: string
    sql: concat(${TABLE}.first_name, " ", ${TABLE}.last_name) ;;
  }

  dimension_group: last_login {
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
    sql: ${TABLE}.last_login_date ;;
  }

  measure: max_last_login {
    type: date
    sql: MAX(${last_login_raw}) ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: password_hint {
    type: string
    sql: ${TABLE}.password_hint ;;
  }

  dimension_group: pwd_expires {
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
    sql: ${TABLE}.pwd_expires_on ;;
  }

  dimension: receive_donation_email {
    type: yesno
    sql: ${TABLE}.receive_donation_email = 1 ;;
  }

  dimension: receive_package_email {
    type: yesno
    sql: ${TABLE}.receive_package_email = 1 ;;
  }

  dimension: receive_who_coming_email {
    type: yesno
    sql: ${TABLE}.receive_who_coming_email = 1 ;;
  }

  dimension: seen_welcome_message {
    type: yesno
    sql: ${TABLE}.seen_welcome_message = 1 ;;
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
    drill_fields: [user_id, last_name, first_name, persona_user.count]
  }
}
