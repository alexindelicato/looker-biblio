view: sel_members_statement_items {
  sql_table_name: SelectAWS_service.members_statement_items;;

  dimension: id{
    primary_key: yes
    hidden: yes
    type: string
  }

  dimension: memberid{
    hidden: yes
    type: string
  }

  dimension: _fivetran_deleted{
    hidden: yes
    type: string
  }

  dimension: description{
    type: string
  }

  dimension: date{
    sql: timestamp_seconds(${TABLE}.timestamp) ;;
    type: string
  }

  measure: MaxDate {
    label: "Max Statement Date"
    type: date
    sql: MAX(${date}) ;;
    convert_tz: no
  }

}
