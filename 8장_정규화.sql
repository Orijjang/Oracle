
CREATE TABLE bookorder (
    orderno   NUMBER NOT NULL,
    orderdate DATE,
    custid    VARCHAR2(20 BYTE),
    cname     VARCHAR2(20 BYTE),
    address   VARCHAR2(100 BYTE),
    bookid    NUMBER,
    bookname  VARCHAR2(100 BYTE),
    count     NUMBER,
    price     NUMBER
);

ALTER TABLE table_1 ADD CONSTRAINT table_1_pk PRIMARY KEY ( orderno );

--실습 7-1
insert into bookorder values (1001, '2024-01-12', 'a101', '김유신', '김해', 101, '프로그래밍', 1, 28000);
insert into bookorder values (1002, '2024-01-12', 'a102', '김춘추', '경주', 101, '프로그래밍', 1, 60000);
insert into bookorder values (1003, '2024-01-12', 'a102', '김춘추', '경주', 102, '자료구조', 2, 60000);
insert into bookorder values (1004, '2024-01-12', 'a103', '장보고', '완도', 102, '자료구조', 2, 32000);
insert into bookorder values (1005, '2024-01-12', 'a104', '강감찬', '서울', 110, '데이터베이스', 1, 25000);
insert into bookorder values (1006, '2024-01-12', 'a105', '이순신', '서울', 110, '데이터베이스', 1, 41000);
insert into bookorder values (1006, '2024-01-12', 'a105', '이순신', '서울', 102, '자료구조', 1, 41000);

-- 실습 7-2
CREATE TABLE bo_book (
    bookid   NUMBER NOT NULL,
    bookname VARCHAR2(100 BYTE),
    price    NUMBER
);

ALTER TABLE bo_book ADD CONSTRAINT book_pk PRIMARY KEY ( bookid );

CREATE TABLE bo_customer (
    custid  VARCHAR2(20 BYTE) NOT NULL,
    name    VARCHAR2(20 BYTE),
    address VARCHAR2(100 BYTE)
);

ALTER TABLE bo_customer ADD CONSTRAINT user_pk PRIMARY KEY ( custid );

CREATE TABLE bo_order (
    orderno   NUMBER NOT NULL,
    orderid   VARCHAR2(20 BYTE),
    bookid    NUMBER,
    count     NUMBER,
    orderdate DATE
);

ALTER TABLE bo_order ADD CONSTRAINT order_pk PRIMARY KEY ( orderno );

ALTER TABLE bookorder ADD CONSTRAINT table_1_pk PRIMARY KEY ( orderno );

ALTER TABLE bo_order
    ADD CONSTRAINT order_book_fk FOREIGN KEY ( bookid )
        REFERENCES bo_book ( bookid );

ALTER TABLE bo_order
    ADD CONSTRAINT order_customer_fk FOREIGN KEY ( orderid )
        REFERENCES bo_customer ( custid );



CREATE TABLE bo_book3 (
    bookid   NUMBER NOT NULL,
    bookname VARCHAR2(100 BYTE)
);

ALTER TABLE bo_book3 ADD CONSTRAINT bo_bookv1_pk PRIMARY KEY ( bookid );

CREATE TABLE bo_customer3 (
    custid  VARCHAR2(20 BYTE) NOT NULL,
    name    VARCHAR2(20 BYTE),
    address VARCHAR2(100 BYTE)
);

ALTER TABLE bo_customer3 ADD CONSTRAINT bo_customerv1_pk PRIMARY KEY ( custid );

CREATE TABLE bo_order3 (
    orderno   NUMBER NOT NULL,
    orderid1  VARCHAR2(20 BYTE),
    orderdate DATE
);

ALTER TABLE bo_order3 ADD CONSTRAINT bo_orderv1_pk PRIMARY KEY ( orderno );

CREATE TABLE bo_orderitem (
    orderno1 NUMBER NOT NULL,
    bookid1  NUMBER NOT NULL,
    count    NUMBER,
    price    NUMBER
);

ALTER TABLE bo_orderitem ADD CONSTRAINT bo_order3v1_pk PRIMARY KEY ( orderno1,
                                                                     bookid1 );

ALTER TABLE bo_order3
    ADD CONSTRAINT bo_order3_bo_customer3_fk FOREIGN KEY ( orderid1 )
        REFERENCES bo_customer3 ( custid );

ALTER TABLE bo_orderitem
    ADD CONSTRAINT bo_orderitem_bo_book3_fk FOREIGN KEY ( bookid1 )
        REFERENCES bo_book3 ( bookid );

ALTER TABLE bo_orderitem
    ADD CONSTRAINT bo_orderitem_bo_order3_fk FOREIGN KEY ( orderno1 )
        REFERENCES bo_order3 ( orderno );
