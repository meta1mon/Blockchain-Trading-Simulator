<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
						<td align="center" width="380">내용</td>
						<td align="center" width="100">작성자</td>
						<td align="center" width="100">작성일</td>
						<td align="center" width="60">좋아요</td>
						<td align="center" width="60">싫어요</td>
					</tr>
					<!-- 글이 없을 경우 -->
					<c:if test="${myClist.size() eq 0}">
						<tr>
							<td colspan="5" align="center"><br> <br> 작성한 글이
								없습니다. <br> <br></td>
						</tr>
					</c:if>
					<c:if test="${myClist.size() ne 0}">
						<input type="hidden" value="${myClist.size()}" id="ccontentSize"/>
						<c:forEach var="vo" items="${myClist }" varStatus="status">
							<c:if test="${status.index <15}">
								<tr>
									<td align="left">
										<input type="hidden" value="${fn:escapeXml(vo.ccontent)}" class="ccontentHidden"/>
										<a href="${pageContext.request.contextPath}/mypage/myinsta?cno=${vo.cno}" class="subject">
											<span class="ccontentSpan"></span>
										</a> 
									</td>
									<td align="center">${vo.cwriter}</td>
									<td align="center" style="font-size: 13px;">${vo.cdate}</td>
									<td align="center">${vo.likecnt}</td>
									<td align="center">${vo.dislikecnt}</td>
								</tr>
							</c:if>
							<c:if test="${status.index >=15}">
								<tr class="myCommunityList" style="display: none;">
									<td align="left">
										<input type="hidden" value="${fn:escapeXml(vo.ccontent)}" class="ccontentHidden"/>
										<a href="${pageContext.request.contextPath}/mypage/myinsta?cno=${vo.cno}" class="subject">
											<span class="ccontentSpan"></span>
										</a> 
									</td>
									<td align="center">${vo.cwriter}</td>
									<td align="center" style="font-size: 13px;">${vo.cdate}</td>
									<td align="center">${vo.likecnt}</td>
									<td align="center">${vo.dislikecnt}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</table>
				<c:if test="${myClist.size()>15 }">
				<input type="button" id="myCommunityExpand" value="더 보기" class="expandBtn"></input>
				</c:if>
			</div>
			
			<div id="myRe" class="tabcontent">
				<table class="ctable">
					<tr>
						<td align="center" width="380">내용</td>
						<td align="center" width="100">작성자</td>
						<td align="center" width="100">작성일</td>
					</tr>
					<!-- 글이 없을 경우 -->
					<c:if test="${myRlist.size() eq 0}">
						<tr>
							<td colspan="3" align="center"><br> <br> 작성한 댓글이
								없습니다. <br> <br></td>
						</tr>
					</c:if>
					<c:if test="${myRlist.size() ne 0}">
						<input type="hidden" value="${myRlist.size()}" id="rcontentSize"/>
						<c:forEach var="vo" items="${myRlist }" varStatus="status">
							<c:if test="${status.index <15}">
							<tr>
								<td align="left">
									<input type="hidden" value="${fn:escapeXml(vo.rcontent)}" class="rcontentHidden"/>
									<a href="${pageContext.request.contextPath}/mypage/myinsta?cno=${vo.cno}" class="subject">
										<span class="rcontentSpan"></span>
									</a> 
								</td>
								<td align="center">${vo.rwriter }</td>
								<td align="center" style="font-size: 13px;">${vo.rdate }</td>
							</tr>
							</c:if>
							<c:if test="${status.index >=15}">
							<tr class="myReplyCommunityList" style="display: none;">
								<td align="left">
									<input type="hidden" value="${fn:escapeXml(vo.rcontent)}" class="rcontentHidden"/>
									<a href="${pageContext.request.contextPath}/mypage/myinsta?cno=${vo.cno}" class="subject">
										<span class="rcontentSpan"></span>
									</a> 
								</td>
								<td align="center">${vo.rwriter }</td>
								<td align="center" style="font-size: 13px;">${vo.rdate }</td>
							</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</table>
				<c:if test="${myRlist.size()>15 }">
				<input type="button" id="myReplyCommunityExpand" value="더 보기" class="expandBtn"></input>
				</c:if>				
			</div>
			
			
			
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include> 
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myCommunity.js"></script>
</body>
</html>