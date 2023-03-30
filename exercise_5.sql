
# After the first round of rewarding their employees, our client has found that
# some employees were cheating the system and inflating their numbers by sending
# a lot of extra messages. It has now become necessary to develop a better method
# of evaluating an employee’s use of Kipsu. Write a query that will get, for each user,
# the number of conversations (i.e. the issue table) which happened in the previous
# year that began with a message from that user and had at least one message
# in response from the guest.
# Note: a “conversation that happened in 2018” can be defined as an issue whose
# first message’s timestamp falls within 2018
# Structure the result to have the following columns:

# user_id
# issue_count



SELECT
    c.sender AS user_id,
    count(i.issue_id) AS issue_count
FROM `convo` c
    INNER JOIN `issue` i ON i.convo_id = c.convo_id
    INNER JOIN `message` m ON m.issue_id = i.issue_id
# for the year before
WHERE (YEAR(CURDATE()) - YEAR(FROM_UNIXTIME(m.timestamp)) = 1)
GROUP BY c.sender
ORDER BY issue_count DESC;


