view: set_refunds_misclineitems {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.refunds_misclineitems`;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
  }

  dimension: misclineitemid {
    type: number
  }

  dimension: orderid {
    type: number
  }

  dimension: _fivetran_deleted {
    hidden: yes
    type: yesno
  }

  dimension_group: _fivetran_synced {
    hidden: yes
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
  }

  dimension: total {
    type: number
  }

  measure: sum_total   {
    label: "Total Misc Item Refund"
    type: sum
    value_format_name: usd
    sql: round(safe_cast(${TABLE}.total as FLOAT64), 2) ;;
  }

  measure: sum_total_usd {
    label: "Total Misc Item Refund (USD)"
    type: sum
    value_format_name: usd
    sql: case when ${sel_members.currency} = "CAD" then round(safe_cast(${TABLE}.total as FLOAT64), 2)* 0.72
         else round(safe_cast(${TABLE}.total as FLOAT64), 2)*1 End ;;
  }

}
