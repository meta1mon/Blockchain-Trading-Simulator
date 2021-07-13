<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/adminarr.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
<script>
$(function(){
	var  openModal = function(event) {
		$("#modal").css("display", "block");
		var ele = event.currentTarget.querySelectorAll("td");
		
		$("#rrno").val(ele[0].innerText); // 신고 번호
		$("#rcontentText").html(ele[1].innerText); // 신고하는 댓글 내용
		$("#rrespondent").val(ele[2].innerText); // 신고하는 게시글 작성자
		$("#rreporter").val(ele[3].innerText); // 신고자
		$("#rrreasonText").val(ele[4].innerText); // 신고 사유
		$("#rrdate").val(ele[5].innerText); // 신고 날짜
		$("#rreason").val(ele[6].innerText); // 처리 사유
		$("#arrdate").val(ele[7].innerText); // 처리 시간
		$("#rstatus").val(ele[8].innerText); // 처리 상태
	}
	$(".tr").on("click", openModal);
	
	var closeModal = function() {
		$("#modal").css("display", "none");
	}
	
	$("#close").on("click", closeModal);

	$("#cstatusSelect").css("display", "none");
	$("#search").css("display", "inline-block");
	$("#btnsearch").css("display", "inline-block");
	$("#btnsearch2").css("display", "none");
	if($(".rcontent").has($("img"))){
		$(".rcontent img").attr("src", null);
		$(".rcontent img").attr("srcset", null);
		$(".rcontent img").attr("alt", "[이미지]");
	}
var onoff = function(){
	 var opt = $("#searchType option:selected");
	 console.log("이벤트 동작")
	 console.log(opt.val());
	 if(opt.val() == '1'){
		 $("#search").css("display", "none");
		 $("#btnsearch").css("display", "none");
		 $("#rstatusSelect").css("display", "inline-block");
		 $("#btnsearch2").css("display", "inline-block");
	 } else {
		 $("#rstatusSelect").css("display", "none");
		 $("#btnsearch2").css("display", "none");
		 $("#search").css("display", "inline-block");
		 $("#btnsearch").css("display", "inline-block");
	 }
}
	
	$(window).on("load", onoff);
	$("#searchType").on("change", onoff);
})
</script>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
<div id="wrapper">
	<div id="arr">
	<p class="title inbl">처리된 신고 댓글 조회</p>
	<div id="frmSearch">
			<form action="arr" method="get">
				<select id="searchType" name="searchType">
					<option value="2" selected>피신고자</option>
					<option value="3">신고자</option>
					<option value="1">처리 상태</option>
				</select> <input type="search" name="keyword" id="search" placeholder="검색어를 입력해주세요.">
				<button type="submit" id="btnsearch" class="inbl">검색</button>
			</form>
			<form action="arr" method="get">
				<select id="rstatusSelect" name="keyword">
					<option value="accept" selected>수리</option>
					<option value="deny">반려</option>
				</select>
				<button type="submit" id="btnsearch2" class="inbl">검색</button>
			</form>
		</div>
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
					<th>처리 사유</th>
					<th>처리 시간</th>
					<th>처리 상태</th>
				</tr>
				<c:if test="${listCount eq 0}">
					<tr>
						<td colspan="9" class="center">조회된 신고 내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${listCount ne 0}">
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr class="tr">
							<td class="center" style="cursor: pointer;">${vo.rrno}</td>
							<td class="center rcontent">${vo.rcontent}</td>
							<td class="center" style="cursor: pointer;">${vo.rrespondent}</td>
							<td class="center" style="cursor: pointer;">${vo.rreporter}</td>
							<c:choose>
							<c:when test="${vo.rrreason eq 1}">
							<td style="cursor: pointer;">나체 이미지 또는 성적 행위</td>
							</c:when>
							<c:when test="${vo.rrreason eq 2}">
							<td style="cursor: pointer;">혐오 발언 또는 폭력적</td>
							</c:when>
							<c:when test="${vo.rrreason eq 3}">
							<td style="cursor: pointer;">증오 또는 학대</td>
							</c:when>
							<c:when test="${vo.rrreason eq 4}">
							<td style="cursor: pointer;">유해하거나 위험한 행위</td>
							</c:when>
							<c:when test="${vo.rrreason eq 5}">
							<td style="cursor: pointer;">스팸 또는 사용자 현혹</td>
							</c:when>
							<c:when test="${vo.rrreason eq 6}">
							<td style="cursor: pointer;">마음에 들지 않습니다.</td>
							</c:when>
							</c:choose>
							<td style="cursor: pointer;">${vo.rrdate}</td>
							<td style="cursor: pointer;">${vo.rreason}</td>
							<td style="cursor: pointer;">${vo.arrdate}</td>
							<c:choose>
							<c:when test="${vo.rstatus eq 'accept'}">
							<td class="center" style="cursor: pointer; color: green;">수리</td>
							</c:when>
							<c:when test="${vo.rstatus eq 'deny'}">
							<td class="center" style="cursor: pointer; color: red;">반려</td>
							</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</c:if>
				<tr class="page">
					<td colspan="9" class="center">
						<div id="page">
							<!-- 앞 페이지 번호 처리 -->
							<c:if test="${currentPage <= 1}">
							<i class="fas fa-angle-double-left"></i>
							</c:if>
							<c:if test="${currentPage > 1}">
								<c:url var="rrlistST" value="arr">
									<c:param name="page" value="${currentPage-1}"/>
								</c:url>
								<a href="${rrlistST}&searchType=${searchType}&keyword=${keyword}"><i class="fas fa-angle-double-left"></i></a>
							</c:if>
							<!-- 끝 페이지 번호 처리 -->
							<c:set var="endPage" value="${maxPage}" />
							<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
								<!-- 현재페이지랑 같으면-->
								<c:if test="${p eq currentPage}">
									<div class="pageNum"><b>${p}</b></div>
								</c:if>
								<!-- 현재페이지 -->
								<c:if test="${p ne currentPage}">
									<c:url var="rrlistchk" value="arr">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${crlistchk}&searchType=${searchType}&keyword=${keyword}">${p}</a>
								</c:if>
							</c:forEach>
							<c:if test="${currentPage >= maxPage}">
								<i class="fas fa-angle-double-right"></i>
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="rrlistEND" value="arr">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${rrlistEND}&searchType=${searchType}&keyword=${keyword}"><i class="fas fa-angle-double-right"></i></a>
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
						</tr>
						<tr>
							<td>신고자</td>
							<td><input type="text" value="" name="rreporter" id="rreporter" readonly></td>
						</tr>
						<tr>
							<td>신고 사유</td>
							<td><input type="text" value="" id="rrreasonText" readonly></td>
						</tr>
						<tr>
							<td>신고 시간</td>
							<td><input type="text" value="" id="rrdate" name="rrdate" readonly></td>
						</tr>
						<tr>
							<td>처리 사유</td>
							<td><input type="text" name="rreason" id="rreason"></td>
						</tr>
						<tr>
							<td>처리 시간</td>
							<td><input type="text" value="" name="arrdate" id="arrdate" readonly></td>
						</tr>
						<tr>
							<td>처리 상태</td>
							<td><input type="text" value="" name="rstatus" id="rstatus" readonly></td>
						</tr>
						<tr>
							<td colspan="2">
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