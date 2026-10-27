SELECT
  category_1
  ,SUM(turnover) AS turnover
  ,SUM(purchase_cost) AS purchase_cost
FROM gwz_sales
GROUP BY category_1
