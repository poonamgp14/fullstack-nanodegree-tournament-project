-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP TABLE "Matches";
DROP TABLE "Players";
DROP VIEW "PlayerStandings";
DROP DATABASE tournament;
CREATE DATABASE tournament;
\c tournament;
--CONNECT TO tournament USER vagrant USING password123;

--CREATE TABLE (with auto numbering integer id)

CREATE TABLE "Players" (
	Id serial PRIMARY KEY,
	Name varchar(50) NOT NULL,
	CreatedDate timestamp DEFAULT current_timestamp
);

CREATE TABLE "Matches" (
	Id serial PRIMARY KEY,
	Player1 int NOT NULL references "Players"(id),
	Player2 int NOT NULL references "Players"(id),
	Winner int NOT NULL references "Players"(id),
	Loser int NOT NULL references "Players"(id)

);

CREATE VIEW "PlayerStandings"
AS
	SELECT p.id as id, p.name as name,
	(select count(*) from "Matches" as m where p.Id = m.Winner) as wins,
	(select count(*) from "Matches" as m where p.Id = m.Player1 or p.Id = m.Player2) as matches
		FROM "Players" as p
		LEFT JOIN "Matches" as m
		ON p.Id = m.Loser
		GROUP BY p.Id
		order by wins desc;






