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
	<div id="wrapper">
		<div id="mm">
		<div class="border">
			<table class="main">
				<tr>
					<td>
						<span class="text25">전체 가상 투자금</span>
					</td>
				</tr>
				<tr>
					<td>
						<span class="img fas fa-coins"></span>
						<span class="money text text50">
						<fmt:formatNumber value="${totalCybcash}" pattern="#,###,###,###" /></span>
					</td>
				</tr>
				</table>
		</div>
		<div class="border">
				<table class="main">
				<tr>
					<td>
						<span class="text25">미처리 신고 건수</span>
					</td>
				</tr>
				<tr>
					<td>
						<span class="img fas fa-folder folder"></span>
						<span class="img fas fa-folder-open folder"></span>
							<table style="display: inline-block" class="text sub">
								<tr>
									<td>
										<a href="${pageContext.request.contextPath}/admin/cr">게시글</a>
									</td>
								<td class="report">
									<a href="${pageContext.request.contextPath}/admin/cr">${countCreport}</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="${pageContext.request.contextPath}/admin/rr">댓글</a>
								</td>
								<td class="report">
									<a href="${pageContext.request.contextPath}/admin/rr">${countRreport}</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				</table>
		</div>
		<div class="border">
				<table class="main">
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/admin/cll"><span class="text25">신규 충전액</span></a>
					</td>
				</tr>
				<tr>
				<td>
				<span class="img far fa-credit-card"></span>
				<span class="money text text50"><a href="${pageContext.request.contextPath}/admin/cll"><fmt:formatNumber value="${countTodayWon}"
								pattern="#,###,###,###" /></a></span>
				</td>
				</tr>
			</table>
		</div>
		</div>
	</div>
	<script>
	$(function(){
			if($(".folder").has($(".fa-folder"))){
					$(".folder").on("dblclick", function(){
						$(".fa-folder").toggle();
						$(".fa-folder-open").toggle();
					})
				}
			})
	</script>
</body>
</html>