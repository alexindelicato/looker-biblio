view: sel_general_inventory {
  sql_table_name: mysql_service.general_inventory ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
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
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: initial {
    type: number
    sql: ${TABLE}.initial ;;
  }

  dimension: inventory {
    type: number
    sql: ${TABLE}.inventory ;;
  }

  dimension: notforsale {
    type: number
    sql: ${TABLE}.notforsale ;;
  }

  dimension: notified {
    type: string
    sql: ${TABLE}.notified ;;
  }

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
  }

  dimension: sold {
    type: number
    sql: ${TABLE}.sold ;;
  }
#
#   -- Venue Type = 'G'
# SELECT performanceID, inventory+sold AS Capacity, inventory, sold, notForSale
# FROM general_inventory WHERE performanceID = '630c96b8d6225a5bc7124dd4e32894fb'
# -- Venue Type = 'R'
# SELECT performanceID, (inventory+held+sold) AS caspacity, inventory, held, sold
# FROM reserved_inventory ri WHERE performanceID = 'ca71e19b9ba8f4def16f9e399a5d2670'
# -- Venue Type = 'F'
# -- This is a Flex venue and may have multiple sections, so we need to sum the numbers
# SELECT performanceId, sum(inventory) + sum(held) + sum(sold) AS "capacity",  sum(inventory) AS Inventory, sum(held) AS Held, sum(sold) AS Sold, sum(notForSale)
# FROM genBySec_inventory WHERE performanceID = '13eb90ecc2101fe9ae4d2e7c799b8b91';

#   dimension: is_ga {
#     type: yesno
#     sql: ${sel_venues.admission} = 'G';;
#     hidden: yes
#   }
#
#   dimension: is_reserved {
#     type: yesno
#     sql: ${sel_venues.admission} = 'R';;
#     hidden: yes
#   }
#
#   dimension: is_mixed {
#     type: yesno
#     sql: ${sel_venues.admission} = 'F';;
#     hidden: yes
#   }

  measure: sold_count {
    label: "Sold Count"
    type: number
    sql: case when ${sel_venues.venue_type} = 'General Admission' then ${sold}
          when ${sel_venues.venue_type} = 'Reserved' then ${sel_reserved_inventory.sold}
          when ${sel_venues.venue_type} = ' Mixed' then ${sel_genbysec_inventory.sold}
          END;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
