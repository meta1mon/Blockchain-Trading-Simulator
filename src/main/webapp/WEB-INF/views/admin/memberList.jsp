<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet" type="text/css" />
<style>
#mmm th, td {
	padding: 5px;
}

#mmm td:not(.del){
	text-align: left;
}

#mmm{
	position: absolute;
	top: calc(50% - 150px);
	left: calc(50% - 312.5px);
}

#page{
	text-align: center;
}

#listForm{
	width: 100%;
}

.X {
	border: none;
	outline: none;
	background-none;
}

.del{
	text-align:center;
}
.del:hover{
color: red;
}
</style>
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
<title>관리자 페이지 - BTS</title>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="mmm">
		<div>
			<table border="1">
				<tr>
					<td colspan="8">
						<div>
							<form name="listForm" action="ml" method="get" id="listForm">
								<select name="searchType">
									<option value="1">이메일</option>
									<option value="2">닉네임</option>
								</select> <input type="search" name="keyword" id="search" placeholder="검색어를 입력해주세요.">
								<button type="submit" id="btnsearch">검색</button>
							</form>
						</div>
					</td>
				</tr>
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
							<td>${vo.gender}</td>
							<td>${vo.birthdate}</td>
							<td><fmt:formatNumber value="${vo.cybcash}"
									pattern="#,###,###,###" /></td>
							<td>코인 평가 금액</td>
							<td>자산 총액</td>
							<td class="del"><input type="button" class="fas fa-trash-alt"
								onclick="deleteMember('${vo.email}')" class="X"></td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td colspan="8">
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
</body>
</html>