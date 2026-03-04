CREATE TABLE ClubMembership_1NF (
    StudentID INT,
    StudentName VARCHAR(50),
    Email VARCHAR(50),
    ClubName VARCHAR(50),
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(50),
    JoinDate DATE,
    PRIMARY KEY (StudentID, ClubName, JoinDate)
);

INSERT INTO ClubMembership_1NF VALUES
(1, 'Asha', 'asha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-10'),
(2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-12'),
(1, 'Asha', 'asha@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-15'),
(3, 'Nisha', 'nisha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-20'),
(4, 'Rohan', 'rohan@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-18'),
(5, 'Suman', 'suman@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-22'),
(2, 'Bikash', 'bikash@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-25'),
(6, 'Pooja', 'pooja@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-27'),
(3, 'Nisha', 'nisha@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-28'),
(7, 'Aman', 'aman@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-30');
SELECT * FROM ClubMembership_1NF;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Email VARCHAR(50)
);

INSERT INTO Student VALUES
(1, 'Asha', 'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha', 'nisha@email.com'),
(4, 'Rohan', 'rohan@email.com'),
(5, 'Suman', 'suman@email.com'),
(6, 'Pooja', 'pooja@email.com'),
(7, 'Aman', 'aman@email.com');

CREATE TABLE Club (
    ClubID INT PRIMARY KEY,
    ClubName VARCHAR(50),
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(50)
);

INSERT INTO Club VALUES
(101, 'Music Club', 'R101', 'Mr. Raman'),
(202, 'Sports Club', 'R202', 'Ms. Sita'),
(303, 'Drama Club', 'R303', 'Mr. Kiran'),
(401, 'Coding Club', 'Lab1', 'Mr. Anil');

CREATE TABLE Membership (
    MembershipID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ClubID INT,
    JoinDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);

INSERT INTO Membership (StudentID, ClubID, JoinDate) VALUES
(1, 101, '2024-01-10'),
(2, 202, '2024-01-12'),
(1, 202, '2024-01-15'),
(3, 101, '2024-01-20'),
(4, 303, '2024-01-18'),
(5, 101, '2024-01-22'),
(2, 303, '2024-01-25'),
(6, 202, '2024-01-27'),
(3, 401, '2024-01-28'),
(7, 401, '2024-01-30');
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Email VARCHAR(50)
);

INSERT INTO Student VALUES
(1, 'Asha', 'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha', 'nisha@email.com'),
(4, 'Rohan', 'rohan@email.com'),
(5, 'Suman', 'suman@email.com'),
(6, 'Pooja', 'pooja@email.com'),
(7, 'Aman', 'aman@email.com');

CREATE TABLE Club (
    ClubID INT PRIMARY KEY,
    ClubName VARCHAR(50),
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(50)
);

INSERT INTO Club VALUES
(101, 'Music Club', 'R101', 'Mr. Raman'),
(202, 'Sports Club', 'R202', 'Ms. Sita'),
(303, 'Drama Club', 'R303', 'Mr. Kiran'),
(401, 'Coding Club', 'Lab1', 'Mr. Anil');

CREATE TABLE Membership (
    MembershipID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ClubID INT,
    JoinDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);

INSERT INTO Membership (StudentID, ClubID, JoinDate) VALUES
(1, 101, '2024-01-10'),
(2, 202, '2024-01-12'),
(1, 202, '2024-01-15'),
(3, 101, '2024-01-20'),
(4, 303, '2024-01-18'),
(5, 101, '2024-01-22'),
(2, 303, '2024-01-25'),
(6, 202, '2024-01-27'),
(3, 401, '2024-01-28'),
(7, 401, '2024-01-30');

INSERT INTO Student (StudentID, StudentName, Email)
    -> VALUES (101, 'Sujal Shrestha', 'sujal@example.com');
INSERT INTO Club (ClubID, ClubName, ClubRoom, ClubMentor) VALUES (501, 'IT Club', 'Room 501', 'Mr. Sharma');


mysql> SELECT
    ->     s.StudentName,
    ->     c.ClubName,
    ->     m.JoinDate
    -> FROM Membership m
    -> JOIN Student s ON m.StudentID = s.StudentID
    -> JOIN Club c ON m.ClubID = c.ClubID;
