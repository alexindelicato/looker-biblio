view: sel_emailcampaigns {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.emailcampaigns`
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

  dimension: attableid {
    type: string
    sql: ${TABLE}.attableid ;;
  }

  dimension: campaignid {
    type: number
    value_format_name: id
    sql: ${TABLE}.campaignid ;;
  }

  dimension: campaignname {
    type: string
    sql: ${TABLE}.campaignname ;;
  }

  dimension_group: created {
    type: time
    sql: timestamp_seconds(${TABLE}.created) ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: documentid {
    type: string
    sql: ${TABLE}.documentid ;;
  }

  dimension: fromemail {
    type: string
    sql: ${TABLE}.fromemail ;;
  }

  dimension: fromname {
    type: string
    sql: ${TABLE}.fromname ;;
  }

  dimension: lastinteractiondate {
    type: number
    sql: ${TABLE}.lastinteractiondate ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: membernotificationcategoryid {
    type: string
    sql: ${TABLE}.membernotificationcategoryid ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: optedin {
    type: string
    sql: ${TABLE}.optedin ;;
  }

  dimension_group: sendcomplete {
    type: time
    sql: timestamp_seconds(${TABLE}.sendcomplete) ;;
  }

  dimension_group: senddate {
    type: time
    sql: timestamp_seconds(${TABLE}.senddate) ;;
  }

  dimension: sendpid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sendpid ;;
  }

  dimension: sendstart {
    type: number
    sql: ${TABLE}.sendstart ;;
  }

  dimension: sendto {
    type: string
    sql: ${TABLE}.sendto ;;
  }

  dimension: sendtoid {
    type: string
    sql: ${TABLE}.sendtoid ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: template {
    type: string
    sql: ${TABLE}.template ;;
  }

  dimension: templateconfiguration {
    type: string
    sql: ${TABLE}.templateconfiguration ;;
  }

  measure: count {
    type: count
    drill_fields: [campaignname, fromname]
  }

  measure: count_templates {
    label: "# of Email Templates Created"
    type: count_distinct
    sql: ${TABLE}.template ;;
    drill_fields: [campaignname, fromname]
  }

  measure: count_campaigns_email {
    label: "# Of Email Campaigns Created"
    type: count_distinct
    sql: ${TABLE}.campaignid ;;
    drill_fields: [campaignname, fromname]
}

  measure: count_campaigns {
    label: "# Of Email Campaigns Sent"
    type: count_distinct
    sql: ${TABLE}.campaignid ;;
    drill_fields: [campaignname, fromname]

    filters:  {
      field: sendcomplete_date
      value: "NOT NULL"
    }
  }
}
