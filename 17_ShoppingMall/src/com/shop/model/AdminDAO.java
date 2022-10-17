package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	
	Connection con = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;	
	String sql = null;	

	private static AdminDAO instance;
	
	private AdminDAO() {  }  // 기본 생성자
	
	public static AdminDAO getInstance() {
		
		if(instance == null) {
			instance = new AdminDAO();
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
	// 관리자 아이디 & 비밀번호 확인
	/////////////////////////////////////////////////////////////
	public int adminCheck(String id, String pwd){
		
		int result = 0;	// 관리자가 아닌 경우
		openConn();
		
		try {
			sql = "select admin_id, admin_pwd from admin_shop where admin_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) { // DB에 입력한 아이디가 존재하는 경우
				if(pwd.equals(rs.getString("admin_pwd"))) { // 비밀번호가 일치하는 경우 = 관리자인 경우
					result = 1;
				}else { // 아이디는 일치 but 비번 틀린 경우
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
	} // adminCheck() 종료
	
	/////////////////////////////////////////////////////////////
	// 관리자 정보 받기
	/////////////////////////////////////////////////////////////
	public AdminDTO getAdmin(String id) {
		
		AdminDTO dto = null;
		openConn();
		
		try {
			sql = "select * from admin_shop where admin_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new AdminDTO();
				dto.setAdmin_id(rs.getString("admin_id"));
				dto.setAdmin_pwd(rs.getString("admin_pwd"));
				dto.setAdmin_name(rs.getString("admin_name"));
				dto.setAdmin_email(rs.getString("admin_email"));
				dto.setAdmin_date(rs.getString("admin_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}		
		return dto;
	}

}
