<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="text" id="pass" name="pass">
	<button type="button" id="btnCheck">확인</button>




<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

<script>
	// var passRule = /^[A-Za-z0-9]{6,12}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
	var passRule = /^[0-9]{6}-[0-9]{7}$/; // 주민번호 형식.. 와..
	
	$('#btnCheck').on('click', function(){
		
		if(!passRule.test($("input[id='pass']").val())) {
		    //경고
		 	alert("error");
		    return false;
		}
	});
	

	
// 출처: https://epthffh.tistory.com/entry/비밀번호-정규식 [물고기 개발자의 블로그]
</script>
</body>
</html>