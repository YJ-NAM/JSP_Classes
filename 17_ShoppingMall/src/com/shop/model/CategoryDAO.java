package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CategoryDAO {
	
	Connection con = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;	
	String sql = null;	

	private static CategoryDAO instance;
	
	private CategoryDAO() {  }  // 기본 생성자
	
	public static CategoryDAO getInstance() {
		
		if(instance == null) {
			instance = new CategoryDAO();
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
	// 카테고리 추가 메서드
	/////////////////////////////////////////////////////////////
	public int insertCategory(String code, String name){
		
		int result = 0, count = 0;
		openConn();
		try {
			sql = "select max(category_num) from shop_category";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into shop_category values (?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, code);
			pstmt.setString(3, name);			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}		
		return result;
	} // insertCategory() 종료
	
	/////////////////////////////////////////////////////////////
	// 카테고리 조회
	/////////////////////////////////////////////////////////////
	public List<CategoryDTO> getCategoryList() {
		
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		openConn();
		
		try {
			sql = "select * from shop_category order by category_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCategory_num(rs.getInt("category_num"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				list.add(dto);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	} // getCategoryList() 종료
}
