package com.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	Connection con = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;	
	String sql = null;	

	private static MemberDAO instance;
	
	private MemberDAO() {  }  // 기본 생성자
	
	public static MemberDAO getInstance() {
		
		if(instance == null) {
			instance = new MemberDAO();
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
	// 중복 아이디 체크
	/////////////////////////////////////////////////////////////
	public int checkMemberId(String id) {
		int result = 0; // 아이디 중복 체크 변수 선언
		openConn();
		
		try {
			sql = "select * from customer where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) { // 중복되는 경우
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // checkMemberId() 종료
	
	/////////////////////////////////////////////////////////////
	// 전체 고객 조회 
	/////////////////////////////////////////////////////////////
	public String getCustomerList() {
		
		String result = "";
		openConn();
		
		try {
			sql = "select * from customer order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			result += "<customers>";
			
			while(rs.next()) {
				result += "<customer>";
				result += "<no>" + rs.getInt("no") + "</no>";
			    result += "<id>"+rs.getString("id")+"</id>";
			    result += "<name>"+rs.getString("name")+"</name>";
			    result += "<age>"+rs.getInt("age")+"</age>";
			    result += "<phone>"+rs.getString("phone")+"</phone>";
			    result += "<addr>"+rs.getString("addr")+"</addr>";
			    result += "</customer>";
			}
			
		   result += "</customers>";

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // getCustomerList() 종료
	
	/////////////////////////////////////////////////////////////
	// 아이디 중복 검사
	/////////////////////////////////////////////////////////////
    public String idCheck(String id) {

        String result = "사용 가능합니다.";

        try {
            openConn();

            sql = "select * from customer where id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {        // true : 아이디 중복인 경우
            	// true : 중복인 경우 -> 값이 있다는 것은 중복이기 때문
                result = "중복 아이디입니다.";
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            closeConn(rs, pstmt, con);
        }       
        return result;
    }   // idCheck() 종료
    
	/////////////////////////////////////////////////////////////
	// 데이터 입력
	/////////////////////////////////////////////////////////////
    public int insertCustomer(MemberDTO dto) {
    	int result = 0, count = 0;
    	openConn();
    	
    	try {
    		sql = "select max(no) from customer";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into customer values (?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getName());
			pstmt.setInt(4, dto.getAge());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getAddr());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
    	return result;
    } // insertCustomer() 종료

}
