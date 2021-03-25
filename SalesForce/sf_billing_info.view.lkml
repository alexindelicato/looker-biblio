view: sf_billing_info {
  sql_table_name: new_salesforce.billing_info_c ;;

  dimension: account_id {sql: ${TABLE}.account_c ;;}

  dimension: id {sql: ${TABLE}.account_c ;;}

  dimension: is_deleted {}

  dimension: netsuite_id {
    sql: ${TABLE}.netsuite_id_c ;;
    type: string
  }
}
