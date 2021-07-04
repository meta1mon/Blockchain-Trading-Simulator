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
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		var alltimer = setInterval(function() { // 1초마다 함수 돌림 ()
			loadCoin();
		}, 1000);

		// 실시간 가격 받을 것
		var nowprices = [];
		// 보유중인 코인 목록
		var haveCoin = [];
		// 모든 코인계좌
		var coinAcntArr = [];
		// 계좌번호 모음
		var acntNoArr = [];
		// 평가총액 배열
		var appraisalArr = [];

		function loadCoin() {
			//  코인계좌의 코인명 유니크하게 가져오기
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
		function loadCoin2() {
			//  코인계좌의 계좌번호 유니크하게 가져오기
			$.ajax({
				url : '${pageContext.request.contextPath}/coinLoad2',
				type : "post",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						acntNoArr[i] = data[i];
					}
					loadCoinAcnt();
				}
			});
		}
		function loadCoinAcnt() {
			// 모든 코인계좌 내용 가져옴
			$.ajax({
				url : '${pageContext.request.contextPath}/coinAcntLoad',
				type : "post",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						coinAcntArr[i] = [ data[i].coin, data[i].buycnt,
								data[i].acntno ];
					}
					livePrice();
				}
			});
		}

		// 빗썸에서 실시간 가격 받아오기
		function livePrice() {
			$
					.ajax({
						url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
						type : "get",
						cache : false,
						datatype : "json",
						success : function(data) {
							for (var i = 0; i < buyCoinArr.length; i++) {
								nowprices[i] = [ data['data'][haveCoin[i]]['closing_price'] * 1 ]
							}
							calcPrice();
						}
					});
		}

		// 계좌별 보유중인 평가총액 계산
		function calcPrice() {
			for (var i = 0; i < coinAcntArr.length; i++) { // 코인 계좌 행수만큼 돌린다
				for (var j = 0; j < haveCoin.length; j++) {
					if (coinAcntArr[i][0] == haveCoin[j]) {
						appraisalArr[i] += coinAcntArr[i][1] * nowprices[i];
					}
				}
			}
		}
	});
</script>
</head>
<body>
</body>
</html>