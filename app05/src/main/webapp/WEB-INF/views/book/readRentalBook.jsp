<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header" align="center">도서 조회/수정</h3>
	</div>
	<!-- /.col-lg-12 -->

	<div align="center">
		<table border="1">
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>금액</th>
				<th>도서소개</th>
			</tr>
			<c:forEach var="book" items="${list}">
				<tr>
					<td>${book.bookNo}</td>
					<td>${book.bookName}</td>
					<td><fmt:formatNumber value="${book.bookPrice}" type="number" maxFractionDigits="3" /></td>
					<td>${book.bookInfo}</td>				
				</tr>
			</c:forEach>
		</table>
	</div>


</div>
<!-- /.row -->

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>