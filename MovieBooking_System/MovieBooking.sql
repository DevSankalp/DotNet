-- CREATE DATABASE
CREATE DATABASE MovieBookingSystem;

USE MovieBookingSystem;

-- CUSTOMER TABLE
CREATE TABLE Customer (
    C_id INT PRIMARY KEY,
    C_name VARCHAR(100) NOT NULL,
    email_id VARCHAR(100) UNIQUE,
    phone_no VARCHAR(10),
    pass VARCHAR(50)
);

-- SEATS TABLE
CREATE TABLE Seats (
    seat_id INT PRIMARY KEY,
    seat_name VARCHAR(20),
    number_of_seats INT
);

-- BOOKING TABLE
CREATE TABLE Booking (
    booking_date DATE,
    seat_id INT,
    c_id INT,
    ticket_no INT,
    PRIMARY KEY (seat_id, c_id, ticket_no),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id),
    FOREIGN KEY (c_id) REFERENCES Customer(c_id)
);

-- MOVIES_DATA TABLE
CREATE TABLE Movies_Data (
    m_id INT PRIMARY KEY,
    m_name VARCHAR(100),
    release_date DATE,
    director VARCHAR(100),
    producer VARCHAR(100),
    genre VARCHAR(50),
    actors VARCHAR(200),
    duration INT,
    rating FLOAT
);

-- SHOW_DATA TABLE
CREATE TABLE Show_Data (
    show_id INT PRIMARY KEY,
    start_time TIME,
    end_time TIME,
    lang VARCHAR(30),
    m_id INT,
    FOREIGN KEY (m_id) REFERENCES Movies_Data(m_id)
);

-- ADMIN TABLE
CREATE TABLE A_Admin (
    admin_id INT PRIMARY KEY,
    admin_password VARCHAR(50)
);

-- THEATRE TABLE
CREATE TABLE Theatre (
    T_id INT PRIMARY KEY,
    T_name VARCHAR(100),
    loc VARCHAR(100)
);

-- TICKETS TABLE
CREATE TABLE Tickets (
    ticket_no INT PRIMARY KEY,
    hall_no INT,
    seat_no INT,
    T_id INT,
    price FLOAT,
    show_date DATE,
    show_id INT,
    admin_id INT,
    FOREIGN KEY (seat_no) REFERENCES Seats(seat_id),
    FOREIGN KEY (T_id) REFERENCES Theatre(T_id),
    FOREIGN KEY (show_id) REFERENCES Show_Data(show_id),
    FOREIGN KEY (admin_id) REFERENCES A_Admin(admin_id)
);

-- DISCOUNT TABLE
CREATE TABLE Discount (
    offer_id INT PRIMARY KEY,
    m_id INT,
    m_name VARCHAR(100),
    price FLOAT,
    FOREIGN KEY (m_id) REFERENCES Movies_Data(m_id)
);

-- PAYMENT TABLE
CREATE TABLE Payment (
    payment_id INT IDENTITY(1, 1) PRIMARY KEY,
    ticket_no INT NOT NULL,
    c_id INT NOT NULL,
    offer_id INT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    currency CHAR(3) NOT NULL DEFAULT 'INR',
    payment_method VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL,
    transaction_id VARCHAR(100) NULL,
    provider VARCHAR(50) NULL,
    paid_at DATETIME2(0) NOT NULL DEFAULT SYSDATETIME(),
    FOREIGN KEY (ticket_no) REFERENCES Tickets(ticket_no),
    FOREIGN KEY (c_id) REFERENCES Customer(C_id),
    FOREIGN KEY (offer_id) REFERENCES Discount(offer_id),
    CONSTRAINT UQ_Payment_Ticket UNIQUE (ticket_no),
    CONSTRAINT CK_Payment_Status CHECK (
        status IN ('SUCCESS', 'FAILED', 'PENDING', 'REFUNDED')
    )
);

ALTER TABLE
    Booking
ADD
    CONSTRAINT FK_Booking_Tickets FOREIGN KEY (ticket_no) REFERENCES Tickets(ticket_no);