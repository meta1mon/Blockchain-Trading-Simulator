<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/noticeList.css"
	rel="stylesheet" type="text/css" />
<title>공지사항 리스트 - BTS</title>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="listWrapper" style="background-image:url(../resources/assets/img/bgpuple.png); background-repeat: no-repeat; background-size: cover;">
		<div id="listOut">
			<div id="noticeTitle">
				공지사항
			</div>
			<div id="listIn">
			
				<hr>
				
				<form action="nl" name="listForm" method="get">
					<select id="searchType" name="searchType">
						<option value="1">글제목</option>
						<option value="2">글내용</option>
						<option value="3">작성자</option>
					</select> 
					<input type='search' id="search" name="keyword">
					<button type=submit id="btnsearch">검색</button>
				</form>
				
				<input type="hidden" name="page" value="${currentPage}"> 
				<input type="button" id="write" value="글쓰기" onclick="window.location='cWriteForm'">
				
				<div style="clear: both; height: 30px;">
				</div>
				
				<hr>
				
				<table class="noticeList">
					<tr>
						<td align="center" width="60">번호</td>
						<td align="center" width="360">제목</td>
						<td align="center" width="100">작성자</td>
						<td align="center" width="120">작성일</td>
						<td align="center" width="60">조회</td>
						<td align="center" width="60">추천</td>
					</tr>
					<!-- 글이 없을 경우 -->
					<c:if test="${listCount eq 0}">
						<tr>
							<td colspan="6" align="center">
							<br><br> 게시판에 저장된 글이 없습니다. <br><br>
							</td>
						</tr>
					</c:if>
					<c:if test="${listCount ne 0 }">
						<c:forEach var="vo" items="${list }" varStatus="status">
							<tr>
								<td align="center">${vo.cno}</td>
								<td align="left">
									<a	href="nDetail?cno=${vo.cno}&page=${currentPage}">
									&nbsp;${vo.csubject} </a>
									${vo.replycnt}
								</td>
								<td align="center">${vo.cwriter}</td>
								<td align="center">${vo.cdate}</td>
								<td align="center">${vo.viewcnt}</td>
								<td align="center">${vo.likecnt}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<!-- 앞 페이지 번호 처리 -->
				<c:if test="${currentPage <= 1 }">
					[이전]&nbsp;
				</c:if>
				<c:if test="${currentPage >1 }">
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
		</div>
	</div>
</body>
</html>