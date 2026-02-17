-- Create Database
CREATE DATABASE LibraryManagementSystem;

USE LibraryManagementSystem;

-- Members Table
CREATE TABLE Members (
    MemberID INT IDENTITY(1, 1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(200),
    MembershipDate DATE DEFAULT GETDATE(),
    Status VARCHAR(20) CHECK (Status IN ('Active', 'Inactive')) DEFAULT 'Active'
);

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1, 1) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT IDENTITY(1, 1) PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL
);

-- Books Table
CREATE TABLE Books (
    BookID INT IDENTITY(1, 1) PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublicationYear INT,
    CategoryID INT,
    Publisher VARCHAR(100),
    TotalCopies INT CHECK (TotalCopies >= 0),
    AvailableCopies INT CHECK (AvailableCopies >= 0),
    CONSTRAINT FK_Books_Category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- BookAuthors Table (Many - to - Many)
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    CONSTRAINT FK_BookAuthors_Book FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    CONSTRAINT FK_BookAuthors_Author FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
);

-- Admins Table
CREATE TABLE Admins (
    AdminID INT IDENTITY(1, 1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Role VARCHAR(50) DEFAULT 'Librarian'
);

-- IssueRecords Table
CREATE TABLE IssueRecords (
    IssueID INT IDENTITY(1, 1) PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    IssueDate DATE DEFAULT GETDATE(),
    DueDate DATE NOT NULL,
    ReturnDate DATE NULL,
    Status VARCHAR(20) CHECK (Status IN ('Issued', 'Returned')) DEFAULT 'Issued',
    CONSTRAINT FK_Issue_Member FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    CONSTRAINT FK_Issue_Book FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Fines Table
CREATE TABLE Fines (
    FineID INT IDENTITY(1, 1) PRIMARY KEY,
    IssueID INT NOT NULL,
    FineAmount DECIMAL(10, 2) CHECK (FineAmount >= 0),
    PaidStatus VARCHAR(20) CHECK (PaidStatus IN ('Paid', 'Unpaid')) DEFAULT 'Unpaid',
    PaymentDate DATE NULL,
    CONSTRAINT FK_Fine_Issue FOREIGN KEY (IssueID) REFERENCES IssueRecords(IssueID) ON DELETE CASCADE
);

-- Reservations Table
CREATE TABLE Reservations (
    ReservationID INT IDENTITY(1, 1) PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    ReservationDate DATE DEFAULT GETDATE(),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Completed', 'Cancelled')) DEFAULT 'Pending',
    CONSTRAINT FK_Reservation_Member FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    CONSTRAINT FK_Reservation_Book FOREIGN KEY (BookID) REFERENCES Books(BookID)
);