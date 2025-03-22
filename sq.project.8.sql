 # Return each country along with top most genre(highest number of quantity sold- only 1)
 # (Return all countries with genres along with max purchase)
 
with cte as (SELECT c.country , g.name, count(il.quantity) as purchase,
row_number() over(partition by c.country order by count(il.quantity)desc) as row_no
FROM invoice_line il
JOIN invoice i
ON i.invoice_id = il.invoice_id
JOIN customer c
ON c.customer_id = i.customer_id
JOIN track t 
ON t.track_id= il.track_id
JOIN genre g
ON g.genre_id = t.genre_id
GROUP BY c.country, g.name
ORDER BY c.country, purchase desc
)
SELECT * FROM cte
where row_no <=1
 


 
  