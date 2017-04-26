DROP TRIGGER user_trigger;
DROP SEQUENCE user_seq;
DROP TABLE register_user;

-- DROP TRIGGER room_trigger;
-- DROP SEQUENCE room_seq;
DROP TABLE register_room;

DROP TRIGGER table_trigger;
DROP SEQUENCE table_seq;
DROP TABLE register_table;

DROP TABLE table_s;





CREATE TABLE register_user (
  user_id NUMBER(3),
  first_name VARCHAR(45) NOT NULL ,
  last_name VARCHAR(45) NOT NULL ,
  email VARCHAR(45),
  phone_number VARCHAR(45),
  password VARCHAR(45),
  CONSTRAINT register_user_pk PRIMARY KEY (email)
);


CREATE TABLE rooms(
  room_id number(3),
  CONSTRAINT room_id_pk PRIMARY KEY (room_id)
);


CREATE TABLE register_room (
  room_id_fk NUMBER(3),
  name_room VARCHAR(45) NOT NULL,
  email_fk VARCHAR(45) NOT NULL,
  phone_number_room VARCHAR(45),
  quantity_room VARCHAR2(10),
  date_room DATE NOT NULL,
  CONSTRAINT id_fk FOREIGN KEY (room_id_fk)
  REFERENCES rooms,
  CONSTRAINT email_fk FOREIGN KEY (email_fk)
  REFERENCES register_user
);


CREATE TABLE table_s(
  table_id number(3),
  CONSTRAINT table_id_pk PRIMARY KEY (table_id)
);


CREATE TABLE register_table(
  table_id_fk NUMBER(3),
  name_table VARCHAR(45) NOT NULL,
  email_table_fk VARCHAR(45) NOT NULL,
  phone_number_table VARCHAR(45),
  quantity_table VARCHAR2(10),
  date_table DATE NOT NULL,
  CONSTRAINT id_table_fk FOREIGN KEY (table_id_fk)
  REFERENCES table_s,
  CONSTRAINT email_table_fk FOREIGN KEY (email_table_fk)
  REFERENCES register_user
);





CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE OR REPLACE TRIGGER user_trigger
BEFORE INSERT ON register_user
FOR EACH ROW
  BEGIN
    SELECT user_seq.NEXTVAL
    INTO :new.user_id
    FROM dual;
  END;


--CREATE SEQUENCE room_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
--CREATE OR REPLACE TRIGGER room_trigger
-- BEFORE INSERT ON register_room
-- FOR EACH ROW
--   BEGIN
--     SELECT room_seq.NEXTVAL
--     INTO :new.room_id
--     FROM dual;
--   END;


CREATE SEQUENCE table_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE OR REPLACE TRIGGER table_trigger
BEFORE INSERT ON register_table
FOR EACH ROW
  BEGIN
    SELECT table_seq.NEXTVAL
    INTO :new.table_id
    FROM dual;
  END;





CREATE OR REPLACE PROCEDURE FindUserLogin(PARAM1 IN VARCHAR2, PARAM2 IN VARCHAR2, PARAM3 OUT NUMBER) AS
  a VARCHAR2(45);
  BEGIN
    --SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; --на створення в конце COMMIT || ROLLBACK
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED; --на селект
    SELECT count(email) AS name_email
    INTO a
    FROM register_user
    WHERE email=param1 AND password=param2;
    IF a>0 THEN
      param3:=1;--нашло совпадение
    ELSE
      param3:=0;
    END IF ;
  END FindUserLogin;


CREATE OR REPLACE PROCEDURE FindUserRegister(PARAM1 IN VARCHAR2, PARAM3 OUT NUMBER) AS
  a VARCHAR2(45);
  BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SELECT count(email) AS name_email
    INTO a
    FROM register_user
    WHERE email=param1;
    IF a>0 THEN
      param3:=1;--нашло совпадение
    ELSE
      param3:=0;
    END IF;
  END FindUserRegister;


-- CREATE OR REPLACE PROCEDURE findFreePlace(param1 IN DATE, param2 OUT NUMBER) AS
--   a NUMBER;
--   BEGIN
--     SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--     SELECT count(room_id) AS room_id_count
--     INTO a
--     FROM register_room
--     WHERE date_room = param1;
--
--     IF a<3 THEN
--       param2:=1;
--     ELSE
--       param2:=0;
--     END IF;
--   END findFreePlace;


