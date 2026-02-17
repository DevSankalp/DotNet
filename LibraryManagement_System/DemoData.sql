-- CATEGORIES
INSERT INTO
    Categories (CategoryName)
VALUES
    ('Fiction'),
    ('Non-Fiction'),
    ('Science'),
    ('Technology'),
    ('History');

-- 2) AUTHORS
INSERT INTO
    Authors (AuthorName)
VALUES
    ('George Orwell'),
    ('J.K. Rowling'),
    ('Isaac Asimov'),
    ('Yuval Noah Harari'),
    ('Bjarne Stroustrup'),
    ('Walter Isaacson');

-- 3) MEMBERS
INSERT INTO
    Members (
        FullName,
        Email,
        Phone,
        Address,
        MembershipDate,
        Status
    )
VALUES
    (
        'Amit Sharma',
        'amit.sharma@example.com',
        '9876543210',
        '12 MG Road, Bengaluru',
        '2025-01-15',
        'Active'
    ),
    (
        'Priya Verma',
        'priya.verma@example.com',
        '9811122233',
        '45 Park Street, Kolkata',
        '2025-02-02',
        'Active'
    ),
    (
        'Rahul Mehta',
        'rahul.mehta@example.com',
        '9898989898',
        '22 Bandra, Mumbai',
        '2025-03-10',
        'Active'
    ),
    (
        'Sneha Iyer',
        'sneha.iyer@example.com',
        '9822221111',
        '5 Anna Nagar, Chennai',
        '2025-04-05',
        'Inactive'
    ),
    (
        'Vikram Singh',
        'vikram.singh@example.com',
        '9900990099',
        'Sector 21, Noida',
        '2025-05-20',
        'Active'
    ),
    (
        'Neha Kulkarni',
        'neha.kulkarni@example.com',
        '9777777777',
        'FC Road, Pune',
        '2025-06-25',
        'Active'
    );

-- 4) ADMINS
INSERT INTO
    Admins (FullName, Email, PasswordHash, Role)
VALUES
    (
        'Harish Nanda',
        'harish.nanda@library.org',
        'HASHED_ABC123',
        'Librarian'
    ),
    (
        'Vinay Dev Jhari',
        'vinay.jhari@library.org',
        'HASHED_DEF456',
        'Admin'
    );

-- FETCH LOOKUP IDs (for Categories & Authors)
DECLARE @Cat_Fiction INT = (
    SELECT
        CategoryID
    FROM
        Categories
    WHERE
        CategoryName = 'Fiction'
);

DECLARE @Cat_NonFiction INT = (
    SELECT
        CategoryID
    FROM
        Categories
    WHERE
        CategoryName = 'Non-Fiction'
);

DECLARE @Cat_Science INT = (
    SELECT
        CategoryID
    FROM
        Categories
    WHERE
        CategoryName = 'Science'
);

DECLARE @Cat_Technology INT = (
    SELECT
        CategoryID
    FROM
        Categories
    WHERE
        CategoryName = 'Technology'
);

DECLARE @Cat_History INT = (
    SELECT
        CategoryID
    FROM
        Categories
    WHERE
        CategoryName = 'History'
);

DECLARE @Auth_Orwell INT = (
    SELECT
        AuthorID
    FROM
        Authors
    WHERE
        AuthorName = 'George Orwell'
);

DECLARE @Auth_Rowling INT = (
    SELECT
        AuthorID
    FROM
        Authors
    WHERE
        AuthorName = 'J.K. Rowling'
);

DECLARE @Auth_Asimov INT = (
    SELECT
        AuthorID
    FROM
        Authors
    WHERE
        AuthorName = 'Isaac Asimov'
);

DECLARE @Auth_Harari INT = (
    SELECT
        AuthorID
    FROM
        Authors
    WHERE
        AuthorName = 'Yuval Noah Harari'
);

DECLARE @Auth_Bjarne INT = (
    SELECT
        AuthorID
    FROM
        Authors
    WHERE
        AuthorName = 'Bjarne Stroustrup'
);

DECLARE @Auth_Walter INT = (
    SELECT
        AuthorID
    FROM
        Authors
    WHERE
        AuthorName = 'Walter Isaacson'
);

/* ========== 5) BOOKS ========== */
INSERT INTO
    Books (
        Title,
        ISBN,
        PublicationYear,
        CategoryID,
        Publisher,
        TotalCopies,
        AvailableCopies
    )
VALUES
    (
        '1984',
        'ISBN-9780451524935',
        1949,
        @Cat_Fiction,
        'Secker & Warburg',
        8,
        8
    ),
    (
        'Harry Potter and the Philosopher''s Stone',
        'ISBN-9780747532699',
        1997,
        @Cat_Fiction,
        'Bloomsbury',
        12,
        12
    ),
    (
        'Foundation',
        'ISBN-9780553293357',
        1951,
        @Cat_Science,
        'Gnome Press',
        6,
        6
    ),
    (
        'Sapiens: A Brief History of Humankind',
        'ISBN-9780099590088',
        2011,
        @Cat_NonFiction,
        'Harvill Secker',
        10,
        10
    ),
    (
        'The C++ Programming Language',
        'ISBN-9780321563842',
        2013,
        @Cat_Technology,
        'Addison-Wesley',
        5,
        5
    ),
    (
        'Steve Jobs',
        'ISBN-9781451648539',
        2011,
        @Cat_History,
        'Simon & Schuster',
        7,
        7
    ),
    (
        'Harry Potter and the Chamber of Secrets',
        'ISBN-9780747538493',
        1998,
        @Cat_Fiction,
        'Bloomsbury',
        10,
        10
    ),
    (
        'I, Robot',
        'ISBN-9780553382563',
        1950,
        @Cat_Science,
        'Gnome Press',
        4,
        4
    );

-- FETCH BOOK IDs BY ISBN (reliable & unique)
DECLARE @Book_1984 INT = (
    SELECT
        BookID
    FROM
        Books
    WHERE
        ISBN = 'ISBN-9780451524935'
);

DECLARE @Book_HP1 INT = (
    SELECT
        BookID
    FROM
        Books
    WHERE
        ISBN = 'ISBN-9780747532699'
);

DECLARE @Book_Foundation INT = (
    SELECT
        BookID
    FROM
        Books
    WHERE
        ISBN = 'ISBN-9780553293357'
);

DECLARE @Book_Sapiens INT = (
    SELECT
        BookID
    FROM
        Books
    WHERE
        ISBN = 'ISBN-9780099590088'
);

DECLARE @Book_CPP INT = (
    SELECT
        BookID
    FROM
        Books
    WHERE
        ISBN = 'ISBN-9780321563842'
);

DECLARE @Book_SteveJobs INT = (
    SELECT
        BookID
    FROM
        Books
    WHERE
        ISBN = 'ISBN-9781451648539'
);

DECLARE @Book_HP2 INT = (
    SELECT
        BookID
    FROM
        Books
    WHERE
        ISBN = 'ISBN-9780747538493'
);

DECLARE @Book_IRobot INT = (
    SELECT
        BookID
    FROM
        Books
    WHERE
        ISBN = 'ISBN-9780553382563'
);

-- BOOK-AUTHORS (Many-to-Many)
INSERT INTO
    BookAuthors (BookID, AuthorID)
VALUES
    (@Book_1984, @Auth_Orwell),
    (@Book_HP1, @Auth_Rowling),
    (@Book_HP2, @Auth_Rowling),
    (@Book_Foundation, @Auth_Asimov),
    (@Book_IRobot, @Auth_Asimov),
    (@Book_Sapiens, @Auth_Harari),
    (@Book_CPP, @Auth_Bjarne),
    (@Book_SteveJobs, @Auth_Walter);

-- FETCH MEMBER IDs FOR USE IN ISSUE/RESERVATION
DECLARE @Mem_Amit INT = (
    SELECT
        MemberID
    FROM
        Members
    WHERE
        Email = 'amit.sharma@example.com'
);

DECLARE @Mem_Priya INT = (
    SELECT
        MemberID
    FROM
        Members
    WHERE
        Email = 'priya.verma@example.com'
);

DECLARE @Mem_Rahul INT = (
    SELECT
        MemberID
    FROM
        Members
    WHERE
        Email = 'rahul.mehta@example.com'
);

DECLARE @Mem_Sneha INT = (
    SELECT
        MemberID
    FROM
        Members
    WHERE
        Email = 'sneha.iyer@example.com'
);

DECLARE @Mem_Vikram INT = (
    SELECT
        MemberID
    FROM
        Members
    WHERE
        Email = 'vikram.singh@example.com'
);

DECLARE @Mem_Neha INT = (
    SELECT
        MemberID
    FROM
        Members
    WHERE
        Email = 'neha.kulkarni@example.com'
);

-- ISSUE RECORDS
INSERT INTO
    IssueRecords (
        MemberID,
        BookID,
        IssueDate,
        DueDate,
        ReturnDate,
        Status
    )
VALUES
    -- Issued and returned
    (
        @Mem_Amit,
        @Book_1984,
        '2026-01-05',
        DATEADD(DAY, 14, '2026-01-05'),
        '2026-01-12',
        'Returned'
    ),
    (
        @Mem_Priya,
        @Book_HP1,
        '2026-01-10',
        DATEADD(DAY, 14, '2026-01-10'),
        '2026-01-23',
        'Returned'
    ),
    -- Currently issued (no ReturnDate)
    (
        @Mem_Rahul,
        @Book_Foundation,
        '2026-02-01',
        DATEADD(DAY, 14, '2026-02-01'),
        NULL,
        'Issued'
    ),
    (
        @Mem_Vikram,
        @Book_Sapiens,
        '2026-02-05',
        DATEADD(DAY, 14, '2026-02-05'),
        NULL,
        'Issued'
    ),
    (
        @Mem_Neha,
        @Book_CPP,
        '2026-02-08',
        DATEADD(DAY, 14, '2026-02-08'),
        NULL,
        'Issued'
    ),
    -- Another returned
    (
        @Mem_Sneha,
        @Book_SteveJobs,
        '2025-12-20',
        DATEADD(DAY, 14, '2025-12-20'),
        '2026-01-02',
        'Returned'
    );

-- FINES (for overdue returns or unpaid)
DECLARE @Issue_Amit_1984 INT = (
    SELECT
        TOP 1 IssueID
    FROM
        IssueRecords
    WHERE
        MemberID = @Mem_Amit
        AND BookID = @Book_1984
    ORDER BY
        IssueID
);

DECLARE @Issue_Priya_HP1 INT = (
    SELECT
        TOP 1 IssueID
    FROM
        IssueRecords
    WHERE
        MemberID = @Mem_Priya
        AND BookID = @Book_HP1
    ORDER BY
        IssueID
);

DECLARE @Issue_Rahul_Foundation INT = (
    SELECT
        TOP 1 IssueID
    FROM
        IssueRecords
    WHERE
        MemberID = @Mem_Rahul
        AND BookID = @Book_Foundation
    ORDER BY
        IssueID
);

DECLARE @Issue_Vikram_Sapiens INT = (
    SELECT
        TOP 1 IssueID
    FROM
        IssueRecords
    WHERE
        MemberID = @Mem_Vikram
        AND BookID = @Book_Sapiens
    ORDER BY
        IssueID
);

DECLARE @Issue_Neha_CPP INT = (
    SELECT
        TOP 1 IssueID
    FROM
        IssueRecords
    WHERE
        MemberID = @Mem_Neha
        AND BookID = @Book_CPP
    ORDER BY
        IssueID
);

DECLARE @Issue_Sneha_SteveJobs INT = (
    SELECT
        TOP 1 IssueID
    FROM
        IssueRecords
    WHERE
        MemberID = @Mem_Sneha
        AND BookID = @Book_SteveJobs
    ORDER BY
        IssueID
);

INSERT INTO
    Fines (IssueID, FineAmount, PaidStatus, PaymentDate)
VALUES
    -- Suppose Amit returned slightly late and paid
    (@Issue_Amit_1984, 50.00, 'Paid', '2026-01-13'),
    -- Priya returned on time, no fine (omit or insert zero unpaid as example)
    -- Rahul still issued; hypothetical accruing unpaid fine (no payment date yet)
    (@Issue_Rahul_Foundation, 120.00, 'Unpaid', NULL),
    -- Vikram also accruing unpaid fine
    (@Issue_Vikram_Sapiens, 80.00, 'Unpaid', NULL),
    -- Neha on time (no fine), Sneha returned late but paid
    (
        @Issue_Sneha_SteveJobs,
        30.00,
        'Paid',
        '2026-01-03'
    );

-- RESERVATIONS
INSERT INTO
    Reservations (MemberID, BookID, ReservationDate, Status)
VALUES
    (
        @Mem_Priya,
        @Book_Sapiens,
        '2026-02-06',
        'Pending'
    ),
    (
        @Mem_Amit,
        @Book_HP2,
        '2026-01-15',
        'Completed'
    ),
    (
        @Mem_Vikram,
        @Book_IRobot,
        '2026-02-09',
        'Pending'
    ),
    (
        @Mem_Neha,
        @Book_HP1,
        '2026-01-28',
        'Cancelled'
    );

-- OPTIONAL: SYNC AvailableCopies WITH CURRENTLY ISSUED
-- Decrease AvailableCopies by the count of active issues per Book
;

WITH IssuedCounts AS (
    SELECT
        BookID,
        COUNT(*) AS ActiveIssues
    FROM
        IssueRecords
    WHERE
        Status = 'Issued'
    GROUP BY
        BookID
)
UPDATE
    b
SET
    b.AvailableCopies = CASE
        WHEN b.TotalCopies - ic.ActiveIssues >= 0 THEN b.TotalCopies - ic.ActiveIssues
        ELSE 0
    END
FROM
    Books b
    JOIN IssuedCounts ic ON ic.BookID = b.BookID;

-- Optionally, ensure AvailableCopies never exceeds TotalCopies
UPDATE
    Books
SET
    AvailableCopies = CASE
        WHEN AvailableCopies > TotalCopies THEN TotalCopies
        ELSE AvailableCopies
    END;