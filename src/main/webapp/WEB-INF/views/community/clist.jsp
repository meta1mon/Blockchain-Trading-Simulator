<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/clist.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
<body>
	<div id="wrapper">
	<%@include file="../main/header.jsp"%>
		<div class="listOut">
	
			<div class="comm">커뮤니티</div>
			<br>
			<br>
			<div class="bestComm">BEST 게시글</div>
			<!-- 조회수 상위 5개 인기 게시글 -->
			<c:if test="${listCount ne 0}">
				<hr>
				<table class="ptable">
					<c:forEach var="vo" items="${plist}" varStatus="status">
						<tr>
							<td align="center" width="60" style="font-size: 13px;">${vo.cno}</td>
							<td align="left" width="300"><a
								href="cDetail?cno=${vo.cno}&page=${currentPage}" class="subject">&nbsp;${vo.csubject}
							</a> <a href="cDetail?cno=${vo.cno}&page=${currentPage}"
								class="replycnt">[${vo.replycnt}]</a></td>
							<td align="center" width="100">${vo.cwriter}</td>
							<td align="center" width="110" style="font-size: 13px;">${vo.cdate}</td>
							<td align="center" width="60">${vo.viewcnt}</td>
							<td align="center" width="60">${vo.likecnt}</td>
						</tr>
					</c:forEach>
				</table>
				<hr>
			</c:if>
			
			<div class="searchDiv">
				<form action="clist" name="listForm" method="get">
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
			</div>
			
			<hr>
			<table class="ctable">
				<tr>
					<td align="center" width="60">번호</td>
					<td align="center" width="300">제목</td>
					<td align="center" width="100">작성자</td>
					<td align="center" width="110">작성일</td>
					<td align="center" width="60">조회</td>
					<td align="center" width="60">추천</td>
				</tr>
				<!-- 글이 없을 경우 -->
				<c:if test="${listCount eq 0}">
					<tr>
						<td colspan="6" align="center"><br> <br> 게시판에 저장된
							글이없습니다.<br> <br></td>
					</tr>
				</c:if>
				<c:if test="${listCount ne 0}">
					<c:forEach var="voNotice" items="${noticeList }" varStatus="status">
						<tr>
							<td align="center" style="color: #B85CEF;">공지사항</td>
							<td align="left">
								<a	href="cDetail?cno=${voNotice.cno}&page=${currentPage}" class="subject">
								&nbsp;${voNotice.csubject} </a> <a href="cDetail?cno=${vo.cno}&page=${currentPage}"
								class="replycnt">[${voNotice.replycnt}]</a>
							</td>
							<td align="center">${voNotice.cwriter}</td>
							<td align="center" style="font-size: 15px;">${voNotice.cdate}</td>
							<td align="center">${voNotice.viewcnt}</td>
							<td align="center">${voNotice.likecnt}</td>
						</tr>
					</c:forEach>
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr>
							<td align="center">${vo.cno}</td>
							<td align="left"><a
								href="cDetail?cno=${vo.cno}&page=${currentPage}" class="subject">&nbsp;${vo.csubject}
							</a> <a href="cDetail?cno=${vo.cno}&page=${currentPage}"
								class="replycnt">[${vo.replycnt}]</a></td>
							<td align="center">${vo.cwriter}</td>
							<td align="center" style="font-size: 15px;">${vo.cdate}</td>
							<td align="center">${vo.viewcnt}</td>
							<td align="center">${vo.likecnt}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<hr>

		<!-- 앞 페이지 번호 처리 -->
<c:if test="${currentPage <= 1}">
	&#60;&nbsp;
</c:if>
		<c:if test="${currentPage > 1}">
			<c:url var="clistST" value="clist">
				<c:param name="page" value="${currentPage-1}" />
			</c:url>
			<a href="${clistST}&search=${keyword }&searchType=${searchType}">&#60;</a>
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
				<a href="${clistchk}&search=${keyword }&searchType=${searchType}">${p}</a>
			</c:if>
		</c:forEach>
		
<c:if test="${currentPage >= maxPage}">
	&#62;
</c:if>

		<c:if test="${currentPage < maxPage}">
			<c:url var="clistEND" value="clist">
				<c:param name="page" value="${currentPage+1}" />
			</c:url>
			<a href="${clistEND}&search=${keyword }&searchType=${searchType}">&#62;</a>
		</c:if> 
		
<div id="page">
			<c:if test="${startPage !=1 }">
				<a href="clist?pageNum=${startPage -1 }&search=${keyword }&searchType=${searchType}" id="leftpage">&#60;</a>
			</c:if>

			<c:forEach begin="${startPage }" end="${maxPage }" var="s" step="1">
				<a href="clist?pageNum=${s }&search=${keyword }&searchType=${searchType}" id="pageNum">&nbsp;${s }&nbsp;</a>
			</c:forEach>

			<c:if test="${maxPage < pageBoxCnt }">
				<a href="clist?pageNum=${maxPage +1 }&search=${keyword }&searchType=${searchType}" id="rightpage">&#62;</a>
			</c:if>
		</div>
		
			<div class="searchDiv">
				<form action="clist" name="bottomlistForm" method="get">
					<select id="searchType" name="searchType">
						<option value="1">글제목</option>
						<option value="2">글내용</option>
						<option value="3">작성자</option>
					</select> <input type='search' id="search" name="keyword">
					<button type=submit id="btnsearch">검색</button>
				</form>
				<input type="hidden" name="page" value="${currentPage}"> 
				<input type="button" id="write" value="글쓰기" onclick="window.location='cWriteForm'">
			</div>

		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>