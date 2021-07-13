<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
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
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="${pageContext.request.contextPath}/resources/js/pinpad.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
	integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/investmentData.js"></script>
<style>
.popup {
	position: fixed;
	bottom: 0px;
	right: -400px;
	width: 400px;
	height: 150px;
	background: #FBCCD1;
	border: 1px solid black;
	border-radius: 5px;
	padding: 40px;
	text-align: center;
	font: 18px !important;
	color: black;
}

.popup1 {
	position: fixed;
	bottom: 0px;
	right: -400px;
	width: 400px;
	height: 150px;
	background: #90C5F9;
	border: 1px solid black;
	border-radius: 5px;
	padding: 40px;
	text-align: center;
	font: 18px !important;
	color: black;
}

#mainTable {
	width: 453px;
	text-align: center;
}

#mainTable td {
	padding: 0px;
}
</style>
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
					<!-- 매수 매도 오디오 부분   -->
					<audio id="boughtmusic">
						<source
							src="${pageContext.request.contextPath}/resources/audio/bought.wav">
					</audio>
					<audio id="soldmusic">
						<source
							src="${pageContext.request.contextPath}/resources/audio/sold.wav">
					</audio>
					<div id="title"></div>
				</div>
				<!-- 메인차트부분   -->
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
				<!-- 전체 코인 테이블 부분   -->
				<div class="div5">
					<input type="text" id="searchcoin" value=""
						style="width: 100%; display: 'block'" placeholder="코인 검색">
					<table>
						<tr style='text-align: center'>
							<td width='78.08px !important'></td>
							<td width='91.36px !important'><img
								src="${pageContext.request.contextPath}/resources/assets/img/down-arrow.svg"
								width="30px" height="30px" onclick="click1()"> <img
								src="${pageContext.request.contextPath}/resources/assets/img/up-arrow.svg"
								width="30px" height="30px" onclick="click2()"></td>
							<td width='78.77px !important'><img
								src="${pageContext.request.contextPath}/resources/assets/img/down-arrow.svg"
								width="30px" height="30px" onclick="click3()"> <img
								src="${pageContext.request.contextPath}/resources/assets/img/up-arrow.svg"
								width="30px" height="30px" onclick="click4()"></td>
							<td width='164.31px !important'><img
								src="${pageContext.request.contextPath}/resources/assets/img/down-arrow.svg"
								width="30px" height="30px" onclick="click5()"> <img
								src="${pageContext.request.contextPath}/resources/assets/img/up-arrow.svg"
								width="30px" height="30px" onclick="click6()"></td>
						</tr>
					</table>


					<div id="cointable_div"></div>
				</div>
				<!-- 호가창부분   -->
				<div class="div3">
					<div id="aaaaa"></div>
				</div>
				<!-- 매수 매도 부분   -->
				<div class="div4" id="all_t">
					<table class="table" id="mainTable">
						<c:choose>
							<c:when test="${loginMember == null }">
								<tr>
									<td
										style="text-align: center; font-size: 30px !important; vertical-align: middle;"><a
										style="text-align: center; font-size: 30px !important; color: #8c66c8;"
										href="<%=request.getContextPath()%>/signup" id="join">회원가입</a><input
										name="coin" id="coin" type="hidden" value="BTC"
										readonly="readonly" style="text-align: center;"></td>

								</tr>
								<tr>
									<td
										style="text-align: center; font-size: 30px !important; vertical-align: middle;"><a
										style="text-align: center; font-size: 30px !important; color: #8c66c8;"
										href="<%=request.getContextPath()%>/login" id="signup"
										id="login">로그인</a></td>
								</tr>
							</c:when>
							<c:when test="${loginMember != null }">
								<tr id="now_price" style="width: 226.5px;">
								</tr>
							

								<form id="frm11">
									<tr>
										<td style="width: 223px;">회원계좌번호</td>
										<td>${acnt.acntno }<span id="su"></span><input
											name="acntno" type="hidden" value="${acnt.acntno }"></td>
									</tr>
									<tr>
										<td width="100px">계좌비밀번호</td>
										<td><input class="password2" id="bankpw" name="bankPw"
											type="password" placeholder="비밀번호">
											<button id="check2" type="button"
												style="border-radius: 8px; outline: none; border: 2px #E3C8F8 solid; cursor: pointer; background-color: #E3C8F8; color: white;">확인</button>
										</td>
									</tr>
								</form>
								<tr>
									<td style="text-align: center;" ><button class="btn_bs"
											id="bought_b"
											style="border-radius: 8px; border: 0px; background-color: #f75467; outline: none; cursor: pointer;">매수</button>
									</td>
									<td><button  class="btn_bs" id="sold_b"
											style=" border-radius: 8px; outline: none; cursor: pointer;">매도</button>
										<br></td>
								</tr>
								<form id="frm22">
									<tr>
										<td width="100px">보유 금액</td>
										<td><input id="cybcash" value="" readonly="readonly">
										</td>
									</tr>
									<tr>
										<td style="width: 100px">코인 이름</td>
										<td><input name="coin" id="coin" type="text" value="BTC"
											readonly="readonly" style="text-align: center;"></td>
									</tr>
									<tr>
										<td width="100px">보유 수량</td>
										<td><input style="text-align: center;" id="coincount"
											placeholder="보유 코인" value="" readonly></td>
									</tr>
									<tr>
										<td>가격</td>
										<td><input style="text-align: center;" id="price_b"
											type="text" name="buyprice"><input
											style="text-align: center;" id="price_s" type="text"
											name="sellprice"></td>

									</tr>
									<tr>
										<td>수량</td>
										<td><input style="text-align: center;" id="cnt_b"
											type="text" name="buycnt"><input
											style="text-align: center;" id="cnt_s" type="text"
											name="sellcnt"></td>
									</tr>
									<tr>
										<td>총액</td>
										<td><input id="totalprice" type="text" value="0"><input
											id="updateprice" name="updateprice" type="hidden" value=""><input
											id="updatecoin" name="updatecoin" type="hidden" value=""><br></td>
									</tr>
									<tr>
										<td colspan="2"><input id="acntno" name="acntno"
											type="hidden" value="${acnt.acntno }"> <input
											id="hidden" type="hidden" value="${acnt.cybcash }"></td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="2"><button
												type="button" class="b_c" value="0.1" onclick="buyp(0.1)">10%</button>
											<button type="button" class="b_c" value="0.25"
												onclick="buyp(0.25)">25%</button>
											<button type="button" class="b_c" value="0.50"
												onclick="buyp(0.5)">50%</button>
											<button type="button" class="b_c" value="1" onclick="buyp(1)">100%</button>
											<br> <br></td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="2"><button
												id="bought" type="button"
												style="border-radius: 8px; background-color: #f75467; border: 0px; outline: none; cursor: pointer;">매수</button>
											<button id="sold" type="button"
												style="border-radius: 8px; background-color: #4387f9; border: 0px; outline: none; cursor: pointer;">매도</button></td>

									</tr>
								</form>
							</c:when>
						</c:choose>
					</table>
				</div>

			</div>
			<!-- 체결 & 미체결 부분   -->
			<div class="div7">

				<table id="wb_ws" class='table'>

					<tr>
						<th colspan="1"><span style="font-size: 30px">미체결주문</span></th>
					</tr>
					<tr>
						<td><div id="aj_wb"></div>
							<div id="aj_ws"></div></td>

					</tr>

					<tr>

						<th colspan="1"><span style="font-size: 30px">체결주문</span>
							<div id="bcnt"></div> <input type="hidden" id="s_bcnt" value=""></input><input
							type="hidden" id="s_scnt" value=""></input></th>
					</tr>
					<tr>

						<td><div id="aj_b"></div>
							<div id="aj_s"></div></td>
					</tr>
				</table>
			</div>


		</div>

		<!-- 매수 매도 애니매이션 부분   -->
		<div id="alertbuy" class="popup" style="border: 0px;">
			<a style="font-size: 18px !important;">매수가 체결되었습니다.</a>
			<table id="alertbuy_1" class='table table-striped'>

				<tr>
					<td>거래소</td>
					<td>BTS</td>
				</tr>
				<tr>
					<%
						Date nowTime = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
					%>
					<td>체결시간</td>
					<td><%=sf.format(nowTime)%></td>
				</tr>
			</table>
		</div>
		<div id="alertsold" class="popup1">
			<a style="font-size: 18px !important;">매도가 체결되었습니다.</a>
			<table id="alertbuy_2" class='table table-striped'>

				<tr>
					<td>거래소</td>
					<td>BTS</td>
				</tr>
				<tr>
					<td>체결시간</td>
					<td><%=sf.format(nowTime)%></td>
				</tr>
			</table>


		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
	<!--가상 키보드 부분  -->
	<script type="text/javascript">
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