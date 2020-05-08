view: ct_master_list {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.master_ct_list`
    ;;

  dimension: _file {
    type: string
    sql: ${TABLE}._file ;;
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

  dimension: _line {
    type: number
    sql: ${TABLE}._line ;;
  }

  dimension: billing_contact_email {
    type: string
    sql: ${TABLE}.billing_contact_email ;;
  }

  dimension: billing_contact_name {
    type: string
    sql: ${TABLE}.billing_contact_name ;;
  }

  dimension: billing_contact_note {
    type: string
    sql: ${TABLE}.billing_contact_note ;;
  }

  dimension: billing_contact_phone {
    type: string
    sql: ${TABLE}.billing_contact_phone ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: busines_entity {
    type: string
    sql: ${TABLE}.busines_entity ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension_group: contract_expire {
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
    sql: ${TABLE}.contract_expire_date ;;
  }

  dimension: operations_contact_email {
    type: string
    sql: ${TABLE}.operations_contact_email ;;
  }

  dimension: operations_contact_name {
    type: string
    sql: ${TABLE}.operations_contact_name ;;
  }

  dimension: operations_contact_note {
    type: string
    sql: ${TABLE}.operations_contact_note ;;
  }

  dimension: operations_contact_phone {
    type: string
    sql: ${TABLE}.operations_contact_phone ;;
  }

  dimension: other_contact_email {
    type: string
    sql: ${TABLE}.other_contact_email ;;
  }

  dimension: other_contact_name {
    type: string
    sql: ${TABLE}.other_contact_name ;;
  }

  dimension: other_contact_note {
    type: string
    sql: ${TABLE}.other_contact_note ;;
  }

  dimension: other_contact_phone {
    type: string
    sql: ${TABLE}.other_contact_phone ;;
  }

  dimension: payment_processor {
    type: string
    sql: ${TABLE}.payment_processor ;;
  }


  dimension: is_mor{
    type: yesno
    sql: ${TABLE}.payment_processor IN ("ElectroStub USA ePay","LaughStub USA ePay","TicketMob USA ePay","TuneStub USA ePay") ;;
  }


  dimension: sales_contacts {
    type: string
    sql: ${TABLE}.sales_contacts ;;
  }

  dimension: tm_ytd_revenue {
    type: number
    sql: ${TABLE}.tm_ytd_revenue ;;
  }

  dimension: venue_address {
    type: string
    sql: ${TABLE}.venue_address ;;
  }

  dimension: venue_city {
    type: string
    sql: ${TABLE}.venue_city ;;
  }

  dimension: venue_country {
    type: string
    sql: ${TABLE}.venue_country ;;
  }

  dimension: venue_name {
    type: string
    sql: ${TABLE}.venue_name ;;
  }

  dimension: venue_state {
    type: string
    sql: ${TABLE}.venue_state ;;
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}.website_url ;;
  }

  dimension: ytd_revenue {
    type: number
    sql: ${TABLE}.ytd_revenue ;;
  }

  dimension: ytd_tickets {
    type: number
    sql: ${TABLE}.ytd_tickets ;;
  }

  measure: count {
    type: count
    drill_fields: [venue_name, other_contact_name, operations_contact_name, client_name, billing_contact_name]
  }
}
