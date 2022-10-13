package com.upload.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UploadDAO {

	Connection con = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;	
	String sql = null;	

	private static UploadDAO instance;
	
	private UploadDAO() {  }  // 기본 생성자
	
	public static UploadDAO getInstance() {
		
		if(instance == null) {
			instance = new UploadDAO();
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
	public List<UploadDTO> getUploadList() {
		
		List<UploadDTO> list = new ArrayList<UploadDTO>();
		openConn();
		try {
			sql = "select * from upload order by upload_no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UploadDTO dto = new UploadDTO();
				dto.setUpload_no(rs.getInt("upload_no"));
				dto.setUpload_writer(rs.getString("upload_writer"));
				dto.setUpload_title(rs.getString("upload_title"));
				dto.setUpload_cont(rs.getString("upload_cont"));
				dto.setUpload_pwd(rs.getString("upload_pwd"));
				dto.setUpload_file(rs.getString("upload_file"));
				dto.setUpload_hit(rs.getInt("upload_hit"));
				dto.setUpload_date(rs.getString("upload_date"));
				dto.setUpload_update(rs.getString("upload_update"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}	
		return list;
	} // getUploadList() 종료
	
	/////////////////////////////////////////////////////////////
	// 게시글 등록(파일 포함)
	/////////////////////////////////////////////////////////////
	public int insertUpload(UploadDTO dto) {
		int result = 0, count = 0;
		
		openConn();
		
		try {
			sql = "select max(upload_no) from upload";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1)+1;
			}
			
			sql = "insert into upload values (?, ?, ?, ?, ?, ?, default, sysdate, '')";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getUpload_writer());
			pstmt.setString(3, dto.getUpload_title());
			pstmt.setString(4, dto.getUpload_cont());
			pstmt.setString(5, dto.getUpload_pwd());
			pstmt.setString(6, dto.getUpload_file());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // insertUpload() 종료
	
	/////////////////////////////////////////////////////////////
	// 조회수 증가
	/////////////////////////////////////////////////////////////
	public void hitCount(int no) {
				
		openConn();
		try {
			sql = "update upload set upload_hit = upload_hit + 1 where upload_no = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}
	
	/////////////////////////////////////////////////////////////
	// 상세정보 조회
	/////////////////////////////////////////////////////////////
	public UploadDTO uploadContent(int no) {
		
		UploadDTO dto = null;
		
		openConn();
		try {			
			sql = "select * from upload where upload_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new UploadDTO();
				dto.setUpload_no(rs.getInt("upload_no"));
				dto.setUpload_writer(rs.getString("upload_writer"));
				dto.setUpload_title(rs.getString("upload_title"));
				dto.setUpload_cont(rs.getString("upload_cont"));
				dto.setUpload_pwd(rs.getString("upload_pwd"));
				dto.setUpload_file(rs.getString("upload_file"));
				dto.setUpload_hit(rs.getInt("upload_hit"));
				dto.setUpload_date(rs.getString("upload_date"));
				dto.setUpload_update(rs.getString("upload_update"));
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
		
	}// contentUpload() 종료
	
	/////////////////////////////////////////////////////////////
	// 게시글 수정
	/////////////////////////////////////////////////////////////
	public int modifyUpload(UploadDTO dto) {
		int result = 0;
		openConn();
		
		try {
			sql = "select * from upload where upload_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getUpload_no());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				// 처음부터 물어볼 수는 없음 / rs 가져오지 않았기 때문
				if(dto.getUpload_pwd().equals(rs.getString("upload_pwd"))) { // 비번 대조
					if(dto.getUpload_file() == null) { // 첨부파일을 새로 선택하지 않은 경우
						sql = "update upload set upload_title = ?, upload_cont = ?, upload_update = sysdate "
								+ "where upload_no = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, dto.getUpload_title());
						pstmt.setString(2, dto.getUpload_cont());
						pstmt.setInt(3, dto.getUpload_no());
					}else {	// 수정 폼 페이지에서 첨부파일을 선택한 경우
						sql = "update upload set upload_title = ?, upload_cont = ?, "
								+ "upload_file = ?, upload_update = sysdate where upload_no = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, dto.getUpload_title());
						pstmt.setString(2, dto.getUpload_cont());
						pstmt.setString(3, dto.getUpload_file());						
						pstmt.setInt(4, dto.getUpload_no());
					}
					result = pstmt.executeUpdate();					
				}else { // 비번 틀린 경우
					result = -1;
				}
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}		
		return result;		
	} // modifyUpload() 종료
	
	/////////////////////////////////////////////////////////////
	// 게시글 삭제 + 번호 재정렬
	/////////////////////////////////////////////////////////////	
	public int deleteUpload(int no) {
		int result = 0;
		openConn();
		
		try {
			sql = "delete from upload where upload_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			
			sql = "update upload set upload_no = upload_no - 1 where upload_no > ?";
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
	} // deleteUpload() 종료
	
	
}
