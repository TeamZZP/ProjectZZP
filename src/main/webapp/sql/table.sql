
-- zzp 계정 생성
CREATE USER zzp IDENTIFIED BY zzp;

-- zzp 계정 권한 부여
GRANT CONNECT, RESOURCE TO zzp;

-- + 눌러서 계정 정보 저장

-- zzp member 테이블 생성 
create table member
(
  userid varchar2(30) primary key,
  passwd varchar2(20) not null,
  username varchar2(10) not null,
  email1 varchar2(20) not null,
  email2 varchar2(20) not null,
  phone varchar2(11) not null,
  post varchar2(6),
  created_at DATE
);