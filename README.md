# College Club Membership Database

This project demonstrates the process of **database normalization** from First Normal Form (1NF) to a fully normalized relational design (3NF) using MySQL. The database manages student memberships in various college clubs.


## Overview
Initially, the club membership data is stored in a single table (`ClubMembership_1NF`) which contains redundant information about students and clubs.  

To improve **data integrity**, reduce redundancy, and enforce **referential integrity**, the database is normalized through the following steps:  
1. **1NF** – Eliminate repeating groups; each cell holds a single value.  
2. **2NF** – Eliminate partial dependencies; move data that depends only on part of a composite key.  
3. **3NF** – Eliminate transitive dependencies; move data that depends on non-key attributes.  

---

## Database Structure

### 1NF Table
```sql
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
```
All data stored in a single table

Redundant information (e.g., student info repeated for multiple clubs)

2NF Tables

In 2NF, we remove partial dependencies. Data that depends only on part of the composite key (StudentID + ClubName + JoinDate) is moved to separate tables:

Student Table
```
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Email VARCHAR(50)
);
```
Club Table
```
CREATE TABLE Club (
    ClubID INT PRIMARY KEY,
    ClubName VARCHAR(50),
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(50)
);
```
Membership Table
```
CREATE TABLE Membership (
    MembershipID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ClubID INT,
    JoinDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);
```
3NF Tables

In 3NF, we remove transitive dependencies. All non-key attributes must depend only on the primary key:

Student table remains the same (no transitive dependencies)

Club table remains the same (ClubRoom and ClubMentor are attributes of ClubID)

Membership table remains the same (JoinDate depends on the membership, not the student or club)

The normalized design is now in 3NF, fully eliminating redundancy and dependency anomalies.

SQL Scripts
1NF Sample Data
```
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
```
2NF / 3NF Sample Data
```
-- Students
INSERT INTO Student VALUES
(1, 'Asha', 'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha', 'nisha@email.com'),
(4, 'Rohan', 'rohan@email.com'),
(5, 'Suman', 'suman@email.com'),
(6, 'Pooja', 'pooja@email.com'),
(7, 'Aman', 'aman@email.com');

-- Clubs
INSERT INTO Club VALUES
(101, 'Music Club', 'R101', 'Mr. Raman'),
(202, 'Sports Club', 'R202', 'Ms. Sita'),
(303, 'Drama Club', 'R303', 'Mr. Kiran'),
(401, 'Coding Club', 'Lab1', 'Mr. Anil');

-- Memberships
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
```
Usage

Create the database in MySQL or MariaDB.

Execute the SQL scripts in this order:

ClubMembership_1NF (optional, for 1NF reference)

Student, Club, Membership tables (normalized)

Insert sample data

Query normalized tables for structured student and club membership data:
```
SELECT s.StudentName, c.ClubName, m.JoinDate
FROM Membership m
JOIN Student s ON m.StudentID = s.StudentID
JOIN Club c ON m.ClubID = c.ClubID;
```
This query shows each student along with the clubs they joined and the join dates.

Author

Sujal Shrestha
Bachelors in CyberSecurity and Ethical Hacking
