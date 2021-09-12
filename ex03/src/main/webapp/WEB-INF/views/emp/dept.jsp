<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리</title>

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
	$(function(){
		
		deptList();
		readDept();
		
		// 목록조회 함수
		function deptList(){
			$.ajax({
				url: 'deptList',
				dataType: 'json',
				success: function(datas){
					const table = $('<table>').attr('border', '1');
					$.each(datas, function(idx, data){
						const tr = 
						$('<tr class="detpTr" data-departmentId="data.departmentId">')
								 .append($('<td>').attr('width', '90').html(data.departmentId))
								 .append($('<td>').attr('width', '180').html(data.departmentName))
								 .append($('<td>').attr('width', '90').html(data.managerId))
								 .append($('<td>').attr('width', '90').html(data.locationId));
								 /* .appendTo(table)
								 .appendTo($('#list')); */

						table.append(tr);
					});
					
					$('#list').append(table).append('<br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deptModal" id="btnDept">부서등록</button>');
				} // function 함수 end
				
			});
		}
		
		// 단건조회 함수
		function readDept(){
			const id = $(this).data('departmentid');
			$(document).on('click', '.detpTr', function(){
				$.ajax({
					url: 'readDept/' + id,
					type: 'get',
					contentType:'application/json;charset=utf-8',
					dataType: 'json',
					error:function(xhr,status,msg){
						alert("상태값 :" + status + " Http에러메시지 :"+msg);
					},
					success: readDeptResult
				});
			});
			
			function readDeptResult(data){
				$('#deptModal .modal-body').html(data);
				
				$('#departmentId').val(data.departmentId);
				$('#departmentName').val(data.departmentName);
				$('#managerId').val(data.managerId);
				$('#locationId').val(data.locationId);
				
				$('#deptModal').modal('show');
				
			}
		}
			
			
		
		// 등록 함수
		
		
		// 수정 함수
		
		
		// 삭제 함수
		
	});
</script>

</head>
<body>
	<div align="center"><h3>부서관리</h3></div><br>
	
	<div id="list" align="center">
	<!-- Button trigger modal -->
<!-- 	
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#empModal">
		부서등록
	</button> -->
	</div>
	
	
	<div class="modal" tabindex="-1" id="deptModal">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      	<div class="modal-header">
	        	<h5 class="modal-title">Modal title</h5>
	        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          	<span aria-hidden="true">&times;</span>
	        	</button>
	      	</div>
	      	<div class="modal-body">
	        	<form action="${not empty emp ? 'updateDept' : 'insertDept'}">
	        		<div class="panel">
					    <div class="panel-heading">
					        <p class="panel-title">부서관리</p>
					    </div>
					    <div class="panel-body">
						    	<table border="1">
						    		<tr>
						    			<th>DEPARTMENT_ID</th>
						    			<td><input id="departmentId" name="departmentId"></td>
						    		</tr>
						    		<tr>
						    			<th>DEPARTMENT_NAME</th>
						    			<td><input id="departmentName" name="departmentName"></td>
						    		</tr>
						    		<tr>
						    			<th>MANAGER_ID</th>
						    			<td><input id="managerId" name="managerId"></td>
						    		</tr>
						    		<tr>
						    			<th>LOCATION_ID</th>
						    			<td><input id="locationId" name="locationId"></td>
						    		</tr>
						    	</table>
					    </div>
					    <div class="panel-footer">
					        
					    </div>
					</div>
	        	</form>
	      	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        	<button type="button" class="btn btn-primary">Save</button>
	        	<button type="button" class="btn btn-danger">Delete</button>
	      	</div>
	    	</div>
	  	</div>
	</div>
		
</body>
</html>