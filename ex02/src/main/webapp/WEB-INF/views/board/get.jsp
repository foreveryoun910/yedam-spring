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
 			<input type="hidden" id="rno" name="rno" value="${reply.rno}">
 			<input id="replyer" name="replyer" value="user10">
 			<input id="reply" name="reply" size="30">
 			<button type="button" id="saveReply">댓글등록</button>
 			<button type="button" id="updateReply">수정</button>
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
		
		replyList();
		
		// ==================================================등록처리
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
		
		
		
		
		// ==================================================목록조회
		// 아무것도 안 쓰면 method : 'get'
/* 		replyService.getList({bno:bno}, listCallback);
		
		
		function listCallback(datas) {
			// console.log(datas);
			var str = "";
			for(i=0; i<datas.length; i++){
				str += makeLi(datas[i]);
			}
			$('.chat').html(str);
		} */

		function replyList(){
			$.ajax({
				url: '../reply/',
				data: {bno:bno},
				dataType: 'json',
				success: function(datas){
					var str = "";
					for(i=0; i<datas.list.length; i++){
						str += makeLi(datas.list[i]);
					}
					$('.chat').html(str);
				}
			});			
		}
		
		
		// ==================================================리스트 만들기
		function makeLi(data) {
			return '<li class="left clearfix">'
				 + '	<div>'
				 + '		<div class="header">'
				 + '			<strong class="primary-font">' + data.replyer + '</strong>'
				 + '			<small class="pull-right text-muted">' + data.replyDate + '</small>'
				 + '			<p>' + data.reply + '</p>'
				 + '			<p align="right"><button id="readReply">보기</button>&nbsp;<button id="deleteReply">삭제</button></p>'
				 + '		</div>'
				 + '	</div>'
				 + '</li>'
		}
		
		// ==================================================리스트 만들기(rno)
		function makeLiwithRno(data) {
			return '<li data-rno="' + data.rno + '"class="left clearfix">'
				 + '	<div>'
				 + '		<div class="header">'
				 + '			<strong class="primary-font">' + data.replyer + '</strong>'
				 + '			<small class="pull-right text-muted">' + data.replyDate + '</small>'
				 + '			<p>' + data.reply + '</p>'
				 + '			<p align="right"><button id="readReply">보기</button>&nbsp;<button id="deleteReply">삭제</button></p>'
				 + '		</div>'
				 + '	</div>'
				 + '</li>'
		}		
		
		
		// ==================================================단건조회 (ing)
		$('body').on('click', '#readReply', function(){
			var rno = $(this).closest('li').data('rno');
			$.ajax({
				uri: '../reply/' + rno,
				type: 'GET',
				dataType: 'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success: replySelectResult
			});
		});		
		
		//사용자 조회 응답
		function replySelectResult(reply) {
			$('input:text[name="replyer"]').val(reply.replyer);
			$('input:text[name="reply"]').val(reply.reply);
		}//replySelectResult
		
		
		// ==================================================수정처리 (ing)
		$('body').on('click', '#updateReply', function(){
			var replyer = $('input:text[name="replyer"]').val();
			var reply = $('input:text[name="reply"]').val();
			
			$.ajax({
				url: '../reply/',
				type: 'put',
				dataType: 'json',
				data: JSON.stringify({ replyer: replyer, reply: reply }),
			    contentType: 'application/json',
			    error: function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success: function(data){
					replyList();
				}
			});
		});
		
		
		
		// ==================================================삭제처리
		$('body').on('click', '#deleteReply', function(){
			var rno = $(this).closest('li').data('rno');
			var result = confirm('정말로 삭제하시겠습니까?');
			var li = $(this).closest('li');
			if(result){
				$.ajax({
					url: '../reply/' + rno,
					type: 'DELETE',
					dataType: 'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					},
					success: function(xhr){
						if(xhr == true){
							console.log(xhr.result);
							li.remove();
							alert("삭제완료");
						}
					}
				}); // ajax 끝
			} // if
		}); // 삭제버튼 클릭
		
		
		
		// ==================================================페이징처리
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt){
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt / 10.0);
			}
			
			if(endNum * 10 < replyCnt){
				next = true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
			}
			
			for(var i = startNum ; i <= endNum; i++){
				var active = pageNum == i ? "active":"";
				
				str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
			}
			
			if(next){
				str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
			}
			
			str += "</ul></div>";
			
			console.log(str);
			
			replyPageFooter.html(str);
		}
		
	});
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>