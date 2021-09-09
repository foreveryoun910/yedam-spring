<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<input type="file" name="uploadFile" multiple="multiple">
		
		<!-- String 타입은 넣고, file은 검사 후 넣기 -->
		<form name="frm">
			<label>작성자</label><input type="text" name="writer">
			<label>내용</label><input type="text" name="content">
		</form>
	</div>
	<button id="uploadBtn">upload</button>
	
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    
    <script>
    	$(function(){
    		
    		// 정규표현식 RegExp, /w3schools/i; i를 붙이면 대소문자 관계없이 검색된다.
    		// 확장자 제한, 파일사이즈 제한
    		
    		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    		var maxSize = 5242880; //5MB

    		function checkExtension(fileName, fileSize) {

    			if (fileSize >= maxSize) {
    				alert("파일 사이즈 초과");
    				return false;
    			}

    			if (regex.test(fileName)) {
    				alert("해당 종류의 파일은 업로드할 수 없습니다.");
    				return false;
    			}
    			return true;
    		}    		
    		
    		
    		
    		
    		
    		
    		$('#uploadBtn').on('click', function(){
    			
    			var formData = new FormData(document.frm);
     			var inputFile = $('input[name="uploadFile"]');
    			var files = inputFile[0].files;
    			
    			console.log(files);
    			
    			// add File Data to formData
    			for(var i=0; i<files.length; i++){
    			
    				if( !checkExtension(files[i].name, files[i].size) ){
    					return;
    				}
	    			formData.append('uploadFile', files[i]);
    			}
    			
    			
    			// formData(첨부파일) 넘겨줄 때 넣어야 하는 것(필수) -> processData, contentType
    			$.ajax({
    				url: 'uploadAjaxAction',
    				processData: false,
    				contentType: false,
    				data: formData,
    				type: 'post',
    				success: function(result){
    					alert('Uploaded');
    				}
    			}); // ajax end
    			
    		});
    	});
    </script>
</body>
</html>