/*Approved and Canclled orders*/
SELECT 
    online_order, SUM(`Net Profit`) AS Total_Net_Profit
FROM
    transactions
WHERE
    order_status = 'Approved'
GROUP BY online_order;


SELECT 
    online_order, COUNT(`Net Profit`) AS Total_Net_Profit
FROM
    transactions
WHERE
    order_status = 'Cancelled'
GROUP BY online_order;




/*Customers and brand of products purchased*/
select concat(first_name, ' ', last_name) AS Customer_Name, gender, brand
from cust_demography cd
Join transactions ts
on cd.customer_id = ts.customer_id




/*Net Profit by Customer's job_industry_category*/
select cd.job_industry_category, sum(ts.`Net Profit`) As Total_Net_Profit
from cust_demography cd
Join transactions ts On cd.customer_id = ts.customer_id
Where order_status = 'Approved'
group by cd.job_industry_category
order by Total_Net_Profit Desc;





/*Net Profit by state*/
SELECT 
    ca.state,
    CAST(SUM(ts.`Net Profit`) AS DECIMAL (10 , 2 )) AS Total_Net_Profit
FROM
    cust_address ca
        JOIN
    transactions ts ON ca.customer_id = ts.customer_id
WHERE
    order_status = 'Approved'
GROUP BY ca.state
ORDER BY Total_Net_Profit DESC;





/*Net Profit by Customer's wealth_segment*/
SELECT 
    cd.wealth_segment,
    CAST(SUM(ts.`Net Profit`) AS DECIMAL (10 , 2 )) AS Total_Net_Profit
FROM
    cust_demography cd
        JOIN
    transactions ts ON cd.customer_id = ts.customer_id
WHERE
    order_status = 'Approved'
GROUP BY cd.wealth_segment
ORDER BY Total_Net_Profit DESC;





/*Net Profit by Brand*/
SELECT 
    brand,
    CAST(SUM(`Net Profit`) AS DECIMAL (10 , 2 )) AS Total_Net_Profit
FROM
    transactions ts
WHERE
    ts.order_status = 'Approved'
GROUP BY brand
ORDER BY Total_Net_Profit DESC;




/*Total Orders by State*/
SELECT 
    ca.state, COUNT(ts.online_order) AS Total_Orders
FROM
    cust_address ca
        JOIN
    transactions ts ON ca.customer_id = ts.customer_id
WHERE
    order_status = 'Approved'
GROUP BY ca.state
ORDER BY Total_Orders DESC;