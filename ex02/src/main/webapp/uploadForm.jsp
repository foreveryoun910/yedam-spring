<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- p.495, p.497 -->
	<form method="post" enctype="multipart/form-data" action="uploadFormAction">
		<input multiple="multiple" type="file" name="uploadFile">
		<button>등록</button>
	</form>
</body>
</html>