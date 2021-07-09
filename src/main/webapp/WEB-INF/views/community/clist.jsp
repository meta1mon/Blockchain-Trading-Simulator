<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/clist.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
function showInsertForm() {
    if(${loginMember == null}) {
     alert("게시글을 작성하려면 로그인이 필요합니다.");
    } else {
       window.location='cWriteForm';
    }
 }

</script>
</head>
<body>
	<div id="wrapper">
		<%@include file="../main/header.jsp"%>
		<div class="listOut">

			<div class="comm">공지사항</div>
			<c:if test="${loginMember == 'admin' }">
				<div style="float: right; margin: 40px 20px 0 0;">
					<input type="button" id="write" class="write" value="글쓰기"
						onclick="showInsertForm()">
				</div>
			</c:if>
			<table class="ctable" style="clear: both;">
				<tr>
					<td align="center" width="60" style="font-size: 13px;">번호</td>
					<td align="center" width="300">제목</td>
					<td align="center" width="100">작성자</td>
					<td align="center" width="110">작성일</td>
					<td align="center" width="60">조회</td>
					<td align="center" width="60">추천</td>
				</tr>
				<!-- 글이 없을 경우 -->
				<c:if test="${listCount eq 0}">
					<tr>
						<td colspan="6" align="center"><br> <br> 공지사항이 없습니다<br>
							<br></td>
					</tr>
				</c:if>
				<c:if test="${listCount ne 0}">
					<c:forEach var="voNotice" items="${noticeList }" varStatus="status">
						<tr>
							<td align="center" style="font-size: 13px;">공지</td>
							<td align="left"><a
								href="cDetail?cno=${voNotice.cno}&page=${currentPage}"
								class="subject"> &nbsp;${voNotice.csubject} </a> <a
								href="cDetail?cno=${voNotice.cno}&page=${currentPage}"
								class="replycnt">[${voNotice.replycnt}]</a></td>
							<td align="center">${voNotice.cwriter}</td>
							<td align="center" style="font-size: 13px;">${voNotice.cdate}</td>
							<td align="center">${voNotice.viewcnt}</td>
							<td align="center">${voNotice.likecnt}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<hr>
			<div id="page">
				<span id="leftpage"> <!-- 앞 페이지 번호 처리 --> <c:if
						test="${currentPage <= 1}">
					처음
				</c:if> <!-- 이전페이지로 이동 --> <c:if test="${currentPage > 1}">
						<c:url var="clistST" value="clist">
							<c:param name="page" value="${currentPage-1}" />
						</c:url>
						<a href="${clistST}">이전</a>
					</c:if>
				</span>

				<c:set var="endPage" value="${maxPage}" />
				<c:forEach var="p" begin="1" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="#8C66C8" class="pageNum"><b>${p}</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="clistchk" value="clist">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${clistchk}" class="pageNum">${p}</a>
					</c:if>
				</c:forEach>

				<span id="rightpage"> <!-- 다음페이지로 이동 --> <c:if
						test="${currentPage < maxPage}">
						<c:url var="clistEND" value="clist">
							<c:param name="page" value="${currentPage+1}" />
						</c:url>
						<a href="${clistEND}&searchType=${searchType }&keyword=${keyword}">다음</a>
					</c:if> <!-- 끝 페이지 번호 처리 --> <c:if test="${currentPage >= maxPage}">
					끝
				</c:if>
				</span>
			</div>
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>