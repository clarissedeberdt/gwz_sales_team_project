SELECT
  date_date
  ,category_1
  ,ROUND(turnover_before_promo, 2) AS turnover_before_promo
  ,ROUND(margin, 2) AS margin
FROM (
  SELECT
    date_date
    ,category_1
    ,SUM(turnover_before_promo) OVER (PARTITION BY category_1 ORDER BY date_date) / 1000 AS turnover_before_promo
    ,SUM(margin) OVER (PARTITION BY category_1 ORDER BY date_date) / 1000 AS margin
  FROM (
    SELECT
      date_date
      ,category_1
      ,SUM(turnover_before_promo) AS turnover_before_promo
      ,SUM(turnover) - SUM(purchase_cost) AS margin
    FROM gwz_sales
    GROUP BY date_date, category_1
  ) AS daily
) AS unrounded
ORDER BY category_1, date_date
