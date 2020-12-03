view: sel_OutstandingAR_Report {

  sql_table_name: mysql_service.OutstandingAR_Report ;;

  dimension: member_id {
    label: "Member Id"
    sql: ${TABLE}.vam_id ;;
  }

  dimension: converted_usd {
    label: "AR Owed (USD $)"
    type: number
    value_format: "$0.00"
  }
}
