<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">입력 폼</h1>
	</div>
	
	<!-- 수업: ajax 없음 / 책: ajax 있음 -->
	<div class="panel-heading">Board Register</div>
		<div class="panel-body">
			<form action="register" id="frm" method="post">
				<div class="form-group">
					<label>제목</label><input class="form-control" id="title" name="title">
				</div>
				<div class="form-group">
					<label>내용</label><textarea class="form-control" id="content" name="content" rows="3"></textarea>
				</div>
				<div class="form-group">
					<label>작성자</label><input class="form-control" id="writer" name="writer">
				</div>
				
				<div align="center">		
					<button type="button" id="btnRegister" class="btn btn-success">입력</button>&nbsp;
					<button class="btn btn-success" type="reset">취소</button>
				</div>
			</form>

			<div class="form-group">
				<label>첨부파일</label><input type="file" name="uploadFile" multiple="multiple"><br>
				<button type="button" id="uploadBtn" class="btn btn-primary">파일 등록</button>
				<ul id="uploaded"></ul> <!-- 미리보기 -->
			</div>
		</div>
	</div>
	
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
    				url: '../uploadAjaxAction',
    				processData: false,
    				contentType: false,
    				data: formData,
    				type: 'post',
    				success: function(datas){
    					var str = "";
    					for(i=0; i<datas.length; i++){
    						var obj = datas[i];
    						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
    					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
    					      
    						str += "<li "
    						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
    						str += "<span> "+ obj.fileName+"</span>";
    						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
    						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
    						str += "<img src='../resources/img/attach.png'></a>";
    						str += "</div>";
    						str +  "</li>";
    						
    					}
    					$('#uploaded').html(str);
    					
    					alert('Uploaded');
    				}
    			}); // ajax end
    			
    		}); // uploadBtn 클릭 함수 end
    		
    		
    		
    		
    		// 등록버튼 이벤트 p.564
    		$('#btnRegister').on('click', function(e){
    			e.preventDefault();
    			
    			var str = "";
    			$('#uploaded li').each(function(idx, obj){
    				var jobj = $(obj); // jQuery 객체로 바꾸기
    			      str += "<input type='hidden' name='attachList["+ idx +"].fileName' value='"+jobj.data("filename")+"'>";
    			      str += "<input type='hidden' name='attachList["+ idx +"].uuid' value='"+jobj.data("uuid")+"'>";
    			      str += "<input type='hidden' name='attachList["+ idx +"].uploadPath' value='"+jobj.data("path")+"'>";
    			      str += "<input type='hidden' name='attachList["+ idx +"].fileType' value=1>"; // '"+ jobj.data("type")+"' // 원래는 컨트롤러에서 이미지면 fileType = 1, 아니면 = 0으로 넘겨줘야 한다.
    			});
    			
    			$('#frm').append(str).submit();
    			
    		});
    		
    		
    	});
    </script>	

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>