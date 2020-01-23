view: ot_client_fee_structure {
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
    sql: ${TABLE}.client_id ;;
  }

  dimension: comp_fee {
    value_format: "$0.00"
    label: "Comp Service Fees"
    type: number
    sql: ${TABLE}.comp_fee ;;
  }

  dimension: fs_cap_pct {
    value_format: "0.00\%"
    label: "Service Fee %"
    type: number
    sql: ${TABLE}.fs_cap_pct ;;
  }

  dimension: fs_cap_point {
    label: "Service Fee Ceiling"
    type: number
    sql: ${TABLE}.fs_cap_point ;;
  }

  dimension: fs_charge_processing_fee_for_pac_purchase {
    value_format: "$0.00"
    label: "Apply for Fixed + Package Purchases ( Comp  Checkmark )"
    type: number
    sql: ${TABLE}.fs_charge_processing_fee_for_pac_purchase ;;
  }

  dimension: fs_charge_processing_fee_for_pac_redemption {
    value_format: "$0.00"
    type: number
    sql: ${TABLE}.fs_charge_processing_fee_for_pac_redemption ;;
  }

  dimension: fs_charge_service_fee_for_flex_pack_purchase {
    value_format: "$0.00"
    type: number
    sql: ${TABLE}.fs_charge_service_fee_for_flex_pack_purchase ;;
  }

  dimension: fs_charge_service_fee_for_flex_pack_redemption {
    value_format: "$0.00"
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
    value_format: "$0.00"
    type: number
    sql: ${TABLE}.fs_flex_pack_flat_fee ;;
  }

  dimension: fs_flex_pack_purchase_flat_fee {
    value_format: "$0.00"
    label: "Apply flat fee to all Flex Packages Purchase"
    type: number
    sql: ${TABLE}.fs_flex_pack_purchase_flat_fee ;;
  }

  dimension: fs_flex_pack_redemption_flat_fee {
    value_format: "$0.00"
    label: "Apply flat fee to all Flex Packages Redemption"
    type: number
    sql: ${TABLE}.fs_flex_pack_redemption_flat_fee ;;
  }

  dimension: fs_flex_package_comp_fee {
    value_format: "$0.00"
    type: number
    sql: ${TABLE}.fs_flex_package_comp_fee ;;
  }

  dimension: fs_minimum_fee {
    value_format: "$0.00"
    label: "Service Fee Floor"
    type: number
    sql: ${TABLE}.fs_minimum_fee ;;
  }

  dimension: fs_package_comp_fee {
    value_format: "$0.00"
    label: "Apply for Fixed + Packaged Redemption $ Fee"
    type: number
    sql: ${TABLE}.fs_package_comp_fee ;;
  }

  dimension: fs_per_order_fee_max {
    value_format: "$0.00"
    type: number
    sql: ${TABLE}.fs_per_order_fee_max ;;
  }

  dimension: fs_refund_fee {
    value_format: "$0.00"
    type: number
    sql: ${TABLE}.fs_refund_fee ;;
  }

  dimension: fs_telephone_fee {
    value_format: "$0.00"
    label: "OvationTix Phone Charge (Client)"
    type: number
    sql: ${TABLE}.fs_telephone_fee ;;
  }

  dimension: fs_telephone_fee_public {
    value_format: "$0.00"
    label: "OvationTix Phone Charge (Consumer)"
    type: number
    sql: ${TABLE}.fs_telephone_fee_public ;;
  }

  dimension: fs_uncap_pct {
    value_format: "0.00\%"
    label: "Merchant Processing Fee %"
    type: number
    sql: ${TABLE}.fs_uncap_pct ;;
  }

  dimension: fs_walkup_cc_fee {
    value_format: "$0.00"
    label: "Walk up CC Fee'"
    type: number
    sql: ${TABLE}.fs_walkup_cc_fee ;;
  }

  dimension: fs_walkup_fee {
    value_format: "$0.00"
    label: "Walk up Cash Fee"
    type: number
    sql: ${TABLE}.fs_walkup_fee ;;
  }

  dimension: telephone_fee_bo {
    value_format: "$0.00"
    label: "BO Phone Fee"
    type: number
    sql: ${TABLE}.telephone_fee_bo ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
