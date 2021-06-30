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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#cashR {
	position: absolute;
	top: calc(50% - 350px);
	left: calc(50% - 442.5px);
	width: 1085px;
}

#cashR table {
	width: 100%;
}

#cashR th, td {
	padding: 5px !important;
}

.title{
	font-size: 25px;
	color: #fcc000;
}

input{
	width: calc(100% - 30px);
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

</style>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="cashR">
		<p class="title">충전 상품 관리</p>
		<hr>
		<div>
			<form action="${pageContext.request.contextPath}/admin/cashRegister"
				method="post">
				<table>
					<tr>
						<td class="center">충전금</td>
						<td class="center">판매가</td>
						<td class="center">할인률</td>
						<td class="center">이벤트 시작일자</td>
						<td class="center">이벤트 종료일자</td>
						<td colspan="2" class="center">&nbsp;</td>
					</tr>
					<c:if test="${listCount eq 0}">
						<tr>
							<td colspan="7" class="center">조회된 상품이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${listCount ne 0}">
						<c:forEach var="vo" items="${list}" varStatus="status">
							<tr>
								<td class="right money"><fmt:formatNumber value="${vo.won}"
										pattern="#,###,###,###" /></td>
								<td class="right money"><fmt:formatNumber
										value="${vo.price}" pattern="#,###,###,###" /></td>
								<td class="center percent">${vo.discountrate}</td>
								<td class="center">${vo.startdate}</td>
								<td class="center">${vo.enddate}</td>
								<td class="center edit">
								<button	type="button">수정</button></td>
								<td class="center del">
								<button	type="button">삭제</button></td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 페이징 -->
					<tr class="page">
						<td colspan="7">
							<div id="page">
								<!-- 앞 페이지 번호 처리 -->
								<c:if test="${currentPage <= 1}">
									<i class="fas fa-angle-double-left"></i>
								</c:if>
								<c:if test="${currentPage > 1}">
									<c:url var="cashlistST" value="cll">
										<c:param name="page" value="${currentPage-1}" />
									</c:url>
									<a href="${cashlistST}"><i class="fas fa-angle-double-left"></i></a>
								</c:if>
								<!-- 끝 페이지 번호 처리 -->
								<c:set var="endPage" value="${maxPage}" />
								<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
									<c:if test="${p eq currentPage}">
										<div class="pageNum">
											<b>${p}</b>
										</div>
									</c:if>
									<c:if test="${p ne currentPage}">
										<c:url var="cashlistchk" value="cll">
											<c:param name="page" value="${p}" />
										</c:url>
										<a href="${cashlistchk}">${p}</a>
									</c:if>
								</c:forEach>
								<c:if test="${currentPage >= maxPage}">
									<i class="fas fa-angle-double-right"></i>
								</c:if>
								<c:if test="${currentPage < maxPage}">
									<c:url var="cashlistEND" value="cll">
										<c:param name="page" value="${currentPage+1}" />
									</c:url>
									<a href="${cashlistEND}"><i class="fas fa-angle-double-right"></i></a>
								</c:if>
							</div>
						</td>
					</tr>

					<!-- 충전상품 등록 부분 -->
					<tr>
						<td class="right">
						<input type="number" min="0" name="won" class="right"><span>원</span>
						</td>
						<td class="right"><input type="number" min="0" name="price" class="right"><span>원</span></td>
						<td class="center"><input type="number" min="0" max="100" name="discountrate" class="right"><span>%</span></td>
						<td class="right"><input type="date" name="startdate"></td>
						<td class="right"><input type="date" name="enddate" min=""></td>
						<td colspan="2" class="center"><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
		$(function(){
			$(".money").append("원");
			$(".percent").append("%");
			
			var setMinDate = function(){
				var startdate = $("input[name=startdate]").val();
				console.log(startdate);
				if(startdate != null && startdate != undefined && startdate != ""){
					console.log("설정합니다.");
					$("input[name=enddate]").attr("min", startdate);
				}
			}
			$("input[name=startdate]").on("change", setMinDate);
		})	
	</script>
</body>
</html>