#Kegan Edwards, 801057442, Lab1, 04-02-2022
#1
#2
DROP Database IF EXISTS Lab_1;
CREATE DATABASE IF NOT EXISTS Lab_1;
USE `Lab_1`;

#3
DROP TABLE IF EXISTS Horse;
CREATE TABLE IF NOT EXISTS Horse (
    ID SMALLINT UNSIGNED AUTO_INCREMENT,
	RegisteredName VARCHAR(15) NOT NULL,
    Breed VARCHAR(20) CHECK (Breed IN ('Egyptian Arab', 'Holsteiner', 'Quarter Horse', 'Paint', 'Saddlebred')),
    Height DECIMAL(3,1) CHECK (Height between 10.0 AND 20.0),
    BirthDate DATE CHECK (BirthDate >='2015-01-01'),
    PRIMARY KEY (ID)
);

#4
DROP TABLE IF EXISTS Student;
CREATE TABLE IF NOT EXISTS Student (
    ID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR (30) NOT NULL,
    Street VARCHAR(50) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State CHAR(2) NOT NULL DEFAULT "TX",
    Zip INT UNSIGNED NOT NULL, 
    Phone Char(10) NOT NULL,
    Email VARCHAR(30) UNIQUE
);

#5
DROP TABLE IF EXISTS LessonSchedule;
CREATE TABLE IF NOT EXISTS LessonSchedule ( 
	HorseID SMALLINT UNSIGNED NOT NULL, 
    StudentID SMALLINT UNSIGNED,
    LessonDateTime DATETIME NOT NULL, 
	Primary Key (HorseID, LessonDateTime),
    FOREIGN KEY (HorseID) REFERENCES Horse (ID)
		ON DELETE CASCADE,
    FOREIGN KEY (StudentID) REFERENCES Student (ID)
		ON DELETE SET NULL
);
#6
DROP TABLE IF EXISTS Movie;
CREATE TABLE IF NOT EXISTS Movie (
    ID INT UNSIGNED PRIMARY KEY,
    Title VARCHAR(50),
    Genre VARCHAR(20),
    RatingCode VARCHAR(10),
    Year SMALLINT UNSIGNED
);

ALTER TABLE Movie
ADD Producer VARCHAR(50),
DROP Genre,
RENAME COLUMN Year TO ReleaseYear;

ALTER TABLE Movie
MODIFY COLUMN ReleaseYear SMALLINT;

#7
INSERT INTO Horse (RegisteredName, Breed, Height, BirthDate)
VALUES ("Babe", "Quarter Horse",15.3,'2015-02-10'),
("Independence" ,'Holsteiner',16.0,'2017-03-13'),
("Ellie", 'Saddlebred',15.0,'2016-12-22'),
(NULL, 'Egyptian Arab',14.9,'2019-10-12');



#8
SET SQL_SAFE_UPDATES = 0;
UPDATE Horse
SET Height = 15.6 
WHERE ID = 2;

UPDATE Horse
SET RegisteredName = "Lady Luck", BirthDate = '2015-05-1'
WHERE ID = 4;

UPDATE Horse
SET Breed = NULL
WHERE BirthDate >= '2016-12-22';

#9
DELETE FROM Horse
WHERE Id = 5;

DELETE FROM Horse 
WHERE Breed = "Holsteiner" OR "Paint";

DELETE FROM Horse 
WHERE BirthDate < '2013-3-13';

/*
10. I've been really enjoying sql, but I feel like the material has been going by pretty slowly. I hope to work more with some real world data soon. 
SQL workbench has also been a really big hastle so far. It doesn't seem like there are any alternatives though. Hope whoever is grading this has a nice 
semester.


