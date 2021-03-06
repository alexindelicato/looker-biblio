view: sel_max_login {
    derived_table: {
      sql:
      SELECT
      sel_members.memberid  AS sel_members_memberid,
      sel_members.organizationname  AS sel_members_organizationname,
      CAST(MAX((timestamp_seconds(sel_members.last)))  AS DATE) AS sel_members_max_last_login_date,
      CAST(MAX((timestamp_seconds(sel_agents.last)))  AS DATE) AS sel_agents_max_last_login_date
    FROM mysql_service.members  AS sel_members
    LEFT JOIN `fivetran-ovation-tix-warehouse.mysql_service.agent_to_members`
       AS sel_agent_to_members ON sel_members.memberid=sel_agent_to_members.memberid
    LEFT JOIN `fivetran-ovation-tix-warehouse.mysql_service.agents`
       AS sel_agents ON sel_agent_to_members.agentid=sel_agents.agentid AND sel_agents.deleted is NULL

    WHERE sel_members.testmode="N" and sel_members.active="Y"
    GROUP BY 1,2  ;;
    }

    dimension: sel_members_memberid {
      type: string
      hidden:  yes
      sql: ${TABLE}.sel_members_memberid  ;;
    }

    dimension: sel_members_organizationname {
      type: string
      hidden: yes
      sql: ${TABLE}.sel_members_organizationname  ;;
    }


    dimension_group: sel_members_max_last_login_date {
      type: time
      label: "Members Last Login"
      sql: ${TABLE}.sel_members_max_last_login_date ;;
    }

  dimension_group: sel_agents_max_last_login_date {
    type: time
    label: "Agents Last Login"
    sql: ${TABLE}.sel_agents_max_last_login_date ;;
  }

  dimension_group: max_last_login {
    type: time
    label: "Last Login"
    datatype: date
    sql: case when ${TABLE}.sel_members_max_last_login_date > ${TABLE}.sel_agents_max_last_login_date then ${TABLE}.sel_members_max_last_login_date
         when ${TABLE}.sel_members_max_last_login_date < ${TABLE}.sel_agents_max_last_login_date then ${TABLE}.sel_agents_max_last_login_date
         ELSE ${TABLE}.sel_members_max_last_login_date END;;
  }

  dimension_group: current_time {
    type: time
    hidden: yes
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

    dimension: number_of_days_inactive {
      label: "Days Inactive"
    type: number
    sql:  DATE_DIFF(CURRENT_DATE, CAST(${max_last_login_date} as date),  DAY )  ;;
  }


  }
