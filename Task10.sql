-- 1. Update a student’s city
UPDATE Students SET City = 'Bangalore'
WHERE City = 'Chennai';

-- 2. Increase Programming course prices by 10%
UPDATE Courses SET Price = Price * 1.10
WHERE Category = 'Programming';

-- 4.. Update enrollment status to Completed
UPDATE Enrollments SET Status = 'Completed'
WHERE StudentID = 1 AND CourseID = 1;

-- 5. Correct a wrongly typed email
UPDATE Students SET Email = 'rahul.sharma@example.com'
WHERE StudentID = 1;
