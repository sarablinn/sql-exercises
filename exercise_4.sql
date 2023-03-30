
# A client wants to reward their employees each week for building better relationships
# with their customers by using Kipsu. Write a query to get the number of
# messages sent by each employee last week.
# Structure the result to have the following columns:
#     user_id
#     message_count


SELECT
     m.author AS user_id,
     count(m.msg_id) AS message_count,
     m.type
FROM `message` m
    INNER JOIN `issue` i ON i.issue_id = m.issue_id
# last week
WHERE (WEEK(CURDATE()) - WEEK(FROM_UNIXTIME(m.timestamp)) = 1)
    AND (m.type != 'msg')
    AND (m.type != 'keyword')
GROUP BY user_id
ORDER BY message_count DESC;


