# Toretto's Cafe wants to figure out which of their phone lines is getting the most traffic. 
# Write a query that gets the number of messages for each location.
# Structure the result to have the following columns:
# loc_id
# location_name
# message_count



SELECT
    `convo`.loc_id,
    location.name AS location_name,
    count(message.msg_id) AS message_count
FROM message
    INNER JOIN issue ON (issue.issue_id = message.issue_id)
    INNER JOIN `convo` ON (`convo`.convo_id = issue.convo_id)
    INNER JOIN location ON (location.loc_id = `convo`.loc_id)
    INNER JOIN company ON (company.company_id = `convo`.company_id)
WHERE company.company_id IN (
    SELECT company_id
    FROM company
    WHERE company_name = "Toretto's Cafe")
GROUP BY convo.loc_id
ORDER BY message_count DESC;
			


# Used to check if the above query works.
# Expected results:
# for loc_id 288, there should be 2 rows
# for loc_id 422, there should be 3 rows
SELECT 
	`convo`.loc_id,
	message.msg_id
FROM message 
	INNER JOIN issue ON (issue.issue_id = message.issue_id)
	INNER JOIN `convo` ON (`convo`.convo_id = issue.convo_id)
WHERE company_id IN (
	SELECT company_id 
	FROM company 
	WHERE company_name = "Toretto's Cafe" 
		AND convo.loc_id = 422);
		
		
			
	
