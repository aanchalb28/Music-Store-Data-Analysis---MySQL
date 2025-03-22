# Whic city has highest total, return city name with total

SELECT billing_city, SUM(total) as total 
FROM invoice
group by billing_city
order by total desc
limit 1


