view: pro_overage_orders {
  derived_table: {
    sql:
    SELECT
    ot_client.client_id as client_id,
    ot_client.client_name as client_name,
    ot_order_detail.ticket_id as ticket_id,
    ot_order_detail.type IN ('TCK', 'PMT', 'PKT'),
    sf_accounts.name as sf_account_name,
    sf_accounts.id as sf_account_id,
    ot_orders.time as order_date,
    min(ot_orders.time) as min_order_date

    FROM `fivetran-ovation-tix-warehouse.trs_trs.orders` as ot_orders
    LEFT JOIN trs_trs.client  AS ot_client ON ot_orders.client_id=ot_client.client_id
    LEFT JOIN trs_trs.order_detail  AS ot_order_detail ON ot_orders.order_id = ot_order_detail.order_id
    LEFT JOIN trs_trs.report_crm  AS ot_report_crm ON ot_report_crm.id= ot_client.report_crm_id
    LEFT JOIN new_salesforce.account  AS sf_accounts ON sf_accounts.salesforce_account_id_c = ot_report_crm.crm_id AND sf_accounts.is_deleted= FALSE



    where (ot_client.demo=0 and ot_client.testing_mode=0 and ot_client.active = 1 and ot_orders.imported=0 and ot_orders.is_test_mode=0 and ot_orders.status_id != 11)

    GROUP BY 1,2,3,4,5,6,7

               ;;
  }

  dimension: number_of_days_live {
    type: number
    sql:  timestamp_diff(${current_time_raw}, ${min_order_date_raw}, day);;
  }

 dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: ticket_id{
    type: number
    sql: ${TABLE}.ticket_id ;;
  }

  measure: count_ticket_id {
    type: count_distinct
    sql: ${TABLE}.ticket_id ;;
  }


  dimension: units_sold {
    type: number
    sql: ${TABLE}.units_sold ;;
  }

  dimension: overage_month {
    type: yesno
    sql: ${current_time_month_name} = ${min_order_date_month_name}  ;;
  }

  dimension_group: min_order_date {
    type: time
    sql: ${TABLE}.min_order_date ;;
  }

  dimension_group: current_time {
    type: time
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
  dimension_group: order_date {
    type: time
    sql: ${TABLE}.order_date ;;
  }


  }
