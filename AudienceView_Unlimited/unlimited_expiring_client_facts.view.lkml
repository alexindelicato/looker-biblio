view: unlimited_expiring_client_facts {
  derived_table: {
    sql:
    SELECT
      client_name as expiring_client_name,
      CAST(transaction_range_start_date as TIMESTAMP) as transaction_range_start_date,
      CAST(transaction_range_end_date as TIMESTAMP) as transaction_range_end_date
    FROM `fivetran-ovation-tix-warehouse.audienceview.unlimited_client_facts`
    WHERE 1 = 1
    AND DATE_DIFF( "2021-02-01", DATE(transaction_range_end_date), MONTH) = 1
               ;;
  }

  dimension: expiring_client_name {
    type: string
    sql: ${TABLE}.expiring_client_name ;;
  }
}
