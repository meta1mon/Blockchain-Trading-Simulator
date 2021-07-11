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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="listWrapper">
		<div id="listOut">
			<div id="noticeTitle">
				공지사항
			</div>
			<div id="listIn">
			<input type="button" id="write" value="글쓰기" onclick="window.location='nWrite'">
				<input type="hidden" name="page" value="${currentPage}"> 
				
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
									<a	href="nDetail?cno=${vo.cno}&page=${currentPage}" class="subject">
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
				<table class="center" style="width: 100%">
					<tr>
						<td colspan="6">
							<!-- 앞 페이지 번호 처리 --> 
							<c:if test="${currentPage <= 1 }">
								<i class="fas fa-angle-double-left"></i>
							</c:if> 
							<c:if test="${currentPage >1 }">
								<c:url var="nlistST" value="nl">
									<c:param name="page" value="${currentPage-1}" />
								</c:url>
								<a href="${nlistST}">
								<i class="fas fa-angle-double-left"></i>
								</a>
							</c:if> 
							<!-- 끝 페이지 번호 처리 --> 
							<c:set var="endPage" value="${maxPage}" /> 
							<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
								<c:if test="${p eq currentPage}">
									<div class="pageNum"><b>${p}</b></div>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="nlistchk" value="nl">
										<c:param name="page" value="${p}" />
									</c:url>
								<a href="${nlistchk}">${p}</a>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}">
								<i class="fas fa-angle-double-right"></i>
							</c:if> 
							<c:if test="${currentPage < maxPage}">
								<c:url var="nlistEND" value="nl">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${nlistEND}"><i class="fas fa-angle-double-right"></i></a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>