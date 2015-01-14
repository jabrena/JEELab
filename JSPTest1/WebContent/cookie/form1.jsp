<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<%
//http://docs.oracle.com/javaee/1.4/api/javax/servlet/http/Cookie.html
Cookie cookie = new Cookie("HOST_COOKIE","demo");
cookie.setPath("/");
//cookie.setDomain("");
//cookie.setSecure(true);
response.addCookie(cookie);

cookie = new Cookie("COOKIE_DEMO","1234");
//cookie.setPath("/");
//cookie.setDomain("");
//cookie.setSecure(true);
response.addCookie(cookie);

cookie = new Cookie("COOKIE_DEMO_REMOVE","5678");
//cookie.setPath("/");
//cookie.setDomain("");
//cookie.setSecure(true);
response.addCookie(cookie);

cookie = new Cookie("COOKIE_DEMO_PATH","1111");
//cookie.setPath("/");
//cookie.setDomain("");
//cookie.setSecure(true);
response.addCookie(cookie);

%>
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
	//Cookie cookie = null;
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
<a href="form2.jsp">Go to Step2</a>
</body>
</html>