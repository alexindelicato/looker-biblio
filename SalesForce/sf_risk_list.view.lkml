view: sf_risk_list {
  derived_table: {
    sql: With vd as (SELECT id,
          split(product_gaps_and_risks_c, ";")  AS risk
      FROM `fivetran-ovation-tix-warehouse.new_salesforce.opportunity` as sf_risk_opp
      )

          select id, v as ve from vd, unnest(risk) v
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
    label: "Product Gaps and Risks"
    sql: ${TABLE}.ve ;;
#     html:
#     <b><p style="color: red; background-color: #FFFFFF; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b> ;;
  }

  set: detail {
    fields: [id, ve]
  }
}
