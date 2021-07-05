<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#push").click(function() {
			location.href = location.href;
		});

	});
</script>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/popup.css"
	rel="stylesheet" type="text/css" />
</head>
<body>


	<div id="me" style="min-width: 200px !important;">
		<h2>
			<img
				src="${pageContext.request.contextPath}/resources/assets/img/icon_acnt.svg"
				width="30px" height="30px"> 내 계좌번호 : ${acnt.acntno } <img
				id="push"
				src="${pageContext.request.contextPath}/resources/assets/img/icon_wallet.svg"
				width="30px" height="30px">
		</h2>
		<br>
		<div id="money">

			<p>
				<span>코인 보유액&nbsp; <span id="totalcoin"></span>원 |
				</span> <span>현금 보유액&nbsp; <fmt:formatNumber
						value="${acnt.cybcash }" pattern="#,###,###,###" />원|
				</span> <input id="cash" type="hidden" value="${acnt.cybcash }" /> <span>총
					보유자산 &nbsp; <span id="totalAssets"></span>원
				</span>
			</p>

		</div>


		<div class="tab"></div>


		<table id="coinTable">
			<tr>
				<th>보유코인</th>
				<th>보유수량</th>
				<th>매수평균가</th>
				<th>매수금액</th>
				<th>평가금액</th>
				<th>평가손익</th>
			</tr>
			<c:if test="${coinListCount eq 0 }">
				<tr>
					<td colspan="6" align="center"><br> <br> 보유한 코인이
						없습니다.<br> <br></td>
				</tr>
			</c:if>
			<c:if test="${coinListCount ne 0 }">
				<c:forEach var="coin" items="${coinList }" varStatus="status">
					<c:if test="${coin.buycnt>0 }">
						<tr>
							<td class="coinName">${coin.coin }</td>
							<td class="coinCount"><fmt:formatNumber
									value="${coin.buycnt }" pattern="#,###,###,###.########" /> <input
								type="hidden" class="nCoincnt" value="${coin.buycnt }">
							</td>
							<td><fmt:formatNumber value="${coin.buyprice }"
									pattern="#,###,###,###" />&nbsp;원</td>
							<td><fmt:formatNumber value="${coin.buycnt*coin.buyprice }"
									pattern="#,###,###,###,###" />&nbsp;원 <input class="buyAvg"
								type="hidden"
								value="<fmt:formatNumber value="${coin.buycnt*coin.buyprice }" pattern="#############"/>" />
							</td>
							<td class="coinValue">
								<!-- 									평가금액 : api 이용해서 js로 처리 -->
							</td>
							<td class="coinProfit">
								<!-- 									평가손익 : api 이용해서 js로 처리 -->
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
	</div>



	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/popup.js"></script>
</body>
</html>