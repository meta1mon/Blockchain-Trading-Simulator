<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		var alltimer = setInterval(function() { // 1초마다 함수 돌림 ()
			waittable();
		}, 1000);
		var allcoinList = $("#nameList").val();
		var coinArr = allcoinList.slice(1, allcoinList.length - 1).split(", ");

		var allpriceList = $("#priceList").val();
		var priceArr;
		
		
		
		var nowprices = [];
		function waittable() {
			$
					.ajax({
						url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
						type : "get",
						cache : false,
						datatype : "json",
						success : function(data) {
							for (var i = 0; i < coinArr.length; i++) {
								nowprices[i] = [ data['data'][coinArr[i]]['closing_price'] * 1 ]
								// [140, 240]
								console.log(nowprices[i]);
							}

						}

					});
		}
		;

		function compare() {
			for (var i = 0; i < coinList.length; i++) {

				if (priceList[0][i] == display[0]) {
					//미체결 삭제   ?  글번호는  어찌 가지고 오는가 ?
					//체결 인설트   미체결정보를 보내줘야함 
					// 코인인계좌에 insert OR update
					// 계좌에서  update 
				}
			}
		}

	});
</script>

<style>
</style>

</head>
<body>
	<div>
		<input id="nameList" value="${waitblist }" type="text"> <input
			id="priceList" value="${waitresult }" type="text">
			<br>
		<c:forEach items="${waitresult }" var="vo" >
			<input name="coin" value="${vo.coin }" type="text">
			<input name="price" value="${vo.buyprice }" type="text">
			<input name="ubno" value="${vo.ubno }" type="text">
			<input class="${vo.coin }" value="${vo.ubno }" type="text">
		</c:forEach>

	</div>
</body>
</html>