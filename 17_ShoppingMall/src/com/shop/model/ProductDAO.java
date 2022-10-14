package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDAO {
	Connection con = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;	
	String sql = null;	

	private static ProductDAO instance;
	
	private ProductDAO() {  }  // 기본 생성자
	
	public static ProductDAO getInstance() {
		
		if(instance == null) {
			instance = new ProductDAO();
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
	// 상품 추가 메서드
	/////////////////////////////////////////////////////////////
	public int insertProduct(ProductDTO dto) {
		int result = 0, count = 0;
		openConn();
		
		try {
			sql = "select max(pnum) from shop_products";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into shop_products values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, count);
            pstmt.setString(2, dto.getPname());
            pstmt.setString(3, dto.getPcategory_fk());
            pstmt.setString(4, dto.getPcompany());
            pstmt.setString(5, dto.getPimage());
            pstmt.setInt(6, dto.getPqty());
            pstmt.setInt(7, dto.getPrice());
            pstmt.setString(8, dto.getPspec());
            pstmt.setString(9, dto.getPcontents());
            pstmt.setInt(10, dto.getPoint());
            result = pstmt.executeUpdate();
            
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;		
	} // insertProduct() 종료
	
}
