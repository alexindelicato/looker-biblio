view: sel_venue_maps {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.venue_maps`
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

  dimension: admission {
    type: string
    sql: ${TABLE}.admission ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: iszoomableta {
    type: string
    sql: ${TABLE}.iszoomableta ;;
  }

  dimension: iszoomabletl {
    type: string
    sql: ${TABLE}.iszoomabletl ;;
  }

  dimension: maxcellsizeta {
    type: number
    sql: ${TABLE}.maxcellsizeta ;;
  }

  dimension: maxcellsizetl {
    type: number
    sql: ${TABLE}.maxcellsizetl ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  dimension: showsections {
    type: string
    sql: ${TABLE}.showsections ;;
  }

  dimension: sortorder {
    type: number
    sql: ${TABLE}.sortorder ;;
  }

  dimension: venueid {
    type: string
    sql: ${TABLE}.venueid ;;
  }

  dimension: venuemap {
    type: string
    sql: ${TABLE}.venuemap ;;
  }

  dimension: venuemapid {
    type: string
    sql: ${TABLE}.venuemapid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
