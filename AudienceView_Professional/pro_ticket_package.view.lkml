view: pro_ticket_package {
  sql_table_name: `fivetran-ovation-tix-warehouse.trs_trs.ticket_package`
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

  dimension: boxoffice_only {
    type: number
    sql: ${TABLE}.boxoffice_only ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: convenience_fee {
    type: number
    sql: ${TABLE}.convenience_fee ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}.display_order ;;
  }

  dimension_group: expiration {
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
    sql: CAST(${TABLE}.expiration_date AS TIMESTAMP) ;;
  }

  dimension: expiration_days {
    type: number
    sql: ${TABLE}.expiration_days ;;
  }

  dimension: expiration_type {
    type: string
    sql: ${TABLE}.expiration_type ;;
  }

  dimension: package_desc {
    type: string
    sql: ${TABLE}.package_desc ;;
  }

  dimension: package_id {
    type: number
    sql: ${TABLE}.package_id ;;
  }

  dimension: package_name {
    type: string
    sql: ${TABLE}.package_name ;;
  }

  dimension: package_type {
    type: string
    sql: ${TABLE}.package_type ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: recurring_enabled {
    type: number
    sql: ${TABLE}.recurring_enabled ;;
  }

  dimension: recurring_price_point_id {
    type: number
    sql: ${TABLE}.recurring_price_point_id ;;
  }

  dimension: recurring_sales_channel_id {
    type: number
    sql: ${TABLE}.recurring_sales_channel_id ;;
  }

  dimension: renewal_status {
    type: string
    sql: ${TABLE}.renewal_status ;;
  }

  dimension: taxable {
    type: number
    sql: ${TABLE}.taxable ;;
  }

  dimension: ticket_purchase_limit {
    type: number
    sql: ${TABLE}.ticket_purchase_limit ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [package_name]
  }
}
