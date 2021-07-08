<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/myNav.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/myCommunity.css"	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<jsp:include page="myNav.jsp"></jsp:include>
		<div id="mc">
		
			<div class="tab">
				<button class="tablinks" value="myCom">나의 게시글</button>
				<button class="tablinks" value="myRe">나의 댓글</button>
			</div>
			
			
			
			<div id="myCom" class="tabcontent">
				<table class="ctable">
					<tr>
						<td align="center" width="60" style="font-size: 13px;">번호</td>
						<td align="center" width="380">제목</td>
						<td align="center" width="100">작성자</td>
						<td align="center" width="100">작성일</td>
						<td align="center" width="60">조회</td>
						<td align="center" width="60">추천</td>
					</tr>
					<!-- 글이 없을 경우 -->
					<c:if test="${myClist.size() eq 0}">
						<tr>
							<td colspan="6" align="center"><br> <br> 작성한 글이
								없습니다. <br> <br></td>
						</tr>
					</c:if>
					<c:if test="${myClist.size() ne 0}">
						<c:forEach var="vo" items="${myClist }" varStatus="status">
							<tr>
								<td align="center" style="font-size: 13px;">${vo.cno}</td>
								<td align="left">
									<a href="${pageContext.request.contextPath}/cDetail?cno=${vo.cno}&page=${currentPage}" class="subject">
										&nbsp;${vo.csubject}
									</a> 
									<a href="${pageContext.request.contextPath}/cDetail?cno=${vo.cno}&page=${currentPage}"	class="replycnt">
										[${vo.replycnt}]
									</a>
								</td>
								<td align="center">${vo.cwriter}</td>
								<td align="center" style="font-size: 13px;">${vo.cdate}</td>
								<td align="center">${vo.viewcnt}</td>
								<td align="center">${vo.likecnt}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			
			<div id="myRe" class="tabcontent">
				<table class="ctable">
					<tr>
						<td align="center" width="60" style="font-size: 13px;">번호</td>
						<td align="center" width="380">제목</td>
						<td align="center" width="100">작성자</td>
						<td align="center" width="100">댓글내용</td>
						<td align="center" width="100">작성일</td>
						<td align="center" width="60">조회</td>
						<td align="center" width="60">추천</td>
					</tr>
					<!-- 글이 없을 경우 -->
					<c:if test="${myRlist.size() eq 0}">
						<tr>
							<td colspan="6" align="center"><br> <br> 작성한 댓글이
								없습니다. <br> <br></td>
						</tr>
					</c:if>
					<c:if test="${myRlist.size() ne 0}">
						<c:forEach var="vo" items="${myRlist }" varStatus="status">
							<tr>
								<td align="center" style="font-size: 13px;">${vo.cno }</td>
								<td align="left">
									<a	href="${pageContext.request.contextPath}/cDetail?cno=${vo.cno}&page=${currentPage}" class="subject">
										&nbsp;${vo.csubject}
									</a> 
								</td>
								<td align="center">${vo.cwriter }</td>
								<td align="center">${vo.rcontent }</td>
								<td align="center" style="font-size: 13px;">${vo.rdate }</td>
								<td align="center">${vo.viewcnt }</td>
								<td align="center">${vo.likecnt }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			
			
			
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include> 
	</div>
<script>
//탭메뉴 jQuery
$('.tablinks').click(function() {

	for (var i = 0; i < $('.tabcontent').length; i++) {
		$('.tabcontent').hide();
	}

	$(".tabcontent").eq($(this).index()).show();

});

$(function() {
	$(".tabcontent").eq(0).show(); // 보유코인 목록 탭 기본값 : show()
});


</script>
</body>
</html>