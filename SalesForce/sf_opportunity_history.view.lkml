view: sf_opportunity_history {
  derived_table: {
    sql:
with StateOrders as (
  select '' name, 0 StageValue
  union all
  select 'Qualified', 1
  union all
  select 'Qualified BTI', 1
  union all
  select 'Engaged', 2
  union all
  select 'Evaluation', 3
  union all
  select 'Selected Vendor', 4
  union all
  select 'Short List', 4
  union all
  select 'Commercial Agreement', 5
  union all
  select 'Closed Won', 6
  union all
  select 'Closed Lost', 6
), Field_History as (
Select opportunity_id
  , stage_name new_value
  , coalesce(lag(stage_name) over(PARTITION BY opportunity_id order by created_date),'No Previous Value') old_value
  , created_date
from `new_salesforce.opportunity_history`
where is_deleted = false
), data as(
  select h.opportunity_id
    , h.old_value previous_stage_name
    , h.new_value stage_name
    , ns.StageValue StageValue
    , ps.StageValue previousStageValue
    , h.created_date
    , coalesce(lead(h.created_date) over(PARTITION BY opportunity_id order by h.created_date), current_timestamp() ) next_createdDate
    , row_number() over(PARTITION BY opportunity_id, ns.StageValue order by created_date) rownumber
  from Field_History h
  left join StateOrders ps
    on h.old_value=ps.name
  left join StateOrders ns
    on h.new_value=ns.name
  where old_value <> new_value
  and  coalesce(ns.StageValue,0) > coalesce(ps.StageValue,0)
)

select opportunity_id
  ,stage_name
  ,previous_stage_name
  ,StageValue
  ,previousStageValue
  ,created_date
  ,next_createdDate
from data d
where rownumber = 1;;
  }

  dimension:opportunity_id {}

  dimension:stage_name {
    sql:CASE
          WHEN ${TABLE}.stage_name = 'Qualified BTI' THEN 'Qualified'
          WHEN ${TABLE}.stage_name = 'Short List' THEN 'Selected Vendor (Short List)'
          WHEN ${TABLE}.stage_name = 'Selected Vendor' THEN 'Selected Vendor (Short List)'
          ELSE ${TABLE}.stage_name
          END ;;
    order_by_field: stage_order
  }

  dimension:previous_stage_name {
    label: "Previous Stage Name"
    sql:CASE
          WHEN ${TABLE}.stage_name = 'Qualified BTI' THEN 'Qualified'
          WHEN ${TABLE}.stage_name = 'Short List' THEN 'Selected Vendor (Short List)'
          WHEN ${TABLE}.stage_name = 'Selected Vendor' THEN 'Selected Vendor (Short List)'
          ELSE ${TABLE}.stage_name
          END ;;

      html:
          <a href="https://audienceview2.lightning.force.com/lightning/r/Report/00O4T000001rK6qUAE/edit?queryScope=userFolders">{{ value }}</a> ;;
      order_by_field: previous_stage_order
  }

  dimension:created_date {}

  dimension:next_createdDate {}

  dimension: previous_stage_order{
    hidden: yes
    sql: CASE
            WHEN ${stage_name} = 'Qualified' THEN 1
            WHEN ${stage_name} = 'Engaged' THEN 2
            WHEN ${stage_name} = 'Evaluation' THEN 3
            WHEN ${stage_name} = 'Selected Vendor (Short List)' THEN 4
            WHEN ${stage_name} = 'Commercial Agreement' THEN 5
            WHEN ${stage_name} = 'Closed Won' THEN 6
            WHEN ${stage_name} = 'Closed Lost' THEN 7
            ELSE 99
            END ;;
  }

  dimension: stage_order{
    hidden: yes
    sql: CASE
            WHEN ${stage_name} = 'Qualified' THEN 1
            WHEN ${stage_name} = 'Engaged' THEN 2
            WHEN ${stage_name} = 'Evaluation' THEN 3
            WHEN ${stage_name} = 'Selected Vendor (Short List)' THEN 4
            WHEN ${stage_name} = 'Commercial Agreement' THEN 5
            WHEN ${stage_name} = 'Closed Won' THEN 6
            WHEN ${stage_name} = 'Closed Lost' THEN 7
            ELSE 99
            END ;;
  }

  dimension: Days_In_State{
    sql: TIMESTAMP_DIFF(${next_createdDate}, ${created_date}, DAY);;
  }

  measure: count {}

  measure: sum_Days_In_State {
    type: sum
    label: "Total Days in State"
    sql: ${Days_In_State};;
  }
}
