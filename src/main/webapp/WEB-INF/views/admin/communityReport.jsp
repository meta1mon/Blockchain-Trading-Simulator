<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#cr #modal{
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(188, 143, 143, 0.8);
}

#cr #contents {
	background-color: white;
	margin: 100px auto;
	width: 400px;
	height: 600px;
	text-align: center;
	position: relative;
}

#cr th, td {
	padding: 5px !important;
}

#cr td:not(.center, .right){
	text-align: left;
}

#cr {
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
			$("#crespondent").val(ele[3].innerText);
			$("#ccontent").val(ele[2].innerText);
			$("#creporter").val(ele[4].innerText);
			$("#crreason").val(ele[5].innerText);
			$("#crdate").val(ele[6].innerText);
			$("#cno").val(ele[7].innerText);
		}
		$(".tr").on("click", openModal);
		
		var closeModal = function() {
			$("#modal").css("display", "none");
		}
		
		$(".close").on("click", closeModal);
		
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
	<div id="cr">
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
							<td style="cursor: pointer;">${vo.crno}</td>
							<td style="cursor: pointer;">${vo.csubject}</td>
							<td style="cursor: pointer; display: none">${vo.ccontent}</td>
							<td style="cursor: pointer;">${vo.crespondent}</td>
							<td style="cursor: pointer;">${vo.creporter}</td>
							<c:choose>
							<c:when test="${vo.crreason eq 1}">
							<td style="cursor: pointer;">나체 이미지 또는 성적 행위</td>
							</c:when>
							<c:when test="${vo.crreason eq 2}">
							<td style="cursor: pointer;">혐오 발언 또는 폭력적</td>
							</c:when>
							<c:when test="${vo.crreason eq 3}">
							<td style="cursor: pointer;">증오 또는 학대</td>
							</c:when>
							<c:when test="${vo.crreason eq 4}">
							<td style="cursor: pointer;">유해하거나 위험한 행위</td>
							</c:when>
							<c:when test="${vo.crreason eq 5}">
							<td style="cursor: pointer;">스팸 또는 사용자 현혹</td>
							</c:when>
							<c:when test="${vo.crreason eq 6}">
							<td style="cursor: pointer;">마음에 들지 않습니다.</td>
							</c:when>
							</c:choose>
							<td style="cursor: pointer;">${vo.crdate}</td>
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
								<c:url var="crlistST" value="cr">
									<c:param name="page" value="${currentPage-1}"/>
								</c:url>
								<a href="${crlistST}"><i class="fas fa-angle-double-left"></i></a>
							</c:if>
							<!-- 끝 페이지 번호 처리 -->
							<c:set var="endPage" value="${maxPage}" />
							<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
								<c:if test="${p eq currentPage}">
									<div class="pageNum"><b>${p}</b></div>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="crlistchk" value="cr">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${crlistchk}">${p}</a>
								</c:if>
							</c:forEach>
							<c:if test="${currentPage >= maxPage}">
								<i class="fas fa-angle-double-right"></i>
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="crlistEND" value="cr">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${crlistEND}"><i class="fas fa-angle-double-right"></i></a>
							</c:if>
						</div>
					</td>
			</table>

		</div>
		<div id="modal">
			<div id="contents">
				<table>
				<tr>
				<td>게시글 제목</td>
				<td><input type="text" value="" id="csubject" readonly></td>
				</tr>
				<tr>
				<td>피신고자</td>
				<td><input type="text" value="" id="crespondent" readonly></td>
				</tr>
				<tr>
				<td>게시글 내용</td>
				<td><textarea cols="22" rows="10" id="ccontent" readonly></textarea></td>
				</tr>
				<tr>
				<td>신고자</td>
				<td><input type="text" value="" id="creporter" readonly></td>
				</tr>
				<tr>
				<td>신고 사유</td>
				<td><input type="text" value="" id="crreason" readonly></td>
				</tr>
				<tr>
				<td>신고 시간</td>
				<td><input type="text" value="" id="crdate" readonly></td>
				</tr>
				<tr>
				<td>신고 처리 사유</td>
				<td><input type="text"></td>
				</tr>
				<tr>
				<td colspan="2">
				<input type="text" value="" id="cno" style="display: none">
				<button type="button" id="detail">자세히 보기</button>
				<button type="button">신고 수리</button>
				<button type="button">신고 반려</button>
				<button type="button" class="close">닫기</button>
				</td>
				</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>