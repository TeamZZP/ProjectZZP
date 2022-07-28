
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
	created_at		DATE	DEFAULT sysdate	NOT NULL
);

-- 상품
CREATE TABLE product (
	p_id	VARCHAR2(40)		PRIMARY KEY,
	p_name	VARCHAR2(60)		NOT NULL,
	p_content		VARCHAR2(100)		NOT NULL,
	p_category	VARCHAR2(30)		NOT NULL,
	p_cost_price	NUMBER		NOT NULL,
	p_selling_price	NUMBER		NOT NULL,
	p_discount	NUMBER		NULL,
	p_created 		DATE	DEFAULT sysdate	NOT NULL,
	p_stock	NUMBER		NULL,
	p_img	VARCHAR2(50)		NULL
);

-- 주문
CREATE TABLE orders (
	order_id	NUMBER		PRIMARY KEY,
	p_id	VARCHAR2(40)		NOT NULL REFERENCES product(p_id) ON DELETE CASCADE,
	userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE,
	order_quantity	NUMBER		NOT NULL,
	entrance_passwd	VARCHAR2(20)		NULL,
	order_request	VARCHAR2(20)		NULL,
	order_date	DATE	DEFAULT sysdate	NOT NULL
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

-- 관리자
CREATE TABLE admin (
    	admin_id VARCHAR2(30) PRIMARY KEY,
   	admin_name VARCHAR2(10) NOT NULL,
   	admin_passwd VARCHAR2(20) NOT NULL,
    	admin_email    VARCHAR2(40) NOT NULL,
    	admin_phone    VARCHAR2(11) NOT NULL
);

-- 공지 
CREATE TABLE notice (
   	 notice_id NUMBER primary key,
  	 notice_tittle VARCHAR2(50) NOT NULL,
   	 notice_content VARCHAR2(1000) NOT NULL,
  	 notice_created DATE DEFAULT sysdate,
  	 admin_id VARCHAR2(30) references admin(admin_id) ON DELETE CASCADE,
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
 	chall_content 	VARCHAR2(1000),
 	chall_category 	VARCHAR2(30),
 	chall_hits 		NUMBER,
 	chall_liked 	NUMBER,
 	chall_created 	DATE,
 	chall_img 		VARCHAR2(300)
);

-- 챌린지 댓글
CREATE TABLE comments (
	comment_id	NUMBER		PRIMARY KEY,
	chall_id	NUMBER		NOT NULL REFERENCES challenge(chall_id) ON DELETE CASCADE,
	comment_content	VARCHAR2(800)		NOT NULL,
	userid	VARCHAR2(30)		NOT NULL REFERENCES member(userid) ON DELETE CASCADE
);

-- 시퀀스
CREATE SEQUENCE 테이블명_컬럼명_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;

