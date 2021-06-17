<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<header>
<div class="behindheader"></div><br>
	<div class="header">
	<div class="h_left">
		<ul>
			<li class="menu"><a href="${pageContext.request.contextPath}/investmentpage">모의투자</a></li>
			<li class="menu"><a href="${pageContext.request.contextPath}/ranking">랭킹</a></li>
		</ul>
	</div>
	<div class="h_right">
		<c:choose>
			<c:when test="${loginMember == null }">
				<ul>
					<li class="member"><a href="<%=request.getContextPath()%>/signup" id="signup">회원가입</a></li>				</ul>
			</c:when>
			<c:when test="${loginMember != null }">
				<ul>
					<li class="member"><a href="#">마이페이지</a></li>				</ul>
			</c:when>
		</c:choose>
	</div>
</div>
</header>
