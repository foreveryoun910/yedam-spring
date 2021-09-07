<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">상세보기/수정페이지</h1>
	</div>
	
	<div class="panel-body">
		<form action="modify" method="post" id="frm">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="amount" value="${cri.amount}">
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
			<a class="btn btn-success" href="list?pageNum=${cri.pageNum}&amount=${cri.amount}">목록으로</a>
		</form>
		
		<!-- 방법3. 아예 form을 하나 새로 만들기 -->
		<form id="frm2" action="delete" method="post">
			<input type="hidden" id="bno" name="bno" value="${board.bno}">
			<button class="btn btn-primary">삭제</button>
		</form>
	</div>

</div>
<!-- /.row -->


<!-- 댓글등록 -->
 <div class="row">
 	<div class="panel-heading">
 		<form id="replyForm">
 			<input type="hidden" id="bno" name="bno" value="${board.bno}">
 			<input id="replyer" name="replyer" value="user10">
 			<input id="reply" name="reply" size="30">
 			<button type="button" id="saveReply">댓글등록</button>
   		</form>
 	</div>
 </div>


<!-- 댓글목록 -->

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">댓글보기</h3>
	</div>
	<ul class="chat">
<!-- 		<li class="left clearfix">
			<div>
				<div class="header">
					<strong class="primary-font">작성자</strong>
					<small class="pull-right text-muted">시간</small>
					<p>내용</p>
				</div>
			</div>
		</li>	 -->	
	</ul>
</div>



<script src="../resources/js/reply.js"></script>

<!-- 여기는 board 폴더니까 ../로 빠져나가서 reply로 -->
<script>
	const bno = "${board.bno}";
	$(document).ready(function(){
		
		// 등록처리
		$('#saveReply').on('click', function(){
			replyService.add(function(data) { 
				$('.chat').append(makeLi(data)); 
			});
		});
			
/* 		$('#saveReply').on('click', function(){
			replyService.add(addCallback);
		
		});
		
		function addCallback(data) {
			$('.chat').append(makeLi(data));
		} */
		
		
		// append는 제일 뒤에, prepend는 제일 위에 추가한다.
		
		
		
		
		// 목록조회
		// 아무것도 안 쓰면 method : 'get'
		replyService.getList({bno:bno}, listCallback);
		
		
		function listCallback(datas) {
			// console.log(datas);
			var str = "";
			for(i=0; i<datas.length; i++){
				str += makeLi(datas[i]);
			}
			$('.chat').html(str);
		}

		
		
		// 리스트 만들기
		function makeLi(data) {
			return '<li class="left clearfix">'
				 + '	<div>'
				 + '		<div class="header">'
				 + '			<strong class="primary-font">' + data.replyer + '</strong>'
				 + '			<small class="pull-right text-muted">' + data.replyDate + '</small>'
				 + '			<p>' + data.reply + '</p>'
				 + '		</div>'
				 + '	</div>'
				 + '</li>'
		}
		
		
	});
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>