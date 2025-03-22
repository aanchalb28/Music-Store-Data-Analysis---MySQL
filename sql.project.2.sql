#What are top 3 values of total invoices

SELECT total FROM public.invoice
order by total DESC
LIMIT 3;
