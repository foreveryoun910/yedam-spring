<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- 경로: 현재 위치에서 찾아가라. localhost/app <-여기 app이 context인 것임 -->
<script src="./resources/js/json.min.js"></script>


<!-- get 방식에는 contentType XX -->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">사용자관리</h1>
	</div>

	<!-- 컨텐츠 -->
	<div class="container">
		<form id="form1"  class="form-horizontal">
			<h2>사용자 등록 및 수정</h2>
			<div class="form-group">		
				<label >아이디:</label>
				<input type="text"  class="form-control" name="id" >
			</div>	
			<div class="form-group">
				<label>이름:</label>
				<input type="text"  class="form-control"  name="name" >
			</div>	
			<div class="form-group">
				<label>패스워드:</label>
				<input type="text"  class="form-control"  name="password" >
			</div>			
	<!-- 		<div class="form-group">
				<label >성별:</label>
				<div class="radio">
					<label><input type="radio"  name="gender"  value="남">남</label>
				</div>
				<div class="radio">
					<label><input type="radio"  name="gender"  value="여">여</label>
				</div>	
			</div>	 -->    
			<div class="form-group">   
				<label>역할:</label>
					<select class="form-control" name="role">
						   		<option value="Admin">관리자</option>
						   		<option value="User">사용자</option>
					</select>
			</div>  
			<div class="btn-group">      
					<input type="button"  class="btn btn-primary" value="등록"  id="btnInsert" /> 
					<input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" />
					<input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />
			</div>
		</form>
	</div>		
	<hr/>		
	<div class="container">	
		<h2>사용자 목록</h2>
		<table class="table text-center">
			<thead>
			<tr>
				<th class="text-center">아이디</th>
				<th class="text-center">이름</th>
				<th class="text-center">성별</th>
				<th class="text-center">거주지</th>
			</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>	

</div>	




<script type="text/javascript" >
	$(function(){
		userList();

		userSelect();
		
		userDelete();
		
		userInsert();
	
		userUpdate();
		
		init();
	});
	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click',function(){
			$('#form1').each(function(){
				this.reset();
			});
		});
	}//init
	
	//사용자 삭제 요청
	function userDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			// var userId = $(this).closest('tr').find('#hidden_userId').val();
			var userId = $(this).closest('tr').data('userid');
			var result = confirm(userId +" 사용자를 정말로 삭제하시겠습니까?");
			var tr = $(this).closest('tr');
			if(result) {
				$.ajax({
					url:'users/'+userId,  
					type:'DELETE',
					// data: {}, // 데이터가 없으면 {} 이렇게 쓰는 것도 가능.
					// contentType:'application/json;charset=utf-8', // 보낼 데이터가 없으면 contentType 안 써도 됨.
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:/* function(xhr) {
						console.log(xhr.result);
						userList();
					} */
								function(xhr){ // 삭제 후 리스트 재조회가 아니라 그 행만 삭제하는 방식으로 변경한 것.
								if(xhr.result == true){
									tr.remove(); // tr을 미리 위에서 정의해두어야 함.
									alert("삭제완료");
									} // if 완료
								} // success function 완료
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	//사용자 조회 요청
	function userSelect() {
		//조회 버튼 클릭
		// 버튼은 처음부터 있는 게 아니라 동적으로(추가할 때마다) 생기는 거기 때문에 버튼에 바로 onclick 이벤트를 못 걸어줌(안 먹힘)
		// 그래서 body 안에 있는 버튼의 아이디 이런 식으로 줘서 이벤트를 위임???하는 것임... 대박
		$('body').on('click','#btnSelect',function(){
			// var userId = $(this).closest('tr').find('#hidden_userId').val(); // closest : 조상에서만 찾음.
			// var userId = $(this).parent().parent().data('userId');
			var userId = $(this).closest('tr').data('userid'); // 나를 기준으로 가장 가까운 tr에서 userid 키의 데이터를 찾아와라.
			//특정 사용자 조회
			$.ajax({
				url:'users/'+userId,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:userSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect
	
	//사용자 조회 응답
	function userSelectResult(user) {
		$('input:text[name="id"]').val(user.id);
		$('input:text[name="name"]').val(user.name);
		$('input:text[name="password"]').val(user.password);
		$('select[name="role"]').val(user.role).attr("selected", "selected");
	}//userSelectResult
	
	//사용자 수정 요청
	function userUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click',function(){
			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var password = $('input:text[name="password"]').val();
			var role = $('select[name="role"]').val();		
			$.ajax({ 
			    url: "users", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data: JSON.stringify({ id: id, name:name,password: password, role: role }),
			    contentType: 'application/json',
			    success: function(data) { 
			        userList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	//사용자 등록 요청
	function userInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			$("#form1")
/* 			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var passsword = $('input:text[name="password"]').val();
			var role = $('select[name="role"]').val(); */		
			$.ajax({ 
			    url: "users",  
			    type: 'POST',  
			    dataType: 'json', // responseType이 json이라는 것을 의미?
			    //data: JSON.stringify({ id: id, name:name,password: password, role: role }),
			    data : JSON.stringify($("#form1").serializeObject()), // form에서 넘어온 데이터를 json 형식으로 바꿔준다.
			    contentType: 'application/json', // requestType이 json이라는 것을 의미.
			    success: function(response) {
			    	if(response.result == true) {
			    		userList();
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert
	
	//사용자 목록 조회 요청
	function userList() {
		$.ajax({
			url:'users',
			type:'GET',
			//contentType:'application/json;charset=utf-8', // GET방식에서는 contentType 쓰지 않는다.
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:userListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function userListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){ // for(i=0; i<data.length; i++) for문 돌리는 것과 같음. 반복문.
			$('<tr data-userId="' + item.id + '">') // 데이터속성: data() 사용법 찾아보기  
			.append($('<td>').html(item.id))
			.append($('<td>').html(item.name))
			.append($('<td>').html(item.password))
			.append($('<td>').html(item.role))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
 			// .append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
			.appendTo('tbody');
		});//each
	}//userListResult
</script>



<%@ include file="/WEB-INF/views/includes/footer.jsp"%>