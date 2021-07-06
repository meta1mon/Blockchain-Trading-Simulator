<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<style>
#mcl {
	width: 65%;
	min-width: 1024px;
	text-align: center;
	height: 50%;
	padding: 20px;
	margin: 25px auto;
	background-color: #fff;
    border: 1.5px solid #E3C8F8; 
	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%);
}

#chargeTable{
	margin: 0 auto;
	width: 50%;
	border-collapse:collapse;
	border-top: 2px solid grey;
	border-left: none;
	border-right: none;
 	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%); 
}

#chargeTable th, td {
	padding: 5px 10px 5px 0;
 	border: 0.1px solid #E3C8F8; 
	border-left: none;
	border-right: none;
}

#chargeTable th {
	background-color: #f2f2f2;
}


#chargeTable td {
	padding-right: 35px;
}

.date {
	font-size: 11px;
	font-weight: lighter;
}

.expandBtn {
	height: 30px;
	font-size: 16px;
	background-color: #fff;
	color: #8C66C8,;
	padding: 0px 8px;
	border: 1px solid transparent;
	border-color: #E3C8F8;
  	border-radius: 4px;
  	cursor: pointer;
  	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%);
  	margin: 20px auto 0;
}
</style>
</head>
<body>
	<div id="wrapper">
	<jsp:include page="myNav.jsp"></jsp:include>
		<div id="mcl">
			<table id="chargeTable">
				<tr>
					<th width="30px" align="center">결 제 금 액</th>
					<th width="70px" align="center">충 전 금 액</th>
					<th width="50px" align="center">결 제 일 시</th>
				</tr>
 			<c:if test="${listCount eq 0}">
				<tr>
					<td colspan="3">
						표시할 충전 내역이 없습니다.
					</td>
				</tr>
			</c:if>
			<c:if test="${listCount ne 0}">
				<c:forEach var="cashLog" items="${list}" varStatus="status">
					<c:if test="${status.index <4}">
						<tr>
							<td align="right"><strong><fmt:formatNumber value="${cashLog.sellprice}" pattern="#,###,###,###,###" /></strong>&nbsp;&nbsp;원</td>
							<td align="right"><strong><fmt:formatNumber value="${cashLog.won}" pattern="#,###,###,###,###" /></strong>&nbsp;&nbsp;원	</td>
							<td align="right" class="date">${cashLog.cashdate}</td>
						</tr>
					</c:if>
					<c:if test="${status.index >=4}">
						<tr class="cashlist" style="display:none;">
							<td align="right"><strong><fmt:formatNumber value="${cashLog.sellprice}" pattern="#,###,###,###,###" /></strong>&nbsp;&nbsp;원</td>
							<td align="right"><strong><fmt:formatNumber value="${cashLog.won}" pattern="#,###,###,###,###" /></strong>&nbsp;&nbsp;원	</td>
							<td align="right" class="date">${cashLog.cashdate}</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
			</table>
			<input type="button" id="cExpand" value="더 보기" class="expandBtn"></input>
			
		</div>
	</div>
<script>

var cExpandBool = Boolean(false);

$('#cExpand').click(function() {
	console.log("show 클릭됨!");
	if(cExpandBool == false) {
		$('.cashlist').show();
		cExpandBool= true;
		$('#cExpand').val("접기");
	} else if(cExpandBool == true) {
		$('.cashlist').hide();
		cExpandBool= false;
		$('#cExpand').val("더 보기");
	}
});

</script>
</body>
</html>