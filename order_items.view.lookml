- view: order_items
  sql_table_name: order_items
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: inventory_item_id
    type: int
    # hidden: true
    sql: ${TABLE}.inventory_item_id

  - dimension: order_id
    type: int
    # hidden: true
    sql: ${TABLE}.order_id
    
  - dimension: user_and_order
    sql: CONCAT( ${users.first_name},' ',${order_id})

  - dimension_group: returned
    type: time
    timeframes: [time, date, week, month, day_of_week, month_num, year]
    sql: ${TABLE}.returned_at
    
  - dimension: is_returned
    type: yesno
    sql: ${returned_time} is not null
    
  - dimension: sale_price
    type: number
    sql: ${TABLE}.sale_price
    
  - dimension: twice_the_sales_price_man
    sql: ${sale_price} * 2 * 2 * 2
    
  - measure: total_sale_price
    type: sum
    sql: ${sale_price}
    
  - measure: total_returned_sale_price
    type: sum
    sql: ${sale_price}
    filters:
      is_returned: 'yes'
      
  - measure: percent_revenue_returned
    type: number
    value_format: '#.#\%'
    sql: 100.0 * ${total_returned_sale_price} / nullif(${total_sale_price},0)

  - measure: count
    type: count
    drill_fields: [users.first_name, users.last_name, products.item_name, sale_price]
    
  - measure: count_unique_order_items
    type: count_distinct
    sql: ${id}
    
    
    

