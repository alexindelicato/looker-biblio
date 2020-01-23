view: pro_department {
  sql_table_name: trs_trs.department ;;
  drill_fields: [department_id]

  dimension: department_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.department_id ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    hidden: yes
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    hidden: yes
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

  dimension: calendar_type {
    type: number
    sql: ${TABLE}.calendar_type ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: css_file_id {
    type: number
    sql: ${TABLE}.css_file_id ;;
  }

  dimension: css_path {
    type: string
    sql: ${TABLE}.css_path ;;
  }

  dimension: delete_flag {
    type: number
    sql: ${TABLE}.delete_flag ;;
  }

  dimension: grid_group_by {
    type: number
    sql: ${TABLE}.grid_group_by ;;
  }

  dimension: html_footer {
    type: string
    sql: ${TABLE}.html_footer ;;
  }

  dimension: html_header {
    type: string
    sql: ${TABLE}.html_header ;;
  }

  dimension: logo_image_file_id {
    type: number
    sql: ${TABLE}.logo_image_file_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [department_id, name]
  }
}
