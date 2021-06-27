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
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(function() {
	$('form[name=listForm]').on('submit',function(e) {
		if ($('input[name=keyword]').val() == null || $('input[name=keyword]').val() == "") {
			e.preventDefault();
		} else {
			return true;
		}
	});
});
</script>
<style>
#cll{
	position: absolute;
	top: calc(50% - 150px);
	left: calc(50% - 100px);
}

#cll th, td {
	padding: 5px;
}

#mmm td {
	text-align: left;
}
#page{
	text-align: center;
}
#listForm{
	width: 100%;
}
</style>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="cll">
		<table>
			<tr>
				<td colspan="8">
					<div>
						<form name="listForm" action="cll" method="get" id="listForm">
							<input type="search" name="keyword" id="search"	placeholder="검색어를 입력해주세요.">
							<button type="submit" id="btnsearch">검색</button>
						</form>
					</div>
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<th>결제액</th>
				<th>충전액</th>
				<th>결제 일시</th>
			</tr>
			<c:if test="${listCount eq 0}">
				<tr>
					<td colspan="8" align="center">조회된 기록이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${listCount ne 0}">
				<c:forEach var="vo" items="${list}" varStatus="status">
					<tr>
						<td>${vo.nickname}</td>
						<td><fmt:formatNumber value="${vo.sellprice}"
								pattern="#,###,###,###" /></td>
						<td><fmt:formatNumber value="${vo.won}"
								pattern="#,###,###,###" /></td>
						<td>${vo.cashdate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="4">
					<div id="page">
						<!-- 앞 페이지 번호 처리 -->
						<c:if test="${currentPage <= 1}">
								[이전]
							</c:if>
						<c:if test="${currentPage > 1}">
							<c:url var="clistST" value="clist">
								<c:param name="page" value="${currentPage-1}" />
							</c:url>
							<a href="${clistST}">[이전]</a>
						</c:if>
						<!-- 끝 페이지 번호 처리 -->
						<c:set var="endPage" value="${maxPage}" />
						<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
							<c:if test="${p eq currentPage}">
								<font color="#8C66C8" size="4"><b>[${p}]</b></font>
							</c:if>
							<c:if test="${p ne currentPage}">
								<c:url var="clistchk" value="clist">
									<c:param name="page" value="${p}" />
								</c:url>
								<a href="${clistchk}">${p}</a>
							</c:if>
						</c:forEach>
						<c:if test="${currentPage >= maxPage}">
								[다음]
							</c:if>
						<c:if test="${currentPage < maxPage}">
							<c:url var="clistEND" value="clist">
								<c:param name="page" value="${currentPage+1}" />
							</c:url>
							<a href="${clistEND}">[다음]</a>
						</c:if>
					</div>
				</td>
		</table>
	</div>
</body>
</html>