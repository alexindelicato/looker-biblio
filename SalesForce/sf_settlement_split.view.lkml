view: sf_settlement {
  derived_table: {
    sql: With vd as (SELECT id,
          split(sf_case.test_settlement_period_c, ";")  AS split
      FROM `fivetran-ovation-tix-warehouse.new_salesforce.case` as sf_case
      )

          select id, v as ve from vd, unnest(split) v
       ;;
  }

  measure: count {
    type: count
    drill_fields: [sf_accounts.name,sf_accounts.referenceability_c,ve,sf_risk_opp.amount,ve,sf_risk_opp.functional_gaps_c,sf_risk_opp.amount,sf_risk_opp.stage_name,sf_risk_opp.license_sale_type_c,sf_risk_opp.jira_url_c]
  }

  measure: count_partner {
    type: count
    drill_fields: [sf_accounts.name,sf_risk_list.ve,sf_risk_opp.functional_gaps_c,sf_risk_opp.partner_unit_revenue_c,sf_risk_opp.license_sale_type_c,sf_risk_opp.jira_url_c]
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: ve {
    type: string
    label: "Settlement Period"
    sql: ${TABLE}.ve ;;
  }

  set: detail {
    fields: [id, ve]
  }
}
