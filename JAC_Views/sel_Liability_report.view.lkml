view: sel_liability_report {
  sql_table_name: mysql_service.Liability_Report ;;

  dimension: last_updated_ar_and_funds_held_date {
    label: "Last Updated Liability Date"
    type: date
  }

  dimension: member_id {
    label: "Member Id"
  }

  dimension: vma_gross_liability {
    label: "VMA Gross Liability"
    type: number
    value_format: "$0.00"
  }
}
