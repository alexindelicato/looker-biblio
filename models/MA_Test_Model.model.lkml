include: "/*/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: sel_members_Test {
  from: sel_members
  label: "AV Select Client - Test"
  group_label: "MA Test Model"
  view_label: "AV Select Client"


}
