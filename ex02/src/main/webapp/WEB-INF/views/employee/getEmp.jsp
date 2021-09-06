<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">상세보기</h1>
	</div>
	
	<table class="table table-hover" id="board" border="1">
		<thead>
			<tr>
				<th>employee_id</th>
				<th>first_name</th>
				<th>last_name</th>
				<th>email</th>
				<th>phone_number</th>
				<th>hire_date</th>
				<th>job_id</th>
				<th>salary</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${emp.employeeId}</td>
				<td>${emp.firstName}</td>
				<td>${emp.lastName}</td>
				<td>${emp.email}</td>
				<td>${emp.phoneNumber}</td>
				<td><fmt:formatDate value="${emp.hireDate}" pattern="yyyy-MM-dd" /></td>
				<td>${emp.jobId}</td>
				<td>${emp.salary}</td>
			</tr>
		</tbody>
	</table>
</div>
<!-- /.row -->

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>