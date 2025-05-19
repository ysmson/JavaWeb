<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name1 = "Shawn1";
	pageContext.setAttribute("myname", name1);
	
	String name2 = "Shawn2";
	request.setAttribute("myname", name2);
	
	String name3 = "Shawn3";
	session.setAttribute("myname", name3);
	
	String name4 = "Shawn4";
	application.setAttribute("myname", name4);
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		Name: ${pageScope.myname }<br />
		Name: ${requestScope.myname }<br />
		Name: ${sessionScope.myname }<br />
		Name: ${applicationScope.myname }<br />
	</body>
</html>





