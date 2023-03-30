
# The previous query was okay, but Toretto's Cafe wants to be able to see trends over time.
# Write a query that gets the number of messages for each location for each week.
# Structure the result to have the following columns:

# loc_id
# location_name
# year
# week_number (you can use the WEEK() function)
# message_count



SELECT
    c.loc_id,
    l.name AS location_name,
    YEAR(FROM_UNIXTIME(timestamp)) AS year,
    WEEK(FROM_UNIXTIME(timestamp)) AS week_number,
    DATE(FROM_UNIXTIME(timestamp)) AS 'date',
    COUNT('date') AS message_count
FROM `message` m
    INNER JOIN `issue` i ON m.issue_id = i.issue_id
    INNER JOIN `convo` c on i.convo_id = c.convo_id
    INNER JOIN `location` l ON l.loc_id = c.loc_id
    INNER JOIN `company` co ON co.company_id = c.company_id
WHERE c.company_id = 4
GROUP BY YEARWEEK(FROM_UNIXTIME(timestamp))
ORDER BY 'year' AND 'date';

