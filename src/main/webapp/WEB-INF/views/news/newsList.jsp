<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<input type="text" name="keyword"> 
		<input type="submit" value="검색">
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
			<a href="#">이전</a>
			<a class="pageActive" href="#">1</a>
			<a class="inactive" href="#">2</a>
			<a class="inactive" href="#">3</a>
			<a class="inactive" href="#">4</a>
			<a class="inactive" href="#">5</a>
			<a class="inactive" href="#">6</a>
			<a href="#">다음</a>
		</div>
	</div>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>