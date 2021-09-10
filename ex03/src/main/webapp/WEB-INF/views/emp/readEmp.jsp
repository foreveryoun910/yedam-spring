<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<form id="updateEmp" action="updateEmp" method="get">
		<input type="hidden" id="employeeId" name="employeeId" value="${emp.employeeId}">
			<table border="1">
				<tr>
					<th>FIRST_NAME</th>
					<td>${emp.firstName}</td>
				</tr>
				<tr>
					<th>LAST_NAME</th>
					<td>${emp.lastName}</td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td>${emp.email}</td>
				</tr>
				<tr>
					<th>HIRE_DATE</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${emp.hireDate}"/></td>
				</tr>
				<tr>
					<th>JOB_ID</th>
					<td>${emp.jobId}</td>
				</tr>
				<tr>
					<th>PHONE_NUMBER</th>
					<td>${emp.phoneNumber}</td>
				</tr>
				<tr>
					<th>SALARY</th>
					<td>${emp.salary}</td>
				</tr>	
				<tr>
					<th>COMMISSION_PCT</th>
					<td>${emp.commissionPct}</td>
				</tr>	
				<tr>
					<th>MANAGER_ID</th>
					<td>${emp.managerId}</td>
				</tr>	
				<tr>
					<th>DEPARTMENT_ID</th>
					<td>${emp.departmentId}</td>
				</tr>		
			</table>
			<br>
			<button type="submit">수정</button>&nbsp;&nbsp;
			<button formaction="deleteEmp">삭제</button>&nbsp;&nbsp;
			<button formaction="empList">목록으로</button>
		</form>
	</div>
</body>
</html>