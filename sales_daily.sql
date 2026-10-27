SELECT
  date_date
  ,SUM(turnover) AS turnover
  ,SUM(turnover_before_promo) - SUM(turnover) AS discount
FROM gwz_sales
GROUP BY date_date
ORDER BY date_date
