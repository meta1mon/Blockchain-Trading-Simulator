<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<style>
#mc {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
}

#mc table {
	margin: 0 auto;
}
</style>
</head>
<jsp:include page="myHeader.jsp"></jsp:include>
<body>
	<div id="mc">
		<table class="ctable">
			<tr bgcolor="#8C66C8">
				<td align="center" width="60">번호</td>
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
				<c:forEach var="vo" items="${myClist}" varStatus="status">
					<tr>
						<td align="center">${vo.cno}</td>
						<td align="left"><a href="cDetail?cno=${vo.cno}">
								&nbsp;${vo.csubject} </a></td>
						<td align="center">${vo.cwriter}</td>
						<td align="center">${vo.cdate}</td>
						<td align="center">${vo.viewcnt}</td>
						<td align="center">${vo.likecnt}</td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
	</div>
</body>
</html>