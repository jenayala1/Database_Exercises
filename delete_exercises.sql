USE codeup_test_db;

-- Write SELECT statements for:
-- Make sure to put appropriate captions before each SELECT.

	-- Albums released after 1991
		-- SELECT name AS "All albums after 1991" 
		-- FROM albums
		-- WHERE release_date > 1991;

	-- Albums with the genre 'disco'
		-- SELECT name AS "Disco Albums" 
		-- FROM albums
		-- WHERE genre LIKE 'disco';


	-- Albums by 'Whitney Houston' (...or maybe an artist of your choice)
		-- SELECT name AS "Disco Albums" 
		-- FROM albums
		-- WHERE artist = 'Whitney Houston';

--Convert the SELECT statements to DELETE.
--Use the MySQL command line client to make sure your records really were removed.

		DELETE FROM albums
		WHERE release_date > '1991';

		DELETE FROM albums
		WHERE genre LIKE '%disco%';

		DELETE FROM albums
		WHERE artist LIKE '%Whitney Houston%';