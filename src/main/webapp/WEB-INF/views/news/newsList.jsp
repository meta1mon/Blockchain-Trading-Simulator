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
		<input type="text" name="keyword"> 
		<input type="submit" value="검색">
		<div class="headLine">
			<marquee>
				<ul class="headList">
					<!-- newsList.js의 newsAPI 함수 참조  -->
				</ul>
			</marquee>
		</div>
	</div>
	
	<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>