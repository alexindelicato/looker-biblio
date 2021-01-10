#connection: "fivetran-bigquery"

# include: "*.view.lkml"                       # include all views in this project

include: "/*/*.view"

# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: pro_reporting_client {
  label: "Professional Reporting"
  group_label: "Project Biblio"
  view_label: "Professional Reporting"


  join: pro_reporting_orders1 {
    view_label: "Professional Reporting Orders 1"
    type: left_outer
    relationship: one_to_many
    sql_on: ${pro_reporting_orders1.client_account_client_id}=${pro_reporting_client.client_id} ;;
  }

  join: pro_reporting_orders2 {
    view_label: "Professional Reporting Orders 2"
    type: left_outer
    relationship: one_to_many
    sql_on: ${pro_reporting_orders2.client_account_client_id}=${pro_reporting_client.client_id} ;;
  }


  join: pro_reporting_paysegment {
    view_label: "Professional Reporting Payment Segment Summary"
    type: left_outer
    relationship: one_to_many
    sql_on: ${pro_reporting_paysegment.order_payment_segment_client_id}=${pro_reporting_client.client_id} ;;
  }

}
#--------------------------
