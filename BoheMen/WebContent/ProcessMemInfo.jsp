<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
���̵� : <jsp:getProperty name="member" property="username" /><br/>
��й�ȣ : <jsp:getProperty name="member" property="password" /><br/>
�̸� : <jsp:getProperty name="member" property="name" /><br/>
�̸��� : <jsp:getProperty name="member" property="email" /><br/>
�� : <jsp:getProperty name="member" property="phone" /><br/>
</body>
</html>