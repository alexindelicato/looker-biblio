view: sf_opportunity_businessrisk {
   derived_table: {
     sql: SELECT id
        ,Business_Risk_Detail
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
   dimension: Business_Risk_Detail {
     description: "Business Risk Detail"
     type: string
   }

    measure: count {
      type: count
    }
 }
