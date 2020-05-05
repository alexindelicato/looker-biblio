view: ct_clientvenues {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_clientvenues`
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

  dimension: billingcurrency {
    type: string
    sql: ${TABLE}.billingcurrency ;;
  }

  dimension: clientid {
    type: number
    value_format_name: id
    sql: ${TABLE}.clientid ;;
  }

  dimension: clientname {
    type: string
    sql: ${TABLE}.clientname ;;
  }

  dimension: clienttype {
    type: string
    sql: ${TABLE}.clienttype ;;
  }

  dimension: ctquick {
    type: number
    sql: ${TABLE}.ctquick ;;
  }

  dimension: ctquickemail {
    type: string
    sql: ${TABLE}.ctquickemail ;;
  }

  dimension: ctquickname {
    type: string
    sql: ${TABLE}.ctquickname ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: dupvenueid {
    type: number
    value_format_name: id
    sql: ${TABLE}.dupvenueid ;;
  }

  dimension: isdeleted {
    type: number
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: isscandate {
    type: number
    sql: ${TABLE}.isscandate ;;
  }

  dimension: preferredpayeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.preferredpayeeid ;;
  }

  dimension: secondarypayeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.secondarypayeeid ;;
  }

  dimension: shortvenuename {
    type: string
    sql: ${TABLE}.shortvenuename ;;
  }

  dimension: testaccount {
    type: number
    sql: ${TABLE}.testaccount ;;
  }

  dimension: uniqueid {
    type: string
    sql: ${TABLE}.uniqueid ;;
  }

  dimension: venueemail {
    type: string
    sql: ${TABLE}.venueemail ;;
  }

  dimension: venueid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venueid ;;
  }

  dimension: venuename {
    type: string
    sql: ${TABLE}.venuename ;;
  }

  dimension: venuestate {
    type: string
    sql: ${TABLE}.venuestate ;;
  }

  dimension: venuestatecode {
    type: string
    sql: ${TABLE}.venuestatecode ;;
  }

  dimension: venuezip {
    type: string
    sql: ${TABLE}.venuezip ;;
  }

  dimension: venuezipcode {
    type: string
    sql: ${TABLE}.venuezipcode ;;
  }

  measure: count {
    type: count
    drill_fields: [venuename, shortvenuename, clientname, ctquickname]
  }
}
