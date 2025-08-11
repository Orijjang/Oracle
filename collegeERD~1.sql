-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 12:35:04 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE lecture (
    lecno     NUMBER NOT NULL,
    lecname   VARCHAR2(20 BYTE) NOT NULL,
    leccredit NUMBER NOT NULL,
    lectime   NUMBER NOT NULL,
    lecclass  VARCHAR2(10) NOT NULL
)
LOGGING;

ALTER TABLE lecture ADD CONSTRAINT lecture_pk PRIMARY KEY ( lecno );

CREATE TABLE register (
    regstdno      NUMBER NOT NULL,
    reglecno      CHAR(8 BYTE) NOT NULL,
    regmidscore   NUMBER,
    regfinalscore NUMBER,
    regtotalscore NUMBER,
    reggrade      CHAR(1 BYTE)
)
LOGGING;

CREATE TABLE student (
    stdno      CHAR(8 BYTE) NOT NULL,
    stdname    VARCHAR2(20 BYTE) NOT NULL,
    stdhp      CHAR(13 BYTE) NOT NULL,
    stdyear    NUMBER NOT NULL,
    stdaddress VARCHAR2(100 BYTE) NOT NULL
)
LOGGING;

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( stdno );

ALTER TABLE student ADD CONSTRAINT student__un UNIQUE ( stdhp );

ALTER TABLE register
    ADD CONSTRAINT register_lecture_fk
        FOREIGN KEY ( regstdno )
            REFERENCES lecture ( lecno )
            NOT DEFERRABLE;

ALTER TABLE register
    ADD CONSTRAINT register_student_fk
        FOREIGN KEY ( reglecno )
            REFERENCES student ( stdno )
            NOT DEFERRABLE;

insert into student values ('20201011','김유신','010-1234-1001',3,'경남 김해시');
insert into student values ('20201122','김춘추','010-1234-1002',3,'경남 경주시');
insert into student values ('20210213','장보고','010-1234-1003',2,'전남 완도군');
insert into student values ('20210324','강감찬','010-1234-1004',2,'서울 관악구');
insert into student values ('20220415','이순신','010-1234-1005',1,'서울 종로구');

insert into lecture values (101,'컴퓨터과학 개론',2,40,'본301');
insert into lecture values (102,'프로그래밍 언어',3,52,'본302');
insert into lecture values (103,'데이터베이스',3,56,'본303');
insert into lecture values (104,'자료구조',3,60,'본304');
insert into lecture values (105,'운영체제',3,52,'본305');

INSERT INTO register VALUES ('20220415',101,60,30,NULL,NULL);
INSERT INTO register VALUES ('20210324',103,54,36,NULL,NULL);
INSERT INTO register VALUES ('20201011',105,52,28,NULL,NULL);
INSERT INTO register VALUES ('20220415',102,38,40,NULL,NULL);
INSERT INTO register VALUES ('20210324',104,56,32,NULL,NULL);
INSERT INTO register VALUES ('20210213',103,48,40,NULL,NULL);
delete from register where  regTotalScore is null;
select * from register;

