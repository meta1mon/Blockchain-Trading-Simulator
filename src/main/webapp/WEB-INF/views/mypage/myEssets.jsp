<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/myEssets.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="wrapper">
	<jsp:include page="myNav.jsp"></jsp:include>
		<div id="me">
			<h2>
				<img class="icon" src="${pageContext.request.contextPath}/resources/assets/img/icon_acnt.svg" width="30px" height="30px"> 내 계좌번호 : ${acnt.acntno }
			</h2>
			<br>
			<div id="money">
				<ul>
					<li><img class="icon" src="${pageContext.request.contextPath}/resources/assets/img/icon_bitcoin.svg" width="30px" height="30px">
						<span>코인 보유액&nbsp; <span id="totalcoin"></span>&nbsp;&nbsp;&nbsp;원</span></li>
					<li><img class="icon" src="${pageContext.request.contextPath}/resources/assets/img/icon_won.svg" width="30px" height="30px">
						<span>현금 보유액&nbsp; <fmt:formatNumber value="${acnt.cybcash }" pattern="#,###,###,###,###" />&nbsp;&nbsp;&nbsp;원</span>
						<input id="cash" type="hidden" value="${acnt.cybcash }"/>
					</li>
					<li><img class="icon" src="${pageContext.request.contextPath}/resources/assets/img/icon_wallet.svg" width="30px" height="30px">
						<span>총 보유자산 &nbsp; <span id="totalAssets"></span>&nbsp;&nbsp;&nbsp;원</span></li>
				</ul>
			</div>


			<div class="tab">
				<button class="tablinks" value="coinList">보유코인 목록</button>
				<button class="tablinks" value="deal">체결</button>
				<button class="tablinks" value="nodeal">미체결</button>
			</div>

 			<div id="coinList" class="tabcontent">
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
							<td colspan="6" align="center"><br> <br> 
							보유한 코인이 없습니다.<br> <br></td>
						</tr>
					</c:if>
					<c:if test="${coinListCount ne 0 }">
						<c:forEach var="coin" items="${coinList }" varStatus="status">
							<c:if test="${coin.buycnt>0 }">
							<tr>
								<td class="coinName">${coin.coin }</td>
								<td class="coinCount"><fmt:formatNumber value="${coin.buycnt }" pattern="#,###,###,###,###.########" />
								<input type="hidden" class="nCoincnt" value="${coin.buycnt }"> </td>
								<td><fmt:formatNumber value="${coin.buyprice }" pattern="#,###,###,###,###" />&nbsp;원</td>
								<td>
									<fmt:formatNumber value="${coin.buycnt*coin.buyprice }" pattern="#,###,###,###,###" />&nbsp;원
									<input class="buyAvg" type="hidden" value="<fmt:formatNumber value="${coin.buycnt*coin.buyprice }" pattern="#############"/>"/>
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
			
			<div id="deal" class="tabcontent">
				<h3>체결 매수주문내역</h3>
				<table class="historyTable">
					<tr>
						<th>접수번호</th>
						<th>코인종류 </th>
						<th>코인개수 </th>
						<th>매수가격 </th>
						<th>매수날짜 </th>
					</tr>
					<c:forEach var="blist" items="${boughtResult }" varStatus="status">
						<c:if test="${status.index <4}">
							<tr>
								<td>${blist.ubno }</td>
								<td>${blist.coin }</td>
								<td><fmt:formatNumber value="${blist.buycnt }" pattern="#,###,###,###,###" /></td>
								<td><fmt:formatNumber value="${blist.buyprice }" pattern="#,###,###,###,###" />&nbsp;원</td>
								<td>${blist.bdate }</td>
							</tr>
						</c:if>
						<c:if test="${status.index>=4 }">
							<tr class="blist" style="display: none;">
								<td>${blist.ubno }</td>
								<td>${blist.coin }</td>
								<td><fmt:formatNumber value="${blist.buycnt }" pattern="#,###,###,###,###" /></td>
								<td><fmt:formatNumber value="${blist.buyprice }" pattern="#,###,###,###,###" />&nbsp;원</td>
								<td>${blist.bdate }</td>
							</tr>
						</c:if>
						
					</c:forEach>
				</table>
				<input type="button" id="bExpand" value="내역 더 보기" class="expandBtn"></input>
				
				<h3>체결 매도주문내역</h3>
				<table class="historyTable">
					<tr>
						<th>접수번호</th>
						<th>코인종류 </th>
						<th>코인개수 </th>
						<th>매수가격 </th>
						<th>매수날짜 </th>
					</tr>
					<c:forEach var="slist" items="${soldResult }" varStatus="status">
						<c:if test="${status.index <4}">
							<tr>
								<td>${slist.usno }</td>
								<td>${slist.coin }</td>
								<td><fmt:formatNumber value="${slist.sellcnt }" pattern="#,###,###,###,###" /></td>
								<td><fmt:formatNumber value="${slist.sellprice }" pattern="#,###,###,###,###" />&nbsp;원</td>
								<td>${slist.sdate }</td>
							</tr>
						</c:if>
						<c:if test="${status.index >=4}">
							<tr class="slist" style="display: none;">
								<td>${slist.usno }</td>
								<td>${slist.coin }</td>
								<td><fmt:formatNumber value="${slist.sellcnt }" pattern="#,###,###,###,###" /></td>
								<td><fmt:formatNumber value="${slist.sellprice }" pattern="#,###,###,###,###" />&nbsp;원</td>
								<td>${slist.sdate }</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>  
				<input type="button" id="sExpand" value="내역 더 보기" class="expandBtn"></input>
			</div>
			
			
			
			
			<div id="nodeal" class="tabcontent">
				<h3>미체결 매수주문내역</h3>
				<table class="historyTable">
					<tr>
						<th>접수번호</th>
						<th>코인종류 </th>
						<th>코인개수 </th>
						<th>매수가격 </th>
						<th>매수날짜 </th>
					</tr>
					<c:forEach var="wblist" items="${wBoughtResult }" varStatus="status">
						<c:if test="${status.index <4}">
							<tr>
								<td>${wblist.ubno }</td>
								<td>${wblist.coin }</td>
								<td><fmt:formatNumber value="${wblist.buycnt }" pattern="#,###,###,###,###" /></td>
								<td><fmt:formatNumber value="${wblist.buyprice }" pattern="#,###,###,###,###" />&nbsp;원</td>
								<td>${wblist.wbdate }</td>
							</tr>
						</c:if>
						<c:if test="${status.index >=4}">
							<tr class="wblist" style="display: none;">
								<td>${wblist.ubno }</td>
								<td>${wblist.coin }</td>
								<td><fmt:formatNumber value="${wblist.buycnt }" pattern="#,###,###,###,###" /></td>
								<td><fmt:formatNumber value="${wblist.buyprice }" pattern="#,###,###,###,###" />&nbsp;원</td>
								<td>${wblist.wbdate }</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<input type="button" id="wbExpand" value="내역 더 보기" class="expandBtn"></input>
				
				<h3>미체결 매도주문내역</h3>
				<table class="historyTable">
					<tr>
						<th>접수번호</th>
						<th>코인종류 </th>
						<th>코인개수 </th>
						<th>매수가격 </th>
						<th>매수날짜 </th>
					</tr>
					<c:forEach var="wslist" items="${wSoldResult }" varStatus="status">
						<c:if test="${status.index <4}">
							<tr>
								<td>${wslist.usno }</td>
								<td>${wslist.coin }</td>
								<td><fmt:formatNumber value="${wslist.sellcnt }" pattern="#,###,###,###,###" /></td>
								<td><fmt:formatNumber value="${wslist.sellprice }" pattern="#,###,###,###,###" />&nbsp;원</td>
								<td>${wslist.wsdate }</td>
							</tr>
						</c:if>
						<c:if test="${status.index >=4}">
							<tr class="wslist" style="display: none;">
								<td>${wslist.usno }</td>
								<td>${wslist.coin }</td>
								<td><fmt:formatNumber value="${wslist.sellcnt }" pattern="#,###,###,###,###" /></td>
								<td><fmt:formatNumber value="${wslist.sellprice }" pattern="#,###,###,###,###" />&nbsp;원</td>
								<td>${wslist.wsdate }</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<input type="button" id="wsExpand" value="내역 더 보기" class="expandBtn"></input>
				
			</div>
			
			
			

		
		</div>
	</div>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/myEssets.js"></script>
</body>
</html>