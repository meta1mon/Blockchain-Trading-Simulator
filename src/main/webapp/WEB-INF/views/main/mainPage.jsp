<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="${pageContext.request.contextPath}/resources/js/data.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/newsList.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
<meta charset="UTF-8">
<title>MainPage</title>
<script type="text/javascript">
function go() {
	location.href = "<%=request.getContextPath()%>/investmentpage";
}
</script>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div id="center">
		<table>
			<tr>
				<td>
					<div id="chart">
						<div id="chart_div"></div>
						<button id="chart_btn" class="btn btn-outline-primary"
							onclick="go();">거래소바로가기</button>
					</div>
				</td>
				<td>
					<div id="cointable_div"></div>
					<button id="cointable_btn" class="btn btn-outline-primary"
						onclick="go();">거래소바로가기</button>
				</td>
			</tr>
		</table>
		<div class="headLine">
			<marquee class="scroll" onmouseover="this.stop();"
				onmouseout="this.start();">
				<!-- newsList.js의 newsHeadLine() 함수 참조 -->
			</marquee>
		</div>


	</div>
	<br>
	<br>
	<br>
	<br>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>