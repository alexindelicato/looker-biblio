view: unlimited_donations_summary {
  derived_table: {
    sql:
    SELECT
      gifts.UUID as UUID,
      gifts.client_name as client_name,
      audit_time,
      cast(audit_time as TIMESTAMP) as audit_date_time,
      YEAR,
      quarter,
      userrole_name,
      userrole_group,
      sum(donation_count) as donation_count,
      sum(donation_amount)/100.00 as donation_amount,
      facts.default_currency as default_currency,
        SUM(CASE
          WHEN facts.default_currency = 'CAD' THEN donation_amount * 0.76
          WHEN facts.default_currency = 'COP' THEN donation_amount * 0.00029
          WHEN facts.default_currency = 'GBP' THEN donation_amount * 1.32
          WHEN facts.default_currency = 'PHP' THEN donation_amount * 0.020
          WHEN facts.default_currency = 'USD' THEN donation_amount * 1
          ELSE 0
      END)/100 as donation_amount_usd
    FROM audienceview.unlimited_donations_summary as gifts
    INNER JOIN audienceview.unlimited_client_facts as facts on facts.client_name = gifts.client_name
    GROUP BY
      UUID,
      client_name,
      audit_time,
      YEAR,
      quarter,
      userrole_name,
      userrole_group,
      facts.default_currency
               ;;

      sql_trigger_value: select max(audit_time) from `fivetran-ovation-tix-warehouse.audienceview.unlimited_donations_summary`;;
    }

    dimension:  UUID  { type: string sql: ${TABLE}.UUID  ;; }
    dimension:  client_name { type: string sql: ${TABLE}.client_name ;; }
    dimension:  audit_time  { type: string sql: ${TABLE}.audit_time  ;; }
    dimension_group: audit_date_time { type: time sql: ${TABLE}.audit_date_time ;; }

    dimension:  userrole_name { type: string sql: ${TABLE}.userrole_name ;; }
    dimension:  userrole_group  { type: string sql: ${TABLE}.userrole_group  ;; }

    dimension: default_currency { type: string sql: ${TABLE}.default_currency ;; }
    dimension: donation_count { type: number label: "Donation Count" sql: ${TABLE}.donation_count ;; }
    dimension: donation_amount { type: number value_format_name: usd sql: ${TABLE}.donation_amount ;; }
    dimension: donation_amount_usd { type: number value_format_name: usd sql: ${TABLE}.donation_amount_usd ;; }

    measure:  total_donation_count { type: sum label: "Total Donation Count" sql: ${TABLE}.donation_count ;; }
    measure:  total_donation_amount { type: sum value_format_name: usd label: "Total Donation Amount" sql: ${TABLE}.donation_amount ;; }
    measure:  total_donation_amount_usd { type: sum value_format_name: usd label: "Total Donation Amount (USD)" sql: ${TABLE}.donation_amount_usd ;; }


#  measure: count {
#    type: count
#    drill_fields: [userrole_name, client_name]
#  }
  }
