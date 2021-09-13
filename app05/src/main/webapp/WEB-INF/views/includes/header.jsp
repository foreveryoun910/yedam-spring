<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>app05</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>

	<style>
		#wrapper {
			background-color: yellow;
			min-height: 150px;
			margin-top: auto;
			margin-bottom: auto;
			vertical-align: center;
		}
		
		#menu {
			background-color: skyblue;
			height: 30px;
			vertical-align: center;
		}
	</style>

</head>

<body>

    <div class="container-fluid" id="wrapper">
    	<div align="center" style="vertical-align: center;">
    		<span>도서대여관리</span>
    	</div>
    </div>
    <div>
        <div id="menu">
    		<span><a href="${pageContext.request.contextPath}/book/insertBook">도서등록</a></span>
    		<span><a href="${pageContext.request.contextPath}/book/bookList">도서목록조회</a></span>
    		<span><a href="${pageContext.request.contextPath}/book/readRentalBook">대여현황조회</a></span>
    		<span><a href="${pageContext.request.contextPath}">홈으로</a></span>
    	</div>
    </div>
    <br>
    <br>

            