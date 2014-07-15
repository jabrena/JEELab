<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello World</title>
</head>
<body>
<h1>Demo</h1>
<%-- --%>
<bean:write name="helloWorldForm" property="message"/>

</body>
</html>