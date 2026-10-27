SELECT
  date_date
  ,SUM(turnover) OVER (ORDER BY date_date) / 1000 AS turnover
  ,SUM(margin) OVER (ORDER BY date_date) / 1000 AS margin
  ,SUM(discount) OVER (ORDER BY date_date) / 1000 AS discount
FROM (
  SELECT
    date_date
    ,SUM(turnover) AS turnover
    ,SUM(turnover) - SUM(purchase_cost) AS margin
    ,SUM(turnover_before_promo) - SUM(turnover) AS discount
  FROM gwz_sales
  GROUP BY date_date
) AS daily
ORDER BY date_date
