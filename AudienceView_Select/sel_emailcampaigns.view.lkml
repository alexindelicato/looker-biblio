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

  dimension: created {
    type: number
    sql: ${TABLE}.created ;;
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

  dimension: sendcomplete {
    type: number
    sql: ${TABLE}.sendcomplete ;;
  }

  dimension: senddate {
    type: number
    sql: ${TABLE}.senddate ;;
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
}
