-- Customer table creation

create table customer(
	no number(5) unique,			-- 고객 번호
	id varchar2(30) primary key,	-- 아이디	
	name varchar2(30) not null,		-- 이름
	age number(3),					-- 나이
	phone varchar2(20) not null,	-- 연락처
	addr varchar2(500)				-- 주소
);

-- Save the customer-information
insert into customer values(1, 'hong', '홍길동', 27, '010-1111-1234', '서울시 중구');
insert into customer values(2, 'leess', '이순신', 33, '010-2222-1234', '전라남도 신안군');
insert into customer values(3, 'yooks', '유관순', 19, '010-3333-1234', '충청남도 천안시');