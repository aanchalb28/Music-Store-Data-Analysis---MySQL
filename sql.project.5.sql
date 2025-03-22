# Write qyery to return email, last_name, first_name, genre of rock music listeners.
# Return list by email alphabetically ASC

SELECT DISTINCT c.email, c.first_name, c.last_name, g.name
FROM customer c
JOIN invoice i
ON c.customer_id = i.customer_id
JOIN invoice_line il
ON il.invoice_id = i.invoice_id
JOIN track t
ON t.track_id = il.track_id
JOIN genre g
ON g.genre_id = t.genre_id
WHERE g.name = "Rock"
ORDER BY email asc
