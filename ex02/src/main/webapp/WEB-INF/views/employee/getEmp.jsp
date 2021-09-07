<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">상세보기</h1>
	</div>
	
	<form id="empForm" action="modifyEmp" method="post">
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount}">
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
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${emp.employeeId}<input type="hidden" id="employeeId" name="employeeId" value="${emp.employeeId}"></td> <!--  -->
					<td>${emp.firstName}</td>
					<td>${emp.lastName}</td>
					<td><input id="email" name="email" value="${emp.email}"></td> <!--  -->
					<td><input id="phoneNumber" name="phoneNumber" value="${emp.phoneNumber}"></td> <!--  -->
					<td><fmt:formatDate value="${emp.hireDate}" pattern="yyyy-MM-dd" /></td>
					<td><input id="jobId" name="jobId" value="${emp.jobId}"></td> <!--  -->
				</tr>
			</tbody>
		</table>
		<div align="center">
			<button>수정</button>
			<button formaction="deleteEmp">삭제</button>
			<button onclick="listEmp?pageNum=${cri.pageNum}&amount=${cri.amount}">목록으로</button>
		</div>
	</form>
</div>
<!-- /.row -->

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>