view: sel_patrons_memberships {
  sql_table_name: `fivetran-ovation-tix-warehouse.mysql_service.patrons_memberships`;;

  dimension: patronmembershipid{
    primary_key: yes
    hidden: yes
    type: string
  }

  dimension: allowinfopublished{
    hidden: yes
  }

  dimension_group: created{
    type: time
    sql: timestamp_seconds(${TABLE}.created) ;;
  }

  dimension_group: deleted{
    type: time
    sql: timestamp_seconds(${TABLE}.deleted) ;;
  }

  dimension_group: expires{
    type: time
    sql: timestamp_seconds(${TABLE}.expires) ;;
  }

  dimension: giftmembership{
    hidden: yes
  }

  dimension: membershipid{
    hidden: yes
  }

  dimension: membershiplevelid{
    hidden: yes
  }

  dimension: membershipsaleid{
    hidden: yes
  }

  dimension_group: modified{
    hidden: yes
    type: time
    sql: timestamp_seconds(${TABLE}.expires) ;;
  }

  dimension: secondmembershipcard{
    hidden: yes
  }

  dimension: shipgiftdirectly{
    hidden: yes
  }

  measure: count_active_memberships {
    label: "Total # of Active Memberships"
    type: count_distinct
    drill_fields: [membershipid]
    sql: patronmembershipid ;;

    filters: [expires_date: "after 0 minutes ago"]
  }

  measure: count {
    label: "Total # of Memberships"
    type: count_distinct
    sql: patronmembershipid ;;
    drill_fields: [membershipid]
  }
}
