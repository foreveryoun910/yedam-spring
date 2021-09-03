<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">상세보기</h1>
	</div>
	
	<div class="panel-heading">Board Read</div>
		<div class="panel-body">
			<form role="form" action="modify" method="post" id="frm">
				<input type="hidden" id="bno" name="bno" value="${board.bno}">
				<div class="form-group">
					<label>제목</label><input class="form-control" id="title" name="title" value="${board.title}">
				</div>
				<div class="form-group">
					<label>내용</label><textarea class="form-control" id="content" name="content" rows="3">${board.content}</textarea>
				</div>
				<div class="form-group">
					<label>작성자</label><input class="form-control" id="writer" name="writer" value="${board.writer}">
				</div>
				<button class="btn btn-success">수정</button>&nbsp;
				<button type="button" class="btn btn-danger" onclick="frm.action='delete';frm.submit()">삭제</button> <!-- 방법1 -->
				<!-- 버튼 type="button" 으로 주지 않으면 기본 타입인 submit이 되어서 form의 action인 modify를 실행한다. -->
				<input class="btn btn-danger" type="submit" formaction="delete" value="삭제"> <!-- 방법2. 이게 최신 방법 -->
			</form>
			
			<!-- 방법3. 아예 form을 하나 새로 만들기 -->
			<form id="frm2" action="delete" method="post">
				<input type="hidden" id="bno" name="bno" value="${board.bno}">
				<button class="btn btn-primary">삭제</button>
			</form>
		</div>
	</div>

</div>
<!-- /.row -->

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>