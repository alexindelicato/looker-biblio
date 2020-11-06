view: sel_transactions_refunds {
  sql_table_name: `mysql_service.transactions_refunds`;;

  dimension: transactionid {}

  dimension: refundid {}

  dimension: settled {}
}
