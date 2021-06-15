<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BTS</title>
<%-- <link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" /> --%>
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
		location.href = "cwriteForm";
	}
</script>
</head>
<%@include file="../main/header.jsp"%>
<body>
	<hr>
	<p align="center">
	<div class="comm">커뮤니티</div>

	<form method="get" name="listForm" action="clist">
		<select id="searchType" name="searchType">
			<option value="1">글제목</option>
			<option value="2">작성자</option>
			<option value="3">글내용</option>
		</select> <input type="hidden" name="page" value="${currentPage}"> <input
			type="text" name="keyword"> <input type="submit" value="검색">
				<input type="button" value="글쓰기" onclick="window.location='cWriteForm'">
	</form>
	<table>
		<tr>
		</tr>
		<tr bgcolor="#FFD1B7">
			<td align="center" width="60">번호</td>
			<td align="center" width="380">제목</td>
			<td align="center" width="100">글쓴이</td>
			<td align="center" width="100">작성일</td>
			<td align="center" width="60">조회</td>
			<td align="center" width="60">추천</td>
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
						href="cDetail?cno=${vo.cno}&page=${currentPage}">
							&nbsp;${vo.csubject} </a></td>
					<td align="center">${vo.cwriter}</td>
					<td align="center">${vo.cdate}</td>
					<td align="center">${vo.viewcnt}</td>
					<td align="center">${vo.likecnt}</td>
				</tr>
			</c:forEach>
		</c:if>
		<!-- 앞 페이지 번호 처리 -->
		<tr align="center" height="20">
			<td colspan="5"><c:if test="${currentPage <= 1}">
[이전]&nbsp;
</c:if> <c:if test="${currentPage > 1}">
					<c:url var="clistST" value="clist">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${clistST}">[이전]</a>
				</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" /> <c:forEach
					var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="red" size="4"><b>[${p}]</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="clistchk" value="clist">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${clistchk}">${p}</a>
					</c:if>
				</c:forEach> <c:if test="${currentPage >= maxPage}">
[다음]
</c:if> <c:if test="${currentPage < maxPage}">
					<c:url var="clistEND" value="clist">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${clistEND}">[다음]</a>
				</c:if></td>
		</tr>
	</table>
	<form method="get" name="listForm" action="clist">
		<select id="searchType" name="searchType">
			<option value="1">글제목</option>
			<option value="2">작성자</option>
			<option value="3">글내용</option>
		</select> <input type="hidden" name="page" value="${currentPage}"> <input
			type="text" name="keyword"> <input type="submit" value="검색">
				<input type="button" value="글쓰기" onclick="window.location='cWriteForm'">
	</form>

</body>
<%@include file="../main/footer.jsp"%>
</html>