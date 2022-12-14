-- upload 테이블 생성

create table upload(
	upload_no number(5) primary key,		-- 자료실 글 번호
	upload_writer varchar2(30) not null,	-- 자료실 글 작성자
	upload_title varchar2(200) not null,	-- 자료실 글 제목
	upload_cont varchar2(1000) not null,	-- 자료실 글 내용
	upload_pwd varchar2(30) not null,		-- 자료실 글 비번
	upload_file varchar2(1000),				-- 자료실 파일명
	upload_hit varchar2(5) default 0,		-- 자료실 글 조회수
	upload_date date,						-- 자료실 글 작성일
	upload_update date						-- 자료실 글 수정일
);