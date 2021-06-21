1. ALTER TABLE address ADD district VARCHAR(40);
 UPDATE address SET district='Morang' WHERE city='Jhapa';
 UPDATE address SET district='Sunsari' WHERE city='Itahari' OR city='Dharan';
 UPDATE address SET district='Jhapa' WHERE city='Jhapa';
 UPDATE address SET district='Lalitpur' WHERE city='Lalitpur';
 UPDATE address SET district='Kathmandu' WHERE city='Kathmandu';

2.  SELECT P.product_name,sum(O.quantity) AS total_sales FROM product P INNER JOIN order_product O ON P.product_id=O.product_id
  GROUP BY P.product_name;

3.  UPDATE customer SET customer_name='Bidesh Basnet' WHERE customer_id='C1';

4.  SELECT C.customer_name,P.product_name,OP.quantity,O.order_date FROM customer C INNER JOIN order_details O ON C.customer_id=O.customer_id
    INNER JOIN order_product OP ON OP.order_id=O.order_id INNER JOIN product P ON P.product_id=OP.product_id;

5. SELECT * FROM(SELECT P.product_name, SUM(OP.quantity) as total_sales FROM order_product OP INNER JOIN product P ON OP.product_id=P.product_id
    GROUP BY P.product_name ORDER BY SUM(OP.quantity) DESC) WHERE ROWNUM=1;

6.  SELECT C.customer_name,P.product_name FROM product P INNER JOIN order_product OP ON P.product_id=OP.product_id
    INNER JOIN order_details OD ON OD.order_id=OP.order_id INNER JOIN customer C ON C.customer_id=OD.customer_id
    WHERE OD.order_date=TO_DATE('2020-06-25','YYYY-MM-DD');

7.  SELECT C.customer_id,C.customer_name,A.address_id,A.country,A.zone,A.city,A.district
   FROM customer_address CA INNER JOIN customer C ON CA.customer_id=C.customer_id
   INNER JOIN address A ON A.address_id=CA.address_id INNER JOIN order_details OD ON OD.customer_id=C.customer_id
   INNER JOIN order_product OP ON OP.order_id=OD.order_id GROUP BY C.customer_id,C.customer_name,A.address_id,A.country,A.zone,A.city,A.district
   HAVING COUNT(OP.product_id)>2;

8.  SELECT P.product_name,SUM(OP.quantity*P.unit_price) as total_earned FROM order_product OP INNER JOIN product P ON OP.product_id=P.product_id
    GROUP BY product_name;

9. SELECT C.customer_name,P.product_name FROM order_details OD INNER JOIN customer C ON C.customer_id=OD.customer_id
    INNER JOIN order_product OP ON OP.order_id=OD.order_id INNER JOIN product P ON P.product_id=OP.product_id
    GROUP BY C.customer_name,P.product_name
    HAVING SUM(OP.quantity)>=(SELECT MAX(purchase_quantity) FROM
    (SELECT SUM(quantity) purchase_quantity FROM order_product GROUP BY product_id));

