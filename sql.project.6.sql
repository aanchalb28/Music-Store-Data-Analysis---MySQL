# Return top 10 artist_name by total track count

SELECT a.name, a.artist_id , count(*) as track_count
FROM artist a
JOIN album al
ON a.artist_id = al.artist_id
JOIN track t
ON t.album_id = al.album_id
JOIN genre g
ON t.genre_id = g.genre_id
WHERE g.name = "Rock"
GROUP BY a.name, a.artist_id
ORDER BY track_count desc
LIMIT 10
