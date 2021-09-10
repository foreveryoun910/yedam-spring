<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>


<style>
	.require {
		color: red;
	}
	
	.emp {
		cursor: pointer;
	}
	
	.emp:hover {
		color: blue;
	}
</style>


<script>
	$(function(){
		
		// 매니저 전체 검색
		$('#btnEmpSearch').on('click', function(){
			// 검색페이지를 ajax -> 모달 바디 넣고 -> 모달 호출
			$.ajax({
				url: 'empSearch',
				success: function(data){
					// json 타입이 아니라 페이지 자체를 ajax로 넘기기: html
					$('#empModal .modal-body').html(data);
					$('#empModal').modal('show');
				}
			});			
		});
		
		
		
		// 매니저 단건 검색
/*		$('#managerId').on('change', function(){
			$.ajax({
				url: 'ajaxEmp',
				data: { employeeId: $('#managerId').val() },
				success: function(data){
					if(data){
						$('#name').val(data.firstName + ' ' + data.lastName);
					} else {
						$('#btnEmpSearch').click();
					}
				}
			});
			
		});
*/

		// 원래 기능: enter 누르면 바로 submit이 실행되어버림.
		// submit 막고 엔터키(키번호 13번) ajax가 실행되도록 한다.
		$('#managerId').on('keydown', function(e){
			e.preventDefault;
			$('#name').val('');
			if( $('#managerId').val() == '' ) return;
			if(e.keyCode == 13){
				$.ajax({
					url: 'ajaxEmp',
					data: { employeeId: $('#managerId').val() },
					success: function(data){
						if(data){
							$('#name').val(data.firstName + ' ' + data.lastName);
						} else {
							$('#btnEmpSearch').click();
						}
					}
				}) // ajax end
			} // if end
		});
		
		
		function validation(){
			if(insertFrm.firstName.value == ''){
				alert('first_name 입력');
				insertFrm.firstName.focus();
				return false;
			}			
			if(insertFrm.lastName.value == ''){
				alert('last_name 입력');
				insertFrm.lastName.focus();
				return false;
			}
			if(insertFrm.email.value == ''){
				alert('email 입력');
				insertFrm.email.focus();
				return false;
			}
			if(insertFrm.jobId.value == ''){
				alert('jobId 입력');
				insertFrm.jobId.focus();
				return false;
			}
			
			return true;
		}
		
		
		// 등록버튼
		$('#btnRegister').on('click', function(){
			if( validation() ){
				insertFrm.submit();
			}
			
		});
		
		
		
		// 이메일을 활용해 단건 검색 (과제)
		
		// 수정처리 (과제)
		
		
	});

</script>

</head>
<body>
	<div align="center">
		<form id="insertFrm" action="${not empty emp ? 'updateEmp' : 'insertEmp'}" method="post">
			<c:if test="${not empty emp}">
				<input type="hidden" id="employeeId" name="employeeId" value="${emp.employeeId}">
			</c:if>
			<table border="1">
				<tr>
					<th>FIRST_NAME <font color="red">*</font></th>
					<td><input id="firstName" name="firstName" value="${emp.firstName}"></td>
				</tr>
				<tr>
					<th>LAST_NAME <font color="red">*</font></th>
					<td><input id="lastName" name="lastName" value="${emp.lastName}"></td>
				</tr>
				<tr>
					<th>EMAIL <font color="red">*</font></th>
					<td><input id="email" name="email" value="${emp.email}"></td>
				</tr>
				<tr>
					<th>JOB_ID <font color="red">*</font></th>
					<td>
						<select id="jobId" name="jobId" required="required">
							<option>선택</option>
							<c:forEach items="${opt.jobs}" var="job">
								<option value="${job.jobId}">${job.jobTitle}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			
 				<tr>
					<th>PHONE_NUMBER</th>
					<td><input id="phoneNumber" name="phoneNumber" value="${emp.phoneNumber}"></td>
				</tr>
				<tr>
					<th>SALARY</th>
					<td><input id="salary" name="salary" value="${emp.salary}"></td>
				</tr>
				<tr>
					<th>COMMISSION_PCT</th>
					<td><input id="commissionPct" name="commissionPct" value="${emp.commissionPct}"></td>
				</tr>
 				
				<tr>
					<th>MANAGER_ID</th>
					<td>
						<input id="managerId" name="managerId" value="${emp.managerId}">
						<input id="name">

						<button type="button" id="btnEmpSearch">검색</button>
					</td>
				</tr>
				<tr>
					<th>DEPARTMENT_ID</th>
					<td>
						<select id="deptId" name="deptId">
							<option>선택</option>
							<c:forEach items="${opt.depts}" var="dept">
								<option value="${dept.departmentId}">${dept.departmentName}</option>
							</c:forEach>
						</select>					
					</td>
				</tr>
	
			</table>
			<br>
			<button type="button" id="btnRegister">입력</button>&nbsp;&nbsp;
			<button type="button" onclick="location.href='empList'">목록으로</button>
		</form>
	</div>
	
	
	<div class="modal" tabindex="-1" id="empModal">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      	<div class="modal-header">
	        	<h5 class="modal-title">Modal title</h5>
	        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          	<span aria-hidden="true">&times;</span>
	        	</button>
	      	</div>
	      	<div class="modal-body">
	        	<p>Modal body text goes here.</p>
	      	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        	<button type="button" class="btn btn-primary">Save changes</button>
	      	</div>
	    	</div>
	  	</div>
	</div>
	
		
</body>
</html>