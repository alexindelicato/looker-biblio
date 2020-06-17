view: sel_custom_windows {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.custom_windows`
    ;;
  drill_fields: [custom_windowsid]

  dimension: custom_windowsid {
    primary_key: yes
    type: number
    sql: ${TABLE}.custom_windowsid ;;
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

  dimension: companylogoid {
    type: string
    sql: ${TABLE}.companylogoid ;;
  }

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
  }

  dimension: customwindowid {
    type: string
    sql: ${TABLE}.customwindowid ;;
  }

  dimension: defaultview {
    type: string
    sql: ${TABLE}.defaultview ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: includedevents {
    type: string
    sql: ${TABLE}.includedevents ;;
  }

  dimension: lastcompletedwizardstep {
    type: number
    sql: ${TABLE}.lastcompletedwizardstep ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: memberstyleid {
    type: number
    value_format_name: id
    sql: ${TABLE}.memberstyleid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notforsale {
    type: string
    sql: ${TABLE}.notforsale ;;
  }

  dimension: nottaggedevents {
    type: string
    sql: ${TABLE}.nottaggedevents ;;
  }

  dimension: starttime {
    type: number
    sql: ${TABLE}.starttime ;;
  }

  dimension: suspended {
    type: string
    sql: ${TABLE}.suspended ;;
  }

  dimension: themeid {
    type: string
    sql: ${TABLE}.themeid ;;
  }

  measure: count_windowsid {
    type: count_distinct
    sql: ${TABLE}.custom_windowsid ;;
    drill_fields: [custom_windowsid, name]
  }

  measure: count {
    type: count
    drill_fields: [custom_windowsid, name]
  }
}
