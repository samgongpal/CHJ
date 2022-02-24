drop table MOVIE;
drop table MUSER;
drop table THEATER;
drop table THEATER_ROOM;
drop table RESERVATION;
drop table qna;
drop table seat;

CREATE TABLE MOVIE(
    m_no number(5) PRIMARY KEY,
    m_name varchar2(100),
    m_dir varchar2(50),
    m_actor varchar2(100),
    m_genre varchar2(20),
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

CREATE TABLE SEAT(
    seat1 number(1),
    seat2 number(1),
    seat3 number(1),
    seat4 number(1),
    seat5 number(1),
    seat6 number(1),
    seat7 number(1),
    seat8 number(1),
    seat9 number(1),
    seat10 number(1),
    seat11 number(1),
    seat12 number(1),
    seat13 number(1),
    seat14 number(1),
    seat15 number(1),
    seat16 number(1),
    seat17 number(1),
    seat18 number(1),
    seat19 number(1),
    seat20 number(1),
    seat21 number(1),
    seat22 number(1),
    seat23 number(1),
    seat24 number(1),
    seat25 number(1),
    u_no number(5) not null, /* 회원번호 */
    m_no number(5) not null, /* 영화번호 */
    t_no number(5) not null, /* 영화관번호 */
    r_no number(10) not null /* 예약번호 */
);


CREATE TABLE RESERVATION(
    r_no number(10) PRIMARY KEY,
    r_count number(10),
    /*r_date date,*/
    m_no number(5) not null, /* 영화번호 : 영화테이블에서 같은 번호가 있으면 그 영화 예약 */
    u_no number(5) not null, /* 회원번호 : 회원테이블에서 생년월일 가져와서 관람등급 검사 */
    t_no number(5) not null /* 영화관번호 : 영화관테이블에서 영화관 정보 join */
);

CREATE TABLE qna(
    q_no number(10) PRIMARY KEY,
    q_title varchar2(100),
    q_con varchar2(3000),
    q_hit number(10),
    q_date date
);
 /*
 hit 는 조회수입니다.
 로그인한 유저가 게시글을 클릭했을때 +1 하도록 해주세요.
 */
 
commit;

/* 영화번호, 영화제목, 감독, 배우, 장르, 개봉일, 종영일, 관람등급, 상영시간, 관객수, 영화설명 */
insert into MOVIE values(1, '언차티드', '루벤플레셔', '롬홀랜드,마크월버그', '액션', '20220216', '20220516', 
'A', 116, 40000, '모든 것을 걸었다면 세상 누구보다 빠르게 찾아야 한다!');
insert into MOVIE values(2, '극장판 주술회전 0', '박성후', '오가타메구미,하나자와카나', '애니', '20220217', '20220517',
'B', 105, 20000, '12월 24일, 우리는 백귀야행을 결행한다');
insert into MOVIE values(3, '듄', '드니 빌뇌브', '티모시샬라메,레베카퍼거슨', 'SF', '20220209', '20220509',
'A', 155, 50000, '듄을 지배하는 자가 우주를 지배한다!');
insert into MOVIE values(4, '더 배트맨', '맷리브스', '로버트패틴슨,폴다노', '액션', '20220301', '20220601',
'B', 176, 10000, '영웅이 될 것인가 악당이 될 것인가 운명을 결정할 선택만이 남았다');
insert into MOVIE values(5, '리코리쉬 피자', '폴 토마스 앤더슨', '알라나하임,쿠퍼호프만', '멜로', '20220216', '20220516',
'B', 134, 70000, '1973년 어느 찬란한 여름날 청춘의 한복판으로 달려가는 그들의 이야기');
insert into MOVIE values(6, '나일 강의 죽음', '케네스 브래너', '케네스브래너,갤가돗', '범죄', '20220209', '20220509',
'C', 127, 90000, '신혼부부를 태운 이집트 나일강의 초호화 여객선에서 살인사건이 벌어진다');
insert into MOVIE values(7, '355', '사이먼 킨버그', '제시카차스테인,다이앤크루거', '액션', '20220209', '20220509',
'B', 122, 100000, '월드클래스 블랙 에이전트 TEAM ‘355’ 드디어 그들이 움직인다!');
insert into MOVIE values(8, '해리포터와 불사조기사단', '데이빗 예이츠', '다니엘래드클리프,엠마왓슨', '환타지', '20220209', '20220509',
'A', 137, 50000, '어둠의 세력에 빠진 호그와트를 구하기 위해 해리포터와 불사조 기사단, 그들이 손을 잡았다!');
insert into MOVIE values(9, '나의 촛불', '김의성', '고영태,박영수', '다큐', '20220210', '20220510',
'A', 88, 20000, '2016년 전세계가 주목한 그 시작의 날 진보와 보수를 넘나드는 정치인들이 그날의 비화를 증언한다!');
insert into MOVIE values(10, '씽2게더', '가스제닝스', '메튜맥커너히,리즈위더스푼', '애니', '20220105', '20220405',
'A', 109, 60000, '전 세계가 주목한 스테이지! 함께 도전할 준비됐지?');
/* 회원번호, 아이디, 비밀번호, 이메일, 생년월일, 이름, 성별, 가입일자, 전화 */
INSERT INTO MUSER VALUES(1, 'aaa123', 'aaa123', 'aaa123@aaa.com', '19900101', '김회원', 'M', '20210101', '01011112222');
INSERT INTO MUSER VALUES(2, 'bbb123', 'bbb123', 'bbb123@bbb.com', '19910202', '이회원', 'F', '20210201', '01011113333');
INSERT INTO MUSER VALUES(3, 'ccc123', 'ccc123', 'ccc123@ccc.com', '19920303', '정회원', 'M', '20210301', '01011114444');
INSERT INTO MUSER VALUES(4, 'ddd123', 'ddd123', 'ddd123@ddd.com', '19930404', '현회원', 'F', '20210401', '01011115555');
INSERT INTO MUSER VALUES(5, 'eee123', 'eee123', 'eee123@eee.com', '19940505', '오회원', 'M', '20210501', '01011116666');
INSERT INTO MUSER VALUES(6, 'fff123', 'fff123', 'fff123@fff.com', '19950606', '연회원', 'F', '20210601', '01011117777');
INSERT INTO MUSER VALUES(7, 'ggg123', 'ggg123', 'ggg123@ggg.com', '19960707', '훈회원', 'M', '20210701', '01011118888');
INSERT INTO MUSER VALUES(8, 'hhh123', 'hhh123', 'hhh123@hhh.com', '19970808', '장회원', 'F', '20210801', '01011119999');
INSERT INTO MUSER VALUES(9, 'iii123', 'iii123', 'iii123@iii.com', '19980909', '구회원', 'M', '20210901', '01022221111');
INSERT INTO MUSER VALUES(10, 'jjj123', 'jjj123', 'jjj123@jjj.com', '19991010', '장회원', 'F', '20211001', '01022223333');
 /* 영화관번호, 영화관이름, 지역(동), 상영관숫자 */
INSERT INTO THEATER VALUES(1, '삼공팔', '중앙동', 3);
INSERT INTO THEATER VALUES(2, '삼공팔', '초지동', 2);
INSERT INTO THEATER VALUES(3, '삼공팔', '사동', 2);
/* 좌석번호 1-25번까지(default=0 선택 시=1), 회원번호, 영화번호, 영화관번호, 예약번호 */
INSERT INTO SEAT VALUES(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 1, 1, 1);
 /* 상영관번호, 행좌석, 열좌석, 영화관번호(영화관테이블join) */
insert into theater_room values(1, 5, 5, 1);
insert into theater_room values(2, 6, 6, 1);
insert into theater_room values(3, 7, 7, 1);
 /*예매번호, 인원수, 예매날짜, 영화번호(영화테이블), 회원번호(회원테이블), 영화관번호(영화관테이블) */
 /*
insert into RESERVATION values(1, 1, '20220201', 1, 1, 1);
insert into RESERVATION values(2, 3, '20220201', 2, 2, 2);
insert into RESERVATION values(3, 2, '20220202', 3, 3, 3);
insert into RESERVATION values(4, 2, '20220202', 4, 4, 2);
insert into RESERVATION values(5, 1, '20220203', 5, 5, 1);
insert into RESERVATION values(6, 2, '20220204', 6, 4, 2);
*/
/* 질문번호, 제목, 내용, 조회수, 작성일자 */
INSERT INTO qna VALUES(1,'포인트 적립을 못받았어요.','* 멤버십 등록된 영화관람권의 경우 현장매표소에서는 사용불가능합니다.',0,'20220115');
INSERT INTO qna VALUES(2,'휴면계정이라고 하는데 어떻게 복구 하나요?','* 휴면계정 복구는 1년 동안 가능하며 경과 시 탈퇴처리 되며 개인정보는 파기됩니다.',0,'20220116');
INSERT INTO qna VALUES(3,'영화 예매 시 오류가납니다.','* 고객센터 요일 : 월~금요일(공휴일 제외)',0,'20220116');
INSERT INTO qna VALUES(4,'VIP가 되면 어떤 혜택을 받을 수 있나요?','* 저희는 회원등급이 없습니다. 죄송합니다.',0,'20220117');
INSERT INTO qna VALUES(5,'이름을 개명했는데 어디서 바꾸나요?','* 홈페이지 및 어플 회원 로그인 후 [마이페이지] - [개인정보 수정]에서 [이름변경]을 선택하여주시면 가능합니다.',0,'20220120');
INSERT INTO qna VALUES(6,'외부음식 반입이 가능한가요?','* 상영관 내 외부 음식 반입은 가능하나
영화 관람 시 다른 고객님에게 방해가 되지않은 품목에 한하여 반입 가능합니다.
강한 냄새 및 지속적인 소음이 발생하는 품목은 취식 후 입장해주시길 부탁드리며,
쾌적한 관람 환경을 위해 많은 양해 부탁드립니다.',0,'20220120');
INSERT INTO qna VALUES(7,'분실물 문의는 어떻게 하나요?','* 홈페이지 및 모바일 어플 고객센터 > 분실물 문의를 통해 관람하신 지점과 상세 내용을 기재하여 접수하여주시면
지점에서 확인 후 순차 답변을 드립니다.',0,'20220123');
INSERT INTO qna VALUES(8,'통신사 할인혜택은 어떻게 되나요?','* 멤버십 등록된 영화관람권의 경우 현장매표소에서는 사용불가능합니다.',0,'20220126');
INSERT INTO qna VALUES(9,'포인트 적립을 못받았어요.','* 동반 할인 적용 모두 메가박스 멤버십 포인트 적립 불가',0,'20220126');
INSERT INTO qna VALUES(10,'예매가 되지 않아 선택했던 좌석으로 다시 예매를 하려고 합니다','예매하기 버튼을 누른후 영화상영관과 시간을 선택해주세요.',0,'20220128');
INSERT INTO qna VALUES(11,'통신사 할인혜택은 어떻게 되나요?','* 멤버십 등록된 영화관람권의 경우 현장매표소에서는 사용불가능합니다.',0,'20220126');
INSERT INTO qna VALUES(12,'비회원 1:1문의시 확인이 불가능한가요?','* ',0,'20220202');
INSERT INTO qna VALUES(13,'문화상품권이나,해피머니 상품권으로도 예매가 가능한가요?','',0,'20220202');

/*join 사용법 - select (join 했을 때 출력할 변수들(테이블명.컬럼명)) from (컬럼 참조 할 테이블들) WHERE 조건 ex) A테이블의 C변수와 B테이블의 C변수의 값이 같을 때*/
select theater.t_name, theater.t_address, theater.t_list, theater_room.tr_no, theater_room.tr_row, theater_room.tr_column from theater, theater_room WHERE THEATER.t_no = THEATER_ROOM.t_no;

/* SELECT문 테스트 */
/* 문제01. 예매테이블에서 1번회원의 이름, 성별, 전화번호 출력하기*/
select muser.u_name, muser.u_gender, muser.u_phone from muser, reservation WHERE muser.u_no = reservation.u_no;

/* 문제02. 예매테이블에서 3번영화의 제목, 배우, 장르 출력하기*/
select movie.m_name, movie.m_actor, movie.m_genre from movie, reservation where movie.m_no = reservation.m_no;

/* 문제03. 예매날짜가 2022년 2월 2일인 예매목록 출력하기*/
select * from reservation where r_date = '20220202';

/* 문제04. 예매 인원수가 많은 순으로 정렬*/
select * from reservation order by r_count desc;

/* 문제05. 4번회원의 예매 목록 출력하기*/
select * from reservation where u_no = '4';

/* 문제06. 작성일이 오래된 순서대로 나열하시오.*/
SELECT*FROM qna ORDER BY q_date ASC;

/* 문제07. 분실물 에관한 게시글의 내용을 불러오시오.*/
SELECT q_con FROM qna WHERE q_title like '%분실물%';

/* 문제08. 최신글 순서대로 나열하시오.*/
SELECT*FROM qna ORDER BY q_date DESC;

/* 문제09. 10번째로 작성된 글의 제목을 가져오시오.*/
SELECT q_title FROM qna WHERE q_no = 10;

/* 문제10. 총 게시물 갯수를 구하시오.*/
SELECT count(*) FROM qna; 

/* 문제11. 상영시간 2시간 이상인 영화 */
select m_name, m_info, m_rtime from movie where m_rtime >= 120;

/* 문제12. 3월 이후 개봉작 */
select m_name, m_sdate from movie where m_sdate >= '220301';

/* 문제13. 성별 기준 예약한 이름, 좌석갯수, 날짜 */
select u.u_name, u.u_gender, r.r_count, r.r_date from muser u, reservation r where u.u_no = r.u_no and u.u_gender = 'M';
select u.u_name, u.u_gender, r.r_count, r.r_date from muser u, reservation r where u.u_no = r.u_no and u.u_gender = 'F';

/* 문제14. 예약한 유저번호와 영화제목과 감독 */
select reservation.u_no, movie.m_name, movie.m_dir from movie, reservation where reservation.m_no = movie.m_no;

/* 문제15. 뷰가 많은 영화 순서 */
select * from movie order by m_view desc;

/* 문제16. 유저번호가 1번인 사람의 이름과 번호, 예약인원수  예약날짜 영화이름을 출력하세요*/
select muser.u_name, muser.u_phone, RESERVATION.r_count, reservation.r_date, MOVIE.m_name from muser, RESERVATION, MOVIE WHERE muser.u_no = 1 AND muser.u_no = RESERVATION.u_no;

/* 문제17. 사동 영화관의 예약 인원수를 출력하세요*/
select THEATER.t_name, RESERVATION.r_count from THEATER, RESERVATION WHERE RESERVATION.t_no = 3 And RESERVATION.t_no = THEATER.t_no;

/* 문제18. 19세 이상 영화만 출력하세요*/
select * from MOVIE WHERE m_grade = 'C';

/* 문제19. 영화 개봉순 정렬*/
SELECT * from MOVIE order by m_sdate asc;

/* 문제20. 회원 가입순 오름차순으로 정렬*/
SELECT * from MUSER order by u_regdate DESC; 

select * from reservation;

INSERT INTO RESERVATION VALUES(7, 1, sysdate, 1, 1, 1);
