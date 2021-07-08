<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="${pageContext.request.contextPath}/resources/js/data.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"	rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<script type="text/javascript">
function go() {
	location.href = "<%=request.getContextPath()%>/investmentpage";
	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div id="wrapper">
		<jsp:include page="../sub/pop.jsp"></jsp:include>
		<div id="container">

			<!-- 비디오 버젼 -->
			<!-- 			<video id="videobcg" width="100%" height="auto" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0"> -->
			<%-- 		        <source src="<%=request.getContextPath()%>/resources/assets/mainvideo.mp4" type="video/mp4"> --%>
			<!-- 		        Sorry, your browser does not support HTML5 video. -->
			<!-- 		    </video> -->
			<div id="new">
				<div class="headLine">
					<marquee class="scroll" onmouseover="this.stop();"
						onmouseout="this.start();">
					</marquee>
				</div>
			</div>
			<br>
			<table style="width: 100%">
				<tr>
					<td id="c1">

						<div id="chart_div"></div>
					</td>
					<td><span>&nbsp;&nbsp;</span></td>
					<td id="c2">
						<div id="table">
							<div id="cointable_div"></div>
						</div>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td colspan="2">
						<button id="cointable_btn" onclick="go();">거래소바로가기</button>
					</td>
				</tr>
			</table>
			<br>
			<table style="width: 100%">
				<tr>
					<td id="c1_1"><iframe src="btmichart" width="100%"
							height="550px" class="chat"
							style="border: 1px solid #E3C8F8 !important;"></iframe></td>

					<td id="c1_2"><iframe src="btaichart" width="100%"
							height="550px" class="chat"
							style="border: 1px solid #E3C8F8 !important;"></iframe></td>
				</tr>
			</table>
			<table style="width: 100%"> <!-- 인스타 추가 부분 -->
				<tr>
					<td id="c2_1"></td>

					<td id="c2_2"></td>
				</tr>
				<tr>
					<td id="c3_1"></td>

					<td id="c3_2"></td>
				</tr>
			</table>

		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>