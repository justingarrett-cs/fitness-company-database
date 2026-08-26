/* =========================================================
   Fitness Company Database System
   Database Views
   Oracle SQL
   ========================================================= */


/* View 1:
   Displays scheduled group sessions with trainer information.
*/
CREATE OR REPLACE VIEW v_group_session_schedule AS
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
JOIN person p
    ON gs.trainer_id = p.person_id;


/* View 2:
   Summarizes attendance for each fitness session.
*/
CREATE OR REPLACE VIEW v_session_attendance AS
SELECT
    s.session_id,
    s.center_name,
    s.room_no,
    s.session_date,
    s.start_hour,
    COUNT(pa.customer_id) AS attendance
FROM session_tbl s
LEFT JOIN participation pa
    ON s.session_id = pa.session_id
GROUP BY
    s.session_id,
    s.center_name,
    s.room_no,
    s.session_date,
    s.start_hour;


/* View 3:
   Displays each customer's session participation history.
*/
CREATE OR REPLACE VIEW v_customer_history AS
SELECT
    p.person_id AS customer_id,
    p.first_name,
    p.family_name,
    s.session_id,
    s.session_date,
    s.start_hour,
    s.center_name,
    s.session_kind
FROM person p
JOIN customer c
    ON p.person_id = c.customer_id
LEFT JOIN participation pa
    ON c.customer_id = pa.customer_id
LEFT JOIN session_tbl s
    ON pa.session_id = s.session_id;
