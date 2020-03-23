connection: "fivetran-bigquery"

# include: "*.view.lkml"                       # include all views in this project

include: "/*/*.view"

# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: pro_reporting_client {
  label: "Professional Reporting"
  group_label: "Project Biblio"
  view_label: "Professional Reporting"

  join: pro_reporting_paysegment {
    view_label: "Reporting Payment Segment Summary"
    type: left_outer
    relationship: one_to_many
    sql_on: ${pro_reporting_paysegment.order_payment_segment_client_id}=${pro_reporting_client.client_id} ;;
  }

}
#--------------------------
