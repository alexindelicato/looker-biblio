view: pro_overage_orders {
  derived_table: {
    sql:
    SELECT
    ot_client.client_id as client_id,
    ot_client.client_name as client_name,
    ot_order_detail.ticket_id,
    ot_order_detail.type IN ('TCK', 'PMT', 'PKT'),
    sf_accounts.name as sf_account_name,
    sf_accounts.id as sf_account_id,
    min(time) as order_date

    FROM `fivetran-ovation-tix-warehouse.trs_trs.orders` as ot_orders
    LEFT JOIN trs_trs.client  AS ot_client ON ot_orders.client_id=ot_client.client_id
    LEFT JOIN trs_trs.order_detail  AS ot_order_detail ON ot_orders.order_id = ot_order_detail.order_id
    LEFT JOIN trs_trs.report_crm  AS ot_report_crm ON ot_report_crm.id= ot_client.report_crm_id
    LEFT JOIN new_salesforce.account  AS sf_accounts ON sf_accounts.salesforce_account_id_c = ot_report_crm.crm_id AND sf_accounts.is_deleted= FALSE



    where ot_order_detail.type IN ('TCK', 'PMT', 'PKT') AND (ot_client.demo=0 and ot_client.testing_mode=0 and ot_client.active = 1 and ot_orders.imported=0 and ot_orders.is_test_mode=0 and ot_orders.status_id != 11)

    GROUP BY 1,2,3,4,5,6

               ;;
  }

  dimension: ot_order_detail_count_ticket_id {
    type: number
    sql: ${TABLE}.ot_order_detail_count_ticket_id ;;
  }


  }
