<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>    

<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost/shawn"
	user="root"
	password=""
/>

<!-- 查總筆數 -->
<sql:query var="countResult">
	SELECT COUNT(*) AS total FROM food
</sql:query>
<c:set var="total" value="${countResult.rows[0].total}" />

<!-- 分頁邏輯 -->
<c:set var="rpp" value="23" /> <!-- rows per page -->
<c:set var="page" value="${empty param.page ? 1 : param.page}" />
<c:set var="page" value="${page lt 1 ? 1 : page}" />
<c:set var="start" value="${(page - 1) * rpp}" />
<c:set var="pages" value="${(total + rpp - 1) / rpp}" /> <!-- 總頁數 -->
<c:set var="prev" value="${page == 1 ? 1 : page - 1}" />
<c:set var="next" value="${page >= pages ? pages : page + 1}" />

<!-- 查分頁資料 -->
<sql:query var="result">
	SELECT * FROM food LIMIT ${start}, ${rpp}
</sql:query>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shawn Big Company</title>
</head>
<body>
	<h1>Shawn Big Company</h1>
	<hr />

	<!-- 分頁按鈕 -->
	<a href="?page=${prev}">Prev</a>
	<c:if test="${page < pages}">
		| <a href="?page=${next}">Next</a>
	</c:if>
	<hr />

	<!-- 顯示表格 -->
	<table border="1" width="100%">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Tel</th>
		</tr>
		<c:forEach items="${result.rows}" var="food">
			<tr>
				<td>${food.id}</td>
				<td>${food.name}</td>
				<td>${food.tel}</td>
			</tr>
		</c:forEach>
	</table>

	<p>第 ${page} 頁 / 共 ${pages} 頁（共 ${total} 筆）</p>
</body>
</html>
