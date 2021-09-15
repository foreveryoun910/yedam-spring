<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
	th {
		background-color: yellow;
	}
</style>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>



<script>

	$(function(){
		
		function validation(){		
			if(frm.bookName.value == ''){
				alert('도서명이 입력되지 않았습니다.');
				frm.bookName.focus();
				return false;
			}
			
			return true;
		}
		
		
		// 등록버튼 ( 등록 및 수정 )
		$('#registerBtn').on('click', function(){
			if( validation() ){
				frm.submit();
				alert('도서등록이 완료 되었습니다.');
			}
			
		});
		
		
	});

</script>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header" align="center">도서 등록</h3>
	</div>
	<!-- /.col-lg-12 -->

	<div align="center">
		<form id="frm" action="insertBook" method="post">
			<table border="1">
				<tr>
					<!-- 쿼리 alias를 안 줘서 화면에 출력이 안 되었던 거였음 -->
					<th>도서번호</th>
					<td><input id="bookNo" name="bookNo" value="${book.bookNo}"></td>
				</tr>
				<tr>
					<th>도서명</th>
					<td><input id="bookName" name="bookName"></td>
				</tr>
				<tr>
					<th>표지</th>
					<td><input id="bookCoverimg" name="bookCoverimg"></td>
				</tr>
				<tr>
					<th>출판일자</th>
					<td><input id="bookDate" name="bookDate"></td>
				</tr>
				<tr>
					<th>금액</th>
					<td><input id="bookPrice" name="bookPrice"></td>
				</tr>
				<tr>
					<th>출판사</th>
					<td><input id="bookPublisher" name="bookPublisher"></td>
				</tr>
				<tr>
					<th>도서소개</th>
					<td><textarea id="bookInfo" name="bookInfo" rows="5" cols="50"></textarea></td>
			</table>
			<br>
			<button type="button" id="registerBtn">등록</button>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/book/bookList'">조회</button>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>