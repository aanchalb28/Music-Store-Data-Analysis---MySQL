 # Write a query that determines the customer
 # that has spent the most on music for each country
 # Write a query that returns the country along with top customer and how much they spent
 # for countries where the top amount spent is shared, provide all customers who spent this amount
 
 
 with cte as
 (SELECT c.customer_id, c.country, concat(c.first_name, " " , c.last_name) as full_name, 
 round(SUM(i.total),2) as total_amt,
 row_number() over(partition by country order by round(SUM(i.total),2) desc) as row_no
 FROM customer c
 JOIN invoice i
 ON c.customer_id = i.customer_id
 GROUP BY 1,2,3
 ORDER BY 1 ASC, total_amt desc)
 
 SELECT ct.country, ct.full_name,
round(SUM(total),2) as total_amount
 FROM cte ct
 JOIN invoice i
 ON i.customer_id = ct.customer_id
 where row_no<=1
 GROUP BY 1,2
 ORDER BY total_amount desc
 
 