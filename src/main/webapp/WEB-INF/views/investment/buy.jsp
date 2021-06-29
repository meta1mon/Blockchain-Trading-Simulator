<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>BTS</title>

</head>
<body>
	<input id="nameList" value="${waitblist }" type="hidden">
	<br>
	<c:forEach items="${waitresult }" var="vo">
		<input class="${vo.coin }" value="${vo.buyprice }" type="hidden" style="width: 500px">
		<br>
	</c:forEach>
	<script type="text/javascript">
	$(function() {
		var alltimer = setInterval(function() { // 1초마다 함수 돌림 ()
 			loadValues();
 			livePrice();
			comparePrice();
		}, 1000);
		var allcoinList = $("#nameList").val();

		// 코인 이름 배열
		var coinArr = allcoinList.slice(1, allcoinList.length - 1).split(", ");

		var nowprices = [];

 		function loadValues() {
			$.ajax({
				url : '${pageContext.request.contextPath}/buyLoad',
				type : "get",
				cache : false,
				success : function(data) {
					console.log(data);					
					console.log(typeof data);					
					console.log(data[0]);					
					console.log(data.get(0));					

				}
			});
		} */
		// 빗썸에서 실시간 가격 받아오기
		function livePrice() {
			$.ajax({
						url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
						type : "get",
						cache : false,
						datatype : "json",
						success : function(data) {
							for (var i = 0; i < coinArr.length; i++) {
								nowprices[i] = [ data['data'][coinArr[i]]['closing_price'] * 1 ]
								console.log(nowprices[i]);
							}

						}
					});
		}


		// 미체결 매수 내역과 빗썸의 가격을 비교
		function comparePrice() {
			priceArr = new Array(coinArr.length);
			for (var i = 0; i < priceArr.length; i++) { // 코인 종류만큼 돌린다
				priceArr[i] = new Array($("." + coinArr[i]).length);
				for (var j = 0; j < priceArr[i].length; j++) { // 해당 코인을 클래스로 가지는 수만큼 돌린다	
					var rawData = $("." + coinArr[i]).eq(j).val();
					if (rawData >= 1000) { // 소숫점 제거를 위함. 단가 1000원부터는 1원 이상 간격으로 상승함
						priceArr[i][j] = Math.floor(rawData);
					} else {
						priceArr[i][j] = rawData * 1;
					}
				}
			}

			for (var i = 0; i < priceArr.length; i++) { // 코인 종류만큼 돌린다
				for (var j = 0; j < priceArr[i].length; j++) { // 해당 코인을 클래스로 가지는 수만큼 돌린다	
					if (nowprices[i] == priceArr[i][j]) {
						console.log(coinArr[i] + "코인이 " + priceArr[i][j]
								+ " 가격으로 구매됨");
						$.ajax({
							url : "${pageContext.request.contextPath}/bought",
							type : "post",
							data : {
								"buyCoin" : coinArr[i],
								"buyPrice" : priceArr[i][j]
							},
							success : function(data) {
								if (data > 0) {
									console.log("구매 성공");
									window.location.reload();
								} else {
									console.log("구매 실패");

								}
							}
						})
					}
				}
			}
		}
	});
</script>
</body>
</html>