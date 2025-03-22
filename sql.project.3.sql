# Which customer has spend the most amount

SELECT i.customer_id, c.first_name, c.last_name , SUM(total) as total 
FROM customer c 
join invoice i  
ON c.customer_id = i.customer_id   
GROUP BY i.customer_id, c.first_name, c.last_name   
ORDER BY total desc                             
limit 1; 

