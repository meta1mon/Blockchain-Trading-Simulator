<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/adminrr.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/loadingajax.js"></script>
<script>
	$(function(){
		if($(".rcontent").has($("img"))){
			$(".rcontent img").attr("src", null);
			$(".rcontent img").attr("srcset", null);
			$(".rcontent img").attr("alt", "[이미지]");
		}
		var  openModal = function(event) {
			$("#modal").css("display", "block");
			var ele = event.currentTarget.querySelectorAll("td");
			
			$("#rrno").val(ele[0].innerText); // 신고 번호
			$("#rcontentText").html(ele[1].innerText); // 신고하는 게시글 내용
			$("#rcontent").val($("#rcontentText").html()); // 신고하는 게시글 내용(DB용)
			$("#rrespondent").val(ele[2].innerText); // 신고하는 댓글 작성자
			$("#rreporter").val(ele[3].innerText); // 신고자
			$("#rrreasonText").val(ele[4].innerText); // 신고 사유(텍스트)
			$("#rrreason").val(ele[5].innerText); // 신고 사유(DB용)
			$("#rrdate").val(ele[6].innerText); // 신고 날짜
			$("#cno").val(ele[7].innerText); // 신고하는 댓글이 있는 글 번호
			$("#rno").val(ele[8].innerText); // 신고하는 댓글 번호
		}
		$(".tr").on("click", openModal);
		
		var closeModal = function() {
			$("#modal").css("display", "none");
		}
		
		$("#close").on("click", closeModal);
		
		$(".deal").on("click",function() {
 			var deal = $(this).val();
 			$("#buttonvalue").val(deal);
 			var btnval = $("#buttonvalue").val();
			 
		    var dataquery = $("#frmReport").serialize();
		    dataquery = decodeURIComponent(dataquery);
		    console.log(dataquery);
		    
			$.ajax({
			url : "dealrr",
			type : "POST",
			data : dataquery,
			async : true,
			success : function(data) {
				location.href = "<%=request.getContextPath()%>/admin/rr";
			},
			error : function(request, status, error) {
				console.log("message:"+request.responseText+"\n"+"error:"+error);
			}
			
		})
	})

	})
</script>
<title>관리자 페이지 - BTS</title>
</head>
<%@include file="headerAndAside.jsp"%>
<%@include file="../loadingajax.jsp"%>
<body>
<div id="wrapper">
	<div id="rr">
	<p class="title inbl">신고된 댓글 조회</p>
	<hr>
		<div>
			<table id="list">
				<tr>
					<th>신고 번호</th>
					<th>댓글 내용</th>
					<th>피신고자</th>
					<th>신고자</th>
					<th>신고 사유</th>
					<th>신고 시간</th>
				</tr>
				<c:if test="${listCount eq 0}">
					<tr>
						<td colspan="6" class="center">조회된 신고 내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${listCount ne 0}">
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr class="tr">
							<td class ="center" style="cursor: pointer;">${vo.rrno}</td>
							<td class="center rcontent">${vo.rcontent}</td>
							<td class ="center" style="cursor: pointer;">${vo.rrespondent}</td>
							<td class ="center" style="cursor: pointer;">${vo.rreporter}</td>
							<c:choose>
							<c:when test="${vo.rrreason eq 1}">
							<td style="cursor: pointer;">나체 이미지 또는 성적 행위</td>
							<td class="hidden">${vo.rrreason}</td>
							</c:when>
							<c:when test="${vo.rrreason eq 2}">
							<td style="cursor: pointer;">혐오 발언 또는 폭력적</td>
							<td class="hidden">${vo.rrreason}</td>
							</c:when>
							<c:when test="${vo.rrreason eq 3}">
							<td style="cursor: pointer;">증오 또는 학대</td>
							<td class="hidden">${vo.rrreason}</td>
							</c:when>
							<c:when test="${vo.rrreason eq 4}">
							<td style="cursor: pointer;">유해하거나 위험한 행위</td>
							<td class="hidden">${vo.rrreason}</td>
							</c:when>
							<c:when test="${vo.rrreason eq 5}">
							<td style="cursor: pointer;">스팸 또는 사용자 현혹</td>
							<td class="hidden">${vo.rrreason}</td>
							</c:when>
							<c:when test="${vo.rrreason eq 6}">
							<td style="cursor: pointer;">마음에 들지 않습니다.</td>
							<td class="hidden">${vo.rrreason}</td>
							</c:when>
							</c:choose>
							<td style="cursor: pointer;">${vo.rrdate}</td>
							<td class="hidden">${vo.cno}</td>
							<td class="hidden">${vo.rno}</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr class="page">
					<td colspan="6">
						<div id="page">
							<!-- 앞 페이지 번호 처리 -->
							<c:if test="${currentPage <= 1}">
							<i class="fas fa-angle-double-left"></i>
							</c:if>
							<c:if test="${currentPage > 1}">
								<c:url var="rrlistST" value="rr">
									<c:param name="page" value="${currentPage-1}"/>
								</c:url>
								<a href="${rrlistST}"><i class="fas fa-angle-double-left"></i></a>
							</c:if>
							<!-- 끝 페이지 번호 처리 -->
							<c:set var="endPage" value="${maxPage}" />
							<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
								<c:if test="${p eq currentPage}">
									<div class="pageNum"><b>${p}</b></div>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="rrlistchk" value="rr">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${rrlistchk}">${p}</a>
								</c:if>
							</c:forEach>
							<c:if test="${currentPage >= maxPage}">
								<i class="fas fa-angle-double-right"></i>
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="rrlistEND" value="rr">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${rrlistEND}"><i class="fas fa-angle-double-right"></i></a>
							</c:if>
						</div>
					</td>
					</tr>
			</table>
		</div>
	</div>
	<div id="modal">
			<div id="contents">
				<form id="frmReport">
					<table>
						<tr class="hidden">
							<td>신고 접수 번호</td>
							<td><input type="hidden" value="" name="rrno" id="rrno"></td>
						</tr>
						<tr>
							<td>피신고자</td>
							<td><input type="text" value="" name="rrespondent" id="rrespondent" readonly></td>
						</tr>
						<tr>
							<td class="content">댓글 내용</td>
							<td><div id="rcontentText">&nbsp;</div></td>
							<td class="hidden"><input type="text" value="" name="rcontent"  id="rcontent"></td>
						</tr>
						<tr>
							<td>신고자</td>
							<td><input type="text" value="" name="rreporter" id="rreporter" readonly></td>
						</tr>
						<tr>
							<td>신고 사유</td>
							<td><input type="text" value="" id="rrreasonText" readonly></td>
							<td class="hidden"><input type="hidden" value="" id="rrreason" name="rrreason"></td>
						</tr>
						<tr>
							<td>신고 시간</td>
							<td><input type="text" value="" id="rrdate" name="rrdate" readonly></td>
						</tr>
						<tr>
							<td>신고 처리 사유</td>
							<td><input type="text" name="rreason" id="rreason"></td>
						</tr>
						<tr class="hidden">
							<td>신고된 게시글 번호</td>
							<td><input type="text" value="" name="cno" id="cno"></td>
						</tr>
						<tr class="hidden">
							<td>신고된 댓글 번호</td>
							<td><input type="text" value="" name="rno" id="rno"></td>
						</tr>
						<tr class="hidden">
							<td>신고 처리 시간</td>
							<td><input type="text" value="" name="arrdate" id="arrdate" readonly></td>
						</tr>
						
						<tr>
							<td colspan="2">
								<button type="button" id="accept" class="btnGreen deal" value="accept">수리</button>
								<button type="button" id="deny" class="btnRed deal" value="deny">반려</button>
								<input type="text" id="buttonvalue" value="" name="rstatus" style="display: none">
								
								<button type="button" id="close" class="btnPurple">닫기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		</div>
</body>
</html>