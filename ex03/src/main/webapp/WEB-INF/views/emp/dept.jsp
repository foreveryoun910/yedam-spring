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
		
		// 목록조회 함수
		function deptList(){
			$.ajax({
				url: 'deptList',
				dataType: 'json',
				success: function(datas){
					$.each(datas, function(idx, data){
						$('<div>').append($('<span>').html(data.departmentId))
								  .append($('<span>').html(data.departmentName))
								  .append($('<span>').html(data.managerId))
								  .append($('<span>').html(data.locationId))
								  .appendTo($('#list'));
					});
				} // function 함수 end
				
			});
		}
		
		// 단건조회 함수
		
		
		// 등록 함수
		
		
		// 수정 함수
		
		
		// 삭제 함수
		
	});
</script>

</head>
<body>
	<div align="center"><h3>부서관리</h3></div>
	
	<div id="list" align="center">
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#empModal">
		부서등록
	</button>
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
	        	<form>
	        		<div class="panel">
					    <div class="panel-heading">
					        <p class="panel-title">부서등록</p>
					    </div>
					    <div class="panel-body">
					        <span><label>DEPARTMENT_ID </label><input id="departmentId" name="departmentId"></span>
					        <span><label>DEPARTMENT_NAME </label><input id="departmentName" name="departmentName"></span>
					        <label>MANAGER_ID </label><input id="managerId" name="managerId">
					        <label>LOCATION_ID </label><input id="locationId" name="locationId">
					    </div>
					    <div class="panel-footer">
					        
					    </div>
					</div>
	        	</form>
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