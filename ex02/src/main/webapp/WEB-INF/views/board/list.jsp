<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
    
<!-- DataTables CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">    
<!-- DataTables JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판</h1>
	</div>
	<!-- /.col-lg-12 -->
	<table class="table table-hover" id="board" border="1">
		<thead>
			<tr>
				<th>No</th>
				<th>제목</th>
				<!-- <td>내용</td> -->
				<th>작성자</th>
				<th>작성일자</th>
				<!-- <th>수정일자</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.bno}</td>
					<td><a class="move" href="${board.bno}">${board.title}  [ <span style="color: red;">${board.replycnt}</span> ]</a></td>
					<!-- <td>${each.content}</td> -->
					<td>${board.writer}</td>
					<td><fmt:formatDate value="${board.regDate}" pattern="yy-MM-dd" /></td>
					<!-- <td><fmt:formatDate value="${board.updateDate}" type="both" dateStyle="short" timeStyle="short"/></td> -->
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<form id="actionForm" action="list" method="get">
		<select name="type" style="height: 26px;">
			<option <c:out value="${empty pageMaker.cri.type ? 'selected':''}"/>>선택</option>
			<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
			<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
			<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>
			<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목 or 내용</option>
			<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':''}"/>>제목 or 작성자</option>
			<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':''}"/>>제목 or 내용 or 작성자</option>
		</select>
		<input name="keyword" value="${pageMaker.cri.keyword}">
 		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		
		<button class="btn">검색</button>
	</form>
	<%-- ${pageMaker} --%>
	<div id="pageButton">
		<!-- prev, next 자체가 boolean이기 때문에 조건은 이렇게만 걸어줘도 된다. -->
		<c:if test="${pageMaker.prev}">
			<a href="${pageMaker.startPage - 1}">이전</a>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
			<a href="${num}">${num}</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<a href="${pageMaker.endPage + 1}">다음</a>
		</c:if>
	</div>
	
	<div>
		<button class="btn btn-success" onclick="location.href='register'">등록</button>
	</div>
</div>
<!-- /.row -->

<script>
/* 	$(function(){
		$('#board').DataTable();		
	}) */
	
	$(function(){
		var actionForm = $('#actionForm');

		$('.move').on('click', function(e){
			e.preventDefault();
			var bno = $(this).attr('href') // 클릭한 a의 href 값을 bno에 담는다. 
			actionForm.append('<input type="hidden" name="bno" value="' + bno + '">');
			actionForm.attr('action', 'get');
			actionForm.submit();
		})
		
		$('#pageButton a').on('click', function(e){
			e.preventDefault(); 
			// a, submit의 경우 사용.. tag의 원래 기능을 막고 내가 정의한 function을 실행하도록
			// $(this) : 내가 지금 클릭한 것을 의미 ( 여기서는 a 태그를 의미한다. )
			var p = $(this).attr('href')
			$('[name="pageNum"]').val(p)
			actionForm.submit();
		})
	})
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>