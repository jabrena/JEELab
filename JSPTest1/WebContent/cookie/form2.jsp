<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

//1. Remove Cookie.
Cookie cookie = null;
Cookie cookieDetected = null;
Cookie[] cookies = null;
// Get an array of Cookies associated with this domain
cookies = request.getCookies();
if( cookies != null ){
	for (int i = 0; i < cookies.length; i++){
		cookie = cookies[i];
		if(cookie.getName().equals("COOKIE_DEMO_REMOVE")){
			cookieDetected = cookie;
		}
	}
}else{
    out.println("<h2>No cookies founds</h2>");
}

if(cookieDetected != null){
	cookieDetected.setMaxAge(0);
	cookieDetected.setValue(null);
    response.addCookie(cookieDetected);
}


//2. Update cookie
if( cookies != null ){
	for (int i = 0; i < cookies.length; i++){
		cookie = cookies[i];
		if(cookie.getName().equals("COOKIE_DEMO")){
			cookieDetected = cookie;
		}
	}
}else{
    out.println("<h2>No cookies founds</h2>");
}

if(cookieDetected != null){
	cookieDetected.setValue("Cookie updated");
    response.addCookie(cookieDetected);
}

//2. Update path


if( cookies != null ){
	for (int i = 0; i < cookies.length; i++){
		cookie = cookies[i];
		if(cookie.getName().equals("COOKIE_DEMO_PATH")){
			cookieDetected = cookie;
		}
	}
}else{
  out.println("<h2>No cookies founds</h2>");
}

if(cookieDetected != null){
	cookieDetected.setMaxAge(0);
	cookieDetected.setValue(null);
    response.addCookie(cookieDetected);
    
    cookieDetected = new Cookie("COOKIE_DEMO_PATH","demo");
	cookieDetected.setPath("/");
	response.addCookie(cookieDetected);
}
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
	//Cookie[] cookies = null;
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
<a href="form3.jsp">Next</a>
</body>
</html>