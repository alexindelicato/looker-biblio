view: pro_client_facts {
    derived_table: {
      explore_source: ot_orders {
        column: client_id {}
        column: crm_id { field: ot_report_crm.crm_id }
        column: max_order_date {}
        column: min_order_date {}
        column: total_revenue { field: ot_client_statement.total_revenue }
        column: total_credit_card_processing { field: ot_client_statement.total_credit_card_processing }
        column: count {}
      }
      datagroup_trigger: caching_policy
    }

    dimension: client_id {
      hidden: yes
      type: number
    }

    dimension: crm_id {
      type: string
      primary_key: yes
    }

    dimension: order_count {
      type: number
      sql: ${TABLE}.count ;;
    }

    dimension: health_tier {
      type: tier
      tiers: [100,1000,2000,3000,4000,5000,10000,25000,50000,75000,100000]
      sql: ${order_count} ;;
      style: integer
    }

    dimension: customer_health {
      type: string
      sql: case when ${ot_client.is_churn_risk} then 'At Risk'
              when ${order_count} < 10000 then 'Standard'
              else 'Safe' end ;;
    }
    dimension: account_health {
      sql: ${customer_health};;
      html: {% if value == 'At Risk' %}
              <b><p style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
            {% elsif value == 'Safe' %}
              <b><p style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
            {% else %}
              <b><p style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
            {% endif %}
            ;;
    }



    dimension: total_revenue {
      type: number
      value_format_name: usd
    }
    dimension: total_credit_card_processing {
      type: number
      value_format_name: usd
    }
    dimension: customer_revenue_tier {
      type: tier
      tiers: [500,1000,5000,10000,25000,50000,100000,200000]
      sql: ${total_revenue} ;;
      style: integer
    }

    dimension: Account_Tier {
      type: string
      sql: CASE WHEN ${total_revenue} < 1000 THEN 'Bronze'
              WHEN ${total_revenue} >= 1000 AND ${total_revenue} < 50000 THEN 'Silver'
              Else 'Gold' End;;
    }

    measure: average_client_revenue {
      type: average
      sql: ${total_revenue} ;;
      value_format_name: usd_0
    }

    measure: total_client_revenue {
      type: sum
      sql: ${total_revenue} ;;
      value_format_name: usd_0
    }

    measure: total_credit_card_processing_revenue {
      type: sum
      sql: ${total_credit_card_processing} ;;
      value_format_name: usd_0
    }

    dimension_group: last_order {
      sql: cast(${TABLE}.max_order_date as timestamp) ;;
      type: time
      timeframes: [date,week,month,quarter,year]
    }

    dimension: days_since_last_order {
      sql: DATE_DIFF(current_date,${last_order_date},day) ;;
    }

    dimension_group: first_order {
      sql: cast(${TABLE}.min_order_date as timestamp) ;;
      type: time
      timeframes: [date,week,month,quarter,year]
    }
  }
