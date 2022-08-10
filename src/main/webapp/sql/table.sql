
-- zzp 계정 생성
CREATE USER zzp IDENTIFIED BY zzp;

-- zzp 계정 권한 부여
GRANT CONNECT, RESOURCE TO zzp;

-- + 눌러서 계정 정보 저장

-- 회원
CREATE TABLE member (
	userid	VARCHAR2(30)		PRIMARY KEY,
	passwd	VARCHAR2(20)		NOT NULL,
	username	VARCHAR2(10)		NOT NULL,
	email1	VARCHAR2(20)		NOT NULL,
	email2	VARCHAR2(20)		NOT NULL,
	phone	VARCHAR2(11)		NOT NULL,
	created_at		DATE	DEFAULT sysdate	NOT NULL,
	role	NUMBER	NULL
);

-- 카테고리
CREATE TABLE CATEGORY (
	C_ID NUMBER PRIMARY KEY,
	C_NAME VARCHAR2(20) NOT NULL,
	C_RNK NUMBER NOT NULL,
	USERID NOT NULL REFERENCES MEMBER(USERID),
	C_CREATED_DATE DATE DEFAULT SYSDATE NOT NULL
);

-- 상품
CREATE TABLE PRODUCT (
	P_ID NUMBER PRIMARY KEY,
	P_NAME VARCHAR2(60 BYTE) NOT NULL,
	P_CONTENT VARCHAR2(100)NOT NULL,
	C_ID NOT NULL REFERENCES CATEGORY(C_ID),
	P_COST_PRICE NUMBER NOT NULL,
	P_SELLING_PRICE NUMBER NOT NULL,
	P_DISCOUNT NUMBER NOT NULL,
	P_CREATED DATE   DEFAULT SYSDATE   NOT NULL,
	P_STOCK NUMBER NOT NULL,
	USERID NOT NULL REFERENCES MEMBER(USERID)
);

-- 상품이미지
CREATE TABLE IMAGES(
	P_ID REFERENCES PRODUCT(P_ID),
	IMAGE_RNK NUMBER,
	IMAGE_ROUTE VARCHAR2(30),
	USERID REFERENCES MEMBER(USERID),
	UPDATE_DATE DATE DEFAULT SYSDATE NOT NULL
);

-- 주문
CREATE TABLE ORDERS(
	ORDER_ID NUMBER,
	USERID REFERENCES MEMBER(USERID),
	P_ID REFERENCES PRODUCT(P_ID),
	
	CONSTRAINT ORDERSPK PRIMARY KEY(ORDER_ID,USERID,P_ID),
	
	TOTAL_PRICE NUMBER NOT NULL,
	DELIVERY_ADDRESS VARCHAR2(150) NOT NULL,
	DELIVERY_LOC VARCHAR2(20) NOT NULL,
	DELIVERY_REQ VARCHAR2(50) NOT NULL,
	ORDER_DATE DATE DEFAULT sysdate   NOT NULL,
	ORDER_STATE VARCHAR2(20) NOT NULL
);

-- 주문상세
CREATE TABLE order_detail (
	order_id	NUMBER		NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
	p_id	VARCHAR2(40)		NOT NULL REFERENCES product(p_id) ON DELETE CASCADE,
	userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE,
	order_status	VARCHAR2(30)		NOT NULL
);

-- 장바구니
CREATE TABLE cart (
	cart_id	NUMBER		PRIMARY KEY ,
	userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE,
	p_id	VARCHAR2(40)		NOT NULL REFERENCES product(p_id) ON DELETE CASCADE,
	cart_created	DATE	DEFAULT sysdate	NOT NULL
);

-- 배송지 주소
CREATE TABLE address (
	address_id 	NUMBER		PRIMARY KEY,
	userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE,
	address_name	VARCHAR2(20)		NULL,
	receiver_name	VARCHAR2(10)		NULL,
	receiver_phone	VARCHAR2(11)		NULL,
	post_num		VARCHAR2(10)		NULL,
	addr1	VARCHAR2(300)		NULL,
	addr2	VARCHAR2(300)		NULL,
	default_chk	NUMBER		NULL
);

-- 프로필
CREATE TABLE profile (
	userid  VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE,
	profile_img  VARCHAR2(300)	NULL,
	profile_txt  VARCHAR2(500)	NULL
);

-- 공지 
CREATE TABLE notice (
   	 notice_id NUMBER primary key,
  	 notice_tittle VARCHAR2(50) NOT NULL,
   	 notice_content VARCHAR2(1000) NOT NULL,
  	 notice_created DATE DEFAULT sysdate,
  	 notice_hits NUMBER NOT NULL,
  	 userid VARCHAR2(30) references member(userid) ON DELETE CASCADE,
  	 notice_category VARCHAR2(30) NOT NULL
);

-- 문의글 (q_board_category 1:상품문의/ 2:문의게시판)
CREATE TABLE question (
	q_id	NUMBER		PRIMARY KEY,
	q_board_category	NUMBER		NOT NULL,
	q_category	VARCHAR2(20)		NOT NULL,
	q_title	VARCHAR2(50)		NOT NULL,
	q_content		VARCHAR2(1000)		NOT NULL,
	q_created		DATE	DEFAULT sysdate	NOT NULL,
	q_img	VARCHAR2(300)		NULL,
	q_status	VARCHAR(20)		NOT NULL,
	userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE,
	p_id	VARCHAR2(40)		NULL REFERENCES product(p_id) ON DELETE CASCADE
);

-- 챌린지 도장
CREATE TABLE stamp (
	stamp_id		VARCHAR2(10)		PRIMARY KEY,
	userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE,
	stamp_created	DATE	DEFAULT sysdate	NOT NULL
);

-- 찜한 상품
CREATE TABLE product_liked (
	userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE,
	p_id	VARCHAR2(40)		NOT NULL REFERENCES product(p_id) ON DELETE CASCADE
);

-- 리뷰
CREATE TABLE review (
	review_id		NUMBER		PRIMARY KEY,
	order_id	NUMBER		NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
	p_id	VARCHAR2(40)		NOT NULL REFERENCES product(p_id) ON DELETE CASCADE,
	userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE,
	review_title	VARCHAR2(50)		NOT NULL,
	review_content	VARCHAR2(1000)		NOT NULL,
	review_rate	NUMBER		NOT NULL,
	review_img	VARCHAR2(200)		NULL
);

-- 챌린지
CREATE TABLE challenge (	
	chall_id 	NUMBER PRIMARY KEY,
 	userid 	VARCHAR2(30) NOT NULL REFERENCES member(userid) ON DELETE CASCADE,
 	chall_title 	VARCHAR2(50) NOT NULL,
 	chall_content 	VARCHAR2(1000) NOT NULL,
 	chall_category 	VARCHAR2(30) NOT NULL,
 	chall_hits 		NUMBER	 DEFAULT 0 	  NOT NULL,
 	chall_liked 	NUMBER   DEFAULT 0	  NOT NULL,
 	chall_created 	DATE 	 DEFAULT sysdate NOT NULL,
 	chall_img 		VARCHAR2(300) NULL,
 	chall_comments  NUMBER 	 DEFAULT 0	  NOT NULL
);

-- 챌린지 댓글
CREATE TABLE comments (
	comment_id	NUMBER		PRIMARY KEY,
	chall_id	NUMBER		NOT NULL REFERENCES challenge(chall_id) ON DELETE CASCADE,
	comment_content	VARCHAR2(800)		NOT NULL,
	comment_created 		DATE 	DEFAULT sysdate		NOT NULL,
	userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE
);

-- 챌린지 좋아요
CREATE TABLE chall_liked (
  chall_id	NUMBER		NOT NULL REFERENCES challenge(chall_id) ON DELETE CASCADE,
  userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE
);
ALTER TABLE chall_liked ADD PRIMARY KEY (chall_id,userid);

-- 큐엔에이 답변
CREATE TABLE answer (
	answer_id	number CONSTRAINT pk_answer_answer_id PRIMARY key,
	answer_content	VARCHAR(200)	NOT NULL,
	q_id	NUMBER CONSTRAINT FK_answer_q_id REFERENCES QUESTION(Q_ID) on DELETE CASCADE,
	answer_created	DATE DEFAULT sysdate
);

-- 시퀀스
CREATE SEQUENCE 테이블명_컬럼명_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;

-- 배송지 주소 시퀀스
CREATE SEQUENCE address_address_id_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;

-- 상품 시퀀스
CREATE SEQUENCE PRODUCT_P_ID_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;

-- 장바구니 번호 시퀀스
CREATE SEQUENCE cart_cart_id_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;
  
-- 주문 번호 시퀀스
CREATE SEQUENCE orders_order_id_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;
  
-- 리뷰 글 번호 시퀀스
CREATE SEQUENCE review_review_id_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;
  
-- 챌린지 시퀀스 
CREATE SEQUENCE challenge_chall_id_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;
  
-- 챌린지 댓글 시퀀스
CREATE SEQUENCE comments_comment_id_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;  

-- 공지 글 번호 시퀀스
CREATE SEQUENCE notice_notice_id_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;
  
-- 문의 글 번호 시퀀스
CREATE SEQUENCE question_q_id_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;

 -- 답변 글 번호 시퀀스
 CREATE SEQUENCE answer_answer_id
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;
  
-------------- insert --------------
-- 상품
INSERT INTO PRODUCT (P_ID,P_NAME,P_CONTENT,P_CATEGORY,P_COST_PRICE,P_SELLING_PRICE,P_DISCOUNT,P_CREATED,P_STOCK,USERID) 
VALUES(PRODUCT_P_ID_SEQ.NEXTVAL,'면비누망','플라스틱FREE! 미세 플라스틱에서 자유로운 면 비누망 입니다.',6,2500,2500,'0',SYSDATE,50,'admin1');


-- 챌린지
INSERT INTO member VALUES ('test', 1, 1, 1, 1, 1, sysdate);
INSERT INTO challenge VALUES (CHALLENGE_CHALL_ID_SEQ.nextval, 'test', '용기내 떡볶이', '오늘 떡볶이 용기내 봤어요~ 너무 맛있었습니다.', '이 달의 챌린지', 0, 0, sysdate, 'chall01.jpg');
INSERT INTO challenge VALUES (CHALLENGE_CHALL_ID_SEQ.nextval, 'test', '옷장 정리하고 기부했어요', '열심히 하겠습니다~', '기부하기', 0, 0, sysdate, 'chall02.jpg');
INSERT INTO challenge VALUES (CHALLENGE_CHALL_ID_SEQ.nextval, 'test', '아껴써야죠', '제로웨이스트 실천해보아요', '아껴쓰기', 0, 0, sysdate, 'chall03.jpg');
INSERT INTO challenge VALUES (CHALLENGE_CHALL_ID_SEQ.nextval, 'test', '재활용 열심히 했어요', '하루종일 했습니다.^^', '쓰레기 줄이기', 0, 0, sysdate, 'chall04.jpg');
INSERT INTO challenge VALUES (CHALLENGE_CHALL_ID_SEQ.nextval, 'test', '옷장 정리하고 기부했어요', '열심히 하겠습니다~', '기부하기', 0, 0, sysdate, 'chall02.jpg');
INSERT INTO challenge VALUES (CHALLENGE_CHALL_ID_SEQ.nextval, 'test', '아껴써야죠', '제로웨이스트 실천해보아요', '아껴쓰기', 0, 0, sysdate, 'chall03.jpg');
COMMIT;


-- 관리자, 공지
INSERT into admin values ('admin1', 'zzp1', 'zzp1234', 'zzp1234@naver.com', '01012341234');
insert into notice values (NOTICE_NOTICE_ID_SEQ.nextval, 'zzp공지', 'zzp에 오신 여러분 환영합니다',
    sysdate, 0, 'admin1', 'main');
insert into notice values (NOTICE_NOTICE_ID_SEQ.nextval, 'hi', 'zzp에 오신 여러분 환영합니다',
    sysdate, 0, 'admin1', 'notice');
commit;