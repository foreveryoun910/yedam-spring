<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<script>
	$(document).ready(function(){
		const actionForm = $('#actionForm');
		
		$('.move').on('click', function(e){
			e.preventDefault();
			const employeeId = $(this).attr('href');
			actionForm.append('<input type="hidden" id="employeeId" name="employeeId" value="' + employeeId + '">');
			actionForm.attr('action', 'getEmp');
			actionForm.submit();
		});
		
		$('#pageButton a').on('click', function(e){
			e.preventDefault();
			const pNo = $(this).attr('href');
			$('[name="pageNum"]').val(pNo);
			actionForm.submit();
		});
	});
</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Employee</h1>
	</div>
	<!-- /.col-lg-12 -->
	
	<div align="right">
		<form id="actionForm" action="listEmp" method="get">
			<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
		</form>
		
		
		<form id="searchForm" action="listEmp" method="get">
			<select name="type" style="height: 26px">
				<option <c:out value="${empty pageMaker.cri.type ? 'selected':''}"/>>select</option>
				<option value="L" <c:out value="${pageMaker.cri.type eq 'L' ? 'selected':''}"/>>last_name</option>
				<option value="E" <c:out value="${pageMaker.cri.type eq 'E' ? 'selected':''}"/>>email</option>
				<option value="J" <c:out value="${pageMaker.cri.type eq 'J' ? 'selected':''}"/>>job_id</option>
				<option value="LE" <c:out value="${pageMaker.cri.type eq 'LE' ? 'selected':''}"/>>last_name or email</option>
				<option value="EJ" <c:out value="${pageMaker.cri.type eq 'EJ' ? 'selected':''}"/>>email or job_id</option>
				<option value="LJ" <c:out value="${pageMaker.cri.type eq 'LJ' ? 'selected':''}"/>>last_name or job_id</option>
			</select>

			<input id="keyword" name="keyword" value="${pageMaker.cri.keyword}">
			<button class="btn">검색</button>			
		</form>
	</div>
	<br>
	
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
			<c:forEach var="emp" items="${list}">
				<tr>
					<td>${emp.employeeId}</td>
					<td>${emp.firstName}</td>
					<td><a class="move" href="${emp.employeeId}">${emp.lastName}</a></td>
					<td>${emp.email}</td>
					<td>${emp.phoneNumber}</td>
					<td><fmt:formatDate value="${emp.hireDate}" pattern="yyyy-MM-dd"/> </td>
					<td>${emp.jobId}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div id="pageButton" align="center">
		<c:if test="${pageMaker.prev}">
			<a href="${pageMaker.startPage - 1}">prev</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
			<a href="${page}">${page}</a>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="${pageMaker.endPage + 1}">next</a>
		</c:if>				
	</div><br>
		
	<div align="center">
		<button class="btn btn-success" onclick="location.href='registerEmp'">등록</button>
	</div>
</div>
<!-- /.row -->


<%@ include file="/WEB-INF/views/includes/footer.jsp"%>