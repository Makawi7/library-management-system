(3, 4, '2026-11-02', '2026-11-16', 'Borrowed'),
(4, 5, '2026-10-15', '2026-10-30', 'Returned'),
(5, 3, '2026-11-04', '2026-11-18', 'Borrowed'),
(6, 6, '2026-10-10', '2026-10-25', 'Returned'),
(1, 7, '2026-11-05', '2026-11-19', 'Borrowed'),
(2, 8, '2026-10-01', '2026-10-15', 'Returned');

-- =========================================================================
-- Verification Query
-- =========================================================================
SELECT 'members' AS table_name, COUNT(*) AS total_records FROM members
UNION ALL SELECT 'books', COUNT(*) FROM books
UNION ALL SELECT 'borrowings', COUNT(*) FROM borrowings;

-- =========================================================================
-- SQL Practical Tasks (SELECT & JOIN)
-- =========================================================================

-- Q1.1 Basic retrieval — show selected columns from books
SELECT title, author, category, price FROM books;

-- Q1.2 Conditional retrieval — technology books
SELECT title, author, stock_quantity 
FROM books 
WHERE category = 'Technology';

-- Q1.3 Sorting — List books by price from highest to lowest
SELECT title, price 
FROM books 
ORDER BY price DESC;

-- Q2.1 Full Borrowing Report (JOIN)
SELECT 
    b.borrow_id,
    m.first_name  ' '  m.last_name AS member_name,
    bk.title AS book_title,
    b.borrow_date,
    b.due_date,
    b.status
FROM borrowings b
JOIN members m ON b.member_id = m.member_id
JOIN books bk ON b.book_id = bk.book_id;
