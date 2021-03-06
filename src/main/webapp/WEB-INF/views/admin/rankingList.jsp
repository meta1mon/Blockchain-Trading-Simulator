<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminml.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
	<script>
	    function dpTime(){
	       	var now = new Date();
	       	var year = now.getFullYear();
	       	var month = (now.getMonth()+1);
	       	var day = now.getDay();
	        var hours = now.getHours();
	        var minutes = now.getMinutes();
	        var seconds = now.getSeconds();
	        if(month < 10){
	    		month = "0"+month;
	    	}
	    	if(day < 10){
	    		day = "0"+day;
	    	}
	        if (hours > 12){
	            hours -= 12;
	        	ampm = "μ€ν ";
	        }else{
	            ampm = "μ€μ  ";
	        }
	        if (hours < 10){
	            hours = "0" + hours;
	        }
	        if (minutes < 10){
	            minutes = "0" + minutes;
	        }
	        if (seconds < 10){
	            seconds = "0" + seconds;
	        }
		document.getElementById("timestamp").innerHTML = "π" + year+"λ " + month + "μ "+ day +"μΌ "+ ampm + hours + ":" + minutes + ":" + seconds +" κΈ°μ€";
	    }
	 	setInterval("dpTime()",1000);
	</script>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
<div id="wrapper">
	<div id="mmm">
<div style="width: 100%; height: 20px; text-align: center;"><p id="timestamp" class="inbl">&nbsp;<p></div>
<div style="height: 10px">
</div>
<form action="monthlyrewarding">
	<p class="title inbl">μκ° λ­νΉ</p><button id="monthly" style="float:right;  height: 25px; display: inline-block" type="submit" class="btnPurple inbl">μκ° λ³΄μ λ°μ‘</button>
	<hr>
<table class="ranklist">
	<tr>
	<td>μ΄λ©μΌ</td>
	<td>λλ€μ</td>
	<td>μμ΅λ₯ </td>
	</tr>
	<c:forEach items="${monthly }" var="monthly">
	<tr>
	<td class="email" style="width: 450px"><input type="hidden" name="email" value="${monthly.email }">${monthly.email }</td>
	<td>${monthly.nickname }</td>
	<td style="width: 400px"><c:if test="${monthly.yield>0 }">
		<span style="color: red">&#9650; </span><fmt:formatNumber value="${monthly.yield }" pattern="##,###.######" /> %
		</c:if>
		<c:if test="${monthly.yield==0 }">
			<fmt:formatNumber value="${monthly.yield }" pattern="##,###.######" /> %
		</c:if>
		<c:if test="${monthly.yield <0 }">
		<span style="color: blue">&#9660; </span><fmt:formatNumber value="${monthly.yield }" pattern="##,###.######" /> %
		</c:if></td>
	
	</tr>
	</c:forEach>
</table>
<div style="height: 100px">
</div>
</form>
<form action="weeklyrewarding">
	<p class="title inbl">μ£Όκ° λ­νΉ</p><button id="weekly" style="float:right;  height: 25px; display: inline-block" type="submit" class="btnPurple inbl">μ£Όκ° λ³΄μ λ°μ‘</button>
	<hr>
	<table class="ranklist">
		<tr>
		<td>μ΄λ©μΌ</td>
		<td>λλ€μ</td>
		<td>μμ΅λ₯ </td>
		</tr>
		<c:forEach items="${weekly }" var="weekly">
		<tr>
		<td  style="width: 450px" class="email"><input type="hidden" name="email" value="${weekly.email }">${weekly.email }</td>
		<td>${weekly.nickname }</td>
		<td style="width: 400px">
		<c:if test="${weekly.yield>0 }">
		<span style="color: red">&#9650; </span><fmt:formatNumber value="${weekly.yield }" pattern="##,###.######" /> % 
		</c:if>
		<c:if test="${weekly.yield==0 }">
		<fmt:formatNumber value="${weekly.yield }" pattern="##,###.######" /> %
		</c:if>
		<c:if test="${weekly.yield <0 }">
		<span style="color: blue">&#9660; </span><fmt:formatNumber value="${weekly.yield }" pattern="##,###.######" /> %
		</c:if>
		 </td>
		</tr>
		</c:forEach>
	</table>
</form>
<div style="height: 50px">
</div>
</div>
</div>
</body>
<script>
$(function(){
	$("#monthly").on("click", function(){
		$("#monthly").html("μ μ‘λμμ΅λλ€.");
		$("#monthly").attr("disabled");
		$("#monthly").css("color", "white");
		$("#monthly").css("background", "#8c66c8");
	})
	$("#weekly").on("click", function(){
		$("#weekly").html("μ μ‘λμμ΅λλ€.");
		$("#weekly").attr("disabled");
		$("#weekly").css("color", "white");
		$("#weekly").css("background", "#8c66c8");
	})
})
</script>
</html>