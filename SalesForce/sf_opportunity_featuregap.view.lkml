view: sf_opportunity_featuregap {
  derived_table: {
    sql: SELECT id
      ,Feature_Gap_Detail
      FROM `fivetran-ovation-tix-warehouse.new_salesforce.opportunity`,
      unnest(SPLIT(feature_gap_c , ";")) as Feature_Gap_Detail
      where feature_gap_c is not null
       ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: Feature_Gap_Detail {
    description: "Feature Gap Detail"
    type: string
  }

  measure: count {
    type: count
  }
}
