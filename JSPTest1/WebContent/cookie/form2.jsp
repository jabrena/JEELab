<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="cookieFunctions.jsp" %>

<%

if( existCookie(request.getCookies(),COOKIE_NAME)){

	final String value = getCookieValue(request.getCookies(),COOKIE_NAME);
	response.addCookie(cookieToRemove(COOKIE_NAME));
	response.setHeader( "SET-COOKIE", getCookieString(COOKIE_NAME,value) );
	final String redirectURL = "./form3.jsp";
	response.sendRedirect(redirectURL);
}
%>