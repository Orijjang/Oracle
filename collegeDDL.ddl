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



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
