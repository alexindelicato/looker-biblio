view: ct_unbilled_indirect_revenue {
  derived_table: {
    sql:
SELECT
  ct_fx_rates.fx_rate  AS ct_fx_rates_fx_rate,
  ct_fx_rates_bs.fx_rate_bs  AS ct_fx_rates_bs_fx_rate_bs,
  "Unbilled Indirect revenue - Transaction Date"  AS ct_transactions_transtype_unbilled,
  ct_transactions.clientid  AS ct_transactions_clientid,
  ct_transactions.clientname  AS ct_transactions_clientname,
  ct_transactions.venueid  AS ct_transactions_venueid,
  ct_transactions.venuename  AS ct_transactions_venuename,
  ct_clientvenues.domain  AS ct_clientvenues_domain,
  ct_clientvenues.billingcurrency  AS ct_clientvenues_billingcurrency,
  ct_ar_invoices.ar_id  AS ct_ar_invoices_ar_id,
  (COALESCE(SUM(ct_transactions.billingservicefee ), 0)) + (COALESCE(SUM(ct_transactions.billingcreditcardprocessingfee ), 0))  AS ct_transactions_total_revenue,
  (COALESCE(SUM(ct_transactions.billingservicefee ), 0)) + (COALESCE(SUM(ct_transactions.billingcreditcardprocessingfee ), 0)) + (COALESCE(SUM(ct_transactions.billingadditionalfee ), 0))  AS ct_transactions_ar_amount,
  ((COALESCE(SUM(ct_transactions.billingservicefee ), 0)) + (COALESCE(SUM(ct_transactions.billingcreditcardprocessingfee ), 0)))*ct_fx_rates.fx_rate  AS ct_transactions_total_revenue_fx,
  ((COALESCE(SUM(ct_transactions.billingservicefee ), 0)) + (COALESCE(SUM(ct_transactions.billingcreditcardprocessingfee ), 0)) + (COALESCE(SUM(ct_transactions.billingadditionalfee ), 0))) * ct_fx_rates_bs.fx_rate_bs  AS ct_transactions_ar_amount_fx
FROM `fivetran-ovation-tix-warehouse.crowdtorch_dbo.data_transactions`
     AS ct_transactions
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_clientvenues`
     AS ct_clientvenues ON ct_transactions.clientid = ct_clientvenues.clientid and ct_clientvenues.venueid = ct_transactions.venueid
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_fx_rates`
     AS ct_fx_rates ON EXTRACT(MONTH FROM (CAST(ct_transactions.transactiontime AS TIMESTAMP))) = ct_fx_rates.periodid
    and (EXTRACT(YEAR FROM CAST(ct_transactions.transactiontime AS TIMESTAMP) )) = ct_fx_rates.yearid
    and ct_clientvenues.billingcurrency = ct_fx_rates.currency
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_fx_rates_bs`
     AS ct_fx_rates_bs ON EXTRACT(MONTH FROM (CAST(ct_transactions.transactiontime AS TIMESTAMP))) = ct_fx_rates_bs.periodid
    and (EXTRACT(YEAR FROM CAST(ct_transactions.transactiontime AS TIMESTAMP) )) = ct_fx_rates_bs.yearid
    and ct_clientvenues.billingcurrency = ct_fx_rates_bs.currency
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_transmap`
     AS ct_ar_transmap ON ct_transactions.datatransactionid = ct_ar_transmap.datatransactionid
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_invoices`
     AS ct_ar_invoices ON ct_ar_invoices.ar_id = ct_ar_transmap.ar_id
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_showdatevenues`
     AS ct_ar_showdatevenues ON ct_transactions.clientid = ct_ar_showdatevenues.clientid and ct_ar_showdatevenues.venueid = ct_transactions.venueid

WHERE ((ct_transactions.dataset  IN ('ticketOrder', 'ticketRefundOrder'))) AND (NOT COALESCE(ct_transactions.istmgateway , FALSE)) AND ((((CAST(ct_transactions.transactiontime AS TIMESTAMP) ) >= (TIMESTAMP('2020-03-01 00:00:00')) AND (CAST(ct_transactions.transactiontime AS TIMESTAMP) ) < (TIMESTAMP('2020-04-01 00:00:00'))))) AND (ct_ar_showdatevenues.clientid  IS NULL)
GROUP BY 1,2,3,4,5,6,7,8,9,10

    UNION ALL

    SELECT
  ct_fx_rates.fx_rate  AS ct_fx_rates_fx_rate,
  ct_fx_rates_bs.fx_rate_bs  AS ct_fx_rates_bs_fx_rate_bs,
  "Unbilled Indirect revenue - Show Date"  AS ct_transactions_transtype_unbilled,
  ct_transactions.clientid  AS ct_transactions_clientid,
  ct_transactions.clientname  AS ct_transactions_clientname,
  ct_transactions.venueid  AS ct_transactions_venueid,
  ct_transactions.venuename  AS ct_transactions_venuename,
  ct_clientvenues.domain  AS ct_clientvenues_domain,
  ct_clientvenues.billingcurrency  AS ct_clientvenues_billingcurrency,
  ct_ar_invoices.ar_id  AS ct_ar_invoices_ar_id,
  (COALESCE(SUM(ct_transactions.billingservicefee ), 0)) + (COALESCE(SUM(ct_transactions.billingcreditcardprocessingfee ), 0))  AS ct_transactions_total_revenue,
  (COALESCE(SUM(ct_transactions.billingservicefee ), 0)) + (COALESCE(SUM(ct_transactions.billingcreditcardprocessingfee ), 0)) + (COALESCE(SUM(ct_transactions.billingadditionalfee ), 0))  AS ct_transactions_ar_amount,
  ((COALESCE(SUM(ct_transactions.billingservicefee ), 0)) + (COALESCE(SUM(ct_transactions.billingcreditcardprocessingfee ), 0)))*ct_fx_rates.fx_rate  AS ct_transactions_total_revenue_fx,
  ((COALESCE(SUM(ct_transactions.billingservicefee ), 0)) + (COALESCE(SUM(ct_transactions.billingcreditcardprocessingfee ), 0)) + (COALESCE(SUM(ct_transactions.billingadditionalfee ), 0))) * ct_fx_rates_bs.fx_rate_bs  AS ct_transactions_ar_amount_fx
FROM `fivetran-ovation-tix-warehouse.crowdtorch_dbo.data_transactions`
     AS ct_transactions
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_clientvenues`
     AS ct_clientvenues ON ct_transactions.clientid = ct_clientvenues.clientid and ct_clientvenues.venueid = ct_transactions.venueid
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_fx_rates`
     AS ct_fx_rates ON EXTRACT(MONTH FROM (CAST(ct_transactions.transactiontime AS TIMESTAMP))) = ct_fx_rates.periodid
    and (EXTRACT(YEAR FROM CAST(ct_transactions.transactiontime AS TIMESTAMP) )) = ct_fx_rates.yearid
    and ct_clientvenues.billingcurrency = ct_fx_rates.currency
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_fx_rates_bs`
     AS ct_fx_rates_bs ON EXTRACT(MONTH FROM (CAST(ct_transactions.transactiontime AS TIMESTAMP))) = ct_fx_rates_bs.periodid
    and (EXTRACT(YEAR FROM CAST(ct_transactions.transactiontime AS TIMESTAMP) )) = ct_fx_rates_bs.yearid
    and ct_clientvenues.billingcurrency = ct_fx_rates_bs.currency
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_transmap`
     AS ct_ar_transmap ON ct_transactions.datatransactionid = ct_ar_transmap.datatransactionid
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_invoices`
     AS ct_ar_invoices ON ct_ar_invoices.ar_id = ct_ar_transmap.ar_id
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_showdatevenues`
     AS ct_ar_showdatevenues ON ct_transactions.clientid = ct_ar_showdatevenues.clientid and ct_ar_showdatevenues.venueid = ct_transactions.venueid

WHERE ((ct_transactions.dataset  IN ('ticketOrder', 'ticketRefundOrder'))) AND (NOT COALESCE(ct_transactions.istmgateway , FALSE)) AND ((((CAST(ct_transactions.transactiontime AS TIMESTAMP) ) >= (TIMESTAMP('2015-01-01 00:00:00')) AND (CAST(ct_transactions.transactiontime AS TIMESTAMP) ) < (TIMESTAMP('2020-04-01 00:00:00'))))) AND (ct_ar_transmap.ar_id  IS NULL)  AND (ct_ar_showdatevenues.clientid  IS NULL)
GROUP BY 1,2,3,4,5,6,7,8,9,10 ;;
    }

    dimension: ct_transactions_transtype_unbilled  {
      type: string
      sql: ${TABLE}.ct_transactions_transtype_unbilled ;;
    }

    dimension: ct_transactions_clientname {
      type: string
      sql: ${TABLE}.ct_transactions_clientname ;;
    }
    }
