<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminml.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
<div id="wrapper">
	<div id="mmm">
	<p class="title inbl"><a href="/bts/admin/ml">회원 관리</a></p>
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
					<th>계좌 번호</th>
					<th>현금 보유액</th>
					<th>코인 평가 금액</th>
					<th>자산 총액</th>
					<th>회원 탈퇴</th>
				</tr>
				<c:if test="${listCount eq 0}">
					<tr>
						<td colspan="8" class="center">조회된 회원이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${listCount ne 0}">
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr>
							<td>${vo.email}</td>
							<td>${vo.nickname}</td>
							<td class="center">${vo.gender}</td>
							<td class="center">${vo.birthdate}</td>
							<td class="center">${vo.acntno}</td>
							<td class="right money">
							<fmt:formatNumber value="${vo.cybcash}" pattern="#,###,###,###" /></td>
							<td class="right money"><fmt:formatNumber value="${vo.newesset - vo.cybcash}" pattern="#,###,###,###" /></td>
							<td class="right money"><fmt:formatNumber value="${vo.newesset}" pattern="#,###,###,###" /></td>
							<td class="center del"><input type="image" 
								src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik00MDcuNjcyLDI4MC41OTZjLTIxLjY5MS0xNS41ODctNDUuMzA2LTI3LjU4NC03MC4xODItMzUuNzc4QzM3MC41NjUsMjE5Ljk4NiwzOTIsMTgwLjQ0OSwzOTIsMTM2DQoJCQlDMzkyLDYxLjAxLDMzMC45OTEsMCwyNTYsMFMxMjAsNjEuMDEsMTIwLDEzNmMwLDQ0LjUwNCwyMS40ODgsODQuMDg0LDU0LjYzMywxMDguOTExYy0zMC4zNjgsOS45OTgtNTguODYzLDI1LjU1NS04My44MDMsNDYuMDY5DQoJCQljLTQ1LjczMiwzNy42MTctNzcuNTI5LDkwLjA4Ni04OS41MzIsMTQ3Ljc0M2MtMy43NjIsMTguMDY2LDAuNzQ1LDM2LjYyMiwxMi4zNjMsNTAuOTA4QzI1LjIyMiw1MDMuODQ3LDQyLjM2NSw1MTIsNjAuNjkzLDUxMg0KCQkJSDI2N2MxMS4wNDYsMCwyMC04Ljk1NCwyMC0yMGMwLTExLjA0Ni04Ljk1NC0yMC0yMC0yMEg2MC42OTNjLTguNTM4LDAtMTMuNjg5LTQuNzY2LTE1Ljk5OS03LjYwNg0KCQkJYy0zLjk4OS00LjkwNS01LjUzMy0xMS4yOS00LjIzNi0xNy41MTljMjAuNzU2LTk5LjY5NSwxMDguNjkxLTE3Mi41MjEsMjEwLjI0LTE3NC45NzdjMS43NTksMC4wNjgsMy41MjYsMC4xMDIsNS4zMDIsMC4xMDINCgkJCWMxLjc4OCwwLDMuNTY5LTAuMDM1LDUuMzQxLTAuMTA0YzQ0LjQ2NiwxLjA1Miw4Ni44ODMsMTUuMjM2LDEyMi45ODgsNDEuMTgyYzguOTY5LDYuNDQ2LDIxLjQ2Nyw0LjM5OSwyNy45MTMtNC41NjkNCgkJCUM0MTguNjg4LDI5OS41MzksNDE2LjY0MiwyODcuMDQyLDQwNy42NzIsMjgwLjU5NnogTTI2MC44NjksMjMxLjg3OGMtMS42MjEtMC4wMy0zLjI0NC0wLjA0NS00Ljg2OS0wLjA0NQ0KCQkJYy0xLjYxNCwwLTMuMjI4LDAuMDE2LTQuODQsMC4wNDZDMjAwLjQ2NSwyMjkuMzUsMTYwLDE4Ny4zMTIsMTYwLDEzNmMwLTUyLjkzNSw0My4wNjUtOTYsOTYtOTZzOTYsNDMuMDY1LDk2LDk2DQoJCQlDMzUyLDE4Ny4zMDIsMzExLjU1LDIyOS4zMzQsMjYwLjg2OSwyMzEuODc4eiIvPg0KCTwvZz4NCjwvZz4NCjxnPg0KCTxnPg0KCQk8cGF0aCBkPSJNNDU1LjI4NSw0MjdsNTAuODU3LTUwLjg1N2M3LjgxMS03LjgxMSw3LjgxMS0yMC40NzUsMC0yOC4yODVjLTcuODExLTcuODExLTIwLjQ3NC03LjgxMS0yOC4yODQsMEw0MjcsMzk4LjcxNQ0KCQkJbC01MC44NTgtNTAuODU4Yy03LjgxMS03LjgxMS0yMC40NzQtNy44MTEtMjguMjg0LDBjLTcuODEsNy44MTEtNy44MTEsMjAuNDc1LDAsMjguMjg1TDM5OC43MTUsNDI3bC01MC44NTcsNTAuODU3DQoJCQljLTcuODExLDcuODExLTcuODExLDIwLjQ3NSwwLDI4LjI4NUMzNTEuNzYzLDUxMC4wNDgsMzU2Ljg4MSw1MTIsMzYyLDUxMmM1LjExOSwwLDEwLjIzNy0xLjk1MiwxNC4xNDItNS44NTdMNDI3LDQ1NS4yODUNCgkJCWw1MC44NTgsNTAuODU4QzQ4MS43NjMsNTEwLjA0OCw0ODYuODgxLDUxMiw0OTIsNTEyYzUuMTE5LDAsMTAuMjM3LTEuOTUyLDE0LjE0Mi01Ljg1N2M3LjgxMS03LjgxMSw3LjgxMS0yMC40NzUsMC0yOC4yODUNCgkJCUw0NTUuMjg1LDQyN3oiLz4NCgk8L2c+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg==" 
								width="20px" height="20px"
								class="delMem"
								onclick="deleteMember('${vo.email}')"></td>
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
					</tr>
			</table>

		</div>
	</div>
	</div>
	<script>
//	회원 탈퇴 기능
	function deleteMember(email) {
		var isConfirm = confirm(email + "님을 탈퇴시키시겠습니까?\n" + email
				+ "님의 모든 정보가 삭제됩니다.");
		if (isConfirm) {
			$.ajax({
				url : "md",
				type : "post",
				dataType : "json",
				data : {
					"email" : email
				},
				success : function(data) {
					location.href = "ml";
				},

				error : function(request, error) {
					console.log("message:" + request.responseText + " n"
							+ "error:" + error);
				}
			})
			alert(email + "님을 탈퇴시켰습니다.");
		} else {
			alert("취소하였습니다.");
		}
	}
	</script>
</body>
</html>