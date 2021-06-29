<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/newsContent.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="container">
			<input type="hidden" id="news_id" value="${news_id }">
			<div class="contentWrapper">
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
		</div>
		<div id="space">
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/newsContent.js"></script>
</body>
</html>