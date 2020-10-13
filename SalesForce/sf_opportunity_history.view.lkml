view: sf_BTI_opportunity_win_lose_history {
  derived_table: {
    sql:
with data as(
select h.opportunity_id
  , h.old_value previous_stage_name
  , h.new_value stage_name
  , row_number() over(PARTITION BY opportunity_id order by h.created_date) row_number
from `new_salesforce.opportunity_field_history` h
join `new_salesforce.opportunity` o
  on o.id = h.opportunity_id
where field ='StageName'
  and o.bti_opp_c = true
  and o.not_in_current_bti_scope_c = false
  and h.new_value in ('Closed Lost', 'Closed Won'))
select *
from data
where row_number = 1;;
  }
  dimension:opportunity_id {}
  dimension:stage_name {}
  dimension:previous_stage_name {
    label: "Previous Stage Name"
    sql:coalesce(${TABLE}.previous_stage_name, 'No Previous Stage');;
    html:
    <a href="https://audienceview2.lightning.force.com/lightning/r/Report/00O4T000001rK6qUAE/edit?queryScope=userFolders">{{ value }}</a> ;;
  }
  measure: count {}
}
