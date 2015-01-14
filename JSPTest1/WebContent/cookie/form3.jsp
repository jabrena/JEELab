<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
	<title>Creating a JSP Cookie</title>
</head>
<body>
<h1>Creating a Cookie with a JSP</h1>
</center>
<%
	//Reading cookies in a JSP
	Cookie cookie = null;
	Cookie[] cookies = null;
	// Get an array of Cookies associated with this domain
	cookies = request.getCookies();
	if( cookies != null ){
	   out.println("<h2> Found Cookies Name and Value</h2>");
	     for (int i = 0; i < cookies.length; i++){
	        cookie = cookies[i];
	        out.print("Name : " + cookie.getName( ) + ",  ");
	        out.print("Value: " + cookie.getValue( )+" <br/>");
	     }
	 }else{
	     out.println("<h2>No cookies founds</h2>");
	 }
%>
<a href="form1.jsp">Go back</a>
</body>
</html>