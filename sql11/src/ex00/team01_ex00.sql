WITH last_update AS (SELECT DISTINCT id, rate_to_usd,updated FROM currency ORDER BY updated DESC LIMIT 3)
SELECT COALESCE(public.user.name, 'not defined') AS name,
        COALESCE(public.user.lastname, 'not defined') AS lastname,
        balance.type,
        (SELECT SUM(balance.money) 
           FROM balance
                INNER JOIN public.user pb
                ON balance.user_id = pb.id
          WHERE pb.name = public.user.name) AS volume,
        COALESCE(public.user.lastname, 'not defined'),
        CASE
            WHEN (SELECT last_update.rate_to_usd
                    FROM last_update
                   WHERE last_update.id = currency.id) IS NULL THEN 1
            ELSE (SELECT last_update.rate_to_usd
                    FROM last_update
                   WHERE last_update.id = currency.id)
        END AS last_rate_to_usd,
        ((SELECT SUM(balance.money) 
           FROM balance
                INNER JOIN public.user pb
                ON balance.user_id = pb.id
          WHERE pb.name = public.user.name) * CASE
                                  WHEN (SELECT last_update.rate_to_usd
                                          FROM last_update
                                         WHERE last_update.id = currency.id) IS NULL THEN 1
                                  ELSE (SELECT last_update.rate_to_usd
                                          FROM last_update
                                         WHERE last_update.id = currency.id)
                               END) AS total_volume_in_usd
  FROM public.user
       FULL JOIN balance
       ON public.user.id = balance.user_id

       FULL JOIN currency
       ON currency.id = balance.currency_id
 GROUP BY public.user.name,public.user.lastname, balance.type, currency.name, currency.id
 ORDER BY name DESC, lastname, balance.type;

