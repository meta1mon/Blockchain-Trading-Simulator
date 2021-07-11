<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico"	type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
#cashShop {
	text-align: center;
	
	width: 65%;
	min-width: 1000px;
	height: 95%;
	padding:20px;
	margin: 25px auto;
    background-color: #fff;
    border: 1.5px solid #E3C8F8;
	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%);
}

#cashShop #steps {
	margin: 0 auto;
	width: 100%;
}

#cashShop li {
	list-style-type: none;
	float: left;
	margin: 0 50px;
}
.right{
	text-align: right;
}
#step2, #oldSale{
	border-top: 1.5px solid #E3C8F8;
}
.step {
    width: 80%;
    margin-left: auto;
    margin-right: auto;
}
.step td {
	padding: 2px;
}
.money {
	width: calc(100% - 30px);
	outline: none;
	border: none;
}

.rev{
	color: white;
	background: #8c66c8;
	font-size: inherit;
}

h1 {
	color: #8c66c8;
}

.purple{
	color: #8c66c8;
	font-size: inherit;
}

.btn1{
	width: 100%;
	height: 44px;
	border-radius: 5px;
	background: white;
	border: 1px solid rgb(140, 102, 200);
	color: rgb(140, 102, 200);
}

.btn1:hover{
	background: rgb(140, 102, 200);
	border: 1px solid rgb(140, 102, 200);
	color: white;
}
</style>
<script>
function doOpenCheck(chk){
    var obj = document.getElementsByName("selectCash");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="cashShop">
		<table id="steps">
		<tr>
		<td>
		<div id="nowSale">
			<form>
				<table class="step">
					<tr>
						<td colspan="5">
							<h1><span class="rev">1단계</span> 결제 금액을 선택해 주세요</h1>
						</td>
					</tr>
					<tr>
						<td>모의 투자 충전 금액</td>
						<td>KRW</td>
						<td>할인율</td>
						<td>할인 기간</td>
						<td>&nbsp;</td>
					</tr>
					<c:forEach items="${nowList }" var="cashVo" varStatus="status">
						<tr>
							<td class="right"><fmt:formatNumber value="${cashVo.won }"
								pattern="#,###,###,###" />원</td>
							<td class="right"><fmt:formatNumber value="${cashVo.sellprice }"
								pattern="#,###,###,###" />원</td>
							<td>${cashVo.discountrate }%</td>
							<input type="hidden" name="currentWon${status.count }" value="${cashVo.won }" readonly>
							<input type="hidden" name="currentPrice${status.count }" value="${cashVo.sellprice }" readonly>
							<td>${cashVo.startdate} ~ ${cashVo.enddate }</td>
							<td><input type="radio" name="selectCash" onclick="buyCash(currentPrice${status.count }, currentWon${status.count })"></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
		</td>
		</tr>
		<tr style="height: 232px;">
		<td>
		<div id="step2">
			<table class="step">
				<tr>
					<td colspan="5"><h1><span class="rev">2단계</span> 최종 금액을 확인해 주세요</h1></td>
				</tr>
				<tr>
					<td rowspan="2">&nbsp; &nbsp; &nbsp; &nbsp;</td>
					<td>충전할 금액 : </td>
					<td><input type="text" id="won" class="right money" readonly>원</td>
					<td colspan ="2" rowspan="2"><button type="button" class="btn1" onclick="openPayment();">결제하기</button></td>
				</tr>
				<tr>
					<td>지불할 금액 : </td>
					<td><input type="text" id="cash" name="cash"  class="right money" readonly>원</td>
				</tr>
			</table>
		</div>
		</td>
		</tr>
		<tr>
		<td>
		<div id="oldSale">
			<table class="step">
				<tr>
					<td colspan="4"><h4><span class="purple">&lt;</span> 할인 종료 상품 <span class="purple">&gt;</span></h4></td>
				</tr>
				<tr>
					<td>모의 투자 충전 금액</td>
					<td>KRW</td>
					<td>할인율</td>
					<td>할인 기간</td>
				</tr>
				<c:forEach items="${oldList }" var="cashVo" varStatus="status">
					<tr>
						<td class="right">${cashVo.won }원</td>
						<td class="right">${cashVo.sellprice }원</td>
						<td>${cashVo.discountrate }%</td>
						<td>${cashVo.startdate } ~ ${cashVo.enddate }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</td>
		</tr>
		</table>
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
<script>
	function buyCash(sellprice, won) {
		$("#won").val(won.value);
		$("#cash").val(sellprice.value);
		$("#won2").val(won.value);
		$("#cash2").val(sellprice.value);
	}
	
	var openWin;
	function openPayment() {
		if($("#won").val() != '' && $("#cash").val() != '') {
			openChild();
		} else {
			alert("결제할 상품을 선택하세요");
			
		}
	}
	
	function openChild() {
		openWin = window.open("<%=request.getContextPath()%>/pay", "paymentPopup", "width=850px, height=650px, resizable = no, left= 100, top=100");
		
	}
</script>
</html>