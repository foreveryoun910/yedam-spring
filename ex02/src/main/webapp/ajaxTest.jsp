<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	
	<script>
		// $(function(){}) <- 자체가 body 한 번 훑고 온다는 의미.
		$(function(){
			$('#btn1').on('click', function(){
				$.ajax({
					url: 'ajax1',
					// async: false, // 동기식으로 변경 ( ajax: 원래 비동기 )
					method: 'GET',
					data: { writer : $('#writer').val() },
					dataType: 'json', // text=plain, json, xml
					success: function(data){ // Controller에서의 return값이 function의 파라미터로 들어간다.
						$('#result').append(data.writer + '<br>');
						$('#result').append(data.content + '<br>');
					}
				});	
				
				// 비동기식: 먼저 처리 끝나는 것부터 출력함. ( 순서대로x )
				$('#result').append('클릭됨<br>');
				
			}); // btn1 click end
			
			$('#btn2').on('click', function(){
				$.ajax({
					url: 'ajax2',
					method: 'post',
					data: JSON.stringify({ writer : $('#writer').val() }),
					contentType: 'application/json', // stringify를 쓰면 application/json 반드시.
					success: function(data){ // Controller에서의 return값이 function의 파라미터로 들어간다.
						// $('#result').append($('<p>').html(data.content).append('<br>').append(data.writer));
 						$('#result').append($(`<p>\${data.writer}<br>\${data.content}</p>`)); // el표현식이랑 백틱 사용 때문에 쓰는$()랑 구분이 안 되니까 \를 넣어줘서 구분한다.
 						// $('#result').append('<p>' + {data.content} + '</p>');
						// $('#result').append(data.content + '<br>');
					}
				}); // ajax end
			}); // btn2 click end
			
			// @RequestBody으로 인해 JSON으로 오는 데이터를 stringify로 String으로 만들어주는 중.
			
			
			// 제이쿼리 그룹이벤트 -> 동적으로 추가될 태그에도 미리 이벤트 지정
			// 부모 태그에 이벤트 지정 (꼭 바로 위 부모태그 아니어도 위쪽에 있으면 됨, body에 거는 것도 가능.)
			$('#result').on('click', 'p', function(){
				$(this).remove();
			});
			
		});
	</script>
<!-- 			
			차이점

			$('#btn1').on('click', function(){});
				=btn1.addEventListener('click', function(){})
				=버튼에 클릭이벤트 여러 개 추가 가능.


			$('#btn1').click(function(){});
				=btn1.click = function(){} 
				=버튼에 클릭이벤트가 하나만 걸린다.
				=여러 개 주면 속성이 바뀌는 것.

 -->

	
</head>
<body>
	<input id="writer" name="writer">
	<button type="button" id="btn1">문자열</button>
	<button type="button" id="btn2">파라미터(JSON)</button>
	
	<div id="result"></div>


</body>
</html>