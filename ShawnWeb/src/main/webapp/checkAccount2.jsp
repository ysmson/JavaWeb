<%@page import="java.util.*"%>
<%@page import="jakarta.servlet.jsp.jstl.sql.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.shawn.apis.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:if test="${empty param.account }">
	<c:redirect url="login.html"></c:redirect>
</c:if>
<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost/shawn"
	user="root"
	password=""
/>
<sql:query var="rs">
	SELECT * FROM member WHERE account = ?
	<sql:param>${param.account }</sql:param>
</sql:query>
<c:if test="${rs.rowCount == 0 }">
	<c:redirect url="login.html"></c:redirect>
</c:if>
<c:choose>
	<c:when test="${BCrypt.checkpw(param.passwd, rs.rows[0].passwd) }">
		<%
			Result result = (Result)pageContext.getAttribute("rs");
			SortedMap row = result.getRows()[0];
			
			try{
				byte[] icon =  (byte[])row.get("icon");
				String base64 = Base64.getEncoder().encodeToString(icon);
				row.put("icon", base64);
			}catch(Exception e){
				row.put("icon", "");
			}			
		
		%>
		<c:set var="member" value="${rs.rows[0] }" scope="session"></c:set>
		<c:redirect url="main.jsp"></c:redirect>
	</c:when>
	<c:otherwise>
		<c:redirect url="login.html"></c:redirect>
	</c:otherwise>
</c:choose>



