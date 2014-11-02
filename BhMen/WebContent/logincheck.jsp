<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import = "java.sql.*" %> 
 
<%
Connection conn = null;
PreparedStatement pst = null;
ResultSet rs= null;
String DB_URL = "jdbc:mysql://localhost:3306/test";
String DB_USER = "root";
String DB_PASSWORD= "1234";
String username= "";
String password= "";
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	pst = conn.prepareStatement("select * from member where username=? and password=?");
	out.println("access ok!");
	
}
catch(Exception e){
	e.getMessage();
}

try{
username = (String)request.getParameter("id");
out.println(username);

password = (String)request.getParameter("pw");
out.println(password);

pst.setString(1,username);
pst.setString(2, password);
}
catch(Exception e)
{
	out.println("e1");
}
try
{
	
rs = pst.executeQuery();

if(rs.next())
{
	out.println("welcome");
	session.setAttribute("user_name", username);
	session.setAttribute("pass_word", password);
	
	response.sendRedirect("index_afterlogin.html");
}
else
{
	response.sendRedirect("index.html");
	out.println("fail");
}
}
catch(Exception e)
{
	response.sendRedirect("index.html");
	out.println("err");
	//e.getMessage();
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>