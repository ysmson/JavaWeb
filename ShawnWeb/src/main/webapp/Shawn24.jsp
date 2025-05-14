<%@page import="tw.shawn.apis.Bike"%>
<%
	String name = (String)request.getAttribute("name");
	Bike bike = (Bike)request.getAttribute("bike");
%>
<div>I am Shawn24</div>
Name: <%= name %><br />
Bike speed: <%= bike.getSpeed() %><br />
Bike: <%= bike %>