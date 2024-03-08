USE olympichistory;

SELECT 
    *
FROM
    olympic_history;
    
# Which year saw the highest and lowest no of countries participating in olympics?

SELECT 
    games,
    COUNT(DISTINCT (noc)) AS MAXIMUM
FROM
    olympic_history
GROUP BY (games)
ORDER BY MAXIMUM DESC 
LIMIT 1;

SELECT 
    games,
    COUNT(DISTINCT (noc)) AS MINIMUM
FROM
    olympic_history
GROUP BY (games)
ORDER BY MINIMUM  
LIMIT 1;

#5 Which nation has participated in all of the olympic games?
SELECT 
    NOC
FROM
    (SELECT 
        NOC, COUNT(DISTINCT games) AS num_games
    FROM
        olympic_history
    GROUP BY NOC) AS participation
WHERE
   num_games = (SELECT 
            COUNT(DISTINCT games)
        FROM
            olympic_history);
    
#6 Identify the sport which was played in all summer olympics.
SELECT 
    sport
FROM
    (SELECT 
        sport, COUNT(DISTINCT games) AS num_games
    FROM
        olympic_history
    WHERE
        season = 'Summer'
    GROUP BY sport) AS participarion
WHERE
    num_games = (SELECT 
            COUNT(DISTINCT games)
        FROM
            olympic_history
        WHERE
            season = 'Summer');

#7 Which Sports were just played only once in the olympics?
SELECT 
    sport
FROM
    (SELECT 
        sport, COUNT(DISTINCT games) AS num_games
    FROM
        olympic_history
    GROUP BY sport) AS participation
WHERE
    num_games = 1;
    
#8 Fetch the total no of sports played in each olympic games.
SELECT 
    games, COUNT(DISTINCT player_name) AS player_number
FROM
    olympic_history
GROUP BY games
ORDER BY player_number DESC;

#9 Fetch details of the oldest athletes to win a gold medal.
SELECT 
    *
FROM
    olympic_history
WHERE
    medal = 'Gold' AND age != 'NA'
ORDER BY age DESC
LIMIT 1;

#10 Find the Ratio of male and female athletes participated in all olympic games.
SELECT 
    Games,
    SUM(CASE WHEN sex = 'M' THEN 1 ELSE 0 END) AS male,
    SUM(CASE WHEN sex = 'F' THEN 1 ELSE 0 END) AS female,
    CASE
        WHEN SUM(CASE WHEN sex = 'F' THEN 1 ELSE 0 end) > 0 THEN 
			# male / female upto two decimal point 
            ROUND(SUM(CASE WHEN sex = 'M' THEN 1 ELSE 0 end) * 1.0 / SUM(CASE WHEN sex = 'F' THEN 1 ELSE 0 end),2)  
		ELSE 0.00 # if Ratio is nall then return 0  
    END AS Ratio
FROM
    olympic_history
GROUP BY games
ORDER BY Games ;

#11 Fetch the top 5 athletes who have won the most gold medals.
SELECT 
    player_name, COUNT(medal) AS total_medal
FROM
    olympic_history
WHERE
    medal = 'Gold'
GROUP BY player_name
ORDER BY COUNT(medal) DESC
LIMIT 5;

#12 Fetch the top 5 athletes who have won the most medals 
SELECT 
    player_name, COUNT(medal) AS total_medal
FROM
    olympic_history
GROUP BY player_name
HAVING COUNT(medal) >= 2
ORDER BY COUNT(medal) DESC;

#13 Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
SELECT 
    NOC, COUNT(medal) AS total_medal
FROM
    olympic_history
GROUP BY noc
ORDER BY COUNT(medal) DESC
LIMIT 5;

# List down total gold, silver and broze medals won by each country.
SELECT 
	NOC,
    SUM(CASE WHEN medal = 'Gold' THEN 0 ELSE 1 END) AS Gold ,
    SUM(CASE WHEN medal = 'Silver' THEN 0 ELSE 1 END) AS Silver ,
    SUM(CASE WHEN medal = 'Bronze' THEN 0 ELSE 1 END) AS Bronze 
FROM olympic_history
GROUP BY NOC;
    
# List down total gold, silver and broze medals won by each country corresponding to each olympic games.
SELECT
	games,
	NOC,
    SUM(CASE WHEN medal = 'Gold' THEN 0 ELSE 1 END) AS Gold ,
    SUM(CASE WHEN medal = 'Silver' THEN 0 ELSE 1 END) AS Silver ,
    SUM(CASE WHEN medal = 'Bronze' THEN 0 ELSE 1 END) AS Bronze 
FROM olympic_history
GROUP BY NOC , games;