view: ct_unbilled_indirect_revenue {
  derived_table: {
    sql:
SELECT
    TransType,
--  TransactionTime,
    clientID,
    clientName,
    venueID,
    venueName,
    domain,
    billingCurrency,
    AR_ID,
    Round(sum(billingServiceFee + billingCreditCardProcessingFee),2) as Revenue,
    Round(sum(billingServiceFee + billingCreditCardProcessingFee),2) as AR_Amt,
    Round(sum((billingServiceFee + billingCreditCardProcessingFee) * revenue_FX_Rate),2) as Revenue_USD,
    Round(sum((billingServiceFee + billingCreditCardProcessingFee) * ar_FX_Rate),2) as AR_USD
FROM
(
SELECT 'Unbilled Indirect revenue - Transaction Date' as TransType,
    TransactionTime,
    a.clientID,
    b.clientName,
    a.venueID,
    b.venueName,
    b.domain,
    b.billingCurrency,
    AR_ID,
    billingServiceFee,
    billingCreditCardProcessingFee,
    c.FX_Rate as revenue_fx_rate,
    d.FX_Rate_BS as ar_fx_rate,
    a.dataset,
    a.isTMGateway
FROM `fivetran-ovation-tix-warehouse.crowdtorch_dbo.data_transactions` a
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_clientvenues` b
    on a.clientID = b.clientID and a.venueID = b.venueID
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_fx_rates` c
    on EXTRACT(MONTH FROM a.transactiontime) = c.PeriodID
    and EXTRACT(YEAR FROM transactiontime) = c.YearID
    and b.billingCurrency = c.Currency
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_fx_rates_bs` d
    on EXTRACT(MONTH FROM a.transactiontime) = d.PeriodID
    and EXTRACT(YEAR FROM transactiontime) = d.YearID
    and b.billingCurrency = d.Currency
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_showdatevenues` e
    on a.clientID = e.clientID and a.venueID = e.venueID
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_transmap` f
    on a.dataTransactionID = f.dataTransactionID
WHERE 1 = 1
    AND e.clientID is null
AND Cast(TransactionTime as Date) between '2020-03-01' and '2020-04-01'
UNION ALL
SELECT 'Unbilled Indirect revenue - Show Date' as TransType,
    TransactionTime,
    a.clientID,
    b.clientName,
    a.venueID,
    b.venueName,
    b.domain,
    b.billingCurrency,
    AR_ID,
    billingServiceFee,
    billingCreditCardProcessingFee,
    c.FX_Rate as revenue_fx_rate,
    d.FX_Rate_BS as ar_fx_rate,
    a.dataset,
    a.isTMGateway
FROM `fivetran-ovation-tix-warehouse.crowdtorch_dbo.data_transactions` a
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_clientvenues` b
    on a.clientID = b.clientID and a.venueID = b.venueID
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_fx_rates` c
    ON EXTRACT(MONTH FROM a.transactiontime) = c.PeriodID
    AND EXTRACT(YEAR FROM transactiontime) = c.YearID
    AND b.billingCurrency = c.Currency
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_fx_rates_bs` d
    ON EXTRACT(MONTH FROM a.transactiontime) = d.PeriodID
    AND EXTRACT(YEAR FROM transactiontime) = d.YearID
    AND b.billingCurrency = d.Currency
INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_showdatevenues` e
    on a.clientID = e.clientID and a.venueID = e.venueID
LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_transmap` f
    on a.dataTransactionID = f.dataTransactionID
Where 1 = 1
AND Cast(TransactionTime as Date) between '2015-01-01' and '2020-04-01'
) as t1
WHERE 1 = 1
    AND dataset IN ('ticketOrder', 'ticketRefundOrder')
--  AND Cast(TransactionTime as Date) between '2020-03-01' and '2020-04-01'
--  AND clientID is null
  AND isTMGateway = false
    AND (AR_ID is null or AR_ID >
        (
        Select Max(AR_ID) as Last_AR_ID
        From `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_invoices`
        Where InvoiceDate <= '2020-04-01'
        )
    )
GROUP BY
    TransType,
--  TransactionTime,
    clientID,
    clientName,
    venueID,
    venueName,
    domain,
    billingCurrency,
    AR_ID ;;
  }

  dimension: ar_id {
    type: string
    sql: ${TABLE}.AR_ID ;;
  }

  dimension: arid_null {
    type: string
    sql: "NULL" ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.clientName ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.clientid ;;
  }

  dimension: transtype {
    type: string
    sql: ${TABLE}.transtype ;;
  }

  dimension: venueid {
    type: string
    sql: ${TABLE}.venueid ;;
  }
  dimension: venuename {
    type: string
    sql: ${TABLE}.venuename ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: billingcurrency {
    type: string
    sql: ${TABLE}.billingcurrency ;;
  }

  dimension: revenue {
    type: number
    value_format_name: usd
    sql: ${TABLE}.revenue ;;
  }

  dimension: AR_Amt {
    type: number
    value_format_name: usd
    sql: ${TABLE}.ar_amt ;;
  }

  dimension: Revenue_USD {
    type: number
    value_format_name: usd
    sql: ${TABLE}.Revenue_USD ;;
  }
  dimension: AR_USD {
    type: number
    value_format_name: usd
    sql: ${TABLE}.AR_USD ;;
  }
  }
