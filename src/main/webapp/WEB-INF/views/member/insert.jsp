<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<title>회원 가입</title>
</head>
<body class="content">
	<div>
		<h1>회원가입</h1>
		<div class="progress">
		<table>
		
		</table>
			<div class="terms">
			<i class="far fa-check-circle yet1"></i>
			<i class="far fa-check-circle yet2"></i>
			</div>
			<div class="insertInfo">
			<i class="fas fa-check-circle done"></i>
			<i class="far fa-check-circle yet2"></i>
			</div>
		</div>
		<form id="frmJoin">
			<div class="terms">
				<table>
					<tr>
						<td><input type="checkbox" id="checkAll"> <label
							for="checkAll">모든 항목에 동의합니다.</label></td>
					</tr>
					<tr>
						<td>
							<p>이용약관</p>
							<div class="termsDetail">
								<p>기본 약관의 주요 내용 고지</p>

							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="termAgr" class="termCheck req"><label
							for="termAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td>
							<p>개인정보 수집 및 이용</p>
							<div class="termsDetail">
								<p>BTS(이하 '회사')는 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하
									&lsquo;정보통신망법'), 개인정보보호법에 따라 이용자의 개인정보 및 권익을 보호하고 개인정보와 관련된
									이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="reqAgr" class="termCheck req"><label
							for="reqAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td>
							<p>이벤트 및 정보 수신</p>
							<div class="termsDetail">
								<p>BTS(이하 '회사')는 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하
									&lsquo;정보통신망법'), 개인정보보호법에 따라 이용자의 개인정보 및 권익을 보호하고 개인정보와 관련된
									이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="optAgr" class="termCheck"
							name="mailing"><label for="optAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td>19세 미만은 회원 자격이 없으며, 서비스 이용이 제한됩니다.</td>
					</tr>
					<tr>
						<td><input type="button" value="다음" id="next"></td>
					</tr>
				</table>
			</div>
			<div class="insertInfo">
				<p>*는 필수 입력 사항입니다.</p>
				<table>
					<tr>
						<td>이메일*</td>
					</tr>
					<tr>
						<td><input type="text" name="email" id="email"
							placeholder="이메일을 입력해주세요."></td>
					</tr>
					<tr>
						<td><p class="alert emailReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td>닉네임*</td>
					</tr>
					<tr>
						<td><input type="text" name="nickname" id="nickname" 
							placeholder="닉네임을 입력해주세요."></td>
					</tr>
					<tr>
						<td><p class="alert nickReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td>비밀번호*</td>
					</tr>
					<tr>
						<td><input type="password" name="pw" id="pw" 
							placeholder="비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<td><p class="alert pwReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td>비밀번호 확인*</td>
					</tr>
					<tr>
						<td><input type="password" name="pwCh" id="pwCh" 
							placeholder="비밀번호를 다시 한 번 입력해주세요."></td>
					</tr>
					<tr>
						<td><p class="alert pwCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td>계좌 비밀번호*</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="bankPw" id="bankPw">
							<input type="password" class="bankPw bpw1 bp" size="1" maxlength="1"> 
							<input type="password" class="bankPw bpw2 bp" size="1" maxlength="1"> 
							<input type="password" class="bankPw bpw3 bp" size="1" maxlength="1"> 
							<input type="password" class="bankPw bpw4 bp" size="1" maxlength="1">
						</td>
					</tr>
					<tr>
					<td>
						<p class="alert bankPw"></p>
					</td>
					</tr>
					<tr>
						<td>계좌 비밀번호 확인*</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="bankPwCh" id="bankPwCh">
							<input type="password" class="bankPwCh bpwCh1 bp" size="1" maxlength="1"> 
							<input type="password" class="bankPwCh bpwCh2 bp" size="1" maxlength="1"> 
							<input type="password" class="bankPwCh bpwCh3 bp" size="1" maxlength="1"> 
							<input type="password" class="bankPwCh bpwCh4 bp" size="1" maxlength="1">
						</td>
					</tr>
					<tr>
						<td><p class="alert bankPwCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td>성별</td>
					</tr>
					<tr>
						<td><select name="gender">
								<option value="">선택안함</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
						</select></td>
					</tr>
					<tr>
						<td>생년월일</td>
					</tr>
					<tr>
						<td><input type="date" name="birthdate"></td>
					</tr>
					<tr>
						<td>연락처</td>
					</tr>
					<tr>
						<td><input type="text" name="phone"></td>
					</tr>
					<tr>
						<td><p class="alert phoneReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td><input type="button" value="회원가입" id="insert"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<!-- 약관 동의 체크 박스 -->
	<script>
		$("#checkAll").on("click",function() {
			if ($("#checkAll").is(":checked")) {
				$(".termCheck").prop("checked", true);
			} else {
				$(".termCheck").prop("checked", false);
			}
		});

		$(".termCheck").on("click",function() {
			if ($("input[id$=Agr]:checked").length == 3) {
				$("#checkAll").prop("checked", true);
			} else {
				$("#checkAll").prop("checked", false);
			}

		})
	</script>
	<!-- 다음 버튼 동작 -->
	<script>
		$(function() {
			$(".insertInfo").css("display", "none");
			$("#next").on("click",function() {
				if ($(".req:checked").length == 2) {
					$(".insertInfo").css("display", "block");
					$(".terms").css("display", "none");
					$("input[name=mailing]:checked").val("Y");
				} else {
					alert("필수 항목에 동의해주세요.")
				}
			})
		})
	</script>
	<!-- 계좌비밀번호 포커스 이동 및 값 합치기-->
	<script>
		$(".bankPw").on("keyup", function() {
					var charLimit = $(this).attr("maxlength");
					if (this.value.length >= charLimit) {
						$(this).next(".bankPw").focus();
						console.log($(this).val());
						$("input[name=bankPw]").val(
								$(".bpw1").val() 
								+ $(".bpw2").val()
								+ $(".bpw3").val() 
								+ $(".bpw4").val());
						console.log($("input[name=bankPw]").val());
					}
				})
		$(".bankPwCh").on("keyup", function() {
					var charLimit = $(this).attr("maxlength");
					if (this.value.length >= charLimit) {
						$(this).next(".bankPwCh").focus();
						console.log($(this).val());
						$("input[name=bankPwCh]").val(
								$(".bpwCh1").val() 
								+ $(".bpwCh2").val()
								+ $(".bpwCh3").val()
								+ $(".bpwCh4").val());
						console.log($("input[name=bankPwCh]").val());
					}
				})
	</script>
	<!-- 항목 체크 -->
	<script>
	// 비밀번호 비밀번호 확인 일치 여부
	function passEqual(){
			var pass1 = $("input[name=pw]").val();
			var pass2 = $("input[name=pwCh]").val();
			if ((pass1.length!=0 && pass2.length !=0) && pass1 == pass2) {
				$(".pwCh").text("비밀번호가 일치합니다.");
				$(".pwCh").css("color", "blue");
			} else {
				$(".pwCh").text("비밀번호가 일치하지 않습니다.");
				$(".pwCh").css("color", "red");
				return false;
			}
	};
	// 계좌비밀번호 계좌비밀번호 확인 일치 여부 
	function bankEqual(){
			var pass1 = $("input[name=bankPw]").val();
			var pass2 = $("input[name=bankPwCh]").val();

			if ((pass1.length != 0 && pass2.length != 0) && pass1 == pass2) {
				$(".alert.bankPwCh").text("비밀번호가 일치합니다.");
				$(".alert.bankPwCh").css("color", "blue");
			} else {
				$(".alert.bankPwCh").text("비밀번호가 일치하지 않습니다.");
				$(".alert.bankPwCh").css("color", "red");
				return false;
			}
	};
	
	// 빈칸 체크
	function required(){
			if($("#email").val().length == 0){
				$(".emailReg").text("필수 입력 항목입니다.");
				$(".emailReg").css("color", "red");
				return false;
			}
			if($("#nickname").val().length == 0){
				$(".nickReg").text("필수 입력 항목입니다.");
				$(".nickReg").css("color", "red");
				return false;
			}

			if($("#pw").val().length == 0){
				$(".pwReg").text("필수 입력 항목입니다.");
				$(".pwReg").css("color", "red");
				return false;
			}

			if($("#pwCh").val().length == 0){
				$(".pwCh").text("필수 입력 항목입니다.");
				$(".pwCh").css("color", "red");
				return false;
			}

			if($("#bankPw").val().length == 0){
				$(".alert.bankPw").text("필수 입력 항목입니다.");
				$(".alert.bankPw").css("color", "red");
				return false;
			}

			if($("#bankPwCh").val().length == 0){
				$(".alert.bankPwCh").text("필수 입력 항목입니다.");
				$(".alert.bankPwCh").css("color", "red");
				return false;
			}
		};
		
		// 형식 체크
		function regCheck(){
					var email = $("input[name=email]").val()
					var reg = /^[A-Za-z0-9]([-_.]?[0-9a-zA-Z])+@[A-Za-z0-9]+\.[A-Za-z0-9]+$/g;
					if(email.length != 0){
						if (email.match(reg) == null) {
							$(".emailReg").text("영어 대 소문자, 숫자와 특수문자(-_.)만 사용할 수 있습니다.");
							$(".emailReg").css("color", "red");
							return false;
						} else {
							$(".emailReg").html("&nbsp;");
						}
					}
					
					var nickname = $("input[name=nickname]").val()
					var reg = /^[가-힣A-Za-z0-9]{1,8}$/g;
					if(nickname.length != 0){
						if (nickname.match(reg) != null) {
							$(".nickReg").text("");
						} else {
							$(".nickReg").text("2~8자의 한글, 영어 대 소문자, 숫자만 사용할 수 있습니다.");
							$(".nickReg").css("color", "red");
							return false;
						}
					}	

					var password = $("input[name=pw]").val()
					var reg = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;
					if(password.length != 0){
						if (password.match(reg) != null) {
							$(".pwReg").text("")
						} else {
							$(".pwReg").text("8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
							$(".pwReg").css("color", "red");
							return false;
						}
					}
				
					var password = $("input[name=bankPw]").val()
					var reg = /^\d{4}$/;
					if(password.length != 0){
						if (password.match(reg) != null) {
							$(".alert.bankPw").text("")
						} else {
							$(".alert.bankPw").text("4자리의 숫자만 사용할 수 있습니다.");
							$(".alert.bankPw").css("color", "red");
							return false;
						}
					}

					var phone = $("input[name=phone]").val()
					var reg = /^01(?:0|1|[6-9])*(?:\d{3}|\d{4})*\d{4}$/;
					if (phone.length != 0) {
						if (phone.match(reg) != null) {
							$(".phoneReg").text("");
						} else {
							$(".phoneReg").text("01로 시작하는 숫자만 사용할 수 있습니다.");
							$(".phoneReg").css("color", "red");
							return false;
						}
					} else {
						$(".phoneReg").text("");
						return true;
					}
		};

		$("#insert").on("click", function() {
			console.log("회원가입버튼누름");
			var dataquery = $("#frmJoin").serialize();
			$.ajax({
				url : "insertmember",
				type : "POST",
				data : dataquery,
				async : true,
				success : function(data) {
					if (data > 0) {
						location.href = "authwait";
						} else {
							alert("입력 사항을 다시 확인해주세요.")
							}
					},
					error : function() {
						alert("회원가입 실패");
						}
					});
			});
	</script>
</body>
</html>