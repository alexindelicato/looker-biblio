view: av_arr_acv{
  derived_table: {
    sql:
   SELECT
state,
SUM(annual_contract_value_c) as annual_contract_value_c,
SUM(arr_c) as arr_c,
SUM(annual_contract_value_c + arr_c + net_arr_2019 ) AS ARR
FROM
(
SELECT
    sf_accounts.billing_state  AS state,
CASE WHEN (sf_accounts.type = 'Client - AudienceView Unlimited')
THEN
COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(sf_accounts.annual_contract_value_c ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(sf_accounts.id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(sf_accounts.id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(sf_accounts.id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(sf_accounts.id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0)
ELSE 0
END AS annual_contract_value_c,
CASE WHEN
 sf_accounts.type  IN
 ('Client - AudienceView Campus',
 'Client - AudienceView Grad',
 'Client - AudienceView Professional')
THEN COALESCE(SUM(sf_accounts.arr_c ), 0)
ELSE 0
END AS arr_c,
CASE WHEN
 sf_accounts.type  IN
 ('Client - AudienceView Select', 'Client - CrowdTorch')
THEN COALESCE(SUM(sf_accounts.BTI_2019_ARR_c ), 0)
ELSE 0
END AS net_arr_2019
FROM `fivetran-ovation-tix-warehouse.new_salesforce.account`  AS sf_accounts
WHERE 1 = 1
AND (sf_accounts.billing_country = 'United States')
AND (sf_accounts.billing_state IS NOT NULL)
AND (sf_accounts.is_deleted= FALSE)
GROUP BY
sf_accounts.billing_country,
sf_accounts.type,
sf_accounts.is_deleted,
sf_accounts.billing_state
) as t1
GROUP BY state
ORDER BY
state ;;
}

dimension: state {
  type: string
  sql: ${TABLE}.state ;;
}

  dimension: annual_contract_value_c {
    type: number
    value_format_name: usd
    sql: ${TABLE}.annual_contract_value_c ;;
  }

  dimension: arr_c {
    type: number
    value_format_name: usd
    sql: ${TABLE}.arr_c ;;
  }

  dimension: arr {
    type: number
    label: "Total ARR/ACV by State"
    value_format_name: usd
    sql: ${TABLE}.arr ;;
  }







}
