<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

	<a href="${pageContext.request.contextPath}/emp/empList">Employees</a><br>
	<a href="${pageContext.request.contextPath}/dept">Departments</a>

</body>
</html>
