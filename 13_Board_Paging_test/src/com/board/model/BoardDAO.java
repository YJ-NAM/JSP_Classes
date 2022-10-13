package com.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {

	// DB와 연동하는 객체
	Connection con = null;

	// DB에 SQL문을 전송하는 객체
	PreparedStatement pstmt = null;

	// SQL문을 실행한 후 결과값을 가지고 있는 객체
	ResultSet rs = null;

	// 쿼리문을 저장할 변수
	String sql = null;
	String sql1 = null;

	// ProductDAO 객체를 싱글턴 방식으로 만들어보자
	// 1단계 : 싱글턴 방식으로 객체를 만들기 위해서는 우선적으로 기본생성자의
	// 접근제어자를 public이 아닌 private으로 바꿔주어야 한다.
	// 즉, 외부에서 직접적으로 기본생성자를 호출하지 못하게 하는 방법이다.

	// 2단계 : ProductDAO 객체를 정적(static) 멤버로 선언해주어야 한다.

	private static BoardDAO instance;

	private BoardDAO() {
		// 기본 생성자
	}

	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해주는 getInstance()라는 메서드를
	// 만들어서 해당 메서드를 외부에서 접근할 수 있도록 해주면 됨

	public static BoardDAO getInstance() {

		if (instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}

	// DB를 연동 작업을 진행하는 메서드
	public void openConn() {

		try {
			
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();
			
			// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
			// ctx:lookup -> object로 반환되므로 datasource 타입으로 형변환
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			// 3단계 : DataSource 객체를 이용하여 커넥션을 하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} // openConn() 메서드 end

	// DB에 연결된 자원 종료하는 메서드
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} // closeConn() 메서드 종료
	
	///////////////////////////////////////////////
	// board 테이블의 전체 게시물의 수를 확인하는 메서드
	///////////////////////////////////////////////
	public int getBoardCount() {
		
		int count = 0;
		openConn();
		
		try {
			sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;
		
	} // getBoardCount() 메서드 end
	
	///////////////////////////////////////////////
	// 현재 페이지에 해당하는 게시물을 조회하는 메서드
	///////////////////////////////////////////////
	public List<BoardDTO> getBoardList(int startNo, int endNo) {
		
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		openConn();
		
		try {
						
			/*
			 * sql="select * from (select row_number() over(order by board_no desc) rnum, "
			 * + "b.* from board b) where rnum >= ? and rnum <= ?";
			 */
			
			sql="select * from (select row_number() over(order by board_no desc) rnum, "
					+ "b.* from board b) where rnum between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setBoard_no(rs.getInt("board_no"));
                dto.setBoard_writer(rs.getString("board_writer"));
                dto.setBoard_title(rs.getString("board_title"));
                dto.setBoard_cont(rs.getString("board_cont"));
                dto.setBoard_pwd(rs.getString("board_pwd"));
                dto.setBoard_hit(rs.getInt("board_hit"));
                dto.setBoard_date(rs.getString("board_date"));
                dto.setBoard_update(rs.getString("board_update"));
                list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
		
	} // getBoardList() 메서드 end
	
	///////////////////////////////////////////////
	// 글 등록 메서드
	///////////////////////////////////////////////
	public int insertBoard(BoardDTO dto) {
		
		int result = 0, count = 0;
		openConn();
		
		try {
			sql="select max(board_no) num from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("num") + 1;
			}
			
			sql = "insert into board values ("+count+", ?, ?, ?, ?, 0, sysdate, '')";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBoard_writer());
			pstmt.setString(2, dto.getBoard_title());
			pstmt.setString(3, dto.getBoard_cont());
			pstmt.setString(4, dto.getBoard_pwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}		
		return result;
	}
	
	///////////////////////////////////////////////
	// 글 상세정보 보기 + 조회수 증가
	///////////////////////////////////////////////
	public BoardDTO boardContentList(int no) {
		
		BoardDTO dto = null;
		openConn();
		
		try {
			
			sql = "update board set board_hit = board_hit + 1 where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
			sql = "select * from board where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
		
	} // boardContentList() 메서드 종료
	
	///////////////////////////////////////////////
	// 글 수정 메서드
	///////////////////////////////////////////////
	public int updateBoard(int no, BoardDTO dto) {
		
		int result = 0;
		openConn();
		
		try {
			
			sql = "update board set board_title = ?, board_cont = ?, board_update = sysdate where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBoard_title());
			pstmt.setString(2, dto.getBoard_cont());
			pstmt.setInt(3, no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // updateBoard 메서드 종료
	
	///////////////////////////////////////////////
	// 글 삭제 메서드 + 번호 수정
	///////////////////////////////////////////////
	public int deleteBoard(int no) {
		
		int result = 0;
		openConn();
		
		try {
			sql = "delete from board where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			
			sql = "update board set board_no = board_no - 1 where board_no > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // deleteBoard() 메서드 종료
	
	///////////////////////////////////////////////
	// 글 검색 메서드 + 검색한 내용 페이징 처리까지 
	///////////////////////////////////////////////
	public List<BoardDTO> searchBoard(String search, String keyword, int startNo, int endNo) {
		
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		openConn();
		String subsql = "";
		
		if(search != null && keyword != null) {
			if(search.equals("all")) {
				subsql = "lower(board_title) like '%"+keyword+"%' or lower(board_writer) like '%"+keyword+"%' or lower(board_cont) like '%"+keyword+"%'";
			}else if(search.equals("title")) {
				subsql = "lower(board_title) like '%"+keyword+"%'";
			}else if(search.equals("writer")) {
				subsql = "lower(board_writer) like '%"+keyword+"%'";
			}else if(search.equals("content")) {
				subsql = "lower(board_cont) like '%"+keyword+"%'";
			}else if(search.equals("title_cont")) {
				subsql = "lower(board_cont) like '%"+keyword+"%' or lower(board_title) like '%"+keyword+"%'";
			}
		}		
		
		try {			
			sql = "select * from (select row_number() over(order by board_no desc) rnum, "
					+ "b.* from board b where "+subsql+") where rnum between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));
				list.add(dto);
			}						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;		
	} //searchBoard 메서드 종료
	
	///////////////////////////////////////////////
	// 검색어에 해당하는 게시물의 수 조회 메서드
	///////////////////////////////////////////////
	public int searchListCount(String search, String keyword) {
		
		int count = 0;
		openConn();
		String subsql = "";
		
		if(search != null && keyword != null) {
			if(search.equals("all")) {
				subsql = "lower(board_title) like '%"+keyword+"%' or lower(board_writer) like '%"+keyword+"%' or lower(board_cont) like '%"+keyword+"%'";
			}else if(search.equals("title")) {
				subsql = "lower(board_title) like '%"+keyword+"%'";
			}else if(search.equals("writer")) {
				subsql = "lower(board_writer) like '%"+keyword+"%'";
			}else if(search.equals("content")) {
				subsql = "lower(board_cont) like '%"+keyword+"%'";
			}else if(search.equals("title_cont")) {
				subsql = "lower(board_cont) like '%"+keyword+"%' or lower(board_title) like '%"+keyword+"%'";
			}
		}
		
		try {			
			sql= "select count(*) from board where "+subsql;	
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;		
	} //searchListCount 메서드 종료
		
}
