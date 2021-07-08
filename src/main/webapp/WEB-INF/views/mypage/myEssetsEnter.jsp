<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/myNav.css"	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pinpad.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/pinpad.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
#mee {
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
</style>
</head>
<body>
	<div id="wrapper">
	<jsp:include page="myNav.jsp"></jsp:include>
		<div id="mee">
			<h2>계좌 비밀번호 확인</h2>
			<input type="password" placeholder="계좌 비밀번호를 입력해주세요" id="bankPw"
				name="accountPassword" class="pin3">
			<button type="button" id="enterBtn">확인</button>
		</div>
	</div>
	<script>
		$("#enterBtn").click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/mypage/bankPwCheck",
				type : "post",
				data : {
					"bankPw" : $("#bankPw").val()
				},
				success : function(data) {
					if (data == 1) {
						location.href="${pageContext.request.contextPath}/mypage/me";
					} else if (data == 0) {
						alert("계좌 비밀번호가 틀렸습니다");
					} else {
						alert("에러 발생!! 관리자에게 문의하세요");
					}
				}
			});
		});

		new pinpad({
			ref : {
				el : '.pin3'
			},
			immediate : false,
			maxLength : 4,
			close : '<i class="far fa-times-circle"></i>',
			desc : 'ACCOUNT PASSWORD UPDATE',
			passcode : true,
			letterReplace : {
				'del' : '<i class="fas fa-times delete"></i>',
				'done' : '<i class="fas fa-check done"></i>',
			}
		});
	</script>
</body>
</html>