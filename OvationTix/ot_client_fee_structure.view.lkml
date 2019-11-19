view: client_fee_structure {
  sql_table_name: trs_trs.client_fee_structure ;;

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
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: comp_fee {
    type: number
    sql: ${TABLE}.comp_fee ;;
  }

  dimension: fs_cap_pct {
    type: number
    sql: ${TABLE}.fs_cap_pct ;;
  }

  dimension: fs_cap_point {
    type: number
    sql: ${TABLE}.fs_cap_point ;;
  }

  dimension: fs_charge_processing_fee_for_pac_purchase {
    type: number
    sql: ${TABLE}.fs_charge_processing_fee_for_pac_purchase ;;
  }

  dimension: fs_charge_processing_fee_for_pac_redemption {
    type: number
    sql: ${TABLE}.fs_charge_processing_fee_for_pac_redemption ;;
  }

  dimension: fs_charge_service_fee_for_flex_pack_purchase {
    type: number
    sql: ${TABLE}.fs_charge_service_fee_for_flex_pack_purchase ;;
  }

  dimension: fs_charge_service_fee_for_flex_pack_redemption {
    type: number
    sql: ${TABLE}.fs_charge_service_fee_for_flex_pack_redemption ;;
  }

  dimension: fs_currency {
    type: string
    sql: ${TABLE}.fs_currency ;;
  }

  dimension: fs_currency_symbol {
    type: string
    sql: ${TABLE}.fs_currency_symbol ;;
  }

  dimension: fs_flex_pack_flat_fee {
    type: number
    sql: ${TABLE}.fs_flex_pack_flat_fee ;;
  }

  dimension: fs_flex_pack_purchase_flat_fee {
    type: number
    sql: ${TABLE}.fs_flex_pack_purchase_flat_fee ;;
  }

  dimension: fs_flex_pack_redemption_flat_fee {
    type: number
    sql: ${TABLE}.fs_flex_pack_redemption_flat_fee ;;
  }

  dimension: fs_flex_package_comp_fee {
    type: number
    sql: ${TABLE}.fs_flex_package_comp_fee ;;
  }

  dimension: fs_minimum_fee {
    type: number
    sql: ${TABLE}.fs_minimum_fee ;;
  }

  dimension: fs_package_comp_fee {
    type: number
    sql: ${TABLE}.fs_package_comp_fee ;;
  }

  dimension: fs_per_order_fee_max {
    type: number
    sql: ${TABLE}.fs_per_order_fee_max ;;
  }

  dimension: fs_refund_fee {
    type: number
    sql: ${TABLE}.fs_refund_fee ;;
  }

  dimension: fs_telephone_fee {
    type: number
    sql: ${TABLE}.fs_telephone_fee ;;
  }

  dimension: fs_telephone_fee_public {
    type: number
    sql: ${TABLE}.fs_telephone_fee_public ;;
  }

  dimension: fs_uncap_pct {
    type: number
    sql: ${TABLE}.fs_uncap_pct ;;
  }

  dimension: fs_walkup_cc_fee {
    type: number
    sql: ${TABLE}.fs_walkup_cc_fee ;;
  }

  dimension: fs_walkup_fee {
    type: number
    sql: ${TABLE}.fs_walkup_fee ;;
  }

  dimension: telephone_fee_bo {
    type: number
    sql: ${TABLE}.telephone_fee_bo ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
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
