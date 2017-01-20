-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE tournament;
DROP TABLE "Players";
DROP TABLE "Matches";
CREATE DATABASE tournament;

CONNECT TO tournament USER vagrant USING password123;

--CREATE TABLE (with auto numbering integer id)

CREATE TABLE "Players" (
	Id serial PRIMARY KEY,
	Name varchar(50) NOT NULL,
	CreatedDate timestamp DEFAULT current_timestamp
);

CREATE TABLE "Matches" (
	Id serial PRIMARY KEY,
	Player1 int NOT NULL,
	Player2 int NOT NULL,
	Winner int NOT NULL,
	Loser int NOT NULL

);