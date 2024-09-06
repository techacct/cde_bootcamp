SELECT id 
FROM orders 
WHERE gloss_qty > 4000 OR poster_qty > 4000;

SELECT * 
FROM orders 
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

SELECT company_name 
FROM customers 
WHERE (company_name LIKE 'C%' OR company_name LIKE 'W%')
  AND (primary_contact LIKE '%ana%' AND primary_contact NOT LIKE '%eana%');

SELECT region_name, sales_rep_name, account_name
FROM sales_reps sr
JOIN accounts a ON sr.id = a.sales_rep_id
ORDER BY account_name;
