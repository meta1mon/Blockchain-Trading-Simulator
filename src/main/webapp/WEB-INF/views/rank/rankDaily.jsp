<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css" />
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

/* 랭킹 스와이프 메뉴 시작 */
input[type=radio] {
  display: none;
}

.card {
  position: absolute;
  width: 100px;
  height: 25px;
  left: 0;
  right: 0;
  margin-left: auto;
  margin-right: auto;
  transition: transform .5s ease, opacity .5s;
  cursor: pointer;
  background: white;
  color: #8c66c8;
}

.info {
  position: absolute;
  width: 100px;
  height: 25px;
  left: 0;
  right: 0;
  margin-left: auto;
  margin-right: auto;
  transition: transform .5s ease;
  cursor: pointer;
  background: #8c66c8;
  color: white;
}

.container {
  width: 1240px;
  max-width: 1240px;
  max-height: 100px;
  height: 100%;
  transform-style: preserve-3d;
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}

.cards {
  position: relative;
  width: 100%;
  height: 100%;
}

#item-1:checked ~ .cards #rank-4, #item-2:checked ~ .cards #rank-1, #item-3:checked ~ .cards #rank-2, #item-4:checked ~ .cards #rank-3 {
  transform: translatex(-100%);
  opacity: 0.3;
  z-index: 0;
}

#item-1:checked ~ .cards #rank-2, #item-2:checked ~ .cards #rank-3, #item-3:checked ~ .cards #rank-4, #item-4:checked ~ .cards #rank-1 {
  transform: translatex(100%);
  opacity: 0.3;
  z-index: 0;
}

#item-1:checked ~ .cards #rank-1, #item-2:checked ~ .cards #rank-2, #item-3:checked ~ .cards #rank-3, #item-4:checked ~ .cards #rank-4 {
  transform: translatex(0) scale(1.2);
  opacity: 1;
  z-index: 1;
  background: #8c66c8;
  color: white;
  }
  
#item-1:checked ~ .cards #rank-info-4, #item-2:checked ~ .cards #rank-info-1, #item-3:checked ~ .cards #rank-info-2, #item-4:checked ~ .cards #rank-info-3 {
  transform: translatex(-100%);
  z-index: 0;
}

#item-1:checked ~ .cards #rank-info-2, #item-2:checked ~ .cards #rank-info-3, #item-3:checked ~ .cards #rank-info-4, #item-4:checked ~ .cards #rank-info-1 {
  transform: translatex(100%);                                                                     
  z-index: 0;                                                                                      
}                                                                                                  
                                                                                                   
#item-1:checked ~ .cards #rank-info-1, #item-2:checked ~ .cards #rank-info-2, #item-3:checked ~ .cards #rank-info-3, #item-4:checked ~ .cards #rank-info-4 {
  transform: translatex(0);
  opacity: 1;
  z-index: 1;
  background: #8c66c8;
  color: white;
  }

  
/* 랭킹 스와이프 메뉴 끝 */

/* 랭킹 정보 시작 */
.info{
	width: 1240px;
}
/* 랭킹 정보 끝 */

.ranktable {
	width: 100%;
	text-align: center;
}

.ranktable td {
	width: 33.3%;
}

.top3{
	margin-bottom: 10px;
	width: 100%;
	height: 247px;
}

#accumulative {
	display: none;
}

.ranktable a {
	color: #8c66c8;
}
</style>
 <script>
	$(function(){
		if(${criteria == 0}) {
			$("#item-1").prop("checked", true);
		} else if(${criteria == 1}) {
			$("#item-2").prop("checked", true);
		} else if(${criteria ==2}) {
			$("#item-3").prop("checked", true);
		} else if(${criteria ==3}) {
			$("#item-4").prop("checked", true);
		}
		
		$("#rank-1").click(function() {
			console.log("1번 클릭");
			location.href="rankDaily?criteria=0";
		});
		$("#rank-2").click(function() {
			console.log("2번 클릭");
			location.href="rankDaily?criteria=1";
		});
		$("#rank-3").click(function() {
			console.log("3번 클릭");
			location.href="rankDaily?criteria=2";
		});
		$("#rank-4").click(function() {
			console.log("4번 클릭");
			location.href="rankDaily?criteria=3";
		});
	})
</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="rank">
			<!-- 랭킹 스와이프 메뉴 시작 -->
			<div class="container">
				<input type="radio" name="slider" id="item-1"> 
				<input type="radio" name="slider" id="item-2"> 
				<input type="radio" name="slider" id="item-3"> 
				<input type="radio" name="slider" id="item-4">
				<div class="cards">
					<label class="card" for="item-1" id="rank-1">
						누적 랭킹
					</label>
					<label class="card" for="item-2" id="rank-2">
						일간 랭킹
					</label> 
					<label class="card" for="item-3" id="rank-3">
						주간 랭킹
					</label> 
					<label class="card" for="item-4" id="rank-4">
						월간 랭킹
					</label>
				</div>
				<div class="cards">
					<label class="info" for="item-1" id="rank-info-1">
						초기 자본금(1,000만원)을 기준으로 매 시간 갱신됩니다.
					</label>
					<label class="info" for="item-2" id="rank-info-2">
						매일 오전 9시에 갱신됩니다.
					</label> 
					<label class="info" for="item-3" id="rank-info-3">
						매주 월요일 오전 9시에 갱신됩니다.
					</label> 
					<label class="info" for="item-4" id="rank-info-4">
						매월 1일 오전 9시에 갱신됩니다.
					</label>
				</div>
			</div>
			<!-- 랭킹 스와이프 메뉴 끝 -->
			
			<div id="daily">
			<!-- 일간 TOP3 -->
			<div class="top3" style="clear: both;">
				<ul>
					<li>
						<div>
							<img src="resources/assets/img/silver_medal.png">
						</div>
						<div>
							<p>2등 ${second.nickname }</p>
						</div>
						<div>
							<p>수익률 <fmt:formatNumber value="${second.yield }" pattern="##,###.##" /> % </p>
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
							<p>수익률 <fmt:formatNumber value="${first.yield }" pattern="##,###.##" /> % </p>
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
							<p>수익률 <fmt:formatNumber value="${third.yield }" pattern="##,###.##" /> %</p>
						</div>
					</li>
				</ul>
			</div>
			
			<br>
			<hr style="clear: both;">
			<br>

			<p style="text-align: center;">전체 참가 인원 : ${other.size() } 명</p>

			<br>
			
			<!-- 일간 랭킹 및 내 순위 -->
			<table style="clear: both;" class="ranktable">
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
					<td colspan="3">.<br>.<br>.</td>
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
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>