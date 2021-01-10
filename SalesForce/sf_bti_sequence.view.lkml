view: sf_bti_sequence {
  sql_table_name: `new_salesforce.bti_sequence_c`;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    label: "BTI Onboarding Train"
    type: string
    sql: ${TABLE}.name ;;
  }

}
