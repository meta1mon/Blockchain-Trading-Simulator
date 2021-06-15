<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/investment.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/investmentData.js"></script>

<meta charset="UTF-8">
<title>InvestmentPage</title>
</head>
<body>
	<div id="center">
		<table>
			<tr>
				<td>
					<!-- TradingView Widget BEGIN -->
					<div class="tradingview-widget-container">
						<div id="tradingview_0a196"></div>
						<div class="tradingview-widget-copyright">
							TradingView 제공 <a
								href="https://kr.tradingview.com/symbols/BTCKRW/?exchange=BITHUMB"
								rel="noopener" target="_blank"><span class="blue-text">BTCKRW
									차트</span></a>
						</div>
						<script type="text/javascript"
							src="https://s3.tradingview.com/tv.js"></script>
						<script type="text/javascript">
							new TradingView.widget({
								"width" : 1000,
								"height" : 500,
								"symbol" : "BITHUMB:BTCKRW",
								"interval" : "D",
								"timezone" : "Asia/Seoul",
								"theme" : "light",
								"style" : "1",
								"locale" : "ko",
								"toolbar_bg" : "#f1f3f6",
								"enable_publishing" : true,
								"withdateranges" : true,
								"allow_symbol_change" : true,
								"container_id" : "tradingview_0a196"
							});
						</script>
					</div> <!-- TradingView Widget END -->

				</td>
				<td>
					<div id="cointable_div"
						style="overflow: auto; width: 500px; height: 500px;"></div>

				</td>
			</tr>
		</table>



	</div>

</body>
</html>