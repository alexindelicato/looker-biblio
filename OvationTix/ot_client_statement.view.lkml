view: ot_client_statement {
  sql_table_name: trs_trs.client_statement ;;
  drill_fields: [client_statement_id]

  dimension: client_statement_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.client_statement_id ;;
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

  dimension: account_rep_user_id {
    type: number
    sql: ${TABLE}.account_rep_user_id ;;
  }

  dimension: adjustments {
    type: number
    sql: ${TABLE}.adjustments ;;
  }

  dimension: balance_due {
    type: number
    sql: ${TABLE}.balance_due ;;
  }

  dimension: balance_forward {
    type: number
    sql: ${TABLE}.balance_forward ;;
  }

  dimension: client_account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_account_id ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: create {
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
    sql: ${TABLE}.create_date ;;
  }

  dimension: credit_card_processing_fees {
    type: number
    sql: ${TABLE}.credit_card_processing_fees ;;
  }

  dimension: ovationtix_fees_tax_rate {
    type: number
    sql: ${TABLE}.ovationtix_fees_tax_rate ;;
  }

  dimension: ovationtix_fees_taxes {
    type: number
    sql: ${TABLE}.ovationtix_fees_taxes ;;
  }

  dimension: ovationtix_phone_fees {
    type: number
    sql: ${TABLE}.ovationtix_phone_fees ;;
  }

  dimension: ovationtix_service_fees {
    type: number
    sql: ${TABLE}.ovationtix_service_fees ;;
  }

  dimension: payout_amount {
    type: number
    sql: ${TABLE}.payout_amount ;;
  }

  dimension: statement_amount {
    type: number
    sql: ${TABLE}.statement_amount ;;
  }

  dimension_group: statement {
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
    sql: ${TABLE}.statement_date ;;
  }

  dimension: statement_user_id {
    type: number
    sql: ${TABLE}.statement_user_id ;;
  }

  dimension: test_mode {
    type: number
    sql: ${TABLE}.test_mode ;;
  }

  dimension: tkts_service_fees {
    type: number
    sql: ${TABLE}.tkts_service_fees ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      client_statement_id,
      client_account.id,
      client.client_id,
      client.client_display_name,
      client.merchant_name,
      client.lastname,
      client.perspective_name,
      client.firstname,
      client.client_name,
      client.verisign_username
    ]
  }
}
