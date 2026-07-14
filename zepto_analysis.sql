select * from zepto_v2;

 -- count of rows 
 select count(*) from zepto_v2;
 
 ALTER TABLE zepto_v2
ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
 -- sample data 
 select *from zepto_v2 
 limit300 ;

-- null values 
select * from zepto_v2
where name is null
or
mrp is null
or 
discountPercent is null
or
discountedSellingPrice is null
or 
weightInGms is null
or
availableQuantity is null
or 
outOfStock is null
or 
quantity is null;

-- products in stock vs out of sock
select outofstock ,count(id )
from zepto_v2
group by outOfStock ;


-- Product names present multiple times
SELECT
    name,
    COUNT(id) AS number_of_sku
FROM zepto_v2
GROUP BY name
HAVING COUNT(id) > 1
ORDER BY number_of_sku DESC;

-- top 20 best value products based on discount percent
select distinct name,mrp,discountPercent 
from zepto_v2 
order by discountPercent desc
limit 20 ;
-- products with high mrp
select distinct name,mrp 
from zepto_v2
where outOfStock = true and mrp > 300
order by mrp desc;

-- total rvenu for each type 
select Category ,
sum(discountedSellingPrice*availableQuantity) as total_revenue
from zepto_v2
group by Category
order by total_revenue ;

-- avg price 
SELECT Category,
AVG(mrp) AS average_price
FROM zepto_v2
GROUP BY Category;

-- price per gram
select distinct name,discountedSellingPrice, weightInGms,
round(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto_v2
order by price_per_gram ;

-- weigt category 
select distinct name,weightInGms,
case when weightInGms <1000 then "low"
      when weightInGms <5000 then "medium"
      else "bulk"
      end as weight_category
from zepto_v2 ;

-- category have morthen 20 products 
SELECT Category,
COUNT(*) AS total_products
FROM zepto_v2
GROUP BY Category
HAVING COUNT(*) > 20;

-- top selling project 
SELECT
    category,
    COUNT(*) AS total_products
FROM zepto_v2
GROUP BY category
ORDER BY total_products DESC;

-- most expensive thing catgory
SELECT
    category,
    MAX(mrp) AS highest_price
FROM zepto_v2
GROUP BY category;


-- contribution 80 percent inventory value 
SELECT
name,
SUM(discountedSellingPrice * availableQuantity)
OVER(ORDER BY discountedSellingPrice DESC)
AS cumulative_value
FROM zepto_v2;

















