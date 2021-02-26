view: unlimited_client_facts {
  derived_table: {
    sql:
SELECT
  UUID,
  client_name,
  sf_account_name,
  sf_account_id,
  client_version,
  default_currency,
  sf_billing_street,
  sf_billing_city,
  sf_billing_state,
  sf_billing_country,
  sf_billing_postal_code,
  cast(transaction_range_start_date as TIMESTAMP) as transaction_range_start_date,
  cast(transaction_range_end_date as TIMESTAMP) as transaction_range_end_date,
  finance_customer_code
FROM `fivetran-ovation-tix-warehouse.audienceview.unlimited_client_facts`
           ;;
    sql_trigger_value: select max(audit_time) from `fivetran-ovation-tix-warehouse.audienceview.unlimited_admission_transactions`;;

    }

# DECLARE dateFrom DATETIME;
# DECLARE dateTo DATETIME;
# DECLARE contract_start_date DATETIME;
# DECLARE contract_end_date DATETIME;
# DECLARE transaction_start_year INT64;
# DECLARE contract_start_month INT64;
# DECLARE contract_start_day INT64;
# DECLARE adjusted_contract_start_date DATETIME;

# set dateFrom  = '2020-05-01T00:00:00.000';
# set dateTo  = '2021-01-01T00:00:00.000';

# SET contract_start_date = '2016-06-01';

# set transaction_start_year = EXTRACT( YEAR from dateFrom);
# set contract_start_month = EXTRACT( MONTH from contract_start_date);
# set contract_start_day = EXTRACT( DAY from contract_start_date);

# -- ADJUST THE CONTRACT START DATE TO FOLLOW THE TRANSACTION START DATE YEAR

# set adjusted_contract_start_date = CAST(CONCAT(transaction_start_year, "-", contract_start_month, "-", + contract_start_day, " 00:00:00") AS DATETIME);

# IF (DATE_DIFF(adjusted_contract_start_date, dateFrom, DAY)> 0)
# THEN
#     set contract_start_date =  DATE_ADD( adjusted_contract_start_date, INTERVAL -1 YEAR);
#     set contract_end_date = DATE_ADD(contract_start_date, INTERVAL 1 YEAR);
# ELSE
#     set contract_start_date = adjusted_contract_start_date;
#     set contract_end_date = DATE_ADD(contract_start_date, INTERVAL 1 YEAR);
# END IF;

# select
# contract_start_date as contract_start_date,
# contract_end_date as contract_end_date,
# dateFrom as dateFrom,
# dateTo as dateTo




  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: client_version {
    type: string
    sql: ${TABLE}.client_version ;;
  }

  dimension: sf_account_id {
    type: string
    sql: ${TABLE}.sf_account_id ;;
  }

  dimension: sf_account_name {
    type: string
    sql: ${TABLE}.sf_account_name ;;
  }

  dimension: default_currency {
    type: string
    sql: ${TABLE}.default_currency ;;
  }

  measure: count_client_name {
    type: count_distinct
    drill_fields: [sf_accounts.name, client_name]
    sql: ${TABLE}.client_name;;
  }

}
