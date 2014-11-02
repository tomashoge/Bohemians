package Mem;

import java.sql.*;

public class DAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String DB_URL = "jdbc:mysql://localhost:3306/test";
	private String DB_USER = "root";
	private String DB_PASSWORD= "1234";
	
	private static DAO dao = new DAO();

	// DAO 객체를 보내줄 메서드 : 다른 곳에서 접근이 가능하도록 public
	public static DAO getInstance() {
		return dao;
	}
	
	public boolean userCheck(String id, String pw) throws Exception {
		
		System.out.println(""+id);
		System.out.println(""+pw);
		boolean x = true;
		
		try
		{	
			conn= DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
			String sql= "select username, password from member where username=?";

			pstmt =conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs= pstmt.executeQuery();
			
			System.out.println("middle");
			
			if(rs.next())
			{
				
				String logPass = rs.getString(2);
				
				if(pw.equals(logPass))
				{
					System.out.println("확률성공");
				}
				else
				{
					
				}
			}
			else
			{
				System.out.println("fail");
			}
			
		}
		catch(Exception e)
		{
		  	e.getMessage();
		}
		
/*
		try {
			conn= DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			pstmt = conn.prepareStatement("select username, password from member where username =? and password =?");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			x = false;
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
*/
		return x;

	}
	
	
	public boolean confirmId(String id) throws Exception {
		boolean x = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn= DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
			pstmt = conn.prepareStatement("select username from member where username = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = true; // 중복하는 아이디 있음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

}
