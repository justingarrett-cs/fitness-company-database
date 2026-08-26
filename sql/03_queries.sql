/* =========================================================
   Fitness Company Database System
   SQL Query Examples
   Oracle SQL
   ========================================================= */


/* Q1: JOIN
   List all group sessions with center, room,
   class type, and trainer name.
*/
SELECT
    s.session_id,
    s.session_date,
    s.start_hour,
    s.center_name,
    s.room_no,
    gs.class_type,
    p.first_name || ' ' || p.family_name AS trainer_name
FROM session_tbl s
JOIN group_session gs
    ON s.session_id = gs.session_id
JOIN trainer t
    ON gs.trainer_id = t.trainer_id
JOIN person p
    ON t.trainer_id = p.person_id
ORDER BY s.session_date, s.start_hour;


/* Q2: AGGREGATION
   Count the total number of sessions at each fitness center.
*/
SELECT
    center_name,
    COUNT(*) AS total_sessions
FROM session_tbl
GROUP BY center_name
ORDER BY total_sessions DESC;


/* Q3: AGGREGATION + JOIN
   Count customer attendance for each session.
*/
SELECT
    s.session_id,
    s.center_name,
    s.session_date,
    s.start_hour,
    COUNT(pa.customer_id) AS attendance
FROM session_tbl s
LEFT JOIN participation pa
    ON s.session_id = pa.session_id
GROUP BY
    s.session_id,
    s.center_name,
    s.session_date,
    s.start_hour
ORDER BY attendance DESC;


/* Q4: NESTED QUERY
   Find customers who attended a Strength class.
*/
SELECT
    first_name,
    family_name
FROM person
WHERE person_id IN (
    SELECT customer_id
    FROM participation
    WHERE session_id IN (
        SELECT session_id
        FROM group_session
        WHERE class_type = 'Strength'
    )
);


/* Q5: CORRELATED QUERY
   Find sessions whose attendance is greater
   than the average session attendance.
*/
SELECT
    s.session_id,
    s.center_name,
    s.session_date,
    s.start_hour
FROM session_tbl s
WHERE (
    SELECT COUNT(*)
    FROM participation p
    WHERE p.session_id = s.session_id
) >
(
    SELECT AVG(attendance_count)
    FROM (
        SELECT COUNT(*) AS attendance_count
        FROM participation
        GROUP BY session_id
    )
);


/* Q6: EXISTS
   List trainers who have supervised at least
   one group fitness session.
*/
SELECT
    p.first_name,
    p.family_name,
    t.expertise
FROM trainer t
JOIN person p
    ON t.trainer_id = p.person_id
WHERE EXISTS (
    SELECT 1
    FROM group_session gs
    WHERE gs.trainer_id = t.trainer_id
);


/* Q7: NOT EXISTS
   List customers who have not participated
   in any fitness session.
*/
SELECT
    p.first_name,
    p.family_name
FROM customer c
JOIN person p
    ON c.customer_id = p.person_id
WHERE NOT EXISTS (
    SELECT 1
    FROM participation pa
    WHERE pa.customer_id = c.customer_id
);


/* Q8: ALL
   Find rooms whose capacity is greater than
   or equal to every room at Fitplaza.
*/
SELECT
    center_name,
    room_no,
    capacity
FROM room
WHERE capacity >= ALL (
    SELECT capacity
    FROM room
    WHERE center_name = 'Fitplaza'
);


/* Q9: ANY
   Find sessions held in rooms larger than
   at least one room at My6Pack.
*/
SELECT
    s.session_id,
    s.center_name,
    s.room_no,
    r.capacity
FROM session_tbl s
JOIN room r
    ON s.center_name = r.center_name
    AND s.room_no = r.room_no
WHERE r.capacity > ANY (
    SELECT capacity
    FROM room
    WHERE center_name = 'My6Pack'
);


/* Q10: UNION
   Return people who are customers or trainers.
*/
SELECT
    p.person_id,
    p.first_name,
    p.family_name,
    'Customer' AS role_type
FROM person p
JOIN customer c
    ON p.person_id = c.customer_id

UNION

SELECT
    p.person_id,
    p.first_name,
    p.family_name,
    'Trainer' AS role_type
FROM person p
JOIN trainer t
    ON p.person_id = t.trainer_id

ORDER BY person_id;


/* Q11: INTERSECT
   Find people who appear as both customers and trainers.
*/
SELECT customer_id AS person_id
FROM customer

INTERSECT

SELECT trainer_id AS person_id
FROM trainer;


/* Q12: HAVING
   Find fitness centers with more than two sessions.
*/
SELECT
    center_name,
    COUNT(*) AS total_sessions
FROM session_tbl
GROUP BY center_name
HAVING COUNT(*) > 2;
