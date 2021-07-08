<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>BTS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/myNav.css"	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 

<jsp:include page="../main/header.jsp"></jsp:include>
<nav>
	<div id="myM">
		<h2>마이 페이지</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath}/mypage/mi">나의 정보</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/mpu">비밀번호 변경</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/mee">나의 자산</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/myClist">나의 커뮤니티</a></li>

<!--  			
			<li><a href="${pageContext.request.contextPath}/mypage/myRlist">나의
					댓글</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/mcl">충전
					내역</a></li>
-->					
					
		</ul>
	</div>
</nav>
<jsp:include page="../main/footer.jsp"></jsp:include> 