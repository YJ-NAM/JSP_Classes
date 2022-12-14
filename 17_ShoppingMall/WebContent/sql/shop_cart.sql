-- shop_cart 테이블 생성

create table shop_cart(
	cart_num number(5) primary key,			-- 장바구니 번호
	cart_pnum number(5) not null,			-- 제품 번호
	cart_userId varchar2(30) not null,		-- 사용자 아이디
	cart_pname varchar2(100) not null,		-- 상품 이름
	cart_pqty number(5) not null,			-- 수량
	cart_price number(10) not null,			-- 가격
	cart_pspec varchar2(50) not null,		-- 스펙
	cart_pimage varchar2(500) 				-- 상품 이미지

);
