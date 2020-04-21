view: pro_overage_orders {
  derived_table: {
    sql:
    SELECT
    client_id as client_id,
    client_name as client_name,
    sf_account_name as sf_account_name,
    sf_account_id as sf_account_id,
    min(time_raw) as order_date
    order_detail.ticket_id as ticket_id,
    COUNT(DISTINCT ot_order_detail.ticket_id ) AS ot_order_detail_count_ticket_id,
    CASE WHEN ot_order_detail.type IN ('TCK', 'PMT', 'PKT') THEN 'Yes' ELSE 'No' END

    FROM `fivetran-ovation-tix-warehouse.audienceview.trs_trs.orders`
    LEFT JOIN trs_trs.client  AS ot_client ON ot_orders.client_id=ot_client.client_id
    LEFT JOIN trs_trs.order_detail  AS ot_order_detail ON ot_orders.order_id=ot_order_detail.order_id
    LEFT JOIN trs_trs.report_crm  AS ot_report_crm ON ot_report_crm.id= ot_client.report_crm_id
    LEFT JOIN new_salesforce.account  AS sf_accounts ON sf_accounts.salesforce_account_id_c = ot_report_crm.crm_id AND sf_accounts.is_deleted= FALSE

    where ot_order_detail.type IN ('TCK', 'PMT', 'PKT') AND (ot_client.demo=0 and ot_client.testing_mode=0 and ot_client.active = 1 and ot_orders.imported=0 and ot_orders.is_test_mode=0 and ot_orders.status_id != 11)

    GROUP BY 1,2,3,4,5,6,7

               ;;
  }

  dimension: ot_order_detail_count_ticket_id {
    type: number
    sql: ${TABLE}.ot_order_detail_count_ticket_id ;;
  }


  }
