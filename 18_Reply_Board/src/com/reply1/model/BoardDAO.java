package com.reply1.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	Connection con = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;	
	String sql = null;	

	private static BoardDAO instance;
	
	private BoardDAO() {  }  // 기본 생성자
	
	public static BoardDAO getInstance() {
		
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	/////////////////////////////////////////////////////////////
	// DB 연동
	/////////////////////////////////////////////////////////////
	public void openConn() {
		
		try {
			
			Context ctx = new InitialContext();
			DataSource ds =	(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
	}  // openConn() 메서드 end
	
	
	/////////////////////////////////////////////////////////////
	// DB 자원 종료 
	/////////////////////////////////////////////////////////////
	public void closeConn(ResultSet rs,
			PreparedStatement pstmt, Connection con) {
		
		try {
			if(rs != null) rs.close();
			
			if(pstmt != null) pstmt.close();
			
			if(con != null) con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}  // closeConn() 메서드 end
	
	/////////////////////////////////////////////////////////////
	// 전체 목록 조회
	/////////////////////////////////////////////////////////////
	public List<BoardDTO> getBoardList() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		openConn();
		
		try {
			sql = "select * from tbl_board order by bno desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setRegupdate(rs.getString("regupdate"));
				list.add(dto);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	} // getBoardList() 종료
	
	/////////////////////////////////////////////////////////////
	// 상세내용 조회
	/////////////////////////////////////////////////////////////
	public BoardDTO getBoardContent(int no) {
		
		BoardDTO dto = null;
		openConn();
		
		try {
			sql = "select * from tbl_board where bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setRegupdate(rs.getString("regupdate"));
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	} // getBoardContent() 종료
	
	/////////////////////////////////////////////////////////////
	// 댓글 리스트 조회
	/////////////////////////////////////////////////////////////
	public String getReplyList(int no) {
		
		String result = "";
		openConn();
		
		try {
			sql = "select * from tbl_reply where bno = ? order by redate desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			result += "<replies>";
			while(rs.next()) {
				result += "<reply>";
				result += "<rno>" + rs.getInt("rno") + "</rno>";
				result += "<bno>" + rs.getInt("bno") + "</bno>";
				result += "<rewriter>" + rs.getString("rewriter") + "</rewriter>";
				result += "<recont>" + rs.getString("recont") + "</recont>";
				result += "<redate>" + rs.getString("redate") + "</redate>";
				result += "<reupdate>" + rs.getString("reupdate") + "</reupdate>";
				result += "</reply>";
			}
			result += "</replies>";

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
		
	} // getReplyList() 종료
	
	/////////////////////////////////////////////////////////////
	// 답변글 등록
	/////////////////////////////////////////////////////////////
	public int replyInsert(ReplyDTO dto) {
		int result = 0, count = 0;
		openConn();
		try {
			System.out.println("여기1");

			sql = "select max(rno) from tbl_reply";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}			
			
			System.out.println("여기11");
			sql = "insert into tbl_reply values(?, ?, ?, ?, sysdate, '')";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count); // 답변글 번호
			pstmt.setInt(2, dto.getBno()); // 부모글 번호
			pstmt.setString(3, dto.getRewriter());
			pstmt.setString(4, dto.getRecont());
			System.out.println("여기12");

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
}
