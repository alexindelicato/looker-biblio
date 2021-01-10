view: pro_ticket_type {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.ticket_type`
    ;;
  drill_fields: [ticket_type_id]

  dimension: ticket_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ticket_type_id ;;
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

  dimension_group: availability_end {
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
    sql: CAST(${TABLE}.availability_end AS TIMESTAMP) ;;
  }

  dimension_group: availability_start {
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
    sql: CAST(${TABLE}.availability_start AS TIMESTAMP) ;;
  }

  dimension: consumer_fee {
    type: number
    sql: ${TABLE}.consumer_fee ;;
  }

  dimension: consumer_fee_bo {
    type: number
    sql: ${TABLE}.consumer_fee_bo ;;
  }

  dimension: creditcardmatchdescription {
    type: string
    sql: ${TABLE}.creditcardmatchdescription ;;
  }

  dimension: creditcardpattern {
    type: string
    sql: ${TABLE}.creditcardpattern ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}.display_order ;;
  }

  dimension: enabled {
    type: number
    sql: ${TABLE}.enabled ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: price_level_id {
    type: number
    sql: ${TABLE}.price_level_id ;;
  }

  dimension: production_id {
    type: number
    sql: ${TABLE}.production_id ;;
  }

  dimension: section_id {
    type: number
    sql: ${TABLE}.section_id ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: taxable {
    type: number
    sql: ${TABLE}.taxable ;;
  }

  dimension: tix_type_name {
    type: string
    sql: ${TABLE}.tix_type_name ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [ticket_type_id, tix_type_name]
  }
}
