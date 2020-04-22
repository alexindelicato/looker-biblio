view: sel_agents {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.agents`
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

  dimension: creation {
    type: number
    sql: ${TABLE}.creation ;;
  }

  dimension: defaulttaeventview {
    type: string
    sql: ${TABLE}.defaulttaeventview ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
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

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
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

  measure: count {
    type: count
    drill_fields: [agentid, firstname, lastname, agent_to_members.count]
  }
}
