view: sel_agents {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.agents`
    ;;
  drill_fields: [agentid]

  dimension: agentid {
    primary_key: yes
    type: number
    sql: ${TABLE}.agentid ;;
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

  dimension: agenttype {
    type: string
    sql: ${TABLE}.agenttype ;;
  }

  dimension_group: creation {
    type: time
    sql: timestamp_seconds(${TABLE}.creation) ;;
  }

  dimension: defaulttaeventview {
    type: string
    sql: ${TABLE}.defaulttaeventview ;;
  }

  dimension_group: deleted {
    type: time
    sql: timestamp_seconds(${TABLE}.deleted) ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: full_name {
    type: string
    sql: concat( ${TABLE}.firstname, " ", ${TABLE}.lastname)  ;;
  }


  dimension: isoldta {
    type: string
    sql: ${TABLE}.isoldta ;;
  }

  dimension_group: last {
    type: time
    sql: timestamp_seconds(${TABLE}.last) ;;
  }

  measure: max_last_login {
    type: time
    sql: MAX(${last_raw}) ;;
  }

  dimension_group: current_time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      quarter_of_year,
      week_of_year,
      year
    ]
    sql: CURRENT_TIMESTAMP() ;;
  }

#   dimension: number_of_days_inactive {
#     type: number
#     sql:  timestamp_diff(${current_time_date}, ${max_last_login}, day);;
#   }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension_group: modified {
    type: time
    sql: timestamp_seconds(${TABLE}.modified) ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: optedout {
    type: number
    sql: ${TABLE}.optedout ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: passwordchanged {
    type: number
    sql: ${TABLE}.passwordchanged ;;
  }

  dimension: passwordsalt {
    type: string
    sql: ${TABLE}.passwordsalt ;;
  }

  dimension: visits {
    type: number
    sql: ${TABLE}.visits ;;
  }


  measure: count_agents {
    type: count_distinct
    sql: ${TABLE}.agentid ;;
    drill_fields: [agentid, firstname, lastname, agent_to_members.count]
    filters: {
      field: last_date
      value: "last 14 days"
    }
  }

  measure: count_all_users {
    type: number
    sql: ${count} + 1 ;;
    drill_fields: [agentid, firstname, lastname, agent_to_members.count]
  }

  measure: count {
    type: count
    drill_fields: [agentid, firstname, lastname, agent_to_members.count]
  }
}
