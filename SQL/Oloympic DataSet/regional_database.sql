CREATE DATABASE OlympicHistory;

USE OlympicHistory;

CREATE TABLE olympic_history
(	
	id INT ,
    player_name VARCHAR(255),
    sex VARCHAR(255),
    age VARCHAR(255),
    height VARCHAR(255),
    weight VARCHAR(255),
    team VARCHAR(255),
    noc VARCHAR(255),
    games VARCHAR(255),
    game_year INT,
    season VARCHAR(255),
    city VARCHAR(255),
    sport VARCHAR(255),
    sport_event VARCHAR(255),
    medal VARCHAR(255)
);


CREATE TABLE olympic_history_non
(
	NOC VARCHAR(10),
    region VARCHAR(255),
    notes VARCHAR(255)
);



