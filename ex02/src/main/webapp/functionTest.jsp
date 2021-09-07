<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	(function print(a){
		console.log("즉시실행" + a);
	})(5);
	
	// print(3);
	
	
	// 즉시실행함수
	var replyService = (function(){
		
		function add(reply, callback, error){ 
			$.ajax({
				url: '../reply/',
				data: $('#replyForm').serialize(),
				method: 'POST',
				dataType: 'json',
				success: function(data){
					if(callback) callback(data);
				},
				error: function(){
					if(error) error();
				}
			});
		}
		
		function b(){console.log(b);}
		
		function c(){console.log(c);}
		
		return {a:a, b:b, c:c}
		
	})();
	
	
</script>
</body>
</html>