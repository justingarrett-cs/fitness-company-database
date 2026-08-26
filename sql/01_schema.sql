/* =========================================================
   Fitness Company Database System
   Database Schema
   Oracle SQL
   ========================================================= */

CREATE TABLE center (
    center_name VARCHAR2(40) PRIMARY KEY,
    address VARCHAR2(100) NOT NULL
);

CREATE TABLE room (
    center_name VARCHAR2(40) NOT NULL,
    room_no NUMBER(4) NOT NULL,
    capacity NUMBER(4) NOT NULL CHECK (capacity > 0),

    CONSTRAINT pk_room
        PRIMARY KEY (center_name, room_no),

    CONSTRAINT fk_room_center
        FOREIGN KEY (center_name)
        REFERENCES center(center_name)
        ON DELETE CASCADE
);

CREATE TABLE person (
    person_id NUMBER(6) PRIMARY KEY,
    first_name VARCHAR2(30) NOT NULL,
    family_name VARCHAR2(30) NOT NULL,
    date_of_birth DATE NOT NULL,

    CONSTRAINT uq_person_name_dob
        UNIQUE (first_name, family_name, date_of_birth)
);

CREATE TABLE customer (
    customer_id NUMBER(6) PRIMARY KEY,

    CONSTRAINT fk_customer_person
        FOREIGN KEY (customer_id)
        REFERENCES person(person_id)
        ON DELETE CASCADE
);

CREATE TABLE trainer (
    trainer_id NUMBER(6) PRIMARY KEY,
    diploma VARCHAR2(80) NOT NULL,
    expertise VARCHAR2(40) NOT NULL,

    CONSTRAINT fk_trainer_person
        FOREIGN KEY (trainer_id)
        REFERENCES person(person_id)
        ON DELETE CASCADE
);

CREATE TABLE session_tbl (
    session_id NUMBER(6) PRIMARY KEY,
    session_date DATE NOT NULL,
    start_hour VARCHAR2(5) NOT NULL,
    center_name VARCHAR2(40) NOT NULL,
    room_no NUMBER(4) NOT NULL,
    session_kind VARCHAR2(12) NOT NULL
        CHECK (session_kind IN ('GROUP', 'INDIVIDUAL')),

    CONSTRAINT fk_session_room
        FOREIGN KEY (center_name, room_no)
        REFERENCES room(center_name, room_no),

    CONSTRAINT uq_session_room_time
        UNIQUE (center_name, room_no, session_date, start_hour),

    CONSTRAINT ck_start_hour_format
        CHECK (
            REGEXP_LIKE(
                start_hour,
                '^[0-2][0-9]:[0-5][0-9]$'
            )
        )
);

CREATE TABLE group_session (
    session_id NUMBER(6) PRIMARY KEY,
    class_type VARCHAR2(40) NOT NULL,
    trainer_id NUMBER(6) NOT NULL,

    CONSTRAINT fk_group_session
        FOREIGN KEY (session_id)
        REFERENCES session_tbl(session_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_group_trainer
        FOREIGN KEY (trainer_id)
        REFERENCES trainer(trainer_id)
);

CREATE TABLE individual_session (
    session_id NUMBER(6) PRIMARY KEY,

    CONSTRAINT fk_individual_session
        FOREIGN KEY (session_id)
        REFERENCES session_tbl(session_id)
        ON DELETE CASCADE
);

CREATE TABLE participation (
    customer_id NUMBER(6) NOT NULL,
    session_id NUMBER(6) NOT NULL,

    CONSTRAINT pk_participation
        PRIMARY KEY (customer_id, session_id),

    CONSTRAINT fk_part_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_part_session
        FOREIGN KEY (session_id)
        REFERENCES session_tbl(session_id)
        ON DELETE CASCADE
);
