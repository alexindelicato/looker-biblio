view: ct_charges_glnumber {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_charges_glnumber`
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

  dimension: gl_type {
    type: string
    sql: ${TABLE}.gl_type ;;
  }

  dimension: glnumber {
    type: string
    sql: ${TABLE}.glnumber ;;
  }

  dimension: invdescription {
    type: string
    sql: ${TABLE}.invdescription ;;
  }

  dimension: serviceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.serviceid ;;
  }

  dimension: servicename {
    type: string
    sql: ${TABLE}.servicename ;;
  }

  dimension: servicetype {
    type: string
    sql: ${TABLE}.servicetype ;;
  }

  dimension: sortorder {
    type: number
    sql: ${TABLE}.sortorder ;;
  }

  dimension: usechargedesc {
    type: number
    sql: ${TABLE}.usechargedesc ;;
  }

  measure: count {
    type: count
    drill_fields: [servicename]
  }
}
