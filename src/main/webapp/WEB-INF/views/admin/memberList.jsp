<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#mmm th, td {
	padding: 5px !important;
}

#mmm td:not(.center, .right){
	text-align: left;
}

#mmm{
	position: absolute;
	top: calc(50% - 350px);
	left: calc(50% - 442.5px);
	width: 1085px;
}
.X {
	border: none;
	outline: none;
	background-none;
}

.del:hover{
	color: red;
}

/* 공통 */
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

#listForm{
	 float:right;
}

table{
	width: 100%;
}

.title{
	font-size: 25px;
	color: #fcc000;
}
.inbl{
	display: inline-block;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="mmm">
	<p class="title inbl">회원 목록</p>
	<form name="listForm" action="ml" method="get" id="listForm">
		<select name="searchType">
			<option value="1">이메일</option>
			<option value="2">닉네임</option>
		</select> <input type="search" name="keyword" id="search" placeholder="검색어를 입력해주세요.">
		<button type="submit" id="btnsearch">검색</button>
	</form>
	<hr>
		<div>
			<table>
				<tr>
					<th>이메일</th>
					<th>닉네임</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>현금 보유액</th>
					<th>코인 평가 금액</th>
					<th>자산총액</th>
					<th>회원 탈퇴</th>
				</tr>
				<c:if test="${listCount eq 0}">
					<tr>
						<td colspan="8" align="center">조회된 회원이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${listCount ne 0}">
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr>
							<td>${vo.email}</td>
							<td>${vo.nickname}</td>
							<td class="center">${vo.gender}</td>
							<td class="center">${vo.birthdate}</td>
							<td class="right money"><fmt:formatNumber value="${vo.cybcash}"
									pattern="#,###,###,###" /></td>
							<td>코인 평가 금액</td>
							<td>자산 총액</td>
							<td class="center del"><input type="button" class="fas fa-trash-alt"
								onclick="deleteMember('${vo.email}')" class="X"></td>
						</tr>
					</c:forEach>
				</c:if>
				<tr class="page">
					<td colspan="8" class="center">
						<div id="page">
							<!-- 앞 페이지 번호 처리 -->
							<c:if test="${currentPage <= 1}">
							<i class="fas fa-angle-double-left"></i>
							</c:if>
							<c:if test="${currentPage > 1}">
								<c:url var="mlistST" value="ml">
									<c:param name="page" value="${currentPage-1}"/>
								</c:url>
								<a href="${mlistST}"><i class="fas fa-angle-double-left"></i></a>
							</c:if>
							<!-- 끝 페이지 번호 처리 -->
							<c:set var="endPage" value="${maxPage}" />
							<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
								<c:if test="${p eq currentPage}">
									<div class="pageNum"><b>${p}</b></div>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="mlistchk" value="ml">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${mlistchk}">${p}</a>
								</c:if>
							</c:forEach>
							<c:if test="${currentPage >= maxPage}">
								<i class="fas fa-angle-double-right"></i>
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="clistEND" value="cl">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${clistEND}"><i class="fas fa-angle-double-right"></i></a>
							</c:if>
						</div>
					</td>
			</table>

		</div>
	</div>
	<script>
		function deleteMember(email){
				$.ajax({
					url: "md",
					type: "post",
					dataType: "json",
					data: {"email": email},
					success: function(data){
						console.log(data);
						alert("선택한 회원을 탈퇴시켰습니다." + data);
						location.href="ml";
					},
					
			error : function(request, error) {
				console.log("message:" + request.responseText + " n" + "error:" + error);
								}
							})
		}
	</script>
		<script>
		$(function(){
			console.log("시도");
			$(".money").append("원");
		})	
	</script>
</body>
</html>