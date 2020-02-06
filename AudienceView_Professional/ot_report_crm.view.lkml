view: ot_report_crm {
  sql_table_name: trs_trs.report_crm ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: client_type_id {
    type: number
    sql: ${TABLE}.client_type_id ;;
  }

  dimension: client_type {
    label: "Client Type"
    type: string
    sql: ${pro_client_type.type} ;;
  }


  dimension: crm_id {
    type: string
    sql: ${TABLE}.crm_id ;;
  }

  dimension: crm_name {
    type: string
    sql: ${TABLE}.crm_name ;;
  }

  dimension: is_non_profit {
    type: number
    sql: ${TABLE}.is_non_profit ;;
  }

  dimension: is_tax_exempt {
    type: number
    sql: ${TABLE}.is_tax_exempt ;;
  }

  measure: count {
    type: count
    drill_fields: [id, crm_name, client.count]
  }
}
