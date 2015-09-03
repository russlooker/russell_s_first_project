- view: products
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: brand
    sql: ${TABLE}.brand

  - dimension: category
    sql: ${TABLE}.category

  - dimension: department
    sql: ${TABLE}.department

  - dimension: item_name
    sql: ${TABLE}.item_name

  - dimension: rank
    type: int
    sql: ${TABLE}.rank

  - dimension: retail_price
    type: number
    sql: ${TABLE}.retail_price

  - dimension: sku
    sql: ${TABLE}.sku

  - measure: count
    type: count
    drill_fields: [id, item_name, inventory_items.count]

