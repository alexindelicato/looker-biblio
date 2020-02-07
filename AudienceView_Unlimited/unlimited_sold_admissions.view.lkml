view: unlimited_sold_admissions {
  sql_table_name: audienceview.unlimited_sold_admissions ;;

  dimension: admission_count {
    type: number
    sql: ${TABLE}.admission_count ;;
  }

  dimension: audit_time {
    type: string
    sql: ${TABLE}.audit_time ;;
  }

  dimension: chg1 {
    type: number
    sql: ${TABLE}.CHG1 ;;
  }

  dimension: chg2 {
    type: number
    sql: ${TABLE}.CHG2 ;;
  }

  dimension: chg3 {
    type: number
    sql: ${TABLE}.CHG3 ;;
  }

  dimension: chg4 {
    type: number
    sql: ${TABLE}.CHG4 ;;
  }

  dimension: chg5 {
    type: number
    sql: ${TABLE}.CHG5 ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: gross {
    type: number
    sql: ${TABLE}.GROSS ;;
  }

  dimension: net {
    type: number
    sql: ${TABLE}.NET ;;
  }

  dimension: orderadmission_record_state {
    type: number
    sql: ${TABLE}.orderadmission_record_state ;;
  }

  dimension: orderadmission_record_state_description {
    type: string
    sql: ${TABLE}.orderadmission_record_state_description ;;
  }

  dimension: orderadmission_sale_action {
    type: number
    sql: ${TABLE}.orderadmission_sale_action ;;
  }

  dimension: orderadmission_sale_action_description {
    type: string
    sql: ${TABLE}.orderadmission_sale_action_description ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.quarter ;;
  }

  dimension: userrole_group {
    type: string
    sql: ${TABLE}.userrole_group ;;
  }

  dimension: userrole_name {
    type: string
    sql: ${TABLE}.userrole_name ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.UUID ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.YEAR ;;
  }

  measure: count {
    type: count
    drill_fields: [userrole_name, client_name]
  }
}
