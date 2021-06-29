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
	top: calc(50% - 350px);
	left: calc(50% - 442.5px);
	width: 1085px;
}


#cll th, td {
	padding: 5px !important;
}

#cll td:not(.center, .right) {
	text-align: left;
}

/*공통*/
#page{
	text-align: center;
}

.page {
	position: fixed;
	top: 603.5px;
}
.page td {
	width: 1085px;
}

table{
	width: 100%;
}

#listForm{
	float:right;
}

.title{
	font-size: 25px;
	color: #fcc000;
}

.inbl{
	display: inline-block;
}

</style>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="cll">
	<p class="title inbl">충전 내역</p>
	<form name="listForm" action="cll" method="get" id="listForm">
		<input type="search" name="keyword" id="search"	placeholder="검색어를 입력해주세요.">
		<button type="submit" id="btnsearch">검색</button>
	</form>
	<hr>
		<table>
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
						<td class="right money"><fmt:formatNumber value="${vo.sellprice}"
								pattern="#,###,###,###" /></td>
						<td class="right money"><fmt:formatNumber value="${vo.won}"
								pattern="#,###,###,###" /></td>
						<td class="right">${vo.cashdate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr class="page">
				<td colspan="4">
					<div id="page">
						<!-- 앞 페이지 번호 처리 -->
						<c:if test="${currentPage <= 1}">
						<i class="fas fa-angle-double-left"></i>
							</c:if>
						<c:if test="${currentPage > 1}">
							<c:url var="cllistST" value="cll">
								<c:param name="page" value="${currentPage-1}" />
							</c:url>
							<a href="${cllistST}"><i class="fas fa-angle-double-left"></i></a>
						</c:if>
						<!-- 끝 페이지 번호 처리 -->
						<c:set var="endPage" value="${maxPage}" />
						<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
								<c:if test="${p eq currentPage}">
									<div class="pageNum"><b>${p}</b></div>
								</c:if>
							<c:if test="${p ne currentPage}">
								<c:url var="cllistchk" value="cll">
									<c:param name="page" value="${p}" />
								</c:url>
								<a href="${cllistchk}">${p}</a>
							</c:if>
						</c:forEach>
						<c:if test="${currentPage >= maxPage}">
							<i class="fas fa-angle-double-right"></i>
							</c:if>
						<c:if test="${currentPage < maxPage}">
							<c:url var="cllistEND" value="cll">
								<c:param name="page" value="${currentPage+1}" />
							</c:url>
							<a href="${cllistEND}"><i class="fas fa-angle-double-right"></i></a>
						</c:if>
					</div>
				</td>
		</table>
	</div>
	<script>
		$(function(){
			console.log("시도");
			$(".money").append("원");
		})	
	</script>
</body>
</html>