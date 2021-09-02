<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
메인페이지입니다.
<form action="login">
	<input id="id" name="id" value="${param.id}">
	<input id="pw" name="pw" value="${param.pw}">
	<button>로그인</button>
</form>
</body>
</html>