view: unlimited_payments_summary {
    derived_table: {
      sql:
        SELECT
          payments.UUID as UUID,
          payments.client_name as client_name,
          payments.sf_account_name as sf_account_name,
          payments.sf_account_id as sf_account_id,
          cast(payment_date as TIMESTAMP) as payment_date,
          paymentmethod_name,
          userrole_name,
          paymentmethod_type,

          CASE
            WHEN orderpayment_payment_transaction_type = '0' THEN 'Payment'
            WHEN orderpayment_payment_transaction_type = '1' THEN 'Refund'
            ELSE 'Unknown'
          END as orderpayment_payment_transaction_type,

          ( amount / 100.00 ) as payment_amount,
          orderpayment_transaction_count,
          orderpayment_order_count,
          facts.default_currency as default_currency,
          SUM(CASE
              WHEN orderpayment_payment_transaction_type = '0' THEN 1
              ELSE 0
          END) as payment_transactions_count,
          SUM(CASE
              WHEN orderpayment_payment_transaction_type = '1' THEN 1
              ELSE 0
          END) as refund_transactions_count,
          SUM(CASE
              WHEN orderpayment_payment_transaction_type <> '0'
                AND orderpayment_payment_transaction_type <> '1' THEN 1
              ELSE 0
          END) as other_transactions_count,
          SUM(CASE
              WHEN facts.default_currency = 'CAD' THEN amount * 0.76
              WHEN facts.default_currency = 'COP' THEN amount * 0.00029
              WHEN facts.default_currency = 'GBP' THEN amount * 1.32
              WHEN facts.default_currency = 'PHP' THEN amount * 0.020
              WHEN facts.default_currency = 'USD' THEN amount * 1
              ELSE 0
          END)/100 as payment_amount_usd
          FROM audienceview.unlimited_payments_summary as payments
          INNER JOIN audienceview.unlimited_client_facts as facts on facts.client_name = payments.client_name

          WHERE 1 = 1

        GROUP BY
          payments.UUID,
          payments.client_name,
          payments.sf_account_name,
          payments.sf_account_id,
          cast(payment_date as TIMESTAMP),
          paymentmethod_name,
          userrole_name,
          paymentmethod_type,
          orderpayment_payment_transaction_type,
          amount,
          orderpayment_transaction_count,
          orderpayment_order_count,
          facts.default_currency

          ;;

        sql_trigger_value: select max(payment_date) from `fivetran-ovation-tix-warehouse.audienceview.unlimited_payments_summary`;;
    }

      dimension: UUID  { type: string sql: ${TABLE}.UUID  ;; }
      dimension: client_name { type: string sql: ${TABLE}.client_name ;; }
      dimension: sf_client_name { type: string sql: ${TABLE}.sf_client_name ;; }
      dimension: paymentmethod_name { type: string sql: ${TABLE}.paymentmethod_name ;; }
      dimension: userrole_name { type: string sql: ${TABLE}.userrole_name ;; }
      dimension: paymentmethod_type { type: string sql: ${TABLE}.paymentmethod_type ;; }
      dimension: default_currency { type: string sql: ${TABLE}.default_currency ;; }
      dimension: orderpayment_payment_transaction_type { type: string sql: ${TABLE}.orderpayment_payment_transaction_type ;; }

      dimension_group: payment_date { type: time sql: ${TABLE}.payment_date ;; }

      dimension: orderpayment_transaction_count { type: number sql: ${TABLE}.orderpayment_transaction_count ;; }
      dimension: payment_amount { type: number sql: ${TABLE}.payment_amount ;; }
      dimension: payment_amount_usd { type: number value_format_name: usd sql: ${TABLE}.payment_amount_usd ;; }

      dimension: payment_transactions_count { type: number sql: ${TABLE}.payment_transactions_count ;; }
      dimension: refund_transactions_count { type: number sql: ${TABLE}.refund_transactions_count ;; }
      dimension: other_transactions_count { type: number sql: ${TABLE}.other_transactions_count ;; }

      dimension_group: current_time {
        type: time
        timeframes: [
          raw,
          time,
          date,
          week,
          month,
          month_name,
          quarter,
          quarter_of_year,
          week_of_year,
          year
        ]
        sql: CURRENT_TIMESTAMP() ;;
      }

  measure:total_transaction_count { type: sum sql: ${TABLE}.orderpayment_transaction_count ;; drill_fields: [payment_facts*] }
  measure:total_transaction_amount { type: sum value_format_name: decimal_2 sql: ${TABLE}.payment_amount ;; drill_fields: [payment_facts*] }
  measure:total_transaction_amount_usd { type: sum value_format_name: usd sql: ${TABLE}.payment_amount_usd ;; drill_fields: [payment_facts*] }

  measure:total_payment_transactions_count { type: sum sql: ${TABLE}.payment_transactions_count ;; drill_fields: [payment_facts*] }
  measure:total_refund_transactions_count { type: sum sql: ${TABLE}.refund_transactions_count ;; drill_fields: [payment_facts*] }
  measure:total_other_transactions_count { type: sum sql: ${TABLE}.other_transactions_count ;; drill_fields: [payment_facts*] }

  set: payment_facts {
    fields: [
      client_name,
      paymentmethod_type
    ]
  }


#  measure: count {
#    type: count
#    drill_fields: [userrole_name, client_name]
#  }
    }
