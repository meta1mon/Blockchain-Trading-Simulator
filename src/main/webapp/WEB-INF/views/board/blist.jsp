<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('form[name=listForm]').on(
				'submit',
				function(e) {
					if ($('input[name=keyword]').val() == null
							|| $('input[name=keyword]').val() == "") {
						alert("검색어를 입력해 주세요");
						e.preventDefault();
					} else {
						return true;
					}
				});
	});
	function showInsertForm() {
		location.href = "writeForm.do";
	}
</script>
</head>
<body bgcolor="#FFEFD5">
	<h1>Spring MVC 서버</h1>
	<hr>
	<p align="center">
	<h3>게 시 판</h3>
	<form method="get" name="listForm" action="blist.do">
		<input type="hidden" name="page" value="${currentPage}"> <input
			type="text" name="keyword"> <input type="submit" value="검색">
	</form>
	<table>
		<tr>
			<td align="right" colspan="5"><input type="button" value="전체목록"
				onclick="window.location='blist'"> <input type="button"
				value="글쓰기" onclick="window.location='writeForm'"></td>
		</tr>
		<tr bgcolor="#FFD1B7">
			<td align="center" width="60">번호</td>
			<td align="center" width="380">제목</td>
			<td align="center" width="100">작성자</td>
			<td align="center" width="100">작성일</td>
			<td align="center" width="60">조회수</td>
		</tr>
		<!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="6" align="center"><br> <br> 게시판에 저장된 글이
					없습니다.<br> <br></td>
			</tr>
		</c:if>
		<c:if test="${listCount ne 0}">
			<c:forEach var="vo" items="${list}" varStatus="status">
				<tr>
					<td align="center">${status.count}</td>
					<td align="left"><a
						href="bDetail?board_num=${vo.board_num}&page=${currentPage}">
							&nbsp;${vo.board_title} </a></td>
					<td align="center">${vo.board_writer}</td>
					<td align="center">${vo.regDate}</td>
					<td align="center">${vo.read_count}</td>
				</tr>
			</c:forEach>
		</c:if>
		<!-- 앞 페이지 번호 처리 -->
		<tr align="center" height="20">
			<td colspan="5"><c:if test="${currentPage <= 1}">
[이전]&nbsp;
</c:if> <c:if test="${currentPage > 1}">
					<c:url var="blistST" value="blist">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${blistST}">[이전]</a>
				</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" /> <c:forEach
					var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="red" size="4"><b>[${p}]</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="blistchk" value="blist">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${blistchk}">${p}</a>
					</c:if>
				</c:forEach> <c:if test="${currentPage >= maxPage}">
[다음]
</c:if> <c:if test="${currentPage < maxPage}">
					<c:url var="blistEND" value="blist">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${blistEND}">[다음]</a>
				</c:if></td>
		</tr>
	</table>
</body>
</html>