<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 - BTS</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div class="wrapper">
		<div class="headLine">
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
			<a href="#">이전</a>
			<a class="pageActive" href="#">1</a>
			<a href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#">6</a>
			<a href="#">다음</a>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>