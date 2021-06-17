<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 - BTS</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/newsList.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div class="wrapper">
		<div class="newsSearch">
			<input type="text" id="search" placeholder="검색어를 입력해주세요" maxlength="40"> 
			<input type="submit" id="searchBtn" value="검색">
		</div>
		<div class="headLine">
			<marquee class="scroll" onmouseover="this.stop();" onmouseout="this.start();">
				<!-- newsList.js의 newsHeadLine() 함수 참조 -->
			</marquee>
		</div>
		<div class="newsList" id="raw1">
			<!-- newsList.js의 newsList() 함수 참조 -->
		</div>
		<div class="newsList" id="raw2">
			<!-- newsList.js의 newsList() 함수 참조 -->
		</div>
		<div class="newsPage">
<!-- 			<button class="pageBtn" id="pageBefore">이전</button> -->
<!-- 			<a class="pageActive">1</a> -->
<!-- 			<a class="inactive">2</a> -->
<!-- 			<a class="inactive" >3</a> -->
<!-- 			<a class="inactive">4</a> -->
<!-- 			<a class="inactive">5</a> -->
<!-- 			<button class="pageBtn" id="pageNext">다음</button> -->
		</div>
	</div>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>