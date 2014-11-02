<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Mem.DAO"%>
<jsp:useBean id="member" class="Mem.RegInfo"></jsp:useBean>
<%

String username = (String)request.getParameter("id");
out.println(username);

DAO dao = DAO.getInstance();
boolean check = dao.confirmId(username);

if(check) {%>

<div id="layout">
	<form name="checkForm" method="post" action="idCheck.jsp">
		<table>
			<tr>
				<td id="header"><%=username %>&nbsp;is not available</td>
			</tr>
			<tr>
				<td class="center">&nbsp; choose another username.
					<p>
						<input type="text" size="13" maxlength="12" name="id" /> <input
							type="submit" value="USERNAME-CHECK" />
					</p>
				</td>
			</tr>
		</table>
	</form>
</div>
<%
}
else{ %>
<div id="layout">
	<table>
		<tr>
			<td class="center">
				<p>
					This
					<%=username %>&nbsp;is available username.
				</p> <input type="button" value="close" onclick="window.close();" />
			</td>
		</tr>
	</table>
</div>
<% } %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>