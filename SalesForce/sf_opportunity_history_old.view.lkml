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
    sql:CASE
    WHEN ${TABLE}.previous_stage_name = 'Qualified BTI' THEN 'Qualified'
    ELSE coalesce(${TABLE}.previous_stage_name, 'No Previous Stage')
    END ;;

    html:
    <a href="https://audienceview2.lightning.force.com/lightning/r/Report/00O4T000001rK6qUAE/edit?queryScope=userFolders">{{ value }}</a> ;;
    order_by_field: previous_stage_order
  }

  dimension: previous_stage_order{
    sql: CASE
    WHEN ${previous_stage_name} = 'Qualified' THEN 1
    WHEN ${previous_stage_name} = 'Engaged' THEN 2
    WHEN ${previous_stage_name} = 'Evaluation' THEN 3
    WHEN ${previous_stage_name} = 'Selected Vendor' THEN 4
    WHEN ${previous_stage_name} = 'Commercial Agreement' THEN 5
    ELSE 0
    END ;;
  }
  measure: count {}
}
