use PGA13
Select * from item1
Select * from orders

#1.Show only those items for which at least one order has been placed
Select i.item_id , i.item_name
from item1 i
inner join orders o
on i.item_id = o.item_id

#2.Show all items, including those items for which no order has been placed.
Select i.item_id,i.item_name
from item1 i
left join orders o
on i.item_id = o.item_id

#3.Show only the items that have never been ordered.
Select i.item_id,i.item_name
from item1 i
left join orders o
on i.item_id = o.item_id
where o.item_id is NULL

#4.Show all orders along with the item name that was ordered.
Select  o.order_id ,  i.item_name
from orders o
left join item1 i
on o.item_id = i.item_id

#5.Show all items and the customers who purchased them. 
#If an item has not been purchased, still display the item.
Select i.item_name , o.customer_name
from item1 i
left join orders o
on i.item_id = o.item_id

#6.Find the items that have orders placed by customers from Delhi.
Select i.item_name , o.city
from item1 i
inner join orders o
on i.item_id = o.item_id
where o.city = "Delhi"

#7.Display the item name and customer name for items that have been ordered.
Select i.item_name , o.customer_name
from item1 i
inner join orders o
on i.item_id = o.item_id

#8.Find all items that have not received any orders.
Select i.item_name 
from item1 i
left join orders o
on i.item_id = o.item_id
where o.item_id is NULL

#9.Display every item and the number of orders placed for each item, including items with zero orders.
Select i.item_id, i.item_name , count(o.order_id) as no_of_orders
from item1 i
left join orders o
on i.item_id = o.item_id
group by i.item_id, i.item_name

#10.Display only those items whose total ordered quantity is greater than 1.
Select i.item_id,i.item_name , sum(o.quantity) as total_ordered_qty
from item1 i
inner join orders o
on i.item_id = o.item_id
group by i.item_id, i.item_name
having sum(o.quantity)>1

#11.


