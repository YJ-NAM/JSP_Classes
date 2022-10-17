-- shop_products 테이블 생성

create table shop_products(
	pnum number(5) primary key,			-- 상품 번호
	pname varchar2(100) not null,		-- 상품명
	pcategory_fk varchar2(10) not null,	-- 카테고리 코드
	pcompany varchar2(100),				-- 제조사
	pimage varchar2(100),				-- 이미지
	pqty number(5) default 0,			-- 수량
	price number(10) default 0,			-- 가격
	pspec varchar2(30),					-- 스펙
	pcontents varchar2(1000),			-- 설명
	point number(6) default 0,			-- 포인트
	pinputdate date						-- 입고일자

);

