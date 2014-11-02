<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id= request.getParameter("id");
String password= request.getParameter("pw");

%>
<jsp:useBean id="member" class="Mem.MemberInfo"></jsp:useBean>
<jsp:setProperty name="member" property="id" value="<%=id%>"/>
<jsp:setProperty name="member" property="pw" value="<%=password%>"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자바빈 연습2 - jsp:useBean 을 이용한 객체 생성하기</title>
</head>
<body>
아이디 : <jsp:getProperty name="member" property="id" /><br/>
비밀번호 : <jsp:getProperty name="member" property="pw" /><br/>

</body>
</html>