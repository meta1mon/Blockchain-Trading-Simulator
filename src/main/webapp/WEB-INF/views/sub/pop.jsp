<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>BTS</title>
</head>
<style>
#icon1 {
	z-index: 999;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	position: fixed;
	top: 70px;
	right: 5px;
	width: 50px;
}

#icon2 {
	z-index: 999;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	position: fixed;
	top: 120px;
	right: 5px;
}

#icon2_2 {
	z-index: 999;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	position: fixed;
	top: 120px;
	right: 55px;
}

#icon2_3 {
	z-index: 999;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	position: fixed;
	top: 120px;
	right: 105px;
}

#icon2_4 {
	z-index: 999;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	position: fixed;
	top: 120px;
	right: 155px;
}

.before1 {
	border: 1px solid rgb(140, 102, 200);
	background: white;
	color: rgb(140, 102, 200);
}

.after {
	background-color: rgb(140, 102, 200);
	color: white;
}

#icon1:hover {
	background-color: rgb(140, 102, 200);
	color: white;
}

#icon2:hover {
	background-color: rgb(140, 102, 200);
	color: white;
}

#icon2_2:hover {
	background-color: rgb(140, 102, 200);
	color: white;
}

#icon2_3:hover {
	background-color: rgb(140, 102, 200);
	color: white;
}

.chatt {
	z-index: 9998;
	position: fixed;
	top: 120px;
	right: 5px;
	border: 1px solid rgb(140, 102, 200);
	border-radius: 5px;
}

.w1 {
	z-index: 9997;
	position: fixed;
	top: 170px;
	right: 5px;
	border: 1px solid rgb(140, 102, 200);
	border-radius: 5px;
}

.w2 {
	z-index: 9996;
	position: fixed;
	top: 170px;
	right: 5px;
	border: 1px solid rgb(140, 102, 200);
	border-radius: 5px;
}

.w3 {
	z-index: 9996;
	position: fixed;
	top: 170px;
	right: 5px;
	border: 1px solid rgb(140, 102, 200);
	border-radius: 5px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<input type="button" id="icon2_4" value="Quick" class="before1">
	<input type="button" id="icon2_3" value="환율계산" class="before1">
	<input type="button" id="icon2_2" value="환율" class="before1">
	<input type="button" id="icon2" value="Widget" class="before1">
	<input type="button" id="icon1" value="Chat" class="before1">
	<iframe src="Chatting" width="500px" height="500px" class="chatt"></iframe>
	<iframe class="w1" frameborder="0" scrolling="auto" height="195"
		width="555" allowtransparency="true" marginwidth="0" marginheight="0"
		src="https://sslfxrates.forexprostools.com/index_exchange.php?params&inner-border-color=%23CBCBCB&border-color=%23cbcbcb&bg1=%23F6F6F6&bg2=%23ffffff&inner-text-color=%23000000&currency-name-color=%23000000&header-text-color=%23FFFFFF&force_lang=18"
		align="center">
		<br />
		<div style="width: 540px">
			<a href="http://kr.investing.com" target="_blank"><img
				src="https://wmt-invdn-com.investing.com/forexpros_kr_logo.png"
				alt="Investing.com" title="Investing.com" style="float: left" /></a><span
				style="float: right"><a href="https://kr.investing.com/"
				rel="nofollow" target="_blank"
				style="font-size: 11px; color: #06529D; font-weight: bold;"
				class="underline_link">Investing.com 한국어</a><span
				style="font-size: 11px; color: #333333; text-decoration: none;">제공하는
					환율표.</span></span>
		</div>
	</iframe>

	<iframe class="w2" height="375" width="225" style="text-align: center;"
		src="https://ssltools.forexprostools.com/currency-converter/index.php?from=28&to=12&force_lang=18">
		<table>
			<tr>
				<td><span
					style="font-size: 11px; color: #333333; text-decoration: none;">외환가
						제공하는 통화 변환기<a href="https://kr.investing.com/" rel="nofollow"
						target="_blank"
						style="font-size: 11px; color: #06529D; font-weight: bold;"
						class="underline_link">Investing.com 한국어</a> - 외환포털
				</span></td>
			</tr>
		</table>
	</iframe>
	<iframe class="w3"
		src="https://kr.widgets.investing.com/top-cryptocurrencies?theme=lightTheme&roundedCorners=true"
		width="300" height="480" frameborder="0" allowtransparency="true"
		marginwidth="0" marginheight="0">
		<div class="poweredBy"
			style="font-family: Arial, Helvetica, sans-serif;">
			제공자 <a
				href="https://kr.investing.com?utm_source=WMT&amp;utm_medium=referral&amp;utm_campaign=TOP_CRYPTOCURRENCIES&amp;utm_content=Footer%20Link"
				target="_blank" rel="nofollow">Investing.com</a>
		</div>
	</iframe>
	<script>
		$(function() {
			$(".chatt").css("display", "none")
			var show = function() {
				$(".chatt").toggle();
			}
			$("#icon1").on("click", show);

			$(".w1").css("display", "none");
			$(".w2").css("display", "none");
			$(".w3").css("display", "none");
			$("#icon2_2").css("display", "none");
			$("#icon2_3").css("display", "none");
			$("#icon2_4").css("display", "none");
			var show1 = function() {
				/* $(".w1").toggle(); */
				$("#icon2_2").toggle();
				$("#icon2_3").toggle();
				$("#icon2_4").toggle();
				$(".w1").css("display", "none");
				$(".w2").css("display", "none");
				$(".w3").css("display", "none");
			}

			$("#icon2").on("click", show1);
			var show2 = function() {
				$(".w1").toggle();

			}
			$("#icon2_2").on("click", show2);
			var show3 = function() {
				$(".w2").toggle();

			}
			$("#icon2_3").on("click", show3);
			var show4 = function() {
				$(".w3").toggle();

			}
			$("#icon2_4").on("click", show4);

		})
	</script>
</body>
</html>