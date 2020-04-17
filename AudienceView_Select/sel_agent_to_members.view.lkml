view: sel_agent_to_members {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.agent_to_members`
    ;;
  drill_fields: [agent_to_membersid]

  dimension: agent_to_membersid {
    primary_key: yes
    type: number
    sql: ${TABLE}.agent_to_membersid ;;
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

  dimension: agentid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.agentid ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  measure: count {
    type: count
    drill_fields: [agent_to_membersid, agents.agentid, agents.firstname, agents.lastname]
  }
}
