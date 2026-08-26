/* =========================================================
   Fitness Company Database System
   Sample Data
   Oracle SQL
   ========================================================= */

INSERT INTO center VALUES ('Fitplaza', '100 Main Street, Atlanta, GA');
INSERT INTO center VALUES ('My6Pack', '245 Wellness Drive, Birmingham, AL');
INSERT INTO center VALUES ('IronTemple', '808 Strength Avenue, Montgomery, AL');

INSERT INTO room VALUES ('Fitplaza', 1, 20);
INSERT INTO room VALUES ('Fitplaza', 2, 12);
INSERT INTO room VALUES ('My6Pack', 1, 25);
INSERT INTO room VALUES ('My6Pack', 2, 10);
INSERT INTO room VALUES ('IronTemple', 1, 30);
INSERT INTO room VALUES ('IronTemple', 2, 15);

INSERT INTO person VALUES (101, 'Ava', 'Brooks', DATE '1995-04-12');
INSERT INTO person VALUES (102, 'Liam', 'Carter', DATE '1993-11-03');
INSERT INTO person VALUES (103, 'Mia', 'Davis', DATE '1998-07-19');
INSERT INTO person VALUES (104, 'Noah', 'Evans', DATE '1990-01-25');
INSERT INTO person VALUES (105, 'Olivia', 'Foster', DATE '1988-09-09');
INSERT INTO person VALUES (106, 'Ethan', 'Green', DATE '1999-02-14');
INSERT INTO person VALUES (107, 'Sophia', 'Hill', DATE '1994-05-30');
INSERT INTO person VALUES (108, 'Lucas', 'Irwin', DATE '1991-12-18');
INSERT INTO person VALUES (109, 'Emma', 'Jones', DATE '1997-03-21');
INSERT INTO person VALUES (110, 'James', 'King', DATE '1986-08-08');
INSERT INTO person VALUES (111, 'Grace', 'Lee', DATE '2000-06-16');
INSERT INTO person VALUES (112, 'Caleb', 'Moore', DATE '1989-10-02');

INSERT INTO customer VALUES (101);
INSERT INTO customer VALUES (102);
INSERT INTO customer VALUES (103);
INSERT INTO customer VALUES (104);
INSERT INTO customer VALUES (105);
INSERT INTO customer VALUES (106);
INSERT INTO customer VALUES (107);
INSERT INTO customer VALUES (108);
INSERT INTO customer VALUES (109);
INSERT INTO customer VALUES (111);

INSERT INTO trainer VALUES (105, 'Certified Personal Trainer', 'Strength');
INSERT INTO trainer VALUES (106, 'Group Fitness Diploma', 'Aerobics');
INSERT INTO trainer VALUES (110, 'Yoga Instructor Certificate', 'Yoga');
INSERT INTO trainer VALUES (112, 'Body Styling Specialist', 'Body Styling');

INSERT INTO session_tbl VALUES (
    201, DATE '2026-04-01', '09:00', 'Fitplaza', 1, 'GROUP'
);

INSERT INTO session_tbl VALUES (
    202, DATE '2026-04-01', '09:00', 'Fitplaza', 2, 'INDIVIDUAL'
);

INSERT INTO session_tbl VALUES (
    203, DATE '2026-04-02', '10:00', 'My6Pack', 1, 'GROUP'
);

INSERT INTO session_tbl VALUES (
    204, DATE '2026-04-02', '11:00', 'My6Pack', 2, 'INDIVIDUAL'
);

INSERT INTO session_tbl VALUES (
    205, DATE '2026-04-03', '08:00', 'IronTemple', 1, 'GROUP'
);

INSERT INTO session_tbl VALUES (
    206, DATE '2026-04-04', '14:00', 'Fitplaza', 1, 'GROUP'
);

INSERT INTO session_tbl VALUES (
    207, DATE '2026-04-04', '15:00', 'IronTemple', 2, 'INDIVIDUAL'
);

INSERT INTO session_tbl VALUES (
    208, DATE '2026-04-05', '17:00', 'My6Pack', 1, 'GROUP'
);

INSERT INTO session_tbl VALUES (
    209, DATE '2026-04-06', '18:00', 'Fitplaza', 2, 'GROUP'
);

INSERT INTO session_tbl VALUES (
    210, DATE '2026-04-07', '07:00', 'IronTemple', 1, 'INDIVIDUAL'
);

INSERT INTO group_session VALUES (201, 'Aerobics', 106);
INSERT INTO group_session VALUES (203, 'Body Styling', 112);
INSERT INTO group_session VALUES (205, 'Strength', 105);
INSERT INTO group_session VALUES (206, 'Yoga', 110);
INSERT INTO group_session VALUES (208, 'Aerobics', 106);
INSERT INTO group_session VALUES (209, 'Body Styling', 112);

INSERT INTO individual_session VALUES (202);
INSERT INTO individual_session VALUES (204);
INSERT INTO individual_session VALUES (207);
INSERT INTO individual_session VALUES (210);

INSERT INTO participation VALUES (101, 201);
INSERT INTO participation VALUES (102, 201);
INSERT INTO participation VALUES (103, 201);
INSERT INTO participation VALUES (104, 202);
INSERT INTO participation VALUES (105, 203);
INSERT INTO participation VALUES (106, 203);
INSERT INTO participation VALUES (107, 203);
INSERT INTO participation VALUES (108, 204);
INSERT INTO participation VALUES (101, 205);
INSERT INTO participation VALUES (102, 205);
INSERT INTO participation VALUES (103, 205);
INSERT INTO participation VALUES (109, 205);
INSERT INTO participation VALUES (111, 206);
INSERT INTO participation VALUES (101, 206);
INSERT INTO participation VALUES (104, 207);
INSERT INTO participation VALUES (102, 208);
INSERT INTO participation VALUES (103, 208);
INSERT INTO participation VALUES (107, 208);
INSERT INTO participation VALUES (108, 208);
INSERT INTO participation VALUES (109, 209);
INSERT INTO participation VALUES (111, 209);
INSERT INTO participation VALUES (101, 210);

COMMIT;
