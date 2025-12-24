
-- Revenue by Game: Which game generated the most money?

SELECT 
    g.home_team || ' vs ' || g.away_team AS matchup,
    TO_CHAR(g.tipoff_time, 'YYYY-MM-DD') AS game_date,
    COUNT(ts.ticket_id) AS tickets_sold,
    TO_CHAR(SUM(ts.purchase_price), '$99,999.00') AS total_revenue
FROM Ticket_Sales ts
JOIN NBA_game g ON ts.game_id = g.game_id
GROUP BY g.home_team, g.away_team, g.tipoff_time
ORDER BY SUM(ts.purchase_price) DESC;

-- 2. VIP Customer Identification who destribute the most revenue

SELECT 
    f.username,
    f.email_address,
    COUNT(ts.ticket_id) AS tickets_purchased,
    TO_CHAR(SUM(ts.purchase_price), '$99,999.00') AS total_spent
FROM Fan f
JOIN Ticket_Sales ts ON f.fan_id = ts.fan_id
GROUP BY f.username, f.email_address
HAVING SUM(ts.purchase_price) > 2000
ORDER BY total_spent DESC;