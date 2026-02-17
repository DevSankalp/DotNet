INSERT INTO
    Movies_Data (
        m_id,
        m_name,
        release_date,
        director,
        producer,
        genre,
        actors,
        duration,
        rating
    )
VALUES
    (
        101,
        'Inception',
        '2010-07-16',
        'Christopher Nolan',
        'Emma Thomas',
        'Sci-Fi',
        'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page',
        148,
        8.8
    ),
    (
        102,
        'Interstellar',
        '2014-11-07',
        'Christopher Nolan',
        'Emma Thomas',
        'Sci-Fi',
        'Matthew McConaughey, Anne Hathaway, Jessica Chastain',
        169,
        8.6
    ),
    (
        103,
        'The Dark Knight',
        '2008-07-18',
        'Christopher Nolan',
        'Charles Roven',
        'Action',
        'Christian Bale, Heath Ledger, Aaron Eckhart',
        152,
        9.0
    ),
    (
        104,
        'La La Land',
        '2016-12-09',
        'Damien Chazelle',
        'Fred Berger',
        'Musical',
        'Ryan Gosling, Emma Stone',
        128,
        8.0
    ),
    (
        105,
        'Parasite',
        '2019-05-30',
        'Bong Joon-ho',
        'Kwak Sin-ae',
        'Thriller',
        'Song Kang-ho, Lee Sun-kyun',
        132,
        8.6
    ),
    (
        106,
        'Dune',
        '2021-10-22',
        'Denis Villeneuve',
        'Mary Parent',
        'Sci-Fi',
        'Timothée Chalamet, Rebecca Ferguson',
        155,
        8.1
    ),
    (
        107,
        'Oppenheimer',
        '2023-07-21',
        'Christopher Nolan',
        'Emma Thomas',
        'Biography',
        'Cillian Murphy, Emily Blunt, Robert Downey Jr.',
        180,
        8.6
    );

INSERT INTO
    Theatre (tid, tname, loc)
VALUES
    (1, 'Galaxy Cinemas', 'Downtown'),
    (2, 'Skyline Multiplex', 'Uptown'),
    (3, 'Riverside Screens', 'Riverside');

INSERT INTO
    Seats (seat_id, seat_name, number_of_seats)
VALUES
    (1, 'A1', 1),
    (2, 'A2', 1),
    (3, 'A3', 1),
    (4, 'A4', 1),
    (5, 'B1', 1),
    (6, 'B2', 1),
    (7, 'B3', 1),
    (8, 'B4', 1),
    (9, 'C1', 1),
    (10, 'C2', 1),
    (11, 'C3', 1),
    (12, 'C4', 1);

INSERT INTO
    A_Admin (admin_id, admin_password)
VALUES
    (9001, 'admin@galaxy'),
    (9002, 'admin@skyline'),
    (9003, 'admin@riverside');

INSERT INTO
    Show_Data (show_id, st_time, end_time, lang, m_id)
VALUES
    (5001, '10:00:00', '12:40:00', 'English', 101),
    -- Inception 
    (5002, '13:30:00', '16:20:00', 'English', 102),
    -- Interstellar 
    (5003, '17:00:00', '19:40:00', 'English', 103),
    -- The Dark Knight 
    (5004, '20:30:00', '22:40:00', 'English', 104),
    -- La La Land 
    (5005, '18:00:00', '20:15:00', 'Korean', 105),
    -- Parasite 
    (5006, '15:00:00', '17:40:00', 'English', 106),
    -- Dune 
    (5007, '11:00:00', '14:00:00', 'English', 107);

-- Oppenheimer 
INSERT INTO
    Customer (C_id, C_name, email_id, phone_no, pass)
VALUES
    (
        201,
        'Aarav Mehta',
        'aarav.mehta@example.com',
        '+911234567890',
        'passAarav1!'
    ),
    (
        202,
        'Priya Sharma',
        'priya.sharma@example.com',
        '+911234567891',
        'passPriya2!'
    ),
    (
        203,
        'Rahul Verma',
        'rahul.verma@example.com',
        '+911234567892',
        'passRahul3!'
    ),
    (
        204,
        'Sneha Gupta',
        'sneha.gupta@example.com',
        '+911234567893',
        'passSneha4!'
    ),
    (
        205,
        'Ananya Iyer',
        'ananya.iyer@example.com',
        '+911234567894',
        'passAnanya5!'
    ),
    (
        206,
        'Vikram Singh',
        'vikram.singh@example.com',
        '+911234567895',
        'passVikram6!'
    );

INSERT INTO
    Tickets (
        ticket_no,
        hall_no,
        seat_no,
        tid,
        price,
        show_date,
        show_id,
        admin_id
    )
VALUES
    -- Galaxy Cinemas (tid=1) 
    (
        70001,
        1,
        1,
        1,
        350.00,
        '2026-02-14',
        5001,
        9001
    ),
    -- A1 for Inception 
    (
        70002,
        1,
        2,
        1,
        350.00,
        '2026-02-14',
        5001,
        9001
    ),
    -- A2 for Inception 
    (
        70003,
        2,
        5,
        1,
        380.00,
        '2026-02-14',
        5002,
        9001
    ),
    -- B1 for Interstellar 
    (
        70004,
        2,
        6,
        1,
        380.00,
        '2026-02-14',
        5002,
        9001
    ),
    -- B2 for Interstellar 
    -- Skyline Multiplex (tid=2) 
    (
        70005,
        3,
        3,
        2,
        400.00,
        '2026-02-15',
        5003,
        9002
    ),
    -- A3 for The Dark Knight 
    (
        70006,
        3,
        4,
        2,
        400.00,
        '2026-02-15',
        5003,
        9002
    ),
    -- A4 for The Dark Knight 
    (
        70007,
        1,
        7,
        2,
        320.00,
        '2026-02-15',
        5004,
        9002
    ),
    -- B3 for La La Land 
    (
        70008,
        1,
        8,
        2,
        320.00,
        '2026-02-15',
        5004,
        9002
    ),
    -- B4 for La La Land 
    -- Riverside Screens (tid=3) 
    (
        70009,
        2,
        9,
        3,
        300.00,
        '2026-02-16',
        5005,
        9003
    ),
    -- C1 for Parasite 
    (
        70010,
        2,
        10,
        3,
        300.00,
        '2026-02-16',
        5005,
        9003
    ),
    -- C2 for Parasite 
    (
        70011,
        4,
        11,
        3,
        420.00,
        '2026-02-16',
        5006,
        9003
    ),
    -- C3 for Dune 
    (
        70012,
        4,
        12,
        3,
        420.00,
        '2026-02-16',
        5006,
        9003
    ),
    -- C4 for Dune 
    -- Extra Oppenheimer tickets across theatres 
    (
        70013,
        1,
        1,
        2,
        450.00,
        '2026-02-17',
        5007,
        9002
    ),
    (
        70014,
        1,
        2,
        3,
        450.00,
        '2026-02-18',
        5007,
        9003
    );

INSERT INTO
    Discount (offer_id, m_id, m_name, price)
VALUES
    (8001, 101, 'Inception', 300.00),
    (8002, 102, 'Interstellar', 320.00),
    (8003, 105, 'Parasite', 260.00),
    (8004, 107, 'Oppenheimer', 399.00);

INSERT INTO
    Booking (booking_date, seat_id, c_id, ticket_no)
VALUES
    ('2026-02-13', 1, 201, 70001),
    ('2026-02-13', 2, 202, 70002),
    ('2026-02-13', 5, 203, 70003),
    ('2026-02-13', 6, 204, 70004),
    ('2026-02-14', 3, 205, 70005),
    ('2026-02-14', 4, 206, 70006),
    ('2026-02-14', 7, 201, 70007),
    ('2026-02-14', 8, 202, 70008),
    ('2026-02-15', 9, 203, 70009),
    ('2026-02-15', 10, 204, 70010),
    ('2026-02-15', 11, 205, 70011),
    ('2026-02-15', 12, 206, 70012),
    ('2026-02-16', 1, 205, 70013),
    ('2026-02-17', 2, 206, 70014);