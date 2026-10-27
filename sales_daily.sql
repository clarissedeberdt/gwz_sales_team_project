SELECT
  date_date
  ,SUM(turnover) AS turnover
  ,SUM(turnover) - SUM(purchase_cost) AS margin
FROM gwz_sales
GROUP BY date_date
ORDER BY date_date
