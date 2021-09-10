<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	$(function(){
		$('.read').on('click', function(){
			const employeeId = $(this).data('employeeid');
			location.href = 'readEmp?employeeId=' + employeeId;
		});
	});
</script>

</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<th>EMPLOYEE_ID</th>
				<th>FIRST_NAME</th>
				<th>LAST_NAME</th>
				<th>EMAIL</th>
				<th>HIRE_DATE</th>
				<th>JOB_ID</th>
			</tr>
			<c:forEach var="emp" items="${list}">
			<tr class="read" data-employeeId="${emp.employeeId}">
			<%-- <tr onclick="location.href='readEmp?employeeId=${emp.employeeId}'"> --%>
				<td>${emp.employeeId}<input type="hidden" id="employeeId" value="${emp.employeeId}"></td>
				<td>${emp.firstName}</td>
				<td>${emp.lastName}</td>
				<td>${emp.email}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${emp.hireDate}"/></td>
				<td>${emp.jobId}</td>
			</tr>
			</c:forEach>
		</table>
		<br>
		<button onclick="location.href='insertEmp'">등록</button>
	</div>

</body>
</html>