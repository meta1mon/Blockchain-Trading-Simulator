<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/newsList.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
<!-- 		<div id="container"> -->
			<div id="newsList">
				<div class="newsSearch">
					<input type="text" id="search" placeholder="검색어를 입력해주세요" maxlength="40" value="${keyword}"> 
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
<!-- 		</div> -->
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
</body>
</html>