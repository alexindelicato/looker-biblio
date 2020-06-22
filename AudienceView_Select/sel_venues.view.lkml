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

dimension: venue_type  {
  label: "Venue Type"
  type: string
  sql: case when ${TABLE}.admission = 'G' then 'General Admission'
        when  ${TABLE}.admission = 'R' then 'Reserved'
        when ${TABLE}.admission = 'F' then  'Mixed'
        when ${TABLE}.admission = 'I' then  'Import'
       END ;;
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

  measure: count_non_standard_venue_times {
    type: count_distinct
    sql: ${TABLE}.venueid ;;
    drill_fields: [venueid,name,custom_date]
    filters: {
      field: dateformatpermissions
      value: "NOT 0"
    }
  }

  dimension: custom_date {
    type: string
    sql: case when ${TABLE}.dateformatpermissions = 0 then "Standard"
         when ${TABLE}.dateformatpermissions = 1 then "PERFORMANCE_DATE_FORMAT_HAS_END_TIME"
         when ${TABLE}.dateformatpermissions = 2 then "PERFORMANCE_DATE_FORMAT_HIDE_TIME"
         when ${TABLE}.dateformatpermissions = 3 then "PERFORMANCE_DATE_FORMAT_HAS_END_TIME and PERFORMANCE_DATE_FORMAT_HIDE_TIME"
         when ${TABLE}.dateformatpermissions = 4 then "PERFORMANCE_DATE_FORMAT_CUSTOM_MESSAGE"
         when ${TABLE}.dateformatpermissions = 5 then "PERFORMANCE_DATE_FORMAT_CUSTOM_MESSAGE and PERFORMANCE_DATE_FORMAT_HAS_END_TIME"
         when ${TABLE}.dateformatpermissions = 6 then "PERFORMANCE_DATE_FORMAT_CUSTOM_MESSAGE and PERFORMANCE_DATE_FORMAT_HIDE_TIME"
         when ${TABLE}.dateformatpermissions = 7 then "PERFORMANCE_DATE_FORMAT_CUSTOM_MESSAGE and PERFORMANCE_DATE_FORMAT_HAS_END_TIME and PERFORMANCE_DATE_FORMAT_HIDE_TIME"
    else 'research' end;;
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
    map_layer_name: us_zipcode_tabulation_areas
    type: string
    sql: ${TABLE}.zip ;;
  }

  measure: count_venues {
    type: count_distinct
    sql: ${TABLE}.name ;;
    drill_fields: [venueid, name, events.count]
    filters: {
      field: name
      value: "-NULL"
    }
  }

  measure: count_venueid {
    type: count_distinct
    sql: ${TABLE}.venueid ;;
    drill_fields: [venueid, name, events.count]
  }

  measure: count_GA_venues_types {
    label: "# of GA Venues"
    type: count_distinct
    sql: ${TABLE}.name ;;
    drill_fields: [venueid, name, events.count]
    filters: {
      field: admission
      value: "G"
    }
  }

  measure: count_mixed_venues_types {
    label: "# of Mixed Venues"
    type: count_distinct
    sql: ${TABLE}.name ;;
    drill_fields: [venueid, name, events.count]
    filters: {
      field: admission
      value: "F"
    }
  }

  measure: count_reserved_venues_types {
    label: "# of Reserved Venues"
    type: count_distinct
    sql: ${TABLE}.name ;;
    drill_fields: [venueid, name, events.count]
    filters: {
      field: admission
      value: "R"
    }
  }

  measure: count {
    type: count
    drill_fields: [venueid, name, events.count]
  }
}
