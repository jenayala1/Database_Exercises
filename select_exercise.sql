USE codeup_test_db;

-- The name of all albums by Pink Floyd.
SELECT * FROM albums WHERE artist = 'Pink Floyd';

-- The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper%';

-- The genre for Nevermind
SELECT genre, name FROM albums WHERE name = 'Nevermind';

-- Which albums were released in the 1990s:
SELECT * FROM albums where release_date between 1990 AND 1999;

-- Which albums had less than 20 million certified sales
SELECT * FROM albums WHERE sales < 20000000;

--All the albums in the rock genre. Is this all the rock albums in the table?
SELECT * FROM albums WHERE genre = "rock";