$(function(){
// 약관동의 체크박스
$("#checkAll").on("click", function() {
	if ($("#checkAll").is(":checked")) {
		$(".termCheck").prop("checked", true);
	} else {
		$(".termCheck").prop("checked", false);
	}
});

$(".termCheck").on("click", function() {
	if ($("input[id$=Agr]:checked").length == 3) {
		$("#checkAll").prop("checked", true);
	} else {
		$("#checkAll").prop("checked", false);
	}

})

$(function(){
	$(".agreement").on("click", function(){
		if($(".insertInfo").css("display", "block")){
			$(".insertInfo").css("display", "none");
			$(".terms").css("display", "block");
		}
	})
})

// 다음 버튼
$(function() {
	$(".insertInfo").css("display", "none");
	$("#next").on("click", function() {
		if ($(".req:checked").length == 2) {
			$(".insertInfo").css("display", "block");
			$(".terms").css("display", "none");
			$(".step1").removeClass("far fa-check-circle");
			$(".step1").addClass("fas fa-check-circle");
			$("input[name=mailing]:checked").val("Y");
			$(window).scrollTop(0);
		} else {
			alert("필수 항목에 동의해주세요.")
		}
	})
})

// 비밀번호 비밀번호 확인 일치 여부
var passEqual = function() {
	var pass1 = $("input[name=pw]").val();
	var pass2 = $("input[name=pwCh]").val();
	if ((pass1.length != 0 && pass2.length != 0) && pass1 == pass2) {
		$(".pwCh").text("비밀번호가 일치합니다.");
		$(".pwCh").css("color", "blue");
	} else {
		$(".pwCh").text("비밀번호가 일치하지 않습니다.");
		$(".pwCh").css("color", "red");
		return false;
	}
};

$("input[name=pwCh]").on("keyup", passEqual);

// 빈칸 체크
	var emailReq = function(){
	if ($("#email").val().length == 0) {
		$(".emailReg").text("필수 입력 항목입니다.");
		$(".emailReg").css("color", "red");
		return false;
	}
	}
	var nicknameReq = function(){
	if ($("#nickname").val().length == 0) {
		$(".nickReg").text("필수 입력 항목입니다.");
		$(".nickReg").css("color", "red");
		return false;
	}
	}
	var pwReq = function(){

	if ($("#pw").val().length == 0) {
		$(".pwReg").text("필수 입력 항목입니다.");
		$(".pwReg").css("color", "red");
		return false;
	}
	}
	var pwChReq = function(){

	if ($("#pwCh").val().length == 0) {
		$(".pwCh").text("필수 입력 항목입니다.");
		$(".pwCh").css("color", "red");
		return false;
	}

	}

	$("#email").on("keyup", emailReq);
	$("#nickname").on("keyup", nicknameReq);
	$("#pw").on("keyup", pwReq);
	$("#pwCh").on("keyup", pwChReq);

	var required = function(){
		if(!emailReq){
			return false;
		}
		if(!nicknameReq){
			return false;
		}
		if(!pwReq){
			return false;
		}
		if(!pwChReq){
			return false;
		}
		return true;
	}


// 형식 체크
	var emailReg = function() {
		var email = $("input[name=email]").val()
		var reg = /^[A-Za-z0-9]([-_.]?[0-9a-zA-Z])+@[A-Za-z0-9]+\.[A-Za-z0-9]+$/g;
		if (email.length != 0) {
			if (email.match(reg) == null) {
				$(".emailReg").text("영어 대 소문자, 숫자와 특수문자(-_.)만 사용할 수 있습니다.");
				$(".emailReg").css("color", "red");
				return false;
			} else {
				$(".emailReg").html("&nbsp;");
			}
		} else {

		}
	};

	var nicknameReg = function() {

		var nickname = $("input[name=nickname]").val()
		var reg = /^[가-힣A-Za-z0-9]{1,8}$/g;
		if (nickname.length != 0) {
			if (nickname.match(reg) != null) {
				$(".nickReg").text("");
			} else {
				$(".nickReg").text("2~8자의 한글, 영어 대 소문자, 숫자만 사용할 수 있습니다.");
				$(".nickReg").css("color", "red");
				return false;
			}
		} else {

		}
	};

	var pwReg = function() {

		var password = $("input[name=pw]").val()
		var reg = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;
		if (password.length != 0) {
			if (password.match(reg) != null) {
				$(".pwReg").text("")
			} else {
				$(".pwReg").text(
						"8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
				$(".pwReg").css("color", "red");
				return false;
			}
		} else {

		}
	};

	var phoneReg = function() {
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

	$("#email").on("keyup", emailReg);
	$("#nickname").on("keyup", nicknameReg);
	$("#pw").on("keyup", pwReg);
	$("#phone").on("keyup", phoneReg);

	var regCheck = function() {
		if (!emailReg) {
			return false;
		}
		if (!nicknameReg) {
			return false;
		}
		if (!pwReg) {
			return false;
		}
		if (!phoneReg) {
			return false;
		}
		return true;
	};
	
	function check(){
		if(!passEqual){
			console.log("비밀번호 일치X");
			return false;
		}
		if(!regCheck){
			console.log("형식 일치X");
			return false;
		}
		if(!required){
			console.log("필수항목 입력X");
			return false;
		}
		return true;
	}

//pinpad 생성
	new pinpad({
		ref : {
			el : '.pin1'
		},
		immediate : false,
		maxLength : 4,
		close: '<i class="far fa-times-circle"></i>',
		desc : 'ACCOUNT PASSWORD',
		passcode : true,
		letterReplace : {
			'del' : '<i class="fas fa-times delete"></i>',
			'done' : '<i class="fas fa-check done"></i>',
		}
	});

// 회원가입
$("#insert").on("click", function() {
	console.log("회원가입버튼누름");
	var dataquery = $("#frmJoin").serialize();
	$.ajax({
		url : "signup",
		type : "POST",
		data : dataquery,
		async : true,
		success : function(data) {
			if (data > 0) {
				location.href = "authwait";
				alert("회원가입 성공!")
			} else {
				alert("입력 사항을 다시 확인해주세요.")
			}
		},
		error : function() {
			alert("회원가입 실패!");
		}
	});
});
});