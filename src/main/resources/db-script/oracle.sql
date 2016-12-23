DROP TRIGGER user_trigger;
DROP SEQUENCE user_seq;
DROP TABLE register_user;

CREATE TABLE register_user (
  user_id NUMBER(3),
  first_name VARCHAR(45),
  last_name VARCHAR(45),
  email VARCHAR(45),
  phone_number VARCHAR(45),
  password VARCHAR(45),
  CONSTRAINT register_user_pk PRIMARY KEY (user_id)
);

CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE ;

CREATE OR REPLACE TRIGGER user_trigger
BEFORE INSERT ON register_user
FOR EACH ROW

  BEGIN
    SELECT user_seq.NEXTVAL
    INTO :new.user_id
    FROM dual;
  END;


INSERT INTO register_user (first_name, last_name, email, phone_number, password) VALUES ('Jake', 'Larson', 'jake@gmail.com', '420-55-22', 'secure-oass');
SELECT * FROM register_user;