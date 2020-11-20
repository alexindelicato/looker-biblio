view: sel_events {
  sql_table_name: mysql_service.events ;;
  drill_fields: [eventid]

  dimension: eventid {
    primary_key: yes
    type: string
    sql: ${TABLE}.eventid ;;
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

  dimension: allowpaymentplantl {
    type: string
    sql: ${TABLE}.allowpaymentplantl ;;
  }

  dimension: allowtacouponslist {
    type: string
    sql: ${TABLE}.allowtacouponslist ;;
  }

  dimension: allowtlpickseats {
    type: string
    sql: ${TABLE}.allowtlpickseats ;;
  }

  dimension: analyticscode {
    type: string
    sql: ${TABLE}.analyticscode ;;
  }

  dimension: authenticatetl {
    type: string
    sql: ${TABLE}.authenticatetl ;;
  }

  dimension: brandingcolor {
    type: string
    sql: ${TABLE}.brandingcolor ;;
  }

  dimension: companylogoid {
    type: string
    sql: ${TABLE}.companylogoid ;;
  }

  dimension: creation {
    type: number
    sql: ${TABLE}.creation ;;
  }

  dimension: daterepresentationformat {
    type: number
    sql: ${TABLE}.daterepresentationformat ;;
  }

  dimension: defaultfundid {
    type: string
    sql: ${TABLE}.defaultfundid ;;
  }

  dimension: defaultview {
    type: string
    sql: ${TABLE}.defaultview ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: endsalehour {
    type: number
    sql: ${TABLE}.endsalehour ;;
  }

  dimension: endsalemin {
    type: number
    sql: ${TABLE}.endsalemin ;;
  }

  dimension: endsaleoffset {
    type: string
    sql: ${TABLE}.endsaleoffset ;;
  }

  dimension: etickettemplateid {
    type: string
    sql: ${TABLE}.etickettemplateid ;;
  }

  dimension: firstperformancedate {
    type: number
    sql: ${TABLE}.firstperformancedate ;;
  }

  dimension: firstperformancedateDate {
    type: date
    label: "First Performance Date"
    sql: TIMESTAMP_SECONDS(${TABLE}.firstperformancedate) ;;
  }

  dimension: glaccount {
    type: string
    sql: ${TABLE}.glaccount ;;
  }

  dimension: hasperformances {
    type: string
    sql: ${TABLE}.hasperformances ;;
  }

  dimension: keepshoppingcustomwindowid {
    type: string
    sql: ${TABLE}.keepshoppingcustomwindowid ;;
  }

  dimension: lastcompletedwizardstep {
    type: number
    sql: ${TABLE}.lastcompletedwizardstep ;;
  }

  dimension: lastperformancedate {
    type: number
    sql: ${TABLE}.lastperformancedate ;;
  }

  dimension: listviewinfo {
    type: string
    sql: ${TABLE}.listviewinfo ;;
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

  dimension: notforsaleta {
    label: "Ticket Agent Message"
    type: string
    sql: ${TABLE}.notforsaleta ;;
  }

  dimension: notforsaletl {
    label: "Ticket Line Message"
    type: string
    sql: ${TABLE}.notforsaletl ;;
  }

  dimension: paymentplannumberinstallments {
    type: number
    sql: ${TABLE}.paymentplannumberinstallments ;;
  }

  dimension: presenter {
    type: string
    sql: ${TABLE}.presenter ;;
  }

  dimension: pricingmode {
    type: string
    sql: ${TABLE}.pricingmode ;;
  }

  dimension: receiptcustomizationid {
    type: number
    value_format_name: id
    sql: ${TABLE}.receiptcustomizationid ;;
  }

  dimension: showbillid {
    type: string
    sql: ${TABLE}.showbillid ;;
  }

  dimension: starttime {
    type: number
    sql: ${TABLE}.starttime ;;
  }

  dimension_group: starttimeta {
    type: time
    sql:timestamp_seconds(${TABLE}.starttimeta) ;;
  }

  dimension_group: starttimetl {
    type: time
    sql: timestamp_seconds(${TABLE}.starttimetl) ;;
  }


  dimension: on_sale {
    type: string
    sql: case when current_date < ${sel_performances.starttime_date} and ${starttimetl_date} < ${sel_performances.starttime_date} and ${notforsaletl} is NULL then "On-Sale" Else "Not On-Sale" End ;;
  }

  dimension: suspended {
    type: string
    sql: ${TABLE}.suspended ;;
  }

  dimension: WebSuspended {
    type: string
    label:"Online Sales Channel"
    sql: case when ${TABLE}.suspended='Y' or ${TABLE}.suspended = 'L' then "Not On-Sale" Else "On-Sale" End ;;
  }

  dimension: AgentSuspended {
    type: string
    label:"TicketAgent Sales Channel"
    sql: case when ${TABLE}.suspended='Y' or ${TABLE}.suspended = 'A' then "Not On-Sale" Else "On-Sale" End ;;
  }

  dimension: themeid {
    type: string
    sql: ${TABLE}.themeid ;;
  }

  dimension: tickettemplate {
    type: string
    sql: ${TABLE}.tickettemplate ;;
  }

  dimension: tickettemplatecustomizationid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tickettemplatecustomizationid ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: title {
    label: "Event Name"
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: trackingcodedone {
    type: string
    sql: ${TABLE}.trackingcodedone ;;
  }

  dimension: trackingcodeopen {
    type: string
    sql: ${TABLE}.trackingcodeopen ;;
  }

  dimension: venueid {
    type: string
    # hidden: yes
    sql: ${TABLE}.venueid ;;
  }

  dimension: wassuspended {
    type: string
    sql: ${TABLE}.wassuspended ;;
  }

  measure: count {
    type: count
    drill_fields: [eventid, venues.venueid, venues.name, performances.count]
  }


  measure: count_GA_events_types {
    label: "# of GA Events"
    type: count_distinct
    sql: ${TABLE}.eventid ;;
    filters: {
      field: sel_venues.admission
      value: "G"
    }
  }

  measure: count_mixed_events_types {
    label: "# of Mixed Events"
    type: count_distinct
    sql: ${TABLE}.eventid ;;
    filters: {
      field: sel_venues.admission
      value: "F"
    }
  }

  measure: count_reserved_events_types {
    label: "# of Reserved Events"
    type: count_distinct
    sql: ${TABLE}.eventid ;;
    filters: {
      field: sel_venues.admission
      value: "R"
    }
  }

}
