view: sel_memberships {
  sql_table_name: `fivetran-ovation-tix-warehouse.SelectAWS_service.memberships`;;

  dimension: membershipid{
    primary_key: yes
    hidden: yes
    type: string
  }

  dimension: memberid{
    hidden: yes
    type: string
  }
}
