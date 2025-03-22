 # How much amount spent by each customer on artists
 # Return customer_name, artist_name and total_spent
 # find top artist
 
with top_artist  as ( SELECT a.name, a.artist_id,
SUM(il.unit_price*il.quantity) as total_price
FROM artist a
JOIN album al
ON a.artist_id = al.artist_id
JOIN track t
ON t.album_id = al.album_id                        
JOIN invoice_line il                                
ON t.track_id = il.track_id      
GROUP BY a.artist_id, a.name
order by total_price desc
  )
                    
SELECT  c.first_name, a.name, ta.artist_id, ta.total_price,
SUM(il.unit_price*il.quantity) as cust_total_price
FROM customer c
JOIN invoice i
ON c.customer_id = i.customer_id
JOIN invoice_line il
ON il.invoice_id = i.invoice_id
JOIN track t 
ON t.track_id = il.track_id
JOIN album al
ON al.album_id = t.album_id
JOIN top_artist ta
ON ta.artist_id = al.artist_id
JOIN artist a
on a.artist_id = ta.artist_id
GROUP BY  c.first_name, a.name, ta.artist_id , ta.total_price
ORDER by ta.total_price desc

 

