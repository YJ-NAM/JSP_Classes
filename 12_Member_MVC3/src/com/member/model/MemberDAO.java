package com.member.model;

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

public class MemberDAO {
	
		
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

		private static MemberDAO instance;

		private MemberDAO() {
			// 기본 생성자
		}

		// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해주는 getInstance()라는 메서드를
		// 만들어서 해당 메서드를 외부에서 접근할 수 있도록 해주면 됨

		public static MemberDAO getInstance() {

			if (instance == null) {
				instance = new MemberDAO();
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
		
		///////////////////////////////////////////////////////
		// MEMBER10 테이블에서 전체 회원 리스트를 조회하는 메서드
		///////////////////////////////////////////////////////
		public List<MemberDTO> getMemberList() {
			
			List<MemberDTO> list = new ArrayList<MemberDTO>();
			openConn(); // 커넥션풀 방식으로 DB와 연동 작업 진행
			
			try {
				
				sql="select * from member10 order by num desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {					
					MemberDTO dto = new MemberDTO();
					dto.setNum(rs.getInt("num"));
					dto.setMemid(rs.getString("memid"));
					dto.setMemname(rs.getString("memname"));
					dto.setPwd(rs.getString("pwd"));
					dto.setAge(rs.getInt("age"));
					dto.setMileage(rs.getInt("mileage"));
					dto.setJob(rs.getString("job"));
					dto.setAddr(rs.getString("addr"));
					dto.setRegdate(rs.getString("regdate"));
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			return list;
			
		} // getMemberList() 메서드 end
		
		///////////////////////////////////////////////////////
		// MEMBER10 테이블에 회원정보 입력하는 메서드
		///////////////////////////////////////////////////////
		public int insertMember(MemberDTO dto) {
			
			int	result = 0, count = 0;
			openConn();
			
			try {
				sql = "select max(num) from member10";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1)+1;
				}
				
				sql = "insert into member10 values (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, count);
				pstmt.setString(2, dto.getMemid());
				pstmt.setString(3, dto.getMemname());
				pstmt.setString(4, dto.getPwd());
				pstmt.setInt(5, dto.getAge());
				pstmt.setInt(6, dto.getMileage());
				pstmt.setString(7, dto.getJob());
				pstmt.setString(8, dto.getAddr());
				
				result = pstmt.executeUpdate();
				System.out.println(result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		} // insertMember() 메서드 종료
		
		///////////////////////////////////////////////////////
		// 회원별 상세정보 조회 메서드
		///////////////////////////////////////////////////////
		public MemberDTO contentMember(int no) {
			
			MemberDTO dto = null;
			openConn();
			
			try {
				
				sql = "select * from member10 where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new MemberDTO();
					dto.setNum(rs.getInt("num"));
					dto.setMemid(rs.getString("memid"));
					dto.setMemname(rs.getString("memname"));
					dto.setPwd(rs.getString("pwd"));
					dto.setAge(rs.getInt("age"));
					dto.setMileage(rs.getInt("mileage"));
					dto.setJob(rs.getString("job"));
					dto.setAddr(rs.getString("addr"));
					dto.setRegdate(rs.getString("regdate"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return dto;
		} // contentMember() 메서드 종료
		
		///////////////////////////////////////////////////////
		// MEMBER10 테이블의 회원 정보를 수정하는 메서드
		///////////////////////////////////////////////////////
		public int updateMember(MemberDTO dto) {
			
			int result = 0;
			openConn();
			
			try {
				
				sql="update member10 set age=?, mileage=?, job=?, addr=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getAge());
				pstmt.setInt(2, dto.getMileage());
				pstmt.setString(3, dto.getJob());
				pstmt.setString(4, dto.getAddr());
				pstmt.setInt(5, dto.getNum());				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		} // updateMember() 메서드 종료
		
		///////////////////////////////////////////////////////
		// MEMBER10 테이블의 회원 정보를 삭제 메서드
		///////////////////////////////////////////////////////
		public int deleteMember(int no) {
			
			int result = 0;
			openConn();
			
			try {
				
				sql = "delete from member10 where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				result = pstmt.executeUpdate();
				
				sql = "update member10 set num = num - 1 where num > ?";
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
			
		} // deleteMember() 메서드 종료

}
