view: pro_paymenttype {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.paymenttype`
    ;;
  drill_fields: [paymenttype_id]

  dimension: paymenttype_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.paymenttype_id ;;
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

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: deleted {
    type: string
    sql: ${TABLE}.deleted ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}.display_order ;;
  }

  dimension: payment_type_desc {
    type: string
    sql: ${TABLE}.payment_type_desc ;;
  }

  dimension: payment_type_name {
    type: string
    sql: ${TABLE}.payment_type_name ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [paymenttype_id, payment_type_name]
  }
}
