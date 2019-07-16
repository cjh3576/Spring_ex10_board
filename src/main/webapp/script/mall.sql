select * from product
select * from thumbnail
select * from options
commit
insert into options values(product_seq.nextval, 'T0', 'Green');

create table cart(
	num number(8),
	id varchar2(400),
	pid varchar2(400),
	amount number(8),
	constraint cart_num_pk primary key (num),
	constraint cart_id_fk foreign key (id) references by member (id) on delete cascade,
	constraint cart_pid_fk foreign key (pid) references by product (pid) on delete set null
)



CREATE TABLE Product
(
    Pid             VARCHAR2(400)    NOT NULL, 
    Category        VARCHAR2(100)    NULL, 
    Title           VARCHAR2(400)    NULL, 
    Price           NUMBER(8)        NULL, 
    SubContents     VARCHAR2(400)    NULL, 
    MainContents    CLOB             NULL, 
    Amount          NUMBER(8)        NULL, 
    reg_date        DATE             NULL, 
    CONSTRAINT PRODUCT_PID_PK PRIMARY KEY (Pid)
)

CREATE TABLE Options
(
    num         NUMBER(8)        NOT NULL, 
    Pid         VARCHAR2(400)    NULL, 
    Contents    VARCHAR2(400)    NULL, 
    CONSTRAINT OPTIONS_NUM_PK PRIMARY KEY (num),
    CONSTRAINT OPTIONS_PID_FK Foreign KEY (PID) references product (pid)
    ON DELETE CASCADE
);

CREATE TABLE Thumbnail
(
    num      NUMBER(8)        NOT NULL, 
    pid      VARCHAR2(400)    NULL, 
    Fname    VARCHAR2(400)    NULL, 
    Oname    VARCHAR2(400)    NULL, 
    CONSTRAINT THUMBNAIL_NUM_PK PRIMARY KEY (num),
    CONSTRAINT THUMBNAIL_PID_FK Foreign KEY (PID) references product (pid)
    ON DELETE CASCADE
);

create sequence product_seq
start with 1
increment by 1
nomaxvalue
nocycle
nocache