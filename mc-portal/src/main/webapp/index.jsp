<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Index</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/static/style.css' />"/>
</head>
<body>
<h3>Index..</h3>
<div>
${message}

<p>lorem ipsum..</p>
${pageContext.request.contextPath}
<c:url value='static/style.css' />
<hr/>
<%  
  String action = (String) request.getParameter("page");    
  out.println("<h3> the action is  : " + action +" </h3> ");  
%>

<hr/>
<a href="./main?name=mc">test..</a>&nbsp;<a href="./">home!</a>
</div>
</body>
</html>