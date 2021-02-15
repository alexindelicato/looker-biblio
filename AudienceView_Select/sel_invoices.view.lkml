view: sel_invoices {
  sql_table_name: mysql_service.invoices ;;

  dimension: invoiceid {
    label: "Invoice ID"
    primary_key: yes
    type: string
  }

  dimension: memberid {
    label: "Member ID"
    type: string
  }

  dimension: invoicenumber {
    label: "Invoice Number"
    type: number
  }
}
