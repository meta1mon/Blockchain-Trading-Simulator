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
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div id="center">
		<table>
			<tr>
				<td>
					<!-- TradingView Widget BEGIN -->
					<div class="tradingview-widget-container">
						<div id="tradingview_3fe73"></div>
						<div class="tradingview-widget-copyright">
							TradingView 제공 <a
								href="https://kr.tradingview.com/symbols/BTCKRW/?exchange=BITHUMB"
								rel="noopener" target="_blank"><span class="blue-text">BTS
									차트</span></a>
						</div>
						<script type="text/javascript"
							src="https://s3.tradingview.com/tv.js"></script>

					</div> <!-- TradingView Widget END -->
				</td>
				<td>
					<div>
						<input type="text" id="searchcoin" style="width: 400px;" value="">
					</div>
					<div id="cointable_div"
						style="overflow: auto; width: 500px; height: 500px;"></div>


				</td>
			</tr>
		</table>
		<br>
		<div id="currenttable">
			<table class='table table-striped'
				style="width: 500px; height: 500px;">
				<tr>
					<td>현재가</td>
					<td>수량</td>
					<td>누적수량</td>
				</tr>
				<tr>
					<td>11111</td>
					<td>11111</td>
					<td>1111</td>
				</tr>
				<tr>
					<td>22222</td>
					<td>22222</td>
					<td>22222</td>
				</tr>
				<tr>
					<td>333333</td>
					<td>333333</td>
					<td>333333</td>
				</tr>
				<tr>
					<td>44444</td>
					<td>44444</td>
					<td>44444</td>
				</tr>
				<tr>
					<td>55555</td>
					<td>55555</td>
					<td>55555</td>
				</tr>
				
			</table>
			<table style="border: solid 3px; width: 500px; height: 500px;">

				<tr>
					<td colspan="1"><button value="">매도</button>
						<button value="">매수</button></td>
				</tr>
				<tr>
					<td><input id="cash" placeholder="보유 KRW"> <br> <input
						id="cash" placeholder="매도가능 코인"></td>

				</tr>
				<tr>
					<th colspan="1">가격</th>

				</tr>
				<tr>
					<td colspan="1"><input id="cash1"></td>
				</tr>
				<tr>
					<th colspan="1">수량</th>

				</tr>
				<tr>
					<td colspan="1"><input id="cash1"></td>
				</tr>


				<tr>
					<td colspan="1"><button value="10%">10%</button>
						<button value="25%">25%</button>
						<button value="50%">50%</button>
						<button value="100%">100%</button></td>
				</tr>
				<tr>
					<td colspan="1"><button value="매도">매도</button></td>

				</tr>

			</table>
			<table style="border: solid 3px; width: 500px; height: 500px;">

				<tr>
					<th colspan="1">회원계좌번호 : <a>불러와</a><input type="text"
						placeholder="비밀번호"></th>

				</tr>
				<tr>
					<th colspan="1">미체결주문</th>



				</tr>
				<tr>
					<th colspan="1">체결주문</th>




				</tr>


			</table>
		</div>




	</div>

</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>