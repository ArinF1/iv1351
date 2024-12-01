--Query 1:
SELECT
    TO_CHAR(b.schedule_time, 'Mon') AS Month,
    COUNT(*) AS Total,
    SUM(CASE WHEN l.lesson_type = 'Individual' THEN 1 ELSE 0 END) AS Individual,
    SUM(CASE WHEN l.lesson_type = 'Group' THEN 1 ELSE 0 END) AS Group,
    SUM(CASE WHEN l.lesson_type = 'Ensemble' THEN 1 ELSE 0 END) AS Ensemble
FROM
    booking b
JOIN (
    SELECT individual_lesson_id AS lesson_id, 'Individual' AS lesson_type, instructor_id, student_id FROM individual_lesson
    UNION ALL
    SELECT group_lesson_id AS lesson_id, 'Group' AS lesson_type, instructor_id, NULL AS student_id FROM group_lessons
    UNION ALL
    SELECT ensemble_id AS lesson_id, 'Ensemble' AS lesson_type, instructor_id, NULL AS student_id FROM ensembles
) l ON b.instructor_id = l.instructor_id
GROUP BY
    TO_CHAR(b.schedule_time, 'Mon')
ORDER BY
    TO_CHAR(b.schedule_time, 'Mon');


--Query 2:
WITH sibling_counts AS (
    SELECT
        s.student_id,
        COUNT(ss.sibling_id) AS number_of_siblings
    FROM
        student s
    LEFT JOIN
        student_sibling ss ON s.student_id = ss.student_id
    GROUP BY
        s.student_id
)
SELECT
    number_of_siblings,
    COUNT(student_id) AS number_of_students
FROM
    sibling_counts
GROUP BY
    number_of_siblings
ORDER BY
    number_of_siblings;

--Query 3:
WITH lesson_counts AS (
    SELECT
        i.instructor_id,
        p.first_name,
        p.surname,
        COUNT(b.time_slot_id) AS no_of_lessons
    FROM
        booking b
    JOIN
        instructor i ON b.instructor_id = i.instructor_id
    JOIN
        person p ON i.person_id = p.person_id
    GROUP BY
        i.instructor_id, p.first_name, p.surname
    HAVING
        COUNT(b.time_slot_id) > 0
)
SELECT
    instructor_id,
    first_name,
    surname,
    no_of_lessons
FROM
    lesson_counts
WHERE
    no_of_lessons > 3 --Change lesson number threshold
ORDER BY
    no_of_lessons DESC;

--Query 4:
WITH ensemble_bookings AS (
    SELECT
        e.ensemble_id,
        e.genre_id,
        mg.genre AS genre,
        e.max_students,
        COUNT(bs.student_id) AS booked_students,
        EXTRACT(DOW FROM b.schedule_time) AS day_of_week,
        b.schedule_time
    FROM
        ensembles e
    JOIN
        music_genre mg ON e.genre_id = mg.genre_id
    LEFT JOIN
        ensemble_students bs ON e.ensemble_id = bs.ensemble_id
    JOIN
        booking b ON e.instructor_id = b.instructor_id
    WHERE
        b.schedule_time >= '2024-12-04'  -- Start date
        AND b.schedule_time < '2024-12-11'  -- End date
    GROUP BY
        e.ensemble_id, e.genre_id, mg.genre, e.max_students, b.schedule_time
),

booking_status AS (
    SELECT
        ensemble_id,
        genre,
        day_of_week,
        schedule_time,
        max_students,
        booked_students,
        CASE
            WHEN booked_students = max_students THEN 'No Seats'
            WHEN max_students - booked_students <= 2 THEN '1 or 2 Seats'
            ELSE 'Many Seats'
        END AS booking_status
    FROM
        ensemble_bookings
)

SELECT
    TO_CHAR(schedule_time, 'Dy') AS day,
    genre,
    booking_status
FROM
    booking_status
ORDER BY
    genre, day_of_week;



-- EXPLAIN ANALYZE on query 1
VACUUM ANALYZE;

EXPLAIN
SELECT
    TO_CHAR(b.schedule_time, 'Mon') AS Month,
    COUNT(*) AS Total,
    SUM(CASE WHEN l.lesson_type = 'Individual' THEN 1 ELSE 0 END) AS Individual,
    SUM(CASE WHEN l.lesson_type = 'Group' THEN 1 ELSE 0 END) AS Group,
    SUM(CASE WHEN l.lesson_type = 'Ensemble' THEN 1 ELSE 0 END) AS Ensemble
FROM
    booking b
JOIN (
    SELECT individual_lesson_id AS lesson_id, 'Individual' AS lesson_type, instructor_id, student_id FROM individual_lesson
    UNION ALL
    SELECT group_lesson_id AS lesson_id, 'Group' AS lesson_type, instructor_id, NULL AS student_id FROM group_lessons
    UNION ALL
    SELECT ensemble_id AS lesson_id, 'Ensemble' AS lesson_type, instructor_id, NULL AS student_id FROM ensembles
) l ON b.instructor_id = l.instructor_id
GROUP BY
    TO_CHAR(b.schedule_time, 'Mon')
ORDER BY
    TO_CHAR(b.schedule_time, 'Mon');

