<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<style>
#mcl {
	width: 65%;
	min-width: 1024px;
	text-align: center;
	height: 50%;
	padding: 20px;
	margin: 25px auto;
	background-color: #fff;
    border: 1.5px solid #E3C8F8;
	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%);
}

#mcl table {
	margin: 0 auto;	
}
</style>
</head>
<body>
	<div id="wrapper">
	<jsp:include page="myNav.jsp"></jsp:include>
		<div id="mcl">
			<table>
				<tr>
					<th>결제일시</th>
					<th>결제금액</th>
					<th>충전금액</th>
				</tr>
 			<c:if test="${listCount eq 0}">
				<tr>
					<td colspan="3">
						표시할 충전 내역이 없습니다.
					</td>
			</c:if>
			<c:if test="${listCount ne 0}">
				<c:forEach var="cashLog" items="${list}" varStatus="status">
				<tr>
					<td>${cashLog.cashdate}</td>
					<td><fmt:formatNumber value="${cashLog.sellprice}" pattern="#,###,###,###" /></td>
					<td><fmt:formatNumber value="${cashLog.won}" pattern="#,###,###,###" /></td>
				</tr>
				</c:forEach>
			</c:if>
			</table>
		</div>
	</div>
</body>
</html>