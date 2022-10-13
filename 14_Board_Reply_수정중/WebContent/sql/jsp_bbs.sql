
-- jsp_bbs 게시판 테이블 구성

create table jsp_bbs(
	board_no number(5) primary key,		-- 게시판 글번호
	board_writer varchar2(30) not null, -- 게시판 글 작성자
	board_title varchar2(100) not null, -- 게시판 글 제목
	board_cont varchar2(1000) not null, -- 게시판 글 내용
	board_pwd varchar2(30) not null,	-- 게시판 글 비밀번호
	board_hit number(5) default 0,		-- 게시판 글 조회수
	board_date date,					-- 게시판 글 작성일자
	board_update date,					-- 게시판 글 수정일자
	board_group number(5),				-- 게시판 글 그룹
	board_step number(5),				-- 게시판 글 답변 단계
	board_indent number(5)				-- 게시판 답변글 들여쓰기
);

-- jsp_bbs 테이블 데이터 추가하기
insert into jsp_bbs
	values(1, '홍길동', '제목1', '내용1', '1111',
			default, sysdate, '', 1, 0, 0);
	
insert into jsp_bbs
	values(2, '이순신', '장군님 글', '이순신 장군 글입니다.', '2222',
			default, sysdate, '', 2, 0, 0);
	
insert into jsp_bbs
	values(3, '유관순', '열사님 글', '유관순 열사님 글', '3333',
			default, sysdate, '', 3, 0, 0);
	
insert into jsp_bbs
	values(4, '세종대왕', '한글', '가나다라마바사', '4444',
			default, sysdate, '', 4, 0, 0);
	
insert into jsp_bbs
	values(5, '김연아', '연아님 글', '내용5', '5555',
			default, sysdate, '', 5, 0, 0);
	
	
	
	




