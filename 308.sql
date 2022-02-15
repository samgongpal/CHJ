drop table MOVIE;
drop table MUSER;
drop table THEATER;
drop table THEATER_ROOM;
drop table RESERVATION;
drop table qna;

CREATE TABLE MOVIE(
    m_no number(5) PRIMARY KEY,
    m_name varchar2(30),
    m_dir varchar2(20),
    m_actor varchar2(100),
    m_genre varchar2(10),
    m_sdate date,
    m_edate date,
    m_grade char(2), /* A=전체이용가 B=15세이상 C=19세이상 */
    m_rtime number(10),
    m_view number(10),
    m_info varchar(1000)
);

CREATE TABLE MUSER(
    u_no number(5) PRIMARY KEY,
    u_id varchar2(10),
    u_pw varchar2(10),
    u_mail varchar2(30),
    u_birth date,
    u_name varchar2(10),
    u_gender char(2),
    u_regdate date,
    u_phone varchar2(15)
);

CREATE TABLE THEATER(
    t_no number(5) PRIMARY KEY,
    t_name varchar2(10),
    t_address varchar2(10),
    t_list number(3)
);

CREATE TABLE THEATER_ROOM(
    tr_no number(5) PRIMARY KEY,
    tr_row number(10),
    tr_column number(10),
    t_no number(5) not null /* 영화관 테이블 join */
);
    

CREATE TABLE RESERVATION(
    r_no number(10) PRIMARY KEY,
    r_count number(10),
    r_date date,
    m_no number(5) not null, /* 영화번호 : 영화테이블에서 같은 번호가 있으면 그 영화 예약 */
    u_no number(5) not null, /* 회원번호 : 회원테이블에서 생년월일 가져와서 관람등급 검사 */
    t_no number(5) not null /* 영화관번호 : 영화관테이블에서 영화관 정보 join */
);

CREATE TABLE qna(
    q_no number(10) PRIMARY KEY,
    q_title varchar2(50),
    q_con varchar2(3000),
    q_hit number(10),
    q_date date
);

commit;

insert into movie values(1, '1번영화', '김감독', '김배우, 정배우', '스릴러', '20220101', '20220201', 'C', '130', '95000', '김배우의 스릴러'); 
/* 영화번호, 영화제목, 감독, 배우, 장르, 개봉일, 종영일, 관람등급, 상영시간, 관객수, 영화설명 */
insert into movie values(2, '2번영화', '박감독', '유배우, 조배우', '공포', '20220101', '20220201', 'C', '150', '205000', '유배우의 공포');
insert into movie values(3, '3번영화', '정감독', '최배우, 김배우', '액션', '20220101', '20220201', 'B', '90', '130000', '최배우의 액션');
insert into movie values(4, '4번영화', '조감독', '서배우, 이배우', '가족', '20220101', '20220201', 'A', '110', '40000', '서배우의 가족');
insert into movie values(5, '5번영화', '이감독', '마배우, 장배우', '코미디', '20220101', '20220201', 'B', '170', '800000', '마배우의 코미디');
INSERT INTO MUSER VALUES(1, 'aaa123', 'aaa123', 'aaa123@aaa.com', '19900101', '김회원', 'M', '20210101', '01011112222'); /* 회원번호, 아이디, 비밀번호, 이메일, 생년월일, 이름, 성별, 가입일자, 전화 */
INSERT INTO MUSER VALUES(2, 'bbb123', 'bbb123', 'bbb123@bbb.com', '19910202', '이회원', 'F', '20210201', '01011113333');
INSERT INTO MUSER VALUES(3, 'ccc123', 'ccc123', 'ccc123@ccc.com', '19920303', '정회원', 'M', '20210301', '01011114444');
INSERT INTO MUSER VALUES(4, 'ddd123', 'ddd123', 'ddd123@ddd.com', '19930404', '현회원', 'F', '20210401', '01011115555');
INSERT INTO MUSER VALUES(5, 'eee123', 'eee123', 'eee123@eee.com', '19940505', '오회원', 'M', '20210501', '01011116666');
INSERT INTO MUSER VALUES(6, 'fff123', 'fff123', 'fff123@fff.com', '19950606', '연회원', 'F', '20210601', '01011117777');
INSERT INTO MUSER VALUES(7, 'ggg123', 'ggg123', 'ggg123@ggg.com', '19960707', '훈회원', 'M', '20210701', '01011118888');
INSERT INTO MUSER VALUES(8, 'hhh123', 'hhh123', 'hhh123@hhh.com', '19970808', '장회원', 'F', '20210801', '01011119999');
INSERT INTO MUSER VALUES(9, 'iii123', 'iii123', 'iii123@iii.com', '19980909', '구회원', 'M', '20210901', '01022221111');
INSERT INTO MUSER VALUES(10, 'jjj123', 'jjj123', 'jjj123@jjj.com', '19991010', '장회원', 'F', '20211001', '01022223333');
INSERT INTO THEATER VALUES(1, '삼공팔', '중앙동', 3); /* 영화관번호, 영화관이름, 지역(동), 상영관숫자 */
INSERT INTO THEATER VALUES(2, '삼공팔', '초지동', 2);
INSERT INTO THEATER VALUES(3, '삼공팔', '사동', 2);
insert into theater_room values(1, 5, 5, 1); /* 상영관번호, 행좌석, 열좌석, 영화관번호(영화관테이블join) */
insert into theater_room values(2, 6, 6, 1);
insert into theater_room values(3, 7, 7, 1);
insert into RESERVATION values(1, 1, '20220201', 1, 1, 1); /*예매번호, 인원수, 예매날짜, 영화번호(영화테이블), 회원번호(회원테이블), 영화관번호(영화관테이블) */
insert into RESERVATION values(2, 3, '20220201', 2, 2, 2);
insert into RESERVATION values(3, 2, '20220201', 3, 3, 3);
insert into RESERVATION values(4, 2, '20220201', 4, 4, 2);
insert into RESERVATION values(5, 1, '20220201', 5, 5, 1);


select theater.t_name, theater.t_address, theater.t_list, theater_room.tr_no, theater_room.tr_row, theater_room.tr_column from theater, theater_room WHERE THEATER.t_no = THEATER_ROOM.t_no;
