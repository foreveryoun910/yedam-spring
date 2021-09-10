<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<c:forEach items="${list}" var="emp">
	<div class="emp">
		<span>${emp.employeeId}</span>
		<span>${emp.firstName} ${emp.lastName}</span>
		<span>${emp.email}</span>
		<span>${emp.jobId}</span>
	</div>
</c:forEach>


<script>
	$(function(){
		$('.emp').on('click', function(){
			// 자식태그 찾을 때: children()
			// 자손태그까지 찾을 때: find()
			const span = $(this).find('span');
			$('#managerId').val(span.eq(0).text()); // span 태그의 0번째 개체의 text를 넣어준다.
			$('#name').val(span.eq(1).text());
			$('#empModal').modal('hide');
		});
		
	});
</script>