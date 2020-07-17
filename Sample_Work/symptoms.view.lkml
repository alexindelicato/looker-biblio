view: symptoms {
  sql_table_name: `fivetran-ovation-tix-warehouse.sample.symptoms`
    ;;

  dimension: age_group_0_190_19 {
    type: string
    sql: ${TABLE}.Age_group_0_190_19 ;;
  }

  dimension: asymptomatic_13 {
    label: "Asymptomatic"
    type: string
    sql: ${TABLE}.Asymptomatic_13 ;;
  }

  dimension: case_identifier_number {
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.Case_identifier_number6 ;;
  }

  dimension: chills {
    type: string
    sql: ${TABLE}.Chills ;;
  }

  measure: count_chills {
    type: count
    label: "Chills"
    drill_fields: []

    filters: {
      field: chills
      value: "Yes"
    }
  }

  dimension: cough {
    type: string
    sql: ${TABLE}.Cough ;;
  }

  dimension: death {
    label: "Death"
    type: string
    sql: ${TABLE}.Death_19 ;;
  }

  dimension: diarrhea {
    type: string
    sql: ${TABLE}.Diarrhea ;;
  }

  measure: count_diarrhea {
    type: count
    label: "Diarrhea"
    drill_fields: []

    filters: {
      field: diarrhea
      value: "Yes"
    }
  }

  dimension: fever {
    type: string
    sql: ${TABLE}.Fever ;;
  }

  dimension: gender_male0 {
    type: string
    sql: ${TABLE}.Gender_Male0 ;;
  }

  dimension: headache {
    type: string
    sql: ${TABLE}.Headache ;;
  }

  measure: count_headache {
    type: count
    label: "Headache"
    drill_fields: []

    filters: {
      field: headache
      value: "Yes"
    }
  }


  dimension: hospital_status {
    type: string
    sql: ${TABLE}.Hospital_Status ;;
  }

  dimension: irritability {
    type: string
    sql: ${TABLE}.Irritability ;;
  }

  measure: count_irritiability {
    type: count
    label: "Irritiability"
    drill_fields: []

    filters: {
      field: irritability
      value: "Yes"
    }
  }


  dimension: nausea {
    type: string
    sql: ${TABLE}.Nausea ;;
  }

  measure: count_nausea {
    type: count
    label: "Nausea"
    drill_fields: []

    filters: {
      field: nausea
      value: "Yes"
    }
  }


  dimension: occupation {
    type: string
    sql: ${TABLE}.Occupation ;;
  }

  dimension: other {
    type: string
    sql: ${TABLE}.Other ;;
  }

  measure: count_other {
    type: count
    label: "Other"
    drill_fields: []

    filters: {
      field: other
      value: "Yes"
    }
  }


  dimension: pain {
    type: string
    sql: ${TABLE}.Pain ;;
  }

  measure: count_pain {
    type: count
    label: "Pain"
    drill_fields: []

    filters: {
      field: pain
      value: "Yes"
    }
  }


  dimension: region_7 {
    label: "Region"
    type: string
    sql: ${TABLE}.Region_7 ;;
  }

  dimension: runny_nose {
    type: string
    sql: ${TABLE}.Runny_Nose ;;
  }

  dimension: shortness_of_breather {
    type: string
    sql: ${TABLE}.Shortness_of_Breather ;;
  }

  measure: count_shortness {
    type: count
    label: "Shortnesss of Breathe"
    drill_fields: []

    filters: {
      field: shortness_of_breather
      value: "Yes"
    }
  }


  dimension: sore_throat {
    type: string
    sql: ${TABLE}.Sore_Throat ;;
  }

  measure: count_throat {
    type: count
    label: "Throat"
    drill_fields: []

    filters: {
      field: sore_throat
      value: "Yes"
    }
  }


  dimension: transmission {
    type: string
    sql: ${TABLE}.Transmission ;;
  }

  dimension: weakness {
    type: string
    sql: ${TABLE}.Weakness ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_cough {
    type: count
    label: "Cough"
    drill_fields: []

    filters: {
      field: cough
      value: "Yes"
    }
  }

  measure: count_fever {
    type: count
    label: "Fever"
    drill_fields: []

    filters: {
      field: fever
      value: "Yes"
    }
  }

  measure: count_runny_nose {
    type: count
    label: "Runny Nose"
    drill_fields: []

    filters: {
      field: runny_nose
      value: "Yes"
    }
  }
}
