<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/adminmain.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin.js" type="text/javascript"></script>
</head>
<%@include file="headerAndAside.jsp"%> 
<body class="adminContent">
	<div>
		<ul id="mm">
			<li><p>
					<span class="fas fa-chevron-left"></span>전체 가상 투자금<span class="fas fa-chevron-right"></span>
				</p>
				<div class="img fas fa-coins"></div>
				<p class="center money"><fmt:formatNumber value="${totalCybcash}"
								pattern="#,###,###,###" /></p></li>
			<li><p>
					<span class="fas fa-chevron-left"></span>미처리 신고 건수<span class="fas fa-chevron-right"></span>
				</p>
				<div class="img fas fa-folder-open"></div>
				<p>
				<table style="width: 100%">
				<tr>
				
				<td class="left sub"><a href="${pageContext.request.contextPath}/admin/cr">게시글</a></td>
				<td class="right report"><a href="${pageContext.request.contextPath}/admin/cr">${countCreport}</a></td>
				</tr>
				<tr>
				<td class="left sub"><a href="${pageContext.request.contextPath}/admin/rr">댓글</a></td>
				<td class="right report"><a href="${pageContext.request.contextPath}/admin/rr">${countRreport}</a></td>
				</tr>
				</table>
			<li><p>
					<span class="fas fa-chevron-left"></span><a href="${pageContext.request.contextPath}/admin/cll">신규 충전액</a><span class="fas fa-chevron-right"></span>
				</p>
				<div class="img far fa-credit-card"></div>
				<p class="center money"><a href="${pageContext.request.contextPath}/admin/cll"><fmt:formatNumber value="${countTodayWon}"
								pattern="#,###,###,###" /></a></p></li>
		</ul>
	</div>
</body>
</html>