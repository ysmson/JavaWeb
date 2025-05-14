<%@page import="tw.shawn.apis.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	Bike b1 = new Bike();
	b1.upSpeed().upSpeed().upSpeed().upSpeed().upSpeed();
	
	request.setAttribute("name", name);
	request.setAttribute("bike", b1);
	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div>I am Shawn23</div>
		<jsp:forward page="Shawn24.jsp"></jsp:forward>		
	</body>
</html>