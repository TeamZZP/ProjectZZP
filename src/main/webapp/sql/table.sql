
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


  
  
-------------- insert --------------
-- 상품
insert into product VALUES('toothBrush01','칫솔','부드러운 대나무소재 칫솔','bath',2500,2500,0,sysdate,50,'bath01');
insert into product VALUES('soap01','비누','뽀득뽀득 친환경 비누','bath',4000,4000,0,sysdate,50,'bath02');
insert into product VALUES('cottonSwap01','면봉','나무소재 면봉','bath',3000,3000,0,sysdate,50,'bath03');
insert into product VALUES('bodyBrush01','롱바디브러쉬','나무소재 부드러운 롱타입 바디브러쉬','bath',25000,25000,0,sysdate,50,'bath04');
insert into product VALUES('boduBrush02','숏바디브러쉬','나무소재 부드러운 숏타입 바디브러쉬','bath',2000,2000,0,sysdate,50,'bath05');
insert into product VALUES('fruitsBag01','리유저블백W','식품 보관에 용이한 재사용가능 봉투','life',3000,3000,0,sysdate,50,'life01');
insert into product VALUES('ecoBag01','네트에코백','간단한 장보기에 용이한 가방','life',8000,8000,0,sysdate,50,'life02');
insert into product VALUES('fruitsBag02','리유저블백Gn','식품 보관에 용이한 재사용가능 봉투','life',3000,3000,0,sysdate,50,'life03');
insert into product VALUES('ecoBag02','라탄에코백','간단한 장보기에 용이한 가방','life',13000,13000,0,sysdate,50,'life04');
insert into product VALUES('strawPocket01','빨대파우치','빨대 휴대에 용이한 빨대파우치','life',3500,3500,0,sysdate,50,'life05');
insert into product VALUES('paperString01','종이노끈','선물포장에 용이한 종이소재 노끈','firstEvent',100,100,0,sysdate,50,'firstEvent01');
insert into product VALUES('tumbler01','실리콘 텀블러','휴대성이 좋은 텀블러','firstEvent',100,100,0,sysdate,50,'firstEvent02');
insert into product VALUES('tumbler02','스테인리스 텀블러','보온이 뛰어난 텀블러','firstEvent',100,100,0,sysdate,50,'firstEvent03');
insert into product VALUES('soapSet','천연비누세트','잔여감이없는 천연비누','firstEvent',100,100,0,sysdate,50,'firstEvent04');
insert into product VALUES('straw01','빨대세트','세척으로 간편하게 재사용하는 친환경빨대','firstEvent',100,100,0,sysdate,50,'firstEvent05');
insert into product VALUES('solidToothpaste','고체치약','씹어서 양치하는 고체형치약','firstEvent',100,100,0,sysdate,50,'firstEvent06');
insert into product VALUES('bathSet01','샤워세트1','바디워시 비누와 브러쉬 세트','timeEvent',30000,15000,15000,sysdate,50,'timeEvent01');
insert into product VALUES('strawSet01','빨래파우치세트','빨대세트와 파우치 세트','timeEvent',11000,5500,5500,sysdate,50,'timeEvent02');
insert into product VALUES('bathSet02','샤워세트2','샤워도구 세트','timeEvent',30000,15000,15000,sysdate,50,'timeEvent03');
insert into product VALUES('cutlerySet01','다회용수저세트','일회용품을 대신하는 휴대용 다회용 수저세트','timeEvent',10000,5000,5000,sysdate,50,'timeEvent04');
commit;
