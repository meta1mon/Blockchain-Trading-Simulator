<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
	src="${pageContext.request.contextPath}/resources/js/investmentData.js">
	
</script>

<meta charset="UTF-8">
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<jsp:include page='popup.jsp'></jsp:include>
		<jsp:include page="../sub/pop.jsp"></jsp:include>
		<div id="container"
			style="width: 1400px !important; background: white !important;">
			<div class="parent">
				<!-- 위젯, 코인 목록 테이블 -->
				<div class="div1">
					<div id="title"></div>
				</div>
				<div class="div2">
					<div id="chart1">
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
						</div>
						<!-- TradingView Widget END -->
					</div>
				</div>

				<div class="div5">
					<input type="text" id="searchcoin" value=""
						style="width: 100%; display: 'block'" placeholder="코인 검색">
					<table>
						<tr style='text-align: center'>
							<td width= '78.08px !important'></td>
							<td width= '91.36px !important'><img
								src="${pageContext.request.contextPath}/resources/assets/img/down-arrow.svg"
								width="30px" height="30px" onclick="click1()"> <img
								src="${pageContext.request.contextPath}/resources/assets/img/up-arrow.svg"
								width="30px" height="30px" onclick="click2()"></td>
							<td width= '78.77px !important'><img
								src="${pageContext.request.contextPath}/resources/assets/img/down-arrow.svg"
								width="30px" height="30px" onclick="click3()"> <img
								src="${pageContext.request.contextPath}/resources/assets/img/up-arrow.svg"
								width="30px" height="30px" onclick="click4()"></td>
							<td width= '164.31px !important'><img
								src="${pageContext.request.contextPath}/resources/assets/img/down-arrow.svg"
								width="30px" height="30px" onclick="click5()"> <img
								src="${pageContext.request.contextPath}/resources/assets/img/up-arrow.svg"
								width="30px" height="30px" onclick="click6()"></td>
						</tr>
					</table>


					<div id="cointable_div"></div>
				</div>

				<div class="div3">
					<div id="aaaaa"></div>
				</div>

				<div class="div4" id="all_t">
					<c:choose>
						<c:when test="${loginMember == null }">
							<td >
								<table class='table table-striped'>
									<tr>
										<td style="text-align: center; font-size: 30px !important; vertical-align: middle;"><a style="text-align: center; font-size: 30px !important;"  href="<%=request.getContextPath()%>/signup"
											id="join">가입</a><input name="coin" id="coin" type="hidden"
											value="BTC" readonly="readonly" style="text-align: center;"></td>

									</tr>
									<tr>
										<td style="text-align: center; font-size: 30px !important;vertical-align: middle;"><a style="text-align: center; font-size: 30px !important;" href="<%=request.getContextPath()%>/login"
											id="signup" id="login">로그인</a></td>
									</tr>
								</table>
							</td>
						</c:when>
						<c:when test="${loginMember != null }">

							<td>
								<form id="frm11">


									<table class='table table-striped'>

										<tr>
											<th><span>회원계좌번호 : ${acnt.acntno } </span> <span id="su"></span><input
												name="acntno" type="hidden" value="${acnt.acntno }"></th>



										</tr>
										<tr>
											<td>계좌비밀번호 : <input class="password2" id="bankpw"
												name="bankPw" type="password" placeholder="비밀번호">
												<button id="check2" type="button">확인</button></td>
										</tr>


									</table>
								</form>
								<table style="width: 100%; padding-left: 20px;">
									<tr>
										<td style="text-align: center;"><button class="btn_bs"
												id="bought_b">매수</button>
											<button class="btn_bs" id="sold_b">매도</button> <br></td>
									</tr>
								</table>
								<form id="frm22">
									<table style="width: 100%;">
										<tr>
											<th style="font-size: 20px !important; width: 100%;"
												colspan="1">보유잔고</th>
										</tr>
										<tr>
											<td>보유 KRW : &nbsp;&nbsp;&nbsp;<input id="cybcash"
												placeholder="보유 KRW" value="" readonly="readonly"><br>
											</td>

										</tr>
										<tr>
											<th style="font-size: 20px !important;" colspan="1">코인종류</th>
										</tr>
										<tr>
											<td colspan="1">코인 이름 : <input name="coin" id="coin"
												type="text" value="BTC" readonly="readonly"
												style="text-align: center;"><br> 보유 수량 : <input
												style="text-align: center;" id="coincount"
												placeholder="보유 코인" value=""><br></td>
										</tr>

										<tr>
											<th style="font-size: 20px !important;" colspan="1">가격</th>
										</tr>
										<tr>
											<td colspan="1"><input style="text-align: center;"
												id="price_b" type="text" name="buyprice"> <input
												style="text-align: center;" id="price_s" type="text"
												name="sellprice"><br></td>

										</tr>
										<tr>
											<th style="font-size: 20px !important;" colspan="1">수량</th>

										</tr>
										<tr>
											<td colspan="1"><input style="text-align: center;"
												id="cnt_b" type="text" name="buycnt"><input
												style="text-align: center;" id="cnt_s" type="text"
												name="sellcnt"><br></td>
										</tr>
										<tr>
											<th style="font-size: 20px !important;" colspan="1">총액 <a>최소주문금액
													KRW 5,000</a>
											</th>

										</tr>
										<tr>
											<td colspan="1"><input id="totalprice" type="text"
												value="0"><input id="updateprice" name="updateprice"
												type="hidden" value=""><input id="updatecoin"
												name="updatecoin" type="hidden" value=""><br></td>
										</tr>
										<tr>
											<th style="font-size: 20px !important;" colspan="1">수량 <input
												id="acntno" name="acntno" type="hidden"
												value="${acnt.acntno }"> <input id="hidden"
												type="hidden" value="${acnt.cybcash }"></th>
										</tr>


										<tr>
											<td style="text-align: center;" colspan="1"><button
													type="button" class="b_c" value="0.1" onclick="buyp(0.1)">10%</button>
												<button type="button" class="b_c" value="0.25"
													onclick="buyp(0.25)">25%</button>
												<button type="button" class="b_c" value="0.50"
													onclick="buyp(0.5)">50%</button>
												<button type="button" class="b_c" value="1"
													onclick="buyp(1)">100%</button> <br> <br></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="1"><button
													id="bought" type="button">매수</button>
												<button id="sold" type="button">매도</button></td>

										</tr>

									</table>


								</form>

							</td>

						</c:when>
					</c:choose>
					<div class="div6"></div>
				</div>

			</div>
			<div class="div7">

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