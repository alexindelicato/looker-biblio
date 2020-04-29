view: sf_settlement_split {
  derived_table: {
    sql: With vd as (SELECT id,
          split(sf_case.select_your_settlement_period_sf_c, ";")  AS split
      FROM `fivetran-ovation-tix-warehouse.new_salesforce.case` as sf_case
      )

          select id, v as ve from vd, unnest(split) v
       ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [sf_accounts.name,sf_accounts.referenceability_c,ve,sf_risk_opp.amount,ve,sf_risk_opp.functional_gaps_c,sf_risk_opp.amount,sf_risk_opp.stage_name,sf_risk_opp.license_sale_type_c,sf_risk_opp.jira_url_c]
  }

  measure: count_partner {
    type: count
    hidden: yes
    drill_fields: [sf_accounts.name,sf_risk_list.ve,sf_risk_opp.functional_gaps_c,sf_risk_opp.partner_unit_revenue_c,sf_risk_opp.license_sale_type_c,sf_risk_opp.jira_url_c]
  }

  dimension: id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: ve {
    type: string
    label: "Settlement Period Split"
    hidden: yes
    sql: ${TABLE}.ve ;;
  }

  set: detail {
    fields: [id, ve]
  }
}
