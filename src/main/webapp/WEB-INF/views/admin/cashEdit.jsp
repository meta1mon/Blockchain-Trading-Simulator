<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/resources/css/admince.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function deleteCash(cashno){
	console.log("삭제합니다.");
	console.log(cashno);
		var isConfirm = confirm(cashno + "번 상품을 삭제하시겠습니까?");
		if(isConfirm){
			$.ajax({
				url : 'deleteCash',
				type : 'post',
				data : {
					"cashno":cashno					
				},
				sync : true,
				success : function(data) {
					console.log(data);
					alert("상품 삭제 완료!");
					location.href = "cash";
				},
				error : function(request, status, error) {
					console.log("error: 상품 삭제 실패!");
					console.log("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
	
			})
		}else{
			alert("취소하였습니다.")
		}
	}
$(function(){
	$(".editmode").attr("display", "none");
	$(".money .read").css("display", "none");
	$(".info").css("border", "1px solid transparent");
	$(".info").css("border-radius", "5px");
	
	
	var setMinDateReg = function(){
		var startdatereg = $("#startdatereg").val();
		if(startdatereg != null && startdatereg != "" && startdatereg != undefined){
			console.log("설정합니다.");
			$("#enddatereg").attr("min", startdatereg);
		}
	}
	$("#startdatereg").on("keyup", setMinDateReg);
	$("#startdatereg").on("change", setMinDateReg);
	
	
	// 수정을 누르면 .read의 readonly를 false로 변경
	// 수정 버튼과 닫기 버튼의 value를 
	var edit = function(){
		var thistr = $(this).parents(".item"); //내가 클릭한 버튼의 tr
		var index = $(".item").index(thistr); //.item 중에 thistr만 골라서 index를 알려준다!
		console.log(index);
		console.log($(this).val());
			for(var i=0; i<8; i++){
		var ele = $('.item:eq(' + index + 1 +') > td:nth-child('+i+') > input');
		/* console.log(index + "번째 tr의 "+ i + "번째 정보는 " +  ele.val()); */
			var info = $('.item:eq(' + index +') > td:nth-child('+i+') > .info');
			var show = $('.item:eq(' + index +') > td:nth-child('+i+') > .show');
			var money = $('.item:eq(' + index +') > td:nth-child('+i+') > .hide');
			var defaultmode = $('.item:eq(' + index +') .default');
			var editmode = $('.item:eq(' + index +') .editmode');
			
			info.attr("readonly", false);
			show.css("display", "none");
			money.css("display", "inline");
			info.css("border", "1px solid rgba(0,0,0,0.3)");
			info.css("border-radius", "5px");
			defaultmode.css("display", "none");
			editmode.css("display", "block");
		}
			
			var setMinDate = function(){
				console.log("작동")
				var startdate = $('.item:eq(' + index +') > td:nth-child(5) > input').val();
				if(startdate != null && startdate != "" && startdate != undefined){
					console.log("설정합니다.");
					$("input[name=enddate]").attr("min", startdate);
				}
			}
			$("input[name=startdate]").on("keyup", setMinDate);
			$("input[name=startdate]").on("change", setMinDate);

			var ele1 = $('.item:eq(' + index +') > td:nth-child(1) > input');
			var ele2 = $('.item:eq(' + index +') > td:nth-child(2) > input');
			var ele3 = $('.item:eq(' + index +') > td:nth-child(3) > input');
			var ele4 = $('.item:eq(' + index +') > td:nth-child(4) > input');
			var ele5 = $('.item:eq(' + index +') > td:nth-child(5) > input');
			var ele6 = $('.item:eq(' + index +') > td:nth-child(6) > input');

			console.log("수정합니다.");
			
			
	}
	$(".edit").on("click", edit);
	
	var cancel = function(){
		console.log("취소하겠습니다.")
		var thistr = $(this).parents(".item"); //내가 클릭한 버튼의 tr
		var index = $(".item").index(thistr); //.item 중에 thistr만 골라서 index를 알려준다!

		for(var i=0; i<8; i++){
			var ele = $('.item:eq(' + index +') > td:nth-child('+i+') > input');
			/* console.log(index + "번째 tr의 "+ i + "번째 정보는 " +  ele.val()); */
			var info = $('.item:eq(' + index +') > td:nth-child('+i+') > .info');
			var show = $('.item:eq(' + index +') > td:nth-child('+i+') > .show');
			var money = $('.item:eq(' + index +') > td:nth-child('+i+') > .hide');
			var defaultmode = $('.item:eq(' + index +') .default');
			var editmode = $('.item:eq(' + index +') .editmode');
			
			info.attr("readonly", true);
			show.css("display", "inline");
			money.css("display", "none");
			info.css("border", "1px solid transparent");
			info.css("border-radius", "5px");
			defaultmode.css("display", "block");
			editmode.css("display", "none");
		}
		
	}
	$(".cancel").on("click", cancel);
	
	var done = function(){
		console.log("완료하겠습니다.")
		var thistr = $(this).parents(".item"); //내가 클릭한 버튼의 tr
		var index = $(".item").index(thistr); //.item 중에 thistr만 골라서 index를 알려준다!
		var ele1 = $('.item:eq(' + index +') > td:nth-child(1) > input');
		var ele2 = $('.item:eq(' + index +') > td:nth-child(2) > input');
		var ele3 = $('.item:eq(' + index +') > td:nth-child(3) >  input');
		var ele4 = $('.item:eq(' + index +') > td:nth-child(4) > input');
		var ele5 = $('.item:eq(' + index +') > td:nth-child(5) > input');
		var ele6 = $('.item:eq(' + index +') > td:nth-child(6) > input');

		$("input[name=cashno]").val(ele1.val());
		$("input[name=won]").val(ele2.val());
		$("input[name=price]").val(ele3.val());
		$("input[name=discountrate]").val(ele4.val());
		$("input[name=startdate]").val(ele5.val());
		$("input[name=enddate]").val(ele6.val());
		console.log($("input[name=won]").val());
		console.log($("input[name=price]").val());
		console.log($("input[name=discountrate]").val());
		console.log($("input[name=startdate]").val());
		console.log($("input[name=enddate]").val());
		
		var dataquery = $("#frmCashEdit").serialize();
		console.log("dataquery:" + dataquery);
		$.ajax({
				url: 'updateCash',
				type: 'post',
				data: dataquery,
				sync : true,
			success : function(data) {
				alert("상품 수정 완료!");
				location.href = "cash";
			},
			error : function(request, status, error) {
				console.log("error: 상품 수정 실패!");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
				
			})
	}
	$(".done").on("click", done);
	
})	
</script>
</head>
<%@include file="headerAndAside.jsp"%>

<body>
<div id="wrapper">
		<div id="cashR">
			<p class="title">충전 상품 관리</p>
			<hr>
			<div>
					<table id="list">
						<tr>
							<td class="center">충전금</td>
							<td class="center">판매가</td>
							<td class="center">할인률</td>
							<td class="center">이벤트 시작일자</td>
							<td class="center">이벤트 종료일자</td>
							<td colspan="2" class="center">&nbsp;</td>
						</tr>
						<c:if test="${listCount eq 0}">
							<tr>
								<td colspan="7" class="center">조회된 상품이 없습니다.</td>
							</tr>
						</c:if>
					<c:if test="${listCount ne 0}">
						<c:forEach var="vo" items="${list}" varStatus="status">
							<form id="frmCashEdit">
							<tr class="item">
								<td style="display: none">
									<input class="info" type="hidden" name="cashno" id="cashno" value="${vo.cashno}">
								</td>
	
								<td class="money right">
								<span class="show right"><fmt:formatNumber value="${vo.won}" pattern="#,###,###,###" /></span> 
								<input class="right read info hide won" type="number" name="won" value="${vo.won}" readonly="readonly">
								<span>원</span>
								</td>
	
								<td class="money right">
								<span class="show right"><fmt:formatNumber value="${vo.price}" pattern="#,###,###,###" /></span> 
								<input class="right read info hide price" type="number" name="price" value="${vo.price}" readonly="readonly">
								<span>원</span>
								</td>
	
								<td class="center percent">
								<input class="right read info discountrate" type="number" name="discountrate" value="${vo.discountrate}" readonly="readonly"><span>%</span></td>
	
								<td class="center">
								<input class="right read info startdate" type="date" name="startdate"value="${vo.startdate}" readonly="readonly">
								</td>
	
								<td class="center">
								<input class="right read info enddate" type="date" name="enddate" value="${vo.enddate}" readonly="readonly">
								</td>
	
								<td colspan="2" class="center default" style="width: 95.58px">
								<input type="button" class="edit" value="수정"> 
								<input type="button" class="del" value="삭제" onclick="deleteCash('${vo.cashno}')">
									</td>
	
								<td colspan="2" class="center editmode" style="display: none; width: 95.58px">
									<input type="button" class="done" value="완료"> 
									<input type="button" class="cancel" value="취소">
								</td>
							</tr>
							</form>
						</c:forEach>
					</c:if>
					<!-- 페이징 -->
						<tr class="page">
							<td colspan="7">
								<div id="page">
									<!-- 앞 페이지 번호 처리 -->
									<c:if test="${currentPage <= 1}">
										<i class="fas fa-angle-double-left"></i>
									</c:if>
									<c:if test="${currentPage > 1}">
										<c:url var="cashlistST" value="cash">
											<c:param name="page" value="${currentPage-1}" />
										</c:url>
										<a href="${cashlistST}"><i class="fas fa-angle-double-left"></i></a>
									</c:if>
									<!-- 끝 페이지 번호 처리 -->
									<c:set var="endPage" value="${maxPage}" />
									<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
										<c:if test="${p eq currentPage}">
											<div class="pageNum">
												<b>${p}</b>
											</div>
										</c:if>
										<c:if test="${p ne currentPage}">
											<c:url var="cashlistchk" value="cash">
												<c:param name="page" value="${p}" />
											</c:url>
											<a href="${cashlistchk}">${p}</a>
										</c:if>
									</c:forEach>
									<c:if test="${currentPage >= maxPage}">
										<i class="fas fa-angle-double-right"></i>
									</c:if>
									<c:if test="${currentPage < maxPage}">
										<c:url var="cashlistEND" value="cash">
											<c:param name="page" value="${currentPage+1}" />
										</c:url>
										<a href="${cashlistEND}"><i class="fas fa-angle-double-right"></i></a>
									</c:if>
								</div>
							</td>
						</tr>
	
						<!-- 충전상품 등록 부분 -->
						<form action="${pageContext.request.contextPath}/admin/cashRegister" method="post">
						<tr class="register">
							<td class="right">
							<input type="number" min="0" name="won" class="right"><span>원</span>
							</td>
							<td class="right"><input type="number" min="0" name="price" class="right"><span>원</span></td>
							<td class="right"><input type="number" min="0" max="100" name="discountrate" class="right"><span>%</span></td>
							<td class="right"><input type="date" name="startdate" id="startdatereg" class="right"></td>
							<td class="right"><input type="date" name="enddate" id="enddatereg" min="" class="right"></td>
							<td colspan="2" class="center"><input type="submit" class="regCash" value="등록"></td>
						</tr>
						</form>
					</table>
			</div>
		</div>
	</div>
</body>
</html>