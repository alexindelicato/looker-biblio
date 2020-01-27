view: sel_venues {
  sql_table_name: mysql_service.venues ;;
  drill_fields: [venueid]

  dimension: venueid {
    primary_key: yes
    type: string
    sql: ${TABLE}.venueid ;;
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

  dimension: admission {
    type: string
    sql: ${TABLE}.admission ;;
  }

  dimension: allgeneralareasinsingleview {
    type: string
    sql: ${TABLE}.allgeneralareasinsingleview ;;
  }

  dimension: allowduplicateseatlabels {
    type: string
    sql: ${TABLE}.allowduplicateseatlabels ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: dateformatpermissions {
    type: number
    sql: ${TABLE}.dateformatpermissions ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}.deleted ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: directions {
    type: string
    sql: ${TABLE}.directions ;;
  }

  dimension: hidegenadmlabel {
    type: string
    sql: ${TABLE}.hidegenadmlabel ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: locked {
    type: string
    sql: ${TABLE}.locked ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: maxseatsorder {
    type: number
    sql: ${TABLE}.maxseatsorder ;;
  }

  dimension: memberid {
    type: string
    sql: ${TABLE}.memberid ;;
  }

  dimension: memberstyleid {
    type: number
    value_format_name: id
    sql: ${TABLE}.memberstyleid ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}.modified ;;
  }

  dimension: moreinfo {
    type: string
    sql: ${TABLE}.moreinfo ;;
  }

  dimension: name {
    label: "Venue Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: removerequireaisleseatingwhenpyosoff {
    type: string
    sql: ${TABLE}.removerequireaisleseatingwhenpyosoff ;;
  }

  dimension: retired {
    type: string
    sql: ${TABLE}.retired ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: street2 {
    type: string
    sql: ${TABLE}.street2 ;;
  }

  dimension: telephone {
    type: string
    sql: ${TABLE}.telephone ;;
  }

  dimension: viewmaponconfirmations {
    type: string
    sql: ${TABLE}.viewmaponconfirmations ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [venueid, name, events.count]
  }
}
