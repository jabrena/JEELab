<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="cookieFunctions.jsp" %>

<%
//1. Cookie Generation
response.setHeader( "SET-COOKIE", getCookieString(COOKIE_NAME,"123456") );

//2. Redirect to step2
String redirectURL = "./form2.jsp";
response.sendRedirect(redirectURL);
%>