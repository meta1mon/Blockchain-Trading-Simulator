<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#cashShop {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
	border: solid 1px black;
}

#cashShop table {
	margin: 0 auto;
}

#cashShop li {
	list-style-type: none;
	float: left;
	margin: 0 50px;
}
</style>
<title>Insert title here</title>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div id="cashShop">
		<form action="#" method="post">
			<table>
			<tr>
			<td colspan="3">
			<h1>1단계 : 결제 금액을 선택해 주세요</h1>
			<h4>할인 EVENT 기간 : 06/01 ~ 06/30</h4>
			</td>
			</tr>
			<tr>
			<td>모의 투자 충전 금액</td>
			<td>KRW</td>
			<td>할인율</td>
			</tr>
			<tr>
			<td>1,000,000원</td>
			<td>1,000원</td>
			<td>0%</td>
			<td><input type="radio" value="1" name="cash" class="cash"></td>
			</tr>
			<tr>
			<td>5,000,000원</td>
			<td>5,000원</td>
			<td>0%</td>
			<td><input type="radio" value="2" name="cash" class="cash"></td>
			</tr>
			<tr>
			<td>10,000,000원</td>
			<td>9,000원</td>
			<td>10%</td>
			<td><input type="radio" value="3" name="cash" class="cash"></td>
			</tr>
			<tr>
			<td>50,000,000원</td>
			<td>42,500원</td>
			<td>15%</td>
			<td><input type="radio" value="4" name="cash" class="cash"></td>
			</tr>
			<tr>
			<td>100,000,000원</td>
			<td>80,000원</td>
			<td>20%</td>
			<td><input type="radio" value="5" name="cash" class="cash"></td>
			</tr>
			<tr>
			<td colspan="3"><h1>2단계 : 최종 금액을 확인해 주세요</h1></td>
			</tr>
			<tr>
			<td>충전할 금액:</td>
			<td colspan="2"><span class="cyber">&nbsp;</span></td>
			</tr>
			<tr>
			<td>지불할 금액:</td>
			<td colspan="2"><span class="pay">&nbsp;</span></td>
			</tr>
			<tr>
			<td colspan="3"><button type="submit">결제하기</button></td>
			</tr>
			</table>
		</form>
	</div>
</body>
<script>
	$(function(){
		$(".step2").css("display", "none");
		$("input[type=radio]").on("click", function() {
			console.log("클릭 이벤트 정상 작동");
			var pay = $(".pay").val();
			var cash = $(".cyber").val();
			switch ($(".cash:checked").val()) {
			case "1":
				cash = "1000000";
				pay = "1000";
				break;
			case "2":
				cash = "5000000";
				pay = "5000";
				break;
			case "3":
				cash = "10000000";
				pay = "9900";
				break;
			case "4":
				cash = "50000000";
				pay = "42500";
				break;
			case "5":
				cash = "1000000000";
				pay = "80000";
				break;
			}
			console.log(pay);
			console.log(cash);
			$(".cyber").text(cash);
			$(".pay").text(pay);
		})

	})
</script>
</html>