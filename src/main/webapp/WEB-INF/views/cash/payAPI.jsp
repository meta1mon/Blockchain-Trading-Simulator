<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 가로길이 820 세로길이 600  -->
<script>
	$(function() {
		var chargeFinished = false;
		$("#childWon").val(opener.document.getElementById("won").value);
		$("#childPrice").val(opener.document.getElementById("cash").value);

 		IMP.init('imp94986051'); // 아임포트 관리자 페이지의 "시스템 설정" > "내 정보" 에서 확인 가능');
		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : $("#childWon").val() + "원 충전 상품", // 상품 이름
			amount : $("#childPrice").val(), // 가격
			buyer_email : $("#email").val(), // 구매자 이메일
			buyer_name : $("#email").val(), // 구매자 이름
			buyer_tel : '010-1234-5678', // 구매자 폰번호
			buyer_addr : '서울특별시 강남구 삼성동', // 구매자 주소
			buyer_postcode : '123-456', // 구매자 우편번호
			display : [ 2, 3, 4, 5, 6 ]
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			chargeFinished = true;
			alert(msg);


		if (chargeFinished) {
			$.ajax({
				url : "<%=request.getContextPath()%>/chargeCash",
					type : "post",
					data : {
						"email" : $("#email").val(),
						"won" : $("#childWon").val(),
						"sellprice" : $("#childPrice").val()
					},
					success : function(data) {
						alert("충전 완료!! db 확인해보즈아아")
					}
				});
			} else {
				alert("db들리는 거 실패임, 왜냐면 결제가 덜 됐거덩");
			}
		});
	})
</script>
<style>
* {
	background-color: white;
}
</style>
</head>
<body>
	<input type="hidden" id="childPrice">
	<input type="hidden" id="childWon">
	<input type="hidden" id="email" value="${loginMember }">
</body>
</html>