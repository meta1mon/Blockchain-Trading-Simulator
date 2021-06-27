<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 스타일 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<!-- 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="container">
			<jsp:include page="../sub/pop.jsp"></jsp:include>
			<div class="w500px">
				<form action="loginmember" method="post" id="frmLogin">
					<table class="w100">
						<tr>
							<td colspan="2">
								<h1 class="center">로그인</h1>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3">이메일</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="email" id="email"
								class="reqInfo" placeholder="이메일을 입력해주세요."></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3"><p class="alert emailReg">&nbsp;</p></td>
						</tr>
						<tr>
							<td colspan="3">비밀번호</td>
						</tr>
						<tr>
							<td colspan="2"><input type="password" name="pw" id="pw"
								class="reqInfo" placeholder="비밀번호를 입력해주세요."></td>
							<td class="w50px">&nbsp; <span id="seePw"
								class="fas fa-lock"> </span>
						</tr>
						<tr>
							<td colspan="3"><p class="alert pwReg">&nbsp;</p></td>
						</tr>
						<tr>
							<td colspan="2">
								<p class="alert loginCh">
									<c:choose>
										<c:when test="${not empty errorMessage}">
											<c:out value="${errorMessage}" />
										</c:when>
										<c:when test="${empty errorMessage}">
											<c:out value="" />
										</c:when>
									</c:choose>
								</p>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="로그인"
								class="btn1"></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2" class="right"><span><a
									href="<%=request.getContextPath()%>/find" class="small link">비밀번호
										찾기</a></span> <span><a href="<%=request.getContextPath()%>/signup"
									id="signup" class="small link">회원가입</a></span></td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>