<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css" />
<style>
#rank {
	width: 1240px;
	height: 800px;
	margin: 35px auto;
	text-align: center;
	background-color: #fff;
}

#rank table {
	margin: 0 auto;
}

#rank table th, #rank table td, #rank table a {
	font-size: 20px;
}

#rank li {
	list-style-type: none;
	float: left;
	margin: 0 105px;
}

#rank img {
	width: 200px;
	height: 200px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="rank">
		<h1>주간 랭킹</h1>
			<ul>
				<li>
					<div>
						<img src="resources/assets/img/silver_medal.png">
					</div>
					<div>
						<p>2등 ${second.nickname }</p>
					</div>
					<div>
						<p>
							수익률
							<fmt:formatNumber value="${second.yield }" pattern="##,###.##" />
							%
						</p>
					</div>
				</li>
				<li>
					<div>
						<img src="resources/assets/img/gold_medal.png">
					</div>
					<div>
						<p>1등 ${first.nickname }</p>
					</div>
					<div>
						<p>
							수익률
							<fmt:formatNumber value="${first.yield }" pattern="##,###.##" />
							%
						</p>
					</div>
				</li>
				<li>
					<div>
						<img src="resources/assets/img/bronze_medal.png">
					</div>
					<div>
						<p>3등 ${third.nickname }</p>
					</div>
					<div>
						<p>
							수익률
							<fmt:formatNumber value="${third.yield }" pattern="##,###.##" />
							%
						</p>
					</div>
				</li>
			</ul>

			<br>
			<hr style="clear: both;">
			<br>

			<p style="float: left;">전체 참가 인원 : ${other.size() } 명</p>

			<table border="2" style="clear: both;">
				<tr>
					<th>순위</th>
					<th>닉네임</th>
					<th>수익률</th>
				</tr>
				<c:forEach items="${other }" var="rank" begin="3" end="100"
					varStatus="status">
					<tr>
						<td>${status.index +1 }위</td>
						<td>${rank.nickname }</td>
						<td><fmt:formatNumber value="${rank.yield }"
								pattern="##,###.##" /> %</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<c:if test="${loginMember == null }">
					<tr>
						<td colspan="3"><a
							href="${pageContext.request.contextPath}/login">로그인</a>하여 내 랭킹
							확인하기</td>
					</tr>
				</c:if>
				<c:if test="${my != null }">
					<tr>
						<td>${rank }위</td>
						<td>${my.nickname }</td>
						<td><fmt:formatNumber value="${my.yield }"
								pattern="##,###.##" /> %</td>
					</tr>
				</c:if>
			</table>



		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>