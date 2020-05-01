view: sel_nps_scores {
  derived_table: {
    sql:
      SELECT
      sel_nps_scores_client_name,
      max_nps_date,
      score,
      nps_date
      FROM
      (
      SELECT
        client_name AS sel_nps_scores_client_name,
        MAX( nps_date ) as max_nps_date
      FROM `fivetran-ovation-tix-warehouse.mysql_service.nps_scores`
      GROUP BY 1
      ) as t1
      INNER JOIN `fivetran-ovation-tix-warehouse.mysql_service.nps_scores` on client_name = t1.sel_nps_scores_client_name
      and nps_date = t1.max_nps_date
      ;;}



  dimension: sel_nps_scores_client_name {
    label: "Client Name"
    type: string
    sql: ${TABLE}.sel_nps_scores_client_name ;;
  }


  dimension_group: nps {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.nps_date ;;
  }

  dimension_group: max_nps_date {
    label: "Most Recent"
    type: time
    sql: ${TABLE}.max_nps_date ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }
}
