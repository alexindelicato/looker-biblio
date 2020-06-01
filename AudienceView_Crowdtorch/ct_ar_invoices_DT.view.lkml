view: ct_ar_invoices_dt {

   derived_table: {
     sql:
SELECT

  InvoiceNum,
  UniqueVenueID,
  clientID,
  clientName,
  BeginPeriod,
  EndPeriod,
  billingCurrency,
  venueID,
  venueName,
  venueAddress,
  venueCity,
  venueState,
  venueZip,
  venueCountry,
  SaleType,
  ServiceName,
  Amount,
  FeeMetric,
  FeeType,
  FeeTotal

FROM
(

  SELECT
    i.InvoiceNum as InvoiceNum,
    t.UniqueVenueID as UniqueVenueID,
    t.clientID as clientID,
    format('%T', t.clientName) as clientName,
    i.BeginPeriod as BeginPeriod,
    i.EndPeriod as EndPeriod,
    i.billingCurrency as billingCurrency,
    t.venueID as venueID,
    format('%T', t.venueName ) as venueName,
    format('%T', v.venueAddress ) as venueAddress,
    format('%T', v.venueCity ) as venueCity,
    format('%T', v.venueState ) as venueState,
    format('%T', v.venueZip ) as venueZip,
    format('%T', v.venueCountry ) as venueCountry,
    t.SaleType as SaleType,
    IF(t.saleTypeID > 7, so.serviceName, t.ServiceType) AS ServiceName,
    sum(t.Qty) as Amount,
    t.BSF_PerTicket as FeeMetric,
    'Per ticket' as FeeType,
    round(sum(t.Qty) * BSF_PerTicket,2) as FeeTotal

  FROM `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_invoices_trans` t
  INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_invoices` i on (i.invoiceNum = t.InvoiceNum)
  LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.laughstub_venues` v on (v.venueID = t.venueID)
  LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.laughstub_servicesoffered` so on (so.serviceID = t.SaleTypeID)

  GROUP BY
    i.InvoiceNum,
    t.UniqueVenueID,
    t.clientID,
    t.clientName,
    i.BeginPeriod,
    i.EndPeriod,
    i.billingCurrency,
    t.UniqueVenueID,
    t.clientID,
    t.InvoiceNum,
    t.venueID,
    t.venueName,
    v.venueAddress,
    v.venueCity,
    v.venueState,
    v.venueZip,
    v.venueCountry,
    t.SaleType,
    SaleTypeID,
    ServiceType,
    t.venueID,
    t.venueName,
    SaleType,
    serviceName,
    BSF_PerTicket,
    BSF_Percent

  UNION ALL

  SELECT
    i.InvoiceNum as InvoiceNum,
    t.UniqueVenueID as UniqueVenueID,
    t.clientID as clientID,
    format('%T', t.clientName ) as clientName,
    i.BeginPeriod as BeginPeriod,
    i.EndPeriod as EndPeriod,
    i.billingCurrency as billingCurrency,
    t.venueID as venueID,
    format('%T', t.venueName ) as venueName,
    format('%T', v.venueAddress ) as venueAddress,
    format('%T', v.venueCity ) as venueCity,
    format('%T', v.venueState ) as venueState,
    format('%T', v.venueZip ) as venueZip,
    format('%T', v.venueCountry ) as venueCountry,
    t.SaleType,
    IF(t.saleTypeID > 7, so.serviceName, t.ServiceType) AS ServiceName,
    sum(t.Revenue) as Amount,
    t.BSF_Percent as FeeMetric,
    'Percent' as FeeType,
    round(sum(Revenue) * BSF_Percent, 2) as FeeTotal

  FROM `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_invoices_trans` t
  INNER JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.tbl_ticketing_ar_invoices` i on (i.invoiceNum = t.InvoiceNum)
  LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.laughstub_venues` v on (v.venueID = t.venueID)
  LEFT JOIN `fivetran-ovation-tix-warehouse.crowdtorch_dbo.laughstub_servicesoffered` so on (so.serviceID = t.SaleTypeID)

  GROUP BY
    i.InvoiceNum,
    t.UniqueVenueID,
    t.clientID,
    t.clientName,
    i.BeginPeriod,
    i.EndPeriod,
    i.billingCurrency,
    t.UniqueVenueID,
    t.clientID,
    t.InvoiceNum,
    t.venueID,
    t.venueName,
    v.venueAddress,
    v.venueCity,
    v.venueState,
    v.venueZip,
    v.venueCountry,
    t.SaleType,
    SaleTypeID,
    ServiceType,
    t.venueID,
    t.venueName,
    SaleType,
    serviceName,
    BSF_PerTicket,
    BSF_Percent

) as t1


-- WHERE BeginPeriod >= '2020-03-01' and EndPeriod <= '2020-04-01'

ORDER BY
invoiceNum,
SaleType desc,
serviceName desc

       ;;
   }


  dimension: InvoiceNum {
    type: string
    sql: ${TABLE}.InvoiceNum ;;
  }

  dimension: UniqueVenueID {
    type: string
    sql: ${TABLE}.UniqueVenueID ;;
  }

  dimension: clientID {
    type: string
    sql: ${TABLE}.clientID ;;
  }

  dimension: clientName {
    type: string
    sql: ${TABLE}.clientName ;;
  }

  dimension_group: BeginPeriod {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.BeginPeriod ;;
  }

  dimension_group: EndPeriod {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.EndPeriod ;;
  }


  dimension: billingCurrency {
    type: string
    sql: ${TABLE}.billingCurrency ;;
  }

  dimension: venueID {
    type: string
    sql: ${TABLE}.venueID ;;
  }

  dimension: venueName {
    type: string
    sql: ${TABLE}.venueName ;;
  }

  dimension: venueAddress {
    type: string
    sql: ${TABLE}.venueAddress ;;
  }

  dimension: venueCity {
    type: string
    sql: ${TABLE}.venueCity ;;
  }

  dimension: venueState {
    type: string
    sql: ${TABLE}.venueState ;;
  }

  dimension: venueZip {
    type: string
    sql: ${TABLE}.venueZip ;;
  }

  dimension: venueCountry {
    type: string
    sql: ${TABLE}.venueCountry ;;
  }

  dimension: SaleType {
    type: string
    sql: ${TABLE}.SaleType ;;
  }

  dimension: ServiceName {
    type: string
    sql: ${TABLE}.ServiceName ;;
  }

  dimension: Amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  dimension: FeeMetric {
    type: number
    value_format_name: usd
    sql: ${TABLE}.FeeMetric ;;
  }

  dimension: FeeType {
    type: string
    sql: ${TABLE}.FeeType ;;
  }

  dimension: FeeTotal {
    type: number
    value_format_name: usd
    sql: ${TABLE}.FeeTotal ;;
  }

  measure: Grand_Total_Amount {
    type:  sum
    value_format_name: usd
    label: "Grand Total (Amount)"
    sql: ${TABLE}.Amount ;;
    drill_fields: [ct_invoice_detail*]
}


measure: Grand_Total_FeeTotal {
  type:  sum
  value_format_name: usd
  label: "Grand Total (Fees)"
  sql: ${TABLE}.FeeTotal ;;
  drill_fields: [ct_invoice_detail*]
}

set: ct_invoice_detail {
  fields: [
  clientName,
  billingCurrency,
  venueName,
  SaleType,
  ServiceName
  ]
}

}
