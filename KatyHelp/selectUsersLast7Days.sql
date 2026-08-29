SELECT *
FROM Users
WHERE
    registration_date >= NOW() - INTERVAL '7 days';