<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/investment.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/pinpad.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="${pageContext.request.contextPath}/resources/js/pinpad.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/investmentData.js"></script>

<script type="text/javascript">


</script>
<meta charset="UTF-8">
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="container">
			<!-- 위젯, 코인 목록 테이블 -->
			<table id="widgetTB">
				<tr>
					<td>
						<div id="title"></div>

					</td>
				</tr>
				<tr>
					<td id="chart1">
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
					<td><span>&nbsp;&nbsp;</span></td>
					<td><input type="text" id="searchcoin" value=""
						style="width: 100%; display: 'block'" placeholder="코인 검색">
						<div id="cointable_div"></div></td>
				</tr>
			</table>

			<br>
			<div id="alltable">
				<table id="all_t" class='table table-striped'>
					<tr>
						<td>
							<div id="aaaaa"></div>
						</td>


						<c:choose>
							<c:when test="${loginMember == null }">
								<td>
									<table>
										<tr>
											<td><a href="<%=request.getContextPath()%>/signup"
												id="join">가입</a><input name="coin" id="coin" type="hidden"
												value="BTC" readonly="readonly" style="text-align: center;"></td>

										</tr>
										<tr>
											<td><a href="<%=request.getContextPath()%>/login"
												id="signup" id="login">로그인</a></td>
										</tr>
									</table>
								</td>
							</c:when>
							<c:when test="${loginMember != null }">

								<td>
									<form id="frm11">


										<table>

											<tr>
												<th><span>회원계좌번호 : ${acnt.acntno } </span> <span
													id="su"></span><input name="acntno" type="hidden"
													value="${acnt.acntno }"></th>



											</tr>
											<tr>
												<td>계좌비밀번호 : <input class="password2" id="bankpw"
													name="bankPw" type="password" placeholder="비밀번호">
													<button id="check2" type="button">확인</button></td>
											</tr>


										</table>
									</form>
									<table>
										<tr>
											<td><button value="" id="bought_b">매수</button>
												<button value="" id="sold_b">매도</button>
										</tr>
									</table>
									<form id="frm22">
										<table>
											<tr>
												<th colspan="1">보유잔고</th>
											</tr>
											<tr>
												<td>보유 KRW : &nbsp;&nbsp;&nbsp;<input id="cybcash"
													placeholder="보유 KRW" value="" readonly="readonly">
													<br> 매도가능 수량:<input id="coincount"
													placeholder="매도가능 코인">
													<button id="check_cnt" type="button">수량확인</button></td>

											</tr>
											<tr>
												<th colspan="1">코인종류</th>
											</tr>
											<tr>
												<td colspan="1"><input name="coin" id="coin"
													type="text" value="BTC" readonly="readonly"
													style="text-align: center;"></td>
											</tr>

											<tr>
												<th colspan="1">가격</th>
											</tr>
											<tr>
												<td colspan="1"><input id="price_b" type="text"
													name="buyprice"> <input id="price_s" type="text"
													name="sellprice"></td>

											</tr>
											<tr>
												<th colspan="1">수량</th>

											</tr>
											<tr>
												<td colspan="1"><input id="cnt_b" type="text"
													name="buycnt"><input id="cnt_s" type="text"
													name="sellcnt"></td>
											</tr>
											<tr>
												<th colspan="1">총액</th>

											</tr>
											<tr>
												<td colspan="1"><input id="totalprice" type="text"
													value="0"><input id="updateprice"
													name="updateprice" type="text" value=""></td>
											</tr>
											<tr>
												<th colspan="1">매수 총자산대비/매수 코인개수 대비<input id="acntno"
													name="acntno" type="hidden" value="${acnt.acntno }">
													<input id="hidden" type="hidden" value="${acnt.cybcash }"></th>
											</tr>


											<tr>
												<td colspan="1"><button value="10%">10%</button>
													<button value="25%">25%</button>
													<button value="50%">50%</button>
													<button value="100%">100%</button></td>
											</tr>
											<tr>
												<td colspan="1"><button id="bought" type="button">매수</button>
													<button id="sold" type="button">매도</button></td>

											</tr>

										</table>


									</form>

								</td>

							</c:when>
						</c:choose>

					</tr>
				</table>
				<table id="wb_ws" class='table table-striped'>

					<tr>
						<th colspan="1">미체결주문</th>
					</tr>
					<tr>
						<td><div id="aj_wb"></div>
							<div id="aj_ws"></div></td>

					</tr>

					<tr>
						<th colspan="1">체결주문</th>
					</tr>
					<tr>

						<td><div id="aj_b"></div>
							<div id="aj_s"></div></td>
					</tr>
				</table>

			</div>
		</div>


		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
	<!--가상 키보드 부분  -->
	<script type="text/javascript">
		//pinpad 생성
		new pinpad({
			ref : {
				el : '.password2'
			},
			immediate : false,
			maxLength : 4,
			close : '<i class="far fa-times-circle"></i>',
			desc : 'ACCOUNT PASSWORD',
			passcode : true,
			letterReplace : {
				'del' : '<i class="fas fa-times delete"></i>',
				'done' : '<i class="fas fa-check done"></i>',
			}
		});

		$(function() {
			$('.table-striped tbody tr:nth-of-type(odd)').css(
					'background-color', 'rgb(227,200,248, 0.0453)');
		});
	</script>
</body>
</html>