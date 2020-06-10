view: sel_arr {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.arr`
    ;;

  dimension: gross_arr_2019 {
    type: number
    value_format_name: usd
    sql: ${TABLE}.gross_arr_2019 ;;
  }

  dimension: lifetime_arr {
    type: number
    value_format_name: usd
    sql: ${TABLE}.lifetime_arr ;;
  }

  dimension: memberid {
    type: string
    primary_key: yes
    sql: ${TABLE}.memberid ;;
  }

  dimension: net_prorated_arr_2019 {
    type: number
    value_format_name: usd
    sql: ${TABLE}.net_prorated_arr_2019 ;;
  }

  dimension: rolling_arr_may_2020 {
    type: number
    value_format_name: usd
    sql: ${TABLE}.rolling_arr_may_2020 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
