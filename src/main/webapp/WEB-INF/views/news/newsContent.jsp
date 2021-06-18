<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 - BTS</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/newsContent.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div class="wrapper">
		<div id="newsContent">
			<!-- newsContent.js의 newsContent() 함수 참조 -->
			<div class="title">
			</div>
			<div class="byline_pubdate">
			</div>
			<div class="split_line">
			</div>
			<div class="content">
			</div>
			<p class="copyright">Copyright © 뉴스1, 무단전재 및 재배포 금지</p>
		</div>
	</div>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/newsContent.js"></script>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>