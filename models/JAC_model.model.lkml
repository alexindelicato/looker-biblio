connection: "fivetran-bigquery"

# include all views from all folders
include: "/*/*.view"

explore: JAC_MasterFactFile {
  label: "JAC_MasterFactFile"
  group_label: "Test JAC Explores"
  view_label: "JAC_MasterFactFile"
}
