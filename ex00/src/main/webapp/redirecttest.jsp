<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>redirecttest.jsp</title>
</head>
<body>
	<!-- 파라미터 값을 가져오지 않는다. -->
	<% response.sendRedirect("/main"); %>
</body>
</html>