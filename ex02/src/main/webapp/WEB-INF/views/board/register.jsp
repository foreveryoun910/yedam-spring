<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">입력 폼</h1>
	</div>
	
	<div class="panel-heading">Board Register</div>
		<div class="panel-body">
			<form role="form" action="register" method="post">
				<div class="form-group">
					<label>제목</label><input class="form-control" id="title" name="title">
				</div>
				<div class="form-group">
					<label>내용</label><textarea class="form-control" id="content" name="content" rows="3"></textarea>
				</div>
				<div class="form-group">
					<label>작성자</label><input class="form-control" id="writer" name="writer">
				</div>
				<button class="btn btn-success">입력</button>&nbsp;
				<button class="btn btn-success" type="reset">취소</button>
			</form>
		</div>
	</div>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>