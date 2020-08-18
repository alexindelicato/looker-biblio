view: sf_total_client_count {
    derived_table: {
      sql: SELECT
  "Total"  AS sf_accounts_client_count,
  COUNT(CASE WHEN (sf_accounts.type  IN ('Client - AudienceView Campus', 'Client - AudienceView Grad', 'Client - AudienceView Professional', 'Client - AudienceView Select', 'Client - AudienceView Unlimited', 'Client - CrowdTorch', 'Client - Boxxo')) THEN 1 ELSE NULL END) AS sf_accounts_count_total_clients
FROM new_salesforce.account  AS sf_accounts

WHERE sf_accounts.is_deleted= FALSE
GROUP BY 1
ORDER BY 2 DESC
 ;;
}

dimension: client_count{
  type: number
  sql: ${TABLE}.sf_accounts_count_total_clients ;;
}

  measure: measure_client_count{
    type: number
    sql: ${TABLE}.sf_accounts_count_total_clients ;;
    required_fields: [client_count]
  }

dimension: sf_accounts_client_count {
  type: string
  sql: ${TABLE}.sf_accounts_client_count ;;
}
}
