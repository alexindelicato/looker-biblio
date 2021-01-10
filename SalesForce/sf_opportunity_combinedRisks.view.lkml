view: sf_opportunity_combinedRisks {
  derived_table: {
    sql: SELECT id
      ,Feature_Gap_Detail Risk
      FROM `fivetran-ovation-tix-warehouse.new_salesforce.opportunity`,
      unnest(SPLIT(feature_gap_c , ";")) as Feature_Gap_Detail
      where feature_gap_c is not null

      union all

      SELECT id
        ,Business_Risk_Detail Risk
        FROM `fivetran-ovation-tix-warehouse.new_salesforce.opportunity`,
        unnest(SPLIT(Business_Risk_Detail_c, ";")) as Business_Risk_Detail
        where Business_Risk_Detail_c is not null
       ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: Risk {
    description: "Risk"
    type: string
  }

  measure: count {
    type: count

  }
}
