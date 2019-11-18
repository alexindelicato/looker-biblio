connection: "fivetran-bigquery"

# include all views from all folders
include: "/*/*.view"

datagroup: biblio_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: biblio_default_datagroup

# salesforce account explore as primary table
explore: sf_accounts {
  label: "Salesforce Accounts"
  group_label: "Project Biblio"
  view_label: "Salesforce Accounts"
  fields: [ALL_FIELDS*]
  sql_always_where: ${sf_accounts.is_deleted}= FALSE;;

  join: sf_opportunity {
    view_label: "Salesforce Opportunitiy"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_accounts.id}=${sf_opportunity.account_id} AND  ${sf_opportunity.is_deleted}= FALSE;;
  }

  join: sf_user {
    view_label: "Salesforce Users"
    type: left_outer
    relationship: one_to_many
    sql_on: ${sf_user.id}=${sf_accounts.owner_id};;
  }
}

# salesforce opportunity explore as primary table
explore: sf_opportunity {
  label: "Salesforce Opportunity"
  group_label: "Project Biblio"
  view_label: "Salesforce Opportunity"
  fields: [ALL_FIELDS*]
  sql_always_where: ${sf_opportunity.is_deleted}= FALSE;;
}
