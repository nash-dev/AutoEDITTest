CREATE DATABASE AutoEDITest;

CREATE TABLE [User] (
    Id int NOT NULL PRIMARY KEY,
    Username varchar(255) UNIQUE,
    Password varchar(255),
    AccessLevelId varchar(255),
    FirstName varchar(255),
	LastName varchar(255),
	LastLogin DATETIME
);

CREATE TABLE AccessLevel (
    Id int NOT NULL PRIMARY KEY,
    Name varchar(255) UNIQUE,
    Description varchar(255) NOT NULL,
    CONSTRAINT FK_Id FOREIGN KEY (Id)
    REFERENCES AccessLevel(Id)
);



CREATE TABLE Communication (
    Id int NOT NULL PRIMARY KEY,
    CreatedAt DateTime,
    Action varchar(255),
    Result varchar(255),
    
);

INSERT INTO AccessLevel(Id,Name,Description)
VALUES ('1', 'ADMIN', 'Super User'), ('2', 'USER', 'Standard User'), (3,'READONLY','Read Only User');



/*CORRECTION OF FOREIGN KEY RELATIONSHIP DROP TABLKE AND RE ADD*/


DROP TABLE AccessLevel, [User];

CREATE TABLE [User] (
    Id int NOT NULL PRIMARY KEY,
    Username varchar(255) UNIQUE,
    Password varchar(255),
    AccessLevelId int,
    FirstName varchar(255),
	LastName varchar(255),
	LastLogin DATETIME
	
);

CREATE TABLE AccessLevel (
    Id int NOT NULL PRIMARY KEY,
    Name varchar(255) UNIQUE,
    Description varchar(255) NOT NULL,
);

ALTER TABLE dbo.[User]     
ADD CONSTRAINT FK_UserAccessLevelId_AccessLevelID FOREIGN KEY (AccessLevelId)     
    REFERENCES [dbo].[AccessLevel] (Id)     
    ON DELETE CASCADE    
    ON UPDATE CASCADE  

/*TO CHECK TABLE EXIST*/
select * from AccessLevel;

select * from [User];

select* from [Communication];