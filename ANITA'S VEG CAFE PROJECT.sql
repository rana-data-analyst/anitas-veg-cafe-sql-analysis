----                                                            PROJECT OF (ANITA VEG CAFE)



----1. What is the total amount each customer has spent at the café?
SELECT
S.CUSTOMER_ID,
SUM(M.PRICE) AS TOTAL_REVENUE
FROM SALES AS S
JOIN 
MENU AS M
ON S.PRODUCT_ID=M.PRODUCT_ID
GROUP BY S.CUSTOMER_ID;


----2. How many distinct days has each customer placed an order?
SELECT
CUSTOMER_ID,
COUNT(DISTINCT ORDER_DATE) AS UNIQUE_DAYS
FROM SALES 
GROUP BY CUSTOMER_ID
ORDER BY UNIQUE_DAYS DESC;


----3. What was the first dish ordered by each customer?
SELECT 
S.CUSTOMER_ID,
M.PRODUCT_NAME,
MIN(S.ORDER_DATE) AS FIRST_ORDERDATE
FROM SALES AS S
JOIN MENU AS M
ON S.PRODUCT_ID=M.PRODUCT_ID
GROUP BY S.CUSTOMER_ID,M.PRODUCT_NAME;



----4. Which menu item is the most popular overall?
SELECT
M.PRODUCT_NAME,
COUNT(S.PRODUCT_ID) AS HIGHEST_ORDER
FROM SALES AS S
JOIN MENU AS M 
ON S.PRODUCT_ID=M.PRODUCT_ID
GROUP BY M.PRODUCT_NAME
ORDER BY HIGHEST_ORDER DESC;



----5. What is the most frequently ordered dish for each customer?
SELECT
 S.CUSTOMER_ID,
M.PRODUCT_NAME,
COUNT(S.PRODUCT_ID) AS HIGHEST_ORDER
FROM SALES AS S
JOIN MENU AS M 
ON S.PRODUCT_ID=M.PRODUCT_ID
GROUP BY M.PRODUCT_NAME,S.CUSTOMER_ID
ORDER BY HIGHEST_ORDER DESC;




----6. After joining the loyalty program, what dish did each member first order?
SELECT 
S.CUSTOMER_ID,
S.PRODUCT_ID,
ME.PRODUCT_NAME,
MIN(M.JOIN_DATE) AS JONING_DATE
FROM SALES AS S
JOIN MEMBERS AS M
ON S.CUSTOMER_ID=M.CUSTOMER_ID
JOIN MENU AS ME 
ON S.PRODUCT_ID=ME.PRODUCT_ID
GROUP BY S.CUSTOMER_ID,S.PRODUCT_ID,ME.PRODUCT_NAME;

----7. Before joining the loyalty program, what dish did each customer order last?
select
s.customer_id,
max(s.order_date) as last_order_date,
m.product_name,
me.join_date
from sales as s 
join menu as m
on s.product_id=m.product_id
join members as me
on s.customer_id=me.customer_id
group by s.customer_id,m.product_name,me.join_date
order by max(s.order_date) desc;




----8. For each member, how many items and how much did they spend before joining the loyalty program?
select
s.customer_id,
count(s.product_id),
me.join_date,
sum(m.price) as total_spend
from sales as s
join members as me
on s.customer_id=me.customer_id
join menu as m
on s.product_id=m.product_id
where s.order_date < me.join_date
group by s.customer_id,me.join_date
order by total_spend desc;




----9.If each ₹1 = 10 points, and Paneer Butter Masala earns double points, how many points does each customer earn?
SELECT 
    s.customer_id,
    SUM(
        CASE 
            WHEN m.product_name = 'Paneer Butter Masala'
            THEN m.price * 20
            ELSE m.price * 10
        END
    ) AS points
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id;





------ 10. In their first loyalty week (starting from join_date), members earn double points on all items. How many points do Aarav and Meera have by the end of January?

SELECT
    s.customer_id,
    SUM(
        CASE 
            WHEN s.order_date BETWEEN mem.join_date 
                              AND mem.join_date + INTERVAL '6 days'
            THEN m.price * 20
            ELSE 0
        END
    ) AS total_points
FROM sales s
JOIN members mem ON s.customer_id = mem.customer_id
JOIN menu m ON s.product_id = m.product_id
WHERE s.order_date <= '2021-01-31'
GROUP BY s.customer_id;


