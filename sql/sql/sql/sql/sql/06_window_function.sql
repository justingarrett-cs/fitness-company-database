/* =========================================================
   Fitness Company Database System
   Window Function Example
   Oracle SQL
   ========================================================= */

/* Rank trainers by group-session attendance
   during a rolling three-month period.
*/
SELECT
    trainer_id,
    trainer_name,
    total_attendance,
    RANK() OVER (
        ORDER BY total_attendance DESC
    ) AS popularity_rank
FROM (
    SELECT
        gs.trainer_id,
        p.first_name || ' ' || p.family_name AS trainer_name,
        COUNT(pa.customer_id) AS total_attendance
    FROM group_session gs
    JOIN session_tbl s
        ON gs.session_id = s.session_id
    JOIN person p
        ON gs.trainer_id = p.person_id
    LEFT JOIN participation pa
        ON gs.session_id = pa.session_id
    WHERE s.session_date >= ADD_MONTHS(SYSDATE, -3)
    GROUP BY
        gs.trainer_id,
        p.first_name,
        p.family_name
);
