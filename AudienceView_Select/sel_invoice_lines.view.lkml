view: sel_invoice_lines {
  sql_table_name: mysql_service.invoices_lines ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.invoiceid, ${TABLE}.linenumber) ;;
  }

  dimension: invoiceid {
    label: "Invoice ID"
    type: string
  }

  dimension: linenumber {
    label: "Invoice Line Number"
    type: number
  }

  dimension: notation {
    label: "notation"
    type: string
  }
}
