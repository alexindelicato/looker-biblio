view: ct_laughstub_servicesoffered {
  sql_table_name: `fivetran-ovation-tix-warehouse.crowdtorch_dbo.laughstub_servicesoffered`
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

  dimension: discountedrate {
    type: number
    sql: ${TABLE}.discountedrate ;;
  }

  dimension: glnumber {
    type: string
    sql: ${TABLE}.glnumber ;;
  }

  dimension: isdefault {
    type: yesno
    sql: ${TABLE}.isdefault ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: isequipment {
    type: yesno
    sql: ${TABLE}.isequipment ;;
  }

  dimension: isonetime {
    type: yesno
    sql: ${TABLE}.isonetime ;;
  }

  dimension: isrecoupable {
    type: yesno
    sql: ${TABLE}.isrecoupable ;;
  }

  dimension: moduletype {
    type: string
    sql: ${TABLE}.moduletype ;;
  }

  dimension: pricingamount {
    type: number
    sql: ${TABLE}.pricingamount ;;
  }

  dimension: pricingpercent {
    type: number
    sql: ${TABLE}.pricingpercent ;;
  }

  dimension: pricingtypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.pricingtypeid ;;
  }

  dimension: servicedesc {
    type: string
    sql: ${TABLE}.servicedesc ;;
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

  dimension: servicenameshort {
    type: string
    sql: ${TABLE}.servicenameshort ;;
  }

  measure: count {
    type: count
    drill_fields: [servicename]
  }
}
