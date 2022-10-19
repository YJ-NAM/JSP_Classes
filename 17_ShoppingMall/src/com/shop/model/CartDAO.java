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

public class CartDAO {
	Connection con = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;	
	String sql = null;	

	private static CartDAO instance;
	
	private CartDAO() {  }  // 기본 생성자
	
	public static CartDAO getInstance() {
		
		if(instance == null) {
			instance = new CartDAO();
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
	// shop_cart 테이블에 상품 정보 저장
	/////////////////////////////////////////////////////////////
	public int insertCart(CartDTO dto) {
		int result = 0, count = 0;
		openConn();
		
		try {
			sql = "select max(cart_num) from shop_cart";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into shop_cart values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, count);
            pstmt.setInt(2, dto.getCart_pnum());
            pstmt.setString(3, dto.getCart_userid());
            pstmt.setString(4, dto.getCart_pname());
            pstmt.setInt(5, dto.getCart_pqty());
            pstmt.setInt(6, dto.getCart_price());
            pstmt.setString(7, dto.getCart_pspec());
            pstmt.setString(8, dto.getCart_pimage());
            
            result = pstmt.executeUpdate();
            
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // insertCart() 메서드 종료
	
	/////////////////////////////////////////////////////////////
	// shop_cart 테이블 내 사용자 아이디에 해당하는 장바구니 목록 조회
	/////////////////////////////////////////////////////////////
	public List<CartDTO> getCartList(String id) {
		
		List<CartDTO> list = new ArrayList<CartDTO>();
		openConn();
		
		try {
			sql = "select * from shop_cart where cart_userId = ? order by cart_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setCart_num(rs.getInt("cart_num"));
				dto.setCart_pnum(rs.getInt("cart_pnum"));
				dto.setCart_userid(rs.getString("cart_userid"));
				dto.setCart_pname(rs.getString("cart_pname"));
				dto.setCart_pqty(rs.getInt("cart_pqty"));
				dto.setCart_price(rs.getInt("cart_price"));
				dto.setCart_pspec(rs.getString("cart_pspec"));
				dto.setCart_pimage(rs.getString("cart_pimage"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;		
	} // getCartList(id) 종료
	
	/////////////////////////////////////////////////////////////
	// 번호에 해당하는 장바구니 목록 삭제
	/////////////////////////////////////////////////////////////
	public int deleteCart(int no) {
		int result = 0;
		openConn();
		
		try {
			sql = "delete from shop_cart where cart_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			
			sql = "update shop_cart set cart_num = cart_num - 1 where cart_num > ?";
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
	} // deleteCart() 종료
	

}
