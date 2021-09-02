<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- toast grid, jq grid ( 파라미터 여러 개 받아오는 api ) -->
	<form action="/sample/ex05">
		<input name="list[0].name"><input name="list[0].age"><br>
		<input name="list[1].name"><input name="list[1].age"><br>
		<input name="list[2].name"><input name="list[2].age"><br>
		<button>등록</button>
	</form>
	<!-- SampleDTOList에서 list로 받아오기 때문에 list[index] -->
</body>
</html>