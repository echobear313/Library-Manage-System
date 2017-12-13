CREATE TABLE Member
(
SSN Integer,
DriverLicState VARCHAR(50),
DriverLicNum VARCHAR(50),
FName VARCHAR(50),
LName VARCHAR(50),
Street VARCHAR(255),
City VARCHAR(50),
State VARCHAR(50),
PCode VARCHAR(50),
Phone VARCHAR(50),
Email VARCHAR(50),
Passwd VARCHAR(50),
CONSTRAINT MemberSSN PRIMARY KEY (SSN)
);

CREATE TABLE Librarian
(
SSN Integer,
FName VARCHAR(50),
LName VARCHAR(50),
Street VARCHAR(255),
City VARCHAR(50),
State VARCHAR(50),
PCode VARCHAR(50),
Phone VARCHAR(50),
Email VARCHAR(50),
Passwd VARCHAR(50),
CONSTRAINT LibrarianSSN PRIMARY KEY (SSN)
);

CREATE TABLE BookTitle
(
CallNumber VARCHAR(50),
Name VARCHAR(255),
Author VARCHAR(50),
Edition VARCHAR(50),
ISBN VARCHAR(50),
Year Integer,
Publisher VARCHAR(50),
CONSTRAINT CallNumber PRIMARY KEY (CallNumber)
);

CREATE TABLE Book
(
BookID SERIAL,
CallNumber VARCHAR(50),
BorrowerSSN Integer,
DueDate VARCHAR(50),
LibrarianSSN Integer,
CONSTRAINT BookID PRIMARY KEY (BookID),
CONSTRAINT MemberBook FOREIGN KEY (BorrowerSSN) REFERENCES Member(SSN),
CONSTRAINT LibrarianBook FOREIGN KEY (LibrarianSSN) REFERENCES Librarian(SSN),
CONSTRAINT TitleBook FOREIGN KEY (CallNumber) REFERENCES BookTitle(CallNumber)
);

CREATE TABLE Hold
(
SSN Integer,
CallNumber VARCHAR(50),
HoldDateTime TIMESTAMP,
CONSTRAINT HoldMember FOREIGN KEY (SSN) REFERENCES Member(SSN),
CONSTRAINT HoldTitle FOREIGN KEY (CallNumber) REFERENCES BookTitle(CallNumber)
);


INSERT INTO Member VALUES (123123123,'PA','P123-12-123456789','John','Doe','123 Main St','Pittsburgh','PA','15244','412-555-5262','johndoe@hotmail.com','123');
INSERT INTO Member VALUES (111222333,'PA','P321-14-123456','Jane','Doe','456 Elm St','Pittsburgh','PA','15215','412-555-4635','janedoe@hotmail.com','111');
INSERT INTO Member VALUES (123456789,'PA','P111-22-654321','Stan','Dardeviation','1 Sigma Way','Pittsburgh','PA','15213','412-555-4335','stan@hotmail.com','411');
INSERT INTO Member VALUES (111111111,'PA','P334-23-654246','George','Bush','1600 Pennsylvania Avenue','Washington','PA','22213','203-555-4335','president@whitehouse.gov','111');
INSERT INTO Member VALUES (222222222,'PA','P331-25-644321','William','Clinton','4532 W 125th Street','New York','NY','05213','201-555-4335','bill@clinton.com','222');

INSERT INTO Librarian VALUES (321321321,'Joe','Bloggs','421 Some Place','Pittsburgh','PA','15206','4125551212','montet@manyatta.com','321');

INSERT INTO BookTitle VALUES ('TK5105.888.J37 1998','Web Design and Development Black Book','Jarol, Scott','','',1998,'Coriolis Group Books. Albany, NY');
INSERT INTO BookTitle VALUES ('QA76.625.M33 1997','Visual Basic Programmer''s Guide to Web Development','Martiner, William','1st','0471193828',1997,'Wiley Computer Pub. New York');
INSERT INTO BookTitle VALUES ('QA76.73.P224A85 1999','Core PHP Programming : Using PHP to Build Dynamic Web Sites','Atkinson, Leon','','',1999,'Prentice Hall PTR. Upper Saddle River, NJ');
INSERT INTO BookTitle VALUES ('QA76.73.J38K66 1998','Java Programming for Dummies','Koosis, Donald J','3rd','',1998,'IDG Books Worldwide. Foster City, CA');
INSERT INTO BookTitle VALUES ('QA76.9.D3E57 2000','Fundamentals of Database Systems','Elmasri, Ramez; Navathe, Shamkant B.','3rd','0805317554',2000,'Addison-Wesley Longman');
INSERT INTO BookTitle VALUES ('QA76.73.J38J47 1997','Java Database Programming','Jepson, Brian','','',1997,'Wiley Computer Pub. New York');
INSERT INTO BookTitle VALUES ('QA76.L2967 1998','Information Systems and the Internet : A Problem-solving Approach','Laudon, Kenneth C.; Laudon, Jane Price','4th','0030225779',1999,'Dryden Press. Fort Worth, TX');
INSERT INTO BookTitle VALUES ('QA76.9.A43H67 1998','Computer Algorithms','Horowitz, Ellis','','',1998,'Computer Science Press. New York');
INSERT INTO BookTitle VALUES ('HD38.D68','The Effective Executive','Drucker, Peter Ferdinand','1st','0887306128',1967,'Harper & Row. New York');
INSERT INTO BookTitle VALUES ('HF5548.2.S7728 1998','Business Data Communications','Stallings, William','3rd','013594581X',1998,'Prentice Hall. Upper Saddle River, N.J.');
INSERT INTO BookTitle VALUES ('HD58.82.D38 1998','Working Knowledge : How Organizations Manage What They Know','Davenport, Thomas H.','','0875846556',1998,'Harvard Business School Press. Boston, Mass');
INSERT INTO BookTitle VALUES ('HD30.25.A53 1999','An Introduction to Management Science : Quantitative Approaches to Decision Making','Anderson, David Ray','9th','0324003242',1999,'Southwestern Pub Co');
INSERT INTO BookTitle VALUES ('HD9696.63.U62C585 1999','The New New Thing: A Silicon Valley Story','Lewis, Michael','','0393048136',1999,'W.W. Norton & Company. New York');
INSERT INTO BookTitle VALUES ('HD2336.3.N55 1998','Managing Telework: Strategies for Managing the Virtual Workforce','Nilles, Jack M.','','0471293164',1998,'John Wiley & Sons. New York');
INSERT INTO BookTitle VALUES ('HD62.7.S524 1999','Smart Guide to Starting a Small Business','Shaw, Lisa Angowski','','047131885X',1999,'Cader Books. New York');
INSERT INTO BookTitle VALUES ('HD69.T54S5 1999','Smart Guide to Managing Your Time','Shaw, Lisa Angowski','','0471318868',1999,'Cader Books. New York');

INSERT INTO Hold VALUES (123123123,'QA76.9.A43H67 1998', TIMESTAMP '2016/05/12 14:46:06');

INSERT INTO Book (CallNumber) VALUES ('HD2336.3.N55 1998');
INSERT INTO Book (CallNumber) VALUES ('HD30.25.A53 1999');
INSERT INTO Book (CallNumber) VALUES ('HD38.D68');
INSERT INTO Book (CallNumber) VALUES ('HD58.82.D38 1998');
INSERT INTO Book (CallNumber) VALUES ('HD62.7.S524 1999');
INSERT INTO Book (CallNumber) VALUES ('HD69.T54S5 1999');
INSERT INTO Book (CallNumber) VALUES ('HD9696.63.U62C585 1999');
INSERT INTO Book (CallNumber) VALUES ('HF5548.2.S7728 1998');
INSERT INTO Book (CallNumber) VALUES ('HF5548.2.S7728 1998');
INSERT INTO Book (CallNumber) VALUES ('QA76.625.M33 1997');
INSERT INTO Book (CallNumber) VALUES ('QA76.73.J38J47 1997');
INSERT INTO Book (CallNumber) VALUES ('QA76.73.J38K66 1998');
INSERT INTO Book (CallNumber) VALUES ('QA76.73.P224A85 1999');
INSERT INTO Book (CallNumber) VALUES ('QA76.9.A43H67 1998');
INSERT INTO Book (CallNumber, BorrowerSSN, DueDate, LibrarianSSN) VALUES ('QA76.9.D3E57 2000',123456789,'05/14/02',321321321);
INSERT INTO Book (CallNumber) VALUES ('QA76.L2967 1998');
INSERT INTO Book (CallNumber) VALUES ('TK5105.888.J37 1998');
INSERT INTO Book (CallNumber, BorrowerSSN, DueDate, LibrarianSSN) VALUES ('TK5105.888.J37 1998',123123123,'05/9/02',321321321);
INSERT INTO Book (CallNumber, BorrowerSSN, DueDate, LibrarianSSN) VALUES ('QA76.9.D3E57 2000',111222333,'05/14/02',321321321);
INSERT INTO Book (CallNumber) VALUES ('HF5548.2.S7728 1998');
INSERT INTO Book (CallNumber) VALUES ('QA76.73.J38K66 1998');