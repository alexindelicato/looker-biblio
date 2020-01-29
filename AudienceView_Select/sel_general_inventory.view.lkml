view: sel_general_inventory {
  sql_table_name: mysql_service.general_inventory ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: initial {
    type: number
    sql: ${TABLE}.initial ;;
    hidden: yes
  }

  dimension: inventory {
    type: number
    hidden: yes
    sql: ${TABLE}.inventory ;;
  }

  measure: ga_inventory {
    type: number
    hidden: yes
    sql: ${TABLE}.inventory ;;
  }

  measure: ga_capacity {
    type: number
    hidden: yes
    sql: ${ga_sold}+${ga_inventory} ;;
  }

  dimension: notforsale {
    type: number
    sql: ${TABLE}.notforsale ;;
    hidden: yes
  }

  dimension: notified {
    type: string
    sql: ${TABLE}.notified ;;
    hidden: yes
  }

  dimension: performanceid {
    type: string
    sql: ${TABLE}.performanceid ;;
    hidden: yes
  }

  dimension: sold {
    type: number
    hidden: yes
    sql: ${TABLE}.sold ;;
  }

  measure: ga_sold {
    type: number
    hidden: yes
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

  measure: sold_count {
    label: "Sold Count"
    type: number
    sql: case when ${sel_venues.venue_type} = 'General Admission' then ${ga_sold}
          when ${sel_venues.venue_type} = 'Reserved' then ${sel_reserved_inventory.res_sold}
          when ${sel_venues.venue_type} = 'Mixed' then ${sel_genbysec_inventory.sum_sold}
          END;;
    required_fields: [sel_venues.venue_type, sel_venues.admission, sel_general_inventory.sold, sel_reserved_inventory.sold]
  }

  measure: inventory_count {
    label: "Inventory Count"
    type: number
    sql: case when ${sel_venues.venue_type} = 'General Admission' then ${ga_inventory}
          when ${sel_venues.venue_type} = 'Reserved' then ${sel_reserved_inventory.res_inventory}
          when ${sel_venues.venue_type} = 'Mixed' then ${sel_genbysec_inventory.mix_inventory}
          END;;
    required_fields: [sel_venues.venue_type, sel_venues.admission,sel_general_inventory.sold,sel_general_inventory.inventory, sel_reserved_inventory.inventory]
  }

  measure: capacity_count {
    label: "Capacity Count"
    type: number
    sql: case when ${sel_venues.venue_type} = 'General Admission' then ${ga_capacity}
          when ${sel_venues.venue_type} = 'Reserved' then ${sel_reserved_inventory.res_capacity}
          when ${sel_venues.venue_type} = 'Mixed' then ${sel_genbysec_inventory.mix_capacity}
          END;;
    required_fields: [sel_venues.venue_type, sel_venues.admission, sel_general_inventory.sold, sel_reserved_inventory.sold, sel_reserved_inventory.held ]
  }

  measure: count {
    type: count
    drill_fields: [id]
    hidden: yes
  }
}
