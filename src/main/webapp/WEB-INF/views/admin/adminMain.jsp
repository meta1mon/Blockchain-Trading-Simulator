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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
#mm li:not(.sub) {
	float: left;
	list-style-type: none;
	margin: 15px;
	color: black;
	width: 140px;
	height: 167px;
	text-align: center;
	border: 5px solid #ffc000;
	border-radius: 15px;
    padding-top: 39px;
    padding-left: 39px;
    padding-right: 39px;	
}

.sub{
	text-align:left;
	list-style-type: none;
}

#mm .img {
	width: 80px;
	height: 80px;
	padding: 5px;
}

#mm {
	position: absolute;
	top: calc(50% - 150px);
	left: calc(50% - 246px);
}

.fa-chevron-left, .fa-chevron-right {
	color: #ffc000;
}

.report a:hover, .money a:hover {
	color: red;
	font-weight: bold;
}
</style>
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
	<script>
		$(function(){
			$(".money").append("원");
			$(".report").append("건");
		})	
	</script>
</body>
</html>