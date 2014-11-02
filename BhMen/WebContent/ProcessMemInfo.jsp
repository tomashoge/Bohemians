<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %> 

<%

request.setCharacterEncoding("utf-8");
String name_= request.getParameter("name");
String city_= request.getParameter("city");
String country_= request.getParameter("country");
String email_= request.getParameter("email");
String phone_= request.getParameter("phone");
String preferedmusic_= request.getParameter("preferedmusic");
String username_= request.getParameter("username");
String password_= request.getParameter("password");


String DB_URL = "jdbc:mysql://localhost:3306/test";
String DB_USER = "root";
String DB_PASSWORD= "1234";
Connection con = null;
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	out.println("access ok!");
}
catch(Exception e)
{
	out.println("err");
	e.printStackTrace();
}

try
{
	Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	out.println("oracle jdbc connect ok!");
	
	String sql= "INSERT INTO member(name, city, country, email, phone, preferedmusic, username, password) VALUES (?,?,?,?,?,?,?,?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, name_);
	
	pstmt.setString(2, city_);
	
	pstmt.setString(3, country_);
	
	pstmt.setString(4, email_);
	
	pstmt.setString(5, phone_);
	
	pstmt.setString(6, preferedmusic_);
	
	pstmt.setString(7, username_);
	
	pstmt.setString(8, password_);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	
	conn.close();
	
}

catch(SQLException e)
{
	e.printStackTrace();
}
out.println("Register Succes");
response.sendRedirect("index.html");
%>
<jsp:useBean id="member" class="Mem.RegInfo"></jsp:useBean>
<jsp:setProperty name="member" property="name" value="<%=name_%>"/>
<jsp:setProperty name="member" property="city" value="<%=city_%>"/>
<jsp:setProperty name="member" property="country" value="<%=country_%>"/>
<jsp:setProperty name="member" property="email" value="<%=email_%>"/>
<jsp:setProperty name="member" property="phone" value="<%=phone_%>"/>
<jsp:setProperty name="member" property="preferedmusic" value="<%=preferedmusic_%>"/>
<jsp:setProperty name="member" property="username" value="<%=username_%>"/>
<jsp:setProperty name="member" property="password" value="<%=password_%>"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>