CREATE OR REPLACE PROCEDURE findFreePlaceTable(param1 IN DATE, param2 OUT NUMBER) AS
  a NUMBER;
  BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SELECT count(table_id) AS table_id_count
    INTO a
    FROM register_table
    WHERE date_table = param1;

    IF a<30 THEN
      param2:=1;
    ELSE
      param2:=0;
    END IF;
  END findFreePlaceTable;


create or replace
PROCEDURE PROCEDURE6 (email IN VARCHAR2, date_perem IN VARCHAR2,name_perem IN VARCHAR2,phone IN number, count_perem IN number, out_perem out NUMBER) AS
  perem number;
  perem1 number;
  BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    Select count(room_id)
    into perem
    from rooms
    where rownum = 1 and room_id NOT IN(
      select room_id_fk
      from register_room
      where date_room = date_perem
    );
    if(perem>0) then
      BEGIN
        Select room_id
        into perem1
        from rooms
        where rownum = 1 and room_id NOT IN(
          select room_id_fk
          from register_room
          where date_room = date_perem
        );

        -- perem1>0 then
        insert into register_room(room_id_fk, name_room, email_fk, phone_number_room,quantity_room, date_room) values(perem, name_perem, email, phone, count_perem, date_perem);
        out_perem:=1;
      end;
    else
      out_perem:=0;
    end if;
    COMMIT;
  END PROCEDURE6;


create or replace
PROCEDURE PROCEDURE7 (email IN VARCHAR2, date_perem IN VARCHAR2,name_perem IN VARCHAR2,phone IN number, count_perem IN number, out_perem out NUMBER) AS
  perem number;
  perem1 number;
  BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    Select count(table_id)
    into perem
    from table_s
    where rownum = 1 and table_id NOT IN(
      select table_id_fk
      from register_table
      where date_table = date_perem
    );
    if(perem>0) then
      BEGIN
        Select table_id
        into perem1
        from table_s
        where rownum = 1 and table_id NOT IN(
          select table_id_fk
          from register_table
          where date_table = date_perem
        );
        -- perem1>0 then
        insert into register_table(table_id_fk, name_table, email_table_fk, phone_number_table,quantity_table, date_table) values(perem, name_perem, email, phone, count_perem, date_perem);
        out_perem:=1;
      end;
    else
      out_perem:=0;
    end if;
    COMMIT;
  END PROCEDURE7;


SELECT user_id, first_name, last_name, email, phone_number, password FROM register_user WHERE email ='kolo@gmail.com';




INSERT INTO register_user (first_name, last_name, email, phone_number, password) VALUES ('Jake', 'Larson', 'jake@gmail.com', '420-55-22', 'secure-oass');
INSERT INTO register_user (first_name, last_name, email, phone_number, password) VALUES ('Ivan', 'Kolom', 'kolo@gmail.com', '1488', 'kolo228');
INSERT INTO register_user (first_name, last_name, email, phone_number, password) VALUES ('Ivan', 'Kolom', 'kolo1@gmail.com', '1488', 'kolo228');
INSERT INTO register_room (room_id_fk, name_room, email_fk, phone_number_room,quantity_room, date_room) VALUES (1,'Johny', 'boy@mail.ru', '1488-228', 220, TO_DATE('2004-05-01', 'yyyy-mm-dd'));
INSERT INTO register_table (name_table, email_table_fk, phone_number_table,quantity_table, date_table) VALUES ('Johny', 'Boy', '1488-228', 1, TO_DATE('2004-05-01', 'yyyy-mm-dd'));
INSERT INTO ROOMS (room_id) VALUES(1);
INSERT INTO ROOMS (room_id) VALUES(2);
INSERT INTO ROOMS (room_id) VALUES(3);
INSERT INTO ROOMS (room_id) VALUES(4);

INSERT INTO table_s (table_id) VALUES(1);
INSERT INTO table_s (table_id) VALUES(2);
INSERT INTO table_s (table_id) VALUES(3);
INSERT INTO table_s (table_id) VALUES(4);
INSERT INTO table_s (table_id) VALUES(5);
SELECT * FROM table_s;

SELECT * FROM register_room;
SELECT * FROM register_user;
SELECT * FROM register_table;

SELECT * FROM register_table;




Select count(table_id)
from table_s
where rownum = 1 and table_id NOT IN (
select table_id_fk
from register_table
where date_table = TO_DATE('2017-01-01', 'yyyy-mm-dd')
);

Select table_id
from table_s
where rownum = 1 and table_id NOT IN(
  select table_id_fk
  from register_table
  where date_table = TO_DATE('2017-01-01', 'yyyy-mm-dd')
);