/* =========================================================
   Fitness Company Database System
   Audit Logging Trigger
   Oracle SQL / PL/SQL
   ========================================================= */


/* Sequence used to generate unique audit log IDs. */
CREATE SEQUENCE audit_seq
START WITH 1
INCREMENT BY 1;


/* Audit table used to record changes to person data. */
CREATE TABLE customer_audit (
    audit_id NUMBER PRIMARY KEY,
    customer_id NUMBER(6),
    action_type VARCHAR2(10),
    changed_by VARCHAR2(30),
    changed_on DATE,
    old_first_name VARCHAR2(30),
    old_family_name VARCHAR2(30),
    old_date_of_birth DATE,
    new_first_name VARCHAR2(30),
    new_family_name VARCHAR2(30),
    new_date_of_birth DATE
);


/* Trigger records INSERT, UPDATE, and DELETE operations. */
CREATE OR REPLACE TRIGGER trg_customer_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW

DECLARE
    v_action VARCHAR2(10);

BEGIN

    IF INSERTING THEN

        v_action := 'INSERT';

        INSERT INTO customer_audit VALUES (
            audit_seq.NEXTVAL,
            :NEW.person_id,
            v_action,
            USER,
            SYSDATE,
            NULL,
            NULL,
            NULL,
            :NEW.first_name,
            :NEW.family_name,
            :NEW.date_of_birth
        );

    ELSIF UPDATING THEN

        v_action := 'UPDATE';

        INSERT INTO customer_audit VALUES (
            audit_seq.NEXTVAL,
            :NEW.person_id,
            v_action,
            USER,
            SYSDATE,
            :OLD.first_name,
            :OLD.family_name,
            :OLD.date_of_birth,
            :NEW.first_name,
            :NEW.family_name,
            :NEW.date_of_birth
        );

    ELSIF DELETING THEN

        v_action := 'DELETE';

        INSERT INTO customer_audit VALUES (
            audit_seq.NEXTVAL,
            :OLD.person_id,
            v_action,
            USER,
            SYSDATE,
            :OLD.first_name,
            :OLD.family_name,
            :OLD.date_of_birth,
            NULL,
            NULL,
            NULL
        );

    END IF;

END;
/
