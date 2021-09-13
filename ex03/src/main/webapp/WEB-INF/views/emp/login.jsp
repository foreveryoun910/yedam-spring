<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 로그인</title>
</head>
<body>
	<h3>커스텀 로그인</h3>
	<!-- login-processing-url="login" -->
	<form action="login" method="post">
		<input type="text" name="${_csrf.parameterName}" value="${_csrf.token}" >
		<input id="id" name="id">
		<input type="password" id="password" name="password">
		<button>로그인</button>
	</form>
</body>
</html>