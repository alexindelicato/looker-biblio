view: pro_max_login {
  derived_table: {
    sql:
      SELECT
  ot_client.client_id  AS client_id,
  ot_client.client_name  AS client_name,
  CAST(MAX(pro_user.last_login_date)  AS DATE) AS last_login
FROM trs_trs.orders  AS ot_orders
LEFT JOIN trs_trs.client  AS ot_client ON ot_orders.client_id=ot_client.client_id
LEFT JOIN `fivetran-ovation-tix-warehouse.trs_trs.client_user`
     AS pro_client_user ON ot_client.client_id=pro_client_user.client_id
LEFT JOIN `fivetran-ovation-tix-warehouse.trs_trs.user`
     AS pro_user ON pro_client_user.user_id=pro_user.user_id

WHERE ot_client.demo=0 and ot_client.testing_mode=0 and ot_client.client_id NOT IN (35200,34918) and  ot_client.active = 1 and ot_orders.imported=0 and ot_orders.is_test_mode=0 and ot_orders.status_id != 11
GROUP BY 1,2   ;;
  }

  dimension: client_id {
    type: string
    hidden:  yes
    sql: ${TABLE}.client_id  ;;
  }

  dimension: client_name {
    type: string
    hidden: yes
    sql: ${TABLE}.client_name  ;;
  }

  dimension_group: last_login {
    type: time
    label: "Last Login"
    sql: ${TABLE}.last_login ;;
  }

  dimension_group: current_time {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      quarter_of_year,
      week_of_year,
      year
    ]
    sql: CURRENT_TIMESTAMP() ;;
  }

  dimension: number_of_days_inactive {
    label: "Days Inactive"
    type: number
    sql:  DATE_DIFF(CURRENT_DATE, CAST(${last_login_date} as date),  DAY )  ;;
  }


}
