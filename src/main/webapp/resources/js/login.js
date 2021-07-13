$(function(){
	$("#seePw").click(function() {
		if ($("#pw").attr('type') == "password") {
			$("#pw").attr('type', 'text');
			$("#seePw").removeClass("fas fa-lock");
			$("#seePw").addClass("fas fa-lock-open");
		} else {
			$("#pw").attr('type', 'password');
			$("#seePw").removeClass("fas fa-lock-open");
			$("#seePw").addClass("fas fa-lock");
		}
	
	})
	// 입력, 형식 체크
	var checkER = false;
	var emailReg = function() {
		var email = $("input[name=email]").val()
		var reg = /^[A-Za-z0-9]([-_.]?[0-9a-zA-Z])+@[A-Za-z0-9]+\.[A-Za-z0-9]+$/g;
		if (email.length != 0) {
			if (email.match(reg) != null) {
				$(".emailReg").html("&nbsp;");
				checkER = true;
			} else {
				$(".emailReg").text("이메일 형식이 올바르지 않습니다.");
			}
		} else {
			$(".emailReg").html("&nbsp;");
			$(".emailICh").text("필수 입력 항목입니다.");
			
		}
	};
	$("#email").on("keyup", emailReg);
	
	var checkPR = false;
	var pwReg = function() {
		var email = $("input[name=email]").val()
		var password = $("input[name=pw]").val()
		var reg = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;
		if (password.length != 0) {
			if (password.match(reg) != null) {
				$(".pwReg").html("&nbsp;");
				checkPR = true;
			} else if(email == "admin" && password == "admin"){
				$(".emailReg").html("&nbsp;");
				$(".pwReg").html("&nbsp;");
				checkER = true;
				checkPR = true;
			} else {
				$(".pwReg").text(
				"비밀번호 양식이 맞지 않습니다.");
			}
		} else {
			$(".pwReg").html("&nbsp;");
			$(".pwICh").text("필수 입력 항목입니다.");
		}
	};
	$("#pw").on("keyup", pwReg);
});