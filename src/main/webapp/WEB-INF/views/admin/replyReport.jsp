<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#modal{
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

#contents table {
	width: 100%;
}

#contents {
	padding: 30px;
    background-color: white;
    border: 2px solid rgb(140, 102, 200);
    border-radius: 5px;
    top: calc(50% - 200px);
    left: calc(50% - 100px);
    width: 400px;
    height: 365px;
    text-align: center;
    position: absolute;
}

#rr th, td {
	padding: 5px !important;
}

#rr td:not(.center, .right){
	text-align: left;
}

#rr {
	position: absolute;
	top: calc(50% - 150px);
	left: calc(50% - 320px);
}

#page{
	text-align: center;
}

#listForm{
	width: 100%;
}

#detail {
	height: 35px;
}

#close {
	height: 35px;
}

#contents table td:nth-child(1) {
	width: 120px;
	text-align: right;
}

#contents table td input {
	width: 270px;
	border: 1px solid rgba(0, 0, 0, 0.5);
	border-radius: 3px;
}

#rcontent {
	height: 105px;
	width: 270px;
	border: 1px solid rgba(0, 0, 0, 0.5);
	border-radius: 3px;
	font-size: 13.3333px;
	padding: 1px 2px;
	text-align: left;
	background: white;
}

button {
	width: 94px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		var  openModal = function(event) {
			$("#modal").css("display", "block");
			var ele = event.currentTarget.querySelectorAll("td");
			console.log(ele);
			for(i=0; i<ele.length; i++){
				console.log(i+"번째 " + ele[i].innerText);
			};
			$("#csubject").val(ele[1].innerText);
			$("#rrespondent").val(ele[3].innerText);
			$("#rcontent").html(ele[2].innerText);
			$("#rreporter").val(ele[4].innerText);
			$("#rrreason").val(ele[5].innerText);
			$("#rrdate").val(ele[6].innerText);
			$("#cno").val(ele[7].innerText);
		}
		$(".tr").on("click", openModal);
		
		var closeModal = function() {
			$("#modal").css("display", "none");
		}
		
		$("#close").on("click", closeModal);
		
		var detail = function(){
			location.href="<%=request.getContextPath()%>/cDetail?cno="+$("#cno").val();
		}
		
		$("#detail").on("click", detail);

	})
</script>
<title>관리자 페이지 - BTS</title>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="rr">
		<div>
			<table border="1">
				<tr>
					<th>신고 번호</th>
					<th>게시글 제목</th>
					<th>피신고자</th>
					<th>신고자</th>
					<th>신고 사유</th>
					<th>신고 시간</th>
				</tr>
				<c:if test="${listCount eq 0}">
					<tr>
						<td colspan="6" align="center">조회된 신고 내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${listCount ne 0}">
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr class="tr">
							<td style="cursor: pointer;">${vo.rrno}</td>
							<td style="cursor: pointer;">${vo.csubject}</td>
							<td style="cursor: pointer; display: none">${vo.rcontent}</td>
							<td style="cursor: pointer;">${vo.rrespondent}</td>
							<td style="cursor: pointer;">${vo.rreporter}</td>
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
							<td style="cursor: pointer; display: none">${vo.cno}</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
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
			</table>

		</div>
	</div>
		<div id="modal">
			<div id="contents">
				<form id="frmReport">
					<table>
						<tr>
							<td>게시글 제목</td>
							<td><input type="text" value="" id="csubject" readonly></td>
						</tr>
						<tr>
							<td>피신고자</td>
							<td><input type="text" value="" id="rrespondent" readonly></td>
						</tr>
						<tr>
							<td>댓글 내용</td>
							<td><div id="rcontent">&nbsp;</div></td>
						</tr>
						<tr>
							<td>신고자</td>
							<td><input type="text" value="" id="rreporter" readonly></td>
						</tr>
						<tr>
							<td>신고 사유</td>
							<td><input type="text" value="" id="rrreason" readonly></td>
						</tr>
						<tr>
							<td>신고 시간</td>
							<td><input type="text" value="" id="rrdate" readonly></td>
						</tr>
						<tr>
							<td>신고 처리 사유</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" value="" id="cno"
								style="display: none">
								<button type="submit" id="accept" class="btnGreen">수리</button>
								<button type="submit" id="deny" class="btnRed">반려</button>
								<button type="button" id="detail" class="btnPurple">자세히</button>
								<button type="button" id="close" class="btnPurple">닫기</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
</body>
</html>