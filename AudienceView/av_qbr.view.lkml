view: av_qbr {
  derived_table: {
    sql:
      SELECT
        UUID,
        client_name,
        sf_client_name,
        sf_client_id,
        client_time_zone,
        client_vertical,
        client_region,
        -- Need a better way to get the Box Office Currency (Not SF Billing Currency)
        case
          when client_region = 'Canada' THEN 'CDN'
          when client_region = 'EMEA' THEN 'GBP'
          when client_region = 'Philippines' THEN 'PHP'
          when client_region = 'United Kingdom' THEN 'GBP'
          when client_region = 'United States' THEN 'USD'
          else 'USD'
        end as client_currency_code,
        cast(client_metric_date_time as STRING) as client_metric_full_date_time,
        cast(concat(replace(client_metric_date_time, '.', '-'), ':00') as TIMESTAMP) as client_metric_time,
        year,
        quarter,
        userrole_name,
        userrole_group,
        case when client_metric in (
        'AdHoc', 'BI', 'CallLog', 'CancelTickets', 'Custom', 'Delivery', 'Email', 'Forwarding',
        'Gifter', 'Invoice', 'Message', 'Offer', 'Referrer', 'TaxRecipient', 'ThankYouLetter',
        'both', 'combined', 'normal'
        )  then 'Correspondence Sent' else client_metric end as client_metric,
        client_metric_value,
        sum(case when client_metric='Bundle Admission Amount' then client_metric_value else null end) as  bundle_admission_amount,
        sum(case when client_metric='Bundle Admission Volume' then client_metric_value else null end) as  bundle_admission_volume,
        sum(case when client_metric='Bundle Amount' then client_metric_value else null end) as  bundle_amount,
        sum(case when client_metric='Bundle Volume' then client_metric_value else null end) as  bundle_volume,
        sum(case when client_metric='Customer Pass Volume' then client_metric_value else null end) as  customer_pass_volume,
        sum(case when client_metric='Donation Amount' then client_metric_value else null end) as  donation_amount,
        sum(case when client_metric='Donation Volume' then client_metric_value else null end) as  donation_volume,
        sum(case when client_metric='Gift Certificate Amount' then client_metric_value else null end) as  gift_certificate_amount,
        sum(case when client_metric='Gift Certificate Volume' then client_metric_value else null end) as  gift_certificate_volume,
        sum(case when client_metric='Misc Item Amount' then client_metric_value else null end) as  misc_item_amount,
        sum(case when client_metric='Misc Item Volume' then client_metric_value else null end) as  misc_item_volume,
        sum(case when client_metric='Order Total Amount' then client_metric_value else null end) as  order_total_amount,
        sum(case when client_metric='Order Total Volume' then client_metric_value else null end) as  order_total_volume,
        sum(case when client_metric='Service Charge Amount' then client_metric_value else null end) as  service_charge_amount,
        sum(case when client_metric='Service Charge Volume' then client_metric_value else null end) as  service_charge_volume,
        sum(case when client_metric='Single Admission Amount' then client_metric_value else null end) as  single_admission_amount,
        sum(case when client_metric='Single Admission Volume' then client_metric_value else null end) as  single_admission_volume,
        sum(case when client_metric='Sold Admission Volume' then client_metric_value else null end) as  sold_admission_volume,
        sum(case when client_metric='Comp Admission Volume' then client_metric_value else null end) as comp_admission_volume,
        sum(case when client_metric='Customer Memberships Volume' then client_metric_value else null end) as customer_memberships_volume,
        sum(case when client_metric='Customer Spend Amount' then client_metric_value else null end) as customer_spend_amount,
        sum(case when client_metric='New Customer Volume' then client_metric_value else null end) as new_customer_volume,
        sum(case when client_metric='Notes Assigned Volume' then client_metric_value else null end) as notes_assigned_volume,
        sum(case when client_metric='Notes Created Volume' then client_metric_value else null end) as notes_created_volume,
        sum(case when client_metric='Online New Customer Volume' then client_metric_value else null end) as online_new_customer_volume,
        sum(case when client_metric in (
        'AdHoc', 'BI', 'CallLog', 'CancelTickets', 'Custom', 'Delivery', 'Email', 'Forwarding',
        'Gifter', 'Invoice', 'Message', 'Offer', 'Referrer', 'TaxRecipient', 'ThankYouLetter',
        'both', 'combined', 'normal'
        )  then client_metric_value else null end) as correspondence_sent_volume
      FROM audienceview.qbr_data
      WHERE client_metric_value != 0
      GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16

      -- ORDER BY client_metric_time
           ;;

      sql_trigger_value: select max(client_metric_date_time) from `fivetran-ovation-tix-warehouse.audienceview.qbr_data`;;
    }



    measure: total_client_metric_value {
      type:  sum
      value_format_name: decimal_0
      label: "Total Volume"
      sql: ${TABLE}.client_metric_value ;;
    }



    dimension: UUID {
      primary_key: yes
      hidden: yes
      type: string
      sql: ${TABLE}.uuid ;;
    }


    # DATETIME data type breaks filters, CAST to TIMESTAMP

    dimension_group: client_metric_time {
      type: time
      sql: ${TABLE}.client_metric_time ;;
    }

    dimension: client_metric_full_date_time {
      type: string
      sql: ${TABLE}.client_metric_full_date_time ;;
    }

    dimension: client_metric {
      type: string
      sql: ${TABLE}.client_metric ;;
    }

    dimension: client_metric_amounts {
      type: string
      sql:
          CASE
            WHEN ${TABLE}.client_metric like '%Amount'
              AND ${TABLE}.client_metric NOT IN ( 'Customer Spend Amount', 'Order Total Amount' )
            THEN ${TABLE}.client_metric
           ELSE NULL
          END
          ;;
    }

    dimension: client_metric_volumes {
      type: string
      sql:
          CASE
            WHEN ${TABLE}.client_metric like '%Volume'
              AND ${TABLE}.client_metric NOT IN (
                'Sold Admission Volume',
                'Order Total Amount',
                'Comp Admission Volume',
                'New Customer Volume',
                'Notes Created Volume',
                'Customer Pass Volume',
                'Customer Memberships Volume',
                'Notes Assigned Volume',
                'Online New Customer Volume',
                'Order Total Volume'
              )
            THEN ${TABLE}.client_metric
            ELSE NULL
          END
          ;;
    }

    dimension: client_metric_value {
      type: string
      sql: ${TABLE}.client_metric_value ;;
    }

    dimension: client_name {
      type: string
      sql: ${TABLE}.client_name ;;
    }

    dimension: sf_client_name {
      type: string
      sql: ${TABLE}.sf_client_name ;;
    }

    dimension: sf_client_id {
      type: string
      sql: ${TABLE}.sf_client_id ;;
    }

    dimension: client_time_zone {
      type: string
      sql: ${TABLE}.client_time_zone ;;
    }

    dimension: client_vertical {
      type: string
      sql: ${TABLE}.client_vertical ;;
    }

    dimension: client_currency_code {
      type: string
      sql: ${TABLE}.client_currency_code ;;
    }

    dimension: client_region {
      type: string
      sql: ${TABLE}.client_region ;;
    }

    dimension: year {
      type: number
      sql: ${TABLE}.year ;;
    }

    dimension: quarter {
      type: string
      sql: ${TABLE}.quarter ;;
    }

    dimension: userrole_name {
      type: string
      sql: ${TABLE}.userrole_name ;;
    }

    dimension: userrole_group {
      type: string
      sql: ${TABLE}.userrole_group ;;
    }

    measure:total_bundle_admission_amount { type: sum sql: ${TABLE}.bundle_admission_amount ;; drill_fields: [qbr_order_amount_detail*] }
    measure:total_bundle_admission_volume { type: sum sql: ${TABLE}.bundle_admission_volume ;; drill_fields: [qbr_order_volume_detail*] }
    measure:total_bundle_amount { type: sum sql: ${TABLE}.bundle_amount ;; drill_fields: [qbr_order_amount_detail*] }
    measure:total_bundle_volume { type: sum sql: ${TABLE}.bundle_volume ;; drill_fields: [qbr_order_volume_detail*] }
    measure:total_customer_pass_volume { type: sum sql: ${TABLE}.customer_pass_volume ;; }
    measure:total_donation_amount { type: sum sql: ${TABLE}.donation_amount ;; drill_fields: [qbr_order_amount_detail*] }
    measure:total_donation_volume { type: sum sql: ${TABLE}.donation_volume ;; drill_fields: [qbr_order_volume_detail*] }
    measure:total_gift_certificate_amount { type: sum sql: ${TABLE}.gift_certificate_amount ;; drill_fields: [qbr_order_amount_detail*] }
    measure:total_gift_certificate_volume { type: sum sql: ${TABLE}.gift_certificate_volume ;; drill_fields: [qbr_order_volume_detail*] }
    measure:total_misc_item_amount { type: sum sql: ${TABLE}.misc_item_amount ;; drill_fields: [qbr_order_amount_detail*] }
    measure:total_misc_item_volume { type: sum sql: ${TABLE}.misc_item_volume ;; drill_fields: [qbr_order_volume_detail*] }
    measure:total_order_total_amount { type: sum sql: ${TABLE}.order_total_amount ;; drill_fields: [qbr_order_total_detail*] }
    measure:total_order_total_volume { type: sum sql: ${TABLE}.order_total_volume ;; drill_fields: [qbr_order_total_detail*] }
    measure:total_service_charge_amount { type: sum sql: ${TABLE}.service_charge_amount ;; drill_fields: [qbr_order_amount_detail*] }
    measure:total_service_charge_volume { type: sum sql: ${TABLE}.service_charge_volume ;; drill_fields: [qbr_order_volume_detail*] }
    measure:total_single_admission_amount { type: sum sql: ${TABLE}.single_admission_amount ;; drill_fields: [qbr_order_amount_detail*] }
    measure:total_single_admission_volume { type: sum sql: ${TABLE}.single_admission_volume ;; drill_fields: [qbr_order_volume_detail*] }
    measure:total_sold_admission_volume { type: sum sql: ${TABLE}.sold_admission_volume ;; }
    measure:total_comp_admission_volume { type: sum sql: ${TABLE}.comp_admission_volume ;; }
    measure:total_customer_memberships_volume { type: sum sql: ${TABLE}.customer_memberships_volume ;; }
    measure:total_customer_spend_amount { type: sum sql: ${TABLE}.customer_spend_amount ;; }
    measure:total_new_customer_volume { type: sum sql: ${TABLE}.new_customer_volume ;; }
    measure:total_notes_assigned_volume { type: sum sql: ${TABLE}.notes_assigned_volume ;; }
    measure:total_notes_created_volume { type: sum sql: ${TABLE}.notes_created_volume ;; }
    measure:total_online_new_customer_volume { type: sum sql: ${TABLE}.online_new_customer_volume ;; }
    measure:total_correspondence_sent_volume { type: sum sql: ${TABLE}.correspondence_sent_volume ;; }

    measure: total_ticket_amount {
      label: "Total Ticket Amount"
      type: number
      sql: ${total_bundle_admission_amount}+${total_single_admission_amount} ;;
    }

    measure: total_order_item_amounts {
      type: sum
      sql: coalesce(${TABLE}.bundle_admission_amount,${TABLE}.bundle_amount,${TABLE}.donation_amount,${TABLE}.gift_certificate_amount,${TABLE}.misc_item_amount,${TABLE}.service_charge_amount,${TABLE}.single_admission_amount);;
      drill_fields: [qbr_order_amount_detail*,
        -total_bundle_admission_amount,
        -total_bundle_amount,
        -total_donation_amount,
        -total_gift_certificate_amount,
        -total_misc_item_amount,
        -total_service_charge_amount,
        -total_single_admission_amount
      ]
    }

    measure: total_order_item_volumes {
      type: sum
      sql: coalesce(
              ${TABLE}.bundle_admission_volume,
              ${TABLE}.bundle_volume,
              ${TABLE}.donation_volume,
              ${TABLE}.gift_certificate_volume,
              ${TABLE}.misc_item_volume,
              ${TABLE}.service_charge_volume,
              ${TABLE}.single_admission_volume
            ) ;;
      drill_fields: [qbr_order_volume_detail*,
        -total_bundle_admission_volume,
        -total_bundle_volume,
        -total_donation_volume,
        -total_gift_certificate_volume,
        -total_misc_item_volume,
        -total_service_charge_volume,
        -total_single_admission_volume
      ]
      value_format_name: decimal_0
    }

    measure: total_ticket_volume {
      type: sum
      sql: coalesce(${TABLE}.bundle_admission_volume,${TABLE}.single_admission_volume) ;;
      drill_fields: [qbr_ticket_detail*,
        -total_bundle_admission_volume,
        -total_single_admission_volume,
        total_ticket_volume]
      value_format_name: decimal_0
    }
    measure: average_ticket_amount {
      type: average
      sql: ${TABLE}.single_admission_amount;;
      drill_fields: [qbr_ticket_detail*,
        -total_bundle_admission_volume,
        -total_single_admission_volume,
        total_ticket_volume]
      value_format_name: decimal_0
    }
    set: qbr_order_total_detail {
      fields: [
        client_name,
        client_time_zone,
        client_vertical,
        client_region,
        total_order_total_amount,
        total_order_total_volume
      ]
    }

    set: qbr_order_amount_detail {
      fields: [
        client_name,
        client_time_zone,
        client_vertical,
        client_region,
        total_bundle_admission_amount,
        total_bundle_amount,
        total_donation_amount,
        total_gift_certificate_amount,
        total_misc_item_amount,
        total_service_charge_amount,
        total_single_admission_amount
      ]
    }

    set: qbr_order_volume_detail {
      fields: [
        client_name,
        client_time_zone,
        client_vertical,
        client_region,
        total_bundle_admission_volume,
        total_bundle_volume,
        total_donation_volume,
        total_gift_certificate_volume,
        total_misc_item_volume,
        total_service_charge_volume,
        total_single_admission_volume
      ]
    }

    set: qbr_ticket_detail {
      fields: [
        client_name,
        client_time_zone,
        client_vertical,
        client_region,
        total_bundle_admission_volume,
        total_single_admission_volume,
        total_ticket_volume
      ]
    }

  }