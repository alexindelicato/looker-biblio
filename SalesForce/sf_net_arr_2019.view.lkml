view: sf_net_arr_2019 {
  sql_table_name: `fivetran-ovation-tix-warehouse.new_salesforce.net_arr_2019`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: net_arr_2019 {
    type: number
    value_format_name: usd
    hidden: yes
    sql: ${TABLE}.net_arr_2019 ;;
  }

  measure: m_net_arr_2019 {
    type: number
    value_format_name: usd
    hidden: yes
    sql: ${TABLE}.net_arr_2019 ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [id]
  }
}
