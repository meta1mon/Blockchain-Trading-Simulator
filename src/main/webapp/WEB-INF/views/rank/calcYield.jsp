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
		// 실시간 가격 받을 것
		var nowprices = [];
		var haveCoin = [];
		var acntNoArr = new Array();
		var appraisalArr = [];
		var acntNoStr = "";
		loadCoin();

		// 코인 이름 distinct로 받아오기(보유량이 0이면 안가져옴)
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
						acntNoStr += data[i] + ",";
					}

					/* livePrice(); */

					// 코인 하나도 안갖고 있는 회원의 랭킹 처리
					console.log(acntNoStr);
				}
			});
			
			$.ajax({
				url : '${pageContext.request.contextPath}/noCoinRank',
				type : "post",
				data :  {"acnt" : acntNoStr},
				success : function(data) {
					if (data > 0) {
						alert("코인미보유자 랭킹 처리 성공");
					} else {
						alert("코인미보유자 랭킹 처리 실패");
					}
				}
			});
		}

		/* 		// 실시간 코인 가격 불러오기
		 function livePrice() {
		 $.ajax({
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

		 // 이 페이지로 들어왔을 때(수익률 계산함수 호출되었을 때) 당시의 총 자산(평가금+현금) 계산
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
		
		 // 코인 보유 중인 회원의 랭킹 처리
		 for (var i = 0; i < acntNoArr.length; i++) {
		 $.ajax({
		 url : '${pageContext.request.contextPath}/updateRank',
		 type : "post",
		 cache : false,
		 data : { "acntno" : acntNoArr[i],
		 "appraisal" : appraisalArr[i] 
		 },
		 success : function(data) {
		 if(data > 0) {
		 console.log("Daily 랭크 반영 성공");
		 } else {
		 console.log("Daily 랭크 반영 실패");
		 }
		 }
		 });
		 }
		 } */

	});
</script>
</head>
<body>
	<c:forEach items="${coinAcnt }" var="ca" varStatus="status">
		<input type="text" id="acnt${status.index }" value="${ca.acntno }">
		<input type="text" id="coin${status.index }" value="${ca.coin }">
		<input type="text" id="buycnt${status.index }" value="${ca.buycnt}">
		<input type="text" value="" id="ca${status.index }">
		<br>
	</c:forEach>
</body>
</html>