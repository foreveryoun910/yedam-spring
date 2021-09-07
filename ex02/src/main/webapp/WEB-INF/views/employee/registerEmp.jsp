<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">사원입력</h1>
	</div>
	
	<form id="empForm" action="registerEmp" method="post">
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount}">	
		<table class="table table-hover" id="board" border="1">
			<thead>
				<tr>
					<th>first_name</th>
					<th>last_name</th>
					<th>email</th>
					<th>phone_number</th>
					<th>job_id</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input id="firstName" name="firstName"></td>
					<td><input id="lastName" name="lastName"></td>
					<td><input id="email" name="email"></td> <!--  -->
					<td><input id="phoneNumber" name="phoneNumber"></td> <!--  -->
					<td><input id="jobId" name="jobId"></td> <!--  -->
				</tr>
			</tbody>
		</table>
		<div align="center">
			<button>등록</button>
			<input type="button" onclick="location.href='listEmp'" value="목록으로">
		</div>
	</form>
</div>
<!-- /.row -->

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>