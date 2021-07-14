<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buy.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sell.js"></script>
<script>
	function moveAdminPost() {
		var newForm = $('<form></form>');
		newForm.attr("method", "post");
		newForm.attr("action", "<%=request.getContextPath()%>/admin");
		newForm.appendTo('body');
		newForm.submit();		
	}
	function moveMypagePost() {
		var newForm = $('<form></form>');
		newForm.attr("method", "post");
		newForm.attr("action", "<%=request.getContextPath()%>/mypage");
		newForm.appendTo('body');
		newForm.submit();		
	}
</script>
<header>
<div class="behindheader"></div><br>
	<div class="header">
	<div class="h_left">
		<ul>
			<li class="logo"><a href="<%=request.getContextPath()%>/mainpage"><img width="120px" height="50px"
					src="<%=request.getContextPath()%>/resources/assets/img/bts_logo.svg" style="vertical-align:middle;"></a></li>
			<li class="menu"><a class="menutext" href="<%=request.getContextPath()%>/aboutus">About Us</a></li>
			<li class="menu"><a class="menutext" href="${pageContext.request.contextPath}/nlist?news_keyword=">뉴스</a></li>
 			<li class="menu"><a class="menutext" href="<%=request.getContextPath()%>/clist">공지사항</a></li>
			<li class="menu"><a class="menutext" href="<%=request.getContextPath()%>/insta">커뮤니티</a></li>
			<li class="menu"><a class="menutext" href="<%=request.getContextPath()%>/investmentpage">모의투자</a></li>
 			<li class="menu"><a class="menutext" href="javascript:void(window.open('<%=request.getContextPath()%>/prochart', '_blank','width=1300px, height=800px'))">프로차트</a></li>
			<li class="menu"><a class="menutext" href="${pageContext.request.contextPath}/rankDaily">랭킹</a></li>
			<li class="menu"><a class="menutext" href="${pageContext.request.contextPath}/cashShop">충전소</a></li>
		</ul>
	</div>
	<div class="h_right">
		<c:choose>
			<c:when test="${loginMember == null }">
				<ul>
					<li class="menu member"><a class="menutext" href="<%=request.getContextPath()%>/login" id="login">로그인</a></li>
					<li class="menu member"><a class="menutext" href="<%=request.getContextPath()%>/signup" id="signup">회원가입</a></li>
				</ul>
			</c:when>
			<c:when test="${loginMember eq 'admin' }">
				<ul>
					<li class="menu member"><a class="menutext" href="<%=request.getContextPath()%>/logout" id="logout">로그아웃</a></li>
					<li class="menu member"><a class="menutext" onclick="moveAdminPost()" style="color: white; cursor:pointer">관리자</a></li>
				</ul>
			</c:when>
			<c:when test="${loginMember != null }">
				<ul>
					<li class="menu member"><a class="menutext" href="<%=request.getContextPath()%>/logout" id="logout">로그아웃</a></li>
					<li class="menu member"><a class="menutext" onclick="moveMypagePost()" style="color: white; cursor:pointer">마이페이지</a></li>
				</ul>
			</c:when>
		</c:choose>
	</div>
</div>
</header>