<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
/* 		var alltimer = setInterval(function() { // 1초마다 함수 돌림 ()
			loadCoin();
		}, 500000000); */
		// 실시간 가격 받을 것
		var nowprices = [];
		var haveCoin = [];
		var acntNoArr = [];
		var appraisalArr = [];
		loadCoin();

		// 코인 이름 distinct로 받아오기
		function loadCoin() {
			$.ajax({
				url : '${pageContext.request.contextPath}/coinLoad',
				type : "post",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						haveCoin[i] = data[i];
					}
					loadCoin2();
				}
			});
		}
		
		//  코인계좌의 계좌번호 유니크하게 가져오기
		function loadCoin2() {
			$.ajax({
				url : '${pageContext.request.contextPath}/coinLoad2',
				type : "post",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						acntNoArr[i] = data[i];
					}
					livePrice();
				}
			});
		}

		function livePrice() {
			$
					.ajax({
						url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
						type : "get",
						cache : false,
						datatype : "json",
						success : function(data) {
							for (var i = 0; i < haveCoin.length; i++) {
								nowprices[i] = [ data['data'][haveCoin[i]]['closing_price'] * 1 ]
							}
							calcPrice();
						}
					});
		}

		function calcPrice() {
			for (var i = 0; i < ${coinAcnt.size()}; i++) {
				for (var j = 0; j < haveCoin.length; j++) {
					if ($("#coin" + i).val() == haveCoin[j]) {
						$("#ca" + i).val($("#buycnt" + i).val() * nowprices[j]);
					}
				}
			}
			
			for (var i = 0; i < acntNoArr.length; i++) {
				var sum = 0;
				for (var j = 0; j < ${coinAcnt.size()}; j++) {
					if(acntNoArr[i] == $("#acnt"+j).val()) {
						sum += parseInt($("#ca" + j).val());
					}
				}
				appraisalArr[i] = sum;
			}
			
			console.log("ㅁㄴㅇㄻㄴ얼이ㅏㄴㅁ;럼ㄴ이ㅏ;런아ㅣ런ㅁ아ㅣ럼ㄴ아ㅣㄹ;ㅓㅁㄴ아ㅣ럼아닐;ㅓ마니;런미ㅏ런미ㅏ;ㄹ어마ㅣㄴㄹ;ㅓㄴㅇ마림;");
			for (var i = 0; i < acntNoArr.length; i++) {
				$.ajax({
					url : '${pageContext.request.contextPath}/insertRank',
					type : "post",
					cache : false,
					data : { "acntno" : acntNoArr[i],
						"appraisal" : appraisalArr[i] 
					},
					datatype : "json",
					success : function(data) {
						if(data > 0) {
							alert("성공");
						} else {
							alert("실패");
						}
					}
				});
			}
		}
	});
</script>
</head>
<body>
	<c:forEach items="${coinAcnt }" var="ca" varStatus="status">
		<input type="hidden" id="acnt${status.index }"
			value="${ca.acntno }">
		<input type="hidden" id="coin${status.index }" value="${ca.coin }">
		<input type="hidden" id="buycnt${status.index }"
			value="${ca.buycnt}">
		<input type="hidden" value="" id="ca${status.index }">
	</c:forEach>
</body>
</html>