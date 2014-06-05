﻿DROP TABLE IF EXISTS PreCompProductsRow; 
CREATE TABLE PreCompProductsRow AS 
(select sum(sales.quantity*sales.price) as total, products.name,
users.state, products.cid
from (sales INNER JOIN users ON sales.uid = users.id) RIGHT OUTER JOIN
products
ON products.id = sales.pid GROUP BY users.state, products.name,
products.cid);

DROP TABLE IF EXISTS PreCompStaCusCol; 
CREATE TABLE PreCompStaCusCol AS
(select sum(sales.quantity*sales.price) as total, users.name, users.state,
products.cid
from (sales INNER JOIN users ON sales.uid = users.id) RIGHT OUTER JOIN
products
ON products.id = sales.pid
GROUP BY users.state, users.name, products.cid );

DROP TABLE IF EXISTS PreCompCells; 
CREATE TABLE PreCompCells AS
(SELECT SUM(quantity* sales.price) AS total, products.name, users.state, users.name AS nam
     FROM sales 
          INNER JOIN products ON sales.pid = products.id 
          RIGHT OUTER JOIN users ON users.id = sales.uid 
     GROUP BY users.state, products.name, users.name)