view: sf_engagement_request {
  sql_table_name: new_salesforce.engagement_request_c ;;

  dimension: account_id {sql: ${TABLE}.account_c ;;}

  dimension: opportunity_id {sql: ${TABLE}.opportunity_c ;;}

  dimension: is_deleted {}

  dimension: bti_opp {sql: ${TABLE}.bti_opp_c ;;}

  dimension: bti_onboarding_train {sql: ${TABLE}.bti_onboarding_train_c ;;}

  dimension: actual_onboarding_start_date {
    sql: ${TABLE}.actual_onboarding_start_date_c ;;
    type: date
  }

  dimension: actual_go_live_date {
    sql: ${TABLE}.actual_go_live_date_c ;;
    type: date
  }


}
