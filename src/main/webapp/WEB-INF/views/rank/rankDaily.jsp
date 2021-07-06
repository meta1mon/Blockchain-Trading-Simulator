<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

<!-- 여기부터 삭제해도 됨 --!>
#rank1, #rank2, #rank4 {
	cursor: pointer;
	font-size: 30px;
	margin: 0 145px !important;
}

#rank1 {
	background-color: red;
}
</style>

<script>
/* 여깄는거 전부 삭제 해도 됨 */
	$(function() {
		$("#rank4").on("click",	function() {
			location.href = "${pageContext.request.contextPath}/rankAccumulative";
		});
		$("#rank2").on("click", function() {
			location.href = "${pageContext.request.contextPath}/rankWeekly";
		});
	});
</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="rank">
			<div id="rankPage">
			<!-- 이 div 안에 있는거 전부 삭제해도 됨 -->
				<ul>
					<li id="rank4">누적 랭킹</li>
					<li id="rank1">일간 랭킹</li>
					<li id="rank2">주간 랭킹</li>
				</ul>
			</div>
			<div style="clear: both;">

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
			</div>
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