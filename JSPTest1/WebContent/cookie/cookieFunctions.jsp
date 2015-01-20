<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TimeZone" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Calendar" %>

<%!

public final String COOKIE_NAME= "COOKIE_DEMO_HEADER";

//Create a valid GMT expiration date (Today + 1 year)
private String getExpires(){
	final Calendar date = Calendar.getInstance();
	date.setTime(new Date());
	date.add(Calendar.YEAR,1);
	final DateFormat df = new SimpleDateFormat("EEE, dd-MMM-yyyy HH:mm:ss zzz", Locale.ROOT);
	df.setTimeZone(TimeZone.getTimeZone("GMT"));

	return df.format(date.getTime());
}

//Return a valid String to be used in a JSP to declare a Cookie using HTTP Header:
public String getCookieString(final String cookieName, final String value){
	final String expires = "Expires=" + getExpires() + "; ";
	final String path = "Path=/; ";
	final String domain="Domain=localhost; ";
	final String securityOptions = " HttpOnly;";//"Secure; HttpOnly;";
	
	String cookie = cookieName +"="+value+"; ";
	cookie += expires;
	cookie += path;
	//cookie += domain;
	cookie += securityOptions;
	
	return cookie;
}

//response.addCookie(cookie);
public Cookie cookieToRemove(final String cookieName){
	Cookie cookie = new Cookie(cookieName, "");
	cookie.setMaxAge(0);
	cookie.setPath("/");
	return cookie;
}

public boolean existCookie(final Cookie[] cookies, final String cookieName){
	
	boolean detected = false;
	
	Cookie cookie = null;
	if( cookies != null ){
		for (int i = 0; i < cookies.length; i++){
			cookie = cookies[i];
			if(cookie.getName().equals(cookieName)){
				detected = true;
				break;
			}
		}
	}
	
	return detected;
}

public String getCookieValue(final Cookie[] cookies, final String cookieName){
	
	String value = "";
	
	Cookie cookie = null;
	if( cookies != null ){
		for (int i = 0; i < cookies.length; i++){
			cookie = cookies[i];
			if(cookie.getName().equals(cookieName)){
				value = cookie.getValue();
				break;
			}
		}
	}
	
	return value;
}
%>
