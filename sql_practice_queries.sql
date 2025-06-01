


-- 1. List all customers and their corresponding orders
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- 2. Count total orders per customer
select c.customer_id , count(o.order_id) as total_orders 
from customers c 
join orders o on c.customer_id=o.customer_id 
group by c.customer_id 

-- 3. List product names with their category
SELECT p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id;

-- 4. Show order details with product name and quantity
SELECT oi.order_id, p.product_name, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 5. Total quantity in stock for each product
SELECT p.product_name, SUM(s.quantity) AS total_stock
FROM stocks s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;



-- 6. List staff and the store they work at
SELECT s.first_name, s.last_name, st.store_name
FROM staffs s
JOIN stores st ON s.store_id = st.store_id;

-- 7. Orders handled by a specific staff (e.g., staff_id = 3)
SELECT o.order_id, o.order_date, c.first_name AS customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.staff_id = 3;

-- 8. Display products from brand 'Nike'
SELECT p.product_name
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
WHERE b.brand_name = 'Nike';

-- 9. Customers who have not placed any orders
SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 10. Top 5 best-selling products by quantity
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;



-- 11. Orders with store and staff handling info
SELECT o.order_id, o.order_date, st.store_name, sf.first_name AS staff_name
FROM orders o
JOIN stores st ON o.store_id = st.store_id
JOIN staffs sf ON o.staff_id = sf.staff_id;

-- 12. Stores and the number of orders they processed
SELECT s.store_name, COUNT(o.order_id) AS order_count
FROM stores s
LEFT JOIN orders o ON s.store_id = o.store_id
GROUP BY s.store_name;

-- 13. Products with their price and discount
SELECT p.product_name, oi.list_price, oi.discount
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 14. Staff managing other staff (i.e., managers)
SELECT DISTINCT s1.staff_id, s1.first_name, s1.last_name
FROM staffs s1
JOIN staffs s2 ON s1.staff_id = s2.manager_id;

-- 15. Customers who ordered products in 'Electronics' category
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
WHERE cat.category_name = 'Electronics';



-- 16. Rank products by total quantity sold
SELECT product_id, SUM(quantity) AS total_quantity,
       RANK() OVER (ORDER BY SUM(quantity) DESC) AS product_rank
FROM order_items
GROUP BY product_id;

-- 17. Running total of orders per customer
SELECT customer_id, order_id, order_date,
       COUNT(order_id) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_order_count
FROM orders;

-- 18. Get highest selling product in each category
SELECT category_id, product_id, total_quantity
FROM (
    SELECT p.category_id, p.product_id, SUM(oi.quantity) AS total_quantity,
           RANK() OVER (PARTITION BY p.category_id ORDER BY SUM(oi.quantity) DESC) AS rnk
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.category_id, p.product_id
) ranked_products
WHERE rnk = 1;
