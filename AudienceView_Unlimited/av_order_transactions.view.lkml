view: av_order_transactions {
  derived_table: {
    sql:

    SELECT
      UUID,
      client_name,
      sf_account_name,
      sf_account_id,
      audit_time,
      cast(audit_time as TIMESTAMP) as audit_date_time,
      YEAR,
      quarter,
      transaction_type,
      SUM( sold_amount ) AS sold_amount,
      SUM( returned_amount ) AS returned_amount,
      SUM( net_sold_amount ) AS net_sold_amount,
      SUM( sold_volume ) AS sold_volume,
      SUM( returned_volume ) AS returned_volume,
      SUM( net_volume ) AS net_volume
    FROM (
              SELECT
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                'Single Admissions' AS transaction_type,

                SUM( CASE
                  WHEN record_state in ( 0, 1 )
                    THEN single_admission_gross_sold_amount
                    ELSE 0
                END) as sold_amount,

                SUM( CASE
                  WHEN record_state in ( 2 )
                    THEN single_admission_gross_sold_amount
                    ELSE 0
                END) as returned_amount,

                SUM(single_admission_gross_sold_amount) as net_sold_amount,

                SUM( CASE
                  WHEN record_state in ( 0, 1 )
                    THEN single_admission_sold_volume - single_admission_comp_volume
                    ELSE 0
                END) as sold_volume,

                SUM( CASE
                  WHEN record_state in ( 2 )
                    THEN single_admission_sold_volume - single_admission_comp_volume
                    ELSE 0
                END) as returned_volume,

                SUM( single_admission_sold_volume - single_admission_comp_volume ) as net_volume,

              FROM audienceview.unlimited_admission_transactions
              WHERE ( single_admission_sold_volume <> 0 OR single_admission_gross_sold_amount <> 0 )

              GROUP BY
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                transaction_type

    UNION ALL

              SELECT
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                'Single Admission Comps' AS transaction_type,

                0 sold_amount,
                0 as returned_amount,
                0 as net_sold_amount,

                SUM( CASE
                  WHEN record_state in ( 0, 1 )
                    THEN single_admission_comp_volume
                    ELSE 0
                END) as sold_volume,
                SUM( CASE
                  WHEN record_state in ( 2 )
                    THEN single_admission_comp_volume
                    ELSE 0
                END) as returned_volume,
                SUM( single_admission_comp_volume ) as net_volume,

              FROM audienceview.unlimited_admission_transactions
              WHERE ( single_admission_comp_volume <> 0 )

              GROUP BY
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                transaction_type

    UNION ALL
              SELECT
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                'Bundle Admissions' AS transaction_type,

                SUM( CASE
                  WHEN record_state in ( 0, 1 )
                    THEN bundle_admission_gross_sold_amount
                    ELSE 0
                END) as sold_amount,
                SUM( CASE
                  WHEN record_state in ( 2 )
                    THEN bundle_admission_gross_sold_amount
                    ELSE 0
                END) as returned_amount,
                SUM(bundle_admission_gross_sold_amount) as net_sold_amount,

                SUM( CASE
                  WHEN record_state in ( 0, 1 )
                    THEN bundle_admission_sold_volume - bundle_admission_comp_volume
                    ELSE 0
                END) as sold_volume,

                SUM( CASE
                  WHEN record_state in ( 2 )
                    THEN bundle_admission_sold_volume - bundle_admission_comp_volume
                    ELSE 0
                END) as returned_volume,

                SUM( bundle_admission_sold_volume - bundle_admission_comp_volume ) as net_volume,

              FROM audienceview.unlimited_admission_transactions
              WHERE ( bundle_admission_sold_volume <> 0 OR bundle_admission_gross_sold_amount <> 0 )

              GROUP BY
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                transaction_type


    UNION ALL

              SELECT
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                'Bundle Admission Comps' AS transaction_type,

                0 sold_amount,
                0 as returned_amount,
                0 as net_sold_amount,

                IFNULL(SUM( CASE
                  WHEN record_state in ( 0, 1 )
                    THEN bundle_admission_comp_volume
                    ELSE 0
                END),0) as sold_volume,
                IFNULL(SUM( CASE
                  WHEN record_state in ( 2 )
                    THEN bundle_admission_comp_volume
                    ELSE 0
                END),0) as returned_volume,
                IFNULL(SUM( bundle_admission_comp_volume ),0) as net_volume,

              FROM audienceview.unlimited_admission_transactions
              WHERE ( bundle_admission_comp_volume <> 0 )

              GROUP BY
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                transaction_type

    UNION ALL

              SELECT
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                CAST( YEAR as INT64) as YEAR,
                CAST(quarter as INT64) as quarter,
                'Misc Items' AS transaction_type,

                SUM( CASE
                  WHEN record_state in ( 0 )
                    THEN orderitem_gross_sold_amount
                    ELSE 0
                END) as sold_amount,
                SUM( CASE
                  WHEN record_state in ( 2 )
                    THEN orderitem_gross_sold_amount
                    ELSE 0
                END) as returned_amount,
                SUM(orderitem_gross_sold_amount) as net_sold_amount,

                SUM( CASE
                  WHEN record_state in ( 0 )
                    THEN orderitem_sold_volume
                    ELSE 0
                END) as sold_volume,
                SUM( CASE
                  WHEN record_state in ( 2 )
                    THEN orderitem_sold_volume
                    ELSE 0
                END) as returned_volume,
                SUM( orderitem_sold_volume ) as net_volume

              FROM audienceview.unlimited_miscitem_transactions
              WHERE ( orderitem_sold_volume <> 0 OR orderitem_gross_sold_amount <> 0 )

              GROUP BY
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                transaction_type

    UNION ALL

              SELECT
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                CAST( YEAR as INT64) as YEAR,
                CAST(quarter as INT64) as quarter,
                'Gift Certificates' AS transaction_type,

                SUM( CASE
                  WHEN gift_certificate_transaction_type = 'PURCHASE'
                    THEN gift_certificate_purchase_amount
                    ELSE 0
                END) as sold_amount,
                SUM( CASE
                  WHEN gift_certificate_transaction_type = 'REDEMPTION'
                    THEN gift_certificate_redeemed_amount
                    ELSE 0
                END) * -1 as returned_amount,

                SUM(gift_certificate_amount) as net_sold_amount,

                SUM( CASE
                  WHEN gift_certificate_transaction_type = 'PURCHASE'
                    THEN gift_certificate_purchase_volume
                    ELSE 0
                END) as sold_volume,
                SUM( CASE
                  WHEN gift_certificate_transaction_type = 'REDEMPTION'
                    THEN gift_certificate_redeemed_volume
                    ELSE 0
                END) * -1 as returned_volume,
                SUM( gift_certificate_purchase_volume + gift_certificate_redeemed_volume ) as net_volume,

              FROM audienceview.unlimited_certificate_transactions
              WHERE ( gift_certificate_amount <> 0 )

              GROUP BY
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                transaction_type

    UNION ALL

              SELECT
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                CAST( YEAR as INT64) as YEAR,
                CAST(quarter as INT64) as quarter,
                'Donations' AS transaction_type,

                SUM( CASE
                  WHEN record_state in ( 0 )
                    THEN ordergift_sold_amount
                    ELSE 0
                END) as sold_amount,
                SUM( CASE
                  WHEN record_state in ( 2 )
                    THEN ordergift_sold_amount
                    ELSE 0
                END) as returned_amount,

                SUM(ordergift_sold_amount) as net_sold_amount,

                SUM( CASE
                  WHEN record_state in ( 0 )
                    THEN ordergift_sold_volume
                    ELSE 0
                END) as sold_volume,
                SUM( CASE
                  WHEN record_state in ( 2 )
                    THEN ordergift_sold_volume
                    ELSE 0
                END) as returned_volume,
                SUM( ordergift_sold_volume ) as net_volume,

              FROM audienceview.unlimited_gift_transactions
              WHERE ( ordergift_sold_volume <> 0 OR ordergift_sold_amount <> 0 )

              GROUP BY
                UUID,
                client_name,
                sf_account_name,
                sf_account_id,
                audit_time,
                YEAR,
                quarter,
                transaction_type




    ) as t1

    GROUP BY
      UUID,
      client_name,
      sf_account_name,
      sf_account_id,
      audit_time,
      YEAR,
      quarter,
      transaction_type

                ;;

      sql_trigger_value: select max(audit_time) from `fivetran-ovation-tix-warehouse.audienceview.unlimited_admission_transactions`;;
    }

    dimension:  transaction_type { type: string sql: ${TABLE}.transaction_type ;; }

    dimension:  UUID  { type: string sql: ${TABLE}.UUID ;; }
    dimension:  client_name { type: string sql: ${TABLE}.client_name ;; }
    dimension:  audit_time  { type: string sql: ${TABLE}.audit_time ;; }
    dimension_group: audit_date_time { type: time sql: ${TABLE}.audit_date_time ;; }

    dimension:  YEAR  { type: string sql: ${TABLE}. YEAR  ;; }
    dimension:  quarter { type: string sql: ${TABLE}. quarter ;; }
#      dimension:  userrole_name { type: string sql: ${TABLE}.userrole_name ;; }
#      dimension:  userrole_group  { type: string sql: ${TABLE}.userrole_group ;; }

    dimension:  sold_amount  { type: number sql: ${TABLE}.sold_amount ;; }
    dimension:  returned_amount { type: string sql: ${TABLE}.returned_amount ;; }
    dimension:  sold_volume  { type: string sql: ${TABLE}.orderadmission_sale_action_description ;; }
    dimension:  returned_volume { type: string sql: ${TABLE}.orderadmission_record_state_description ;; }

    measure: total_sold_amount {
      type: sum
      label: "Total Amount Sold"
      value_format_name: usd
      sql:  ${TABLE}.sold_amount ;;
    }

    measure: total_returned_amount {
      type: sum
      label: "Total Amount Returned"
      value_format_name: usd
      sql:  ${TABLE}.returned_amount ;;
    }
    measure: total_net_sold_amount {
      type: sum
      label: "Total Amount"
      value_format_name: usd
      sql:  ${TABLE}.net_sold_amount ;;
    }
    measure: total_sold {
      type: sum
      label: "Total Quantity Sold"
      sql:  ${TABLE}.sold_volume;;
    }

    measure: total_returned {
      type: sum
      label: "Total Quantity Returned"
      sql:  ${TABLE}.returned_volume ;;
    }

    measure: total_volume {
      type: sum
      label: "Total Quantity"
      sql:  ${TABLE}.net_volume ;;
    }

  }
