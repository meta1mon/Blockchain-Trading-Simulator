$(function(){
		
//현재 시각 및 날짜
	var SYSDATE = new Date();
	var year = SYSDATE.getFullYear();
	var month = (SYSDATE.getMonth()+1);
	var date = SYSDATE.getDate();
	var hour = SYSDATE.getHours();
	var min = SYSDATE.getMinutes();
	var sec = SYSDATE.getSeconds();

	if(month < 10){
		month = "0"+month;
	}
	if(date < 10){
		date = "0"+date;
	}
	if(hour < 10){
		hour = "0"+hour;
	}
	if(min < 10){
		min = "0"+min;
	}
	if(sec < 10){
		sec = "0"+sec;
	}

	SYSDATE = year+"-"+month+"-"+date+" "+hour+":"+min+":"+sec;
	
	// 이메일, 닉네임 중복 체크
	var checkED = false;
	var emailDupe = function(){
		$.ajax({
			url: "emailcheck",
			type: "post",
			dataType: "json",
			data: {"email" : $("#email").val()},
			success: function(data){
				if(data == 1){
					$(".emailCh").text("이미 사용 중인 이메일입니다.");
					checkED = false;
				} else {
					checkED = true;
				}
			}
		})
	}
	$("#email").on("keyup", emailDupe);

	var checkND = false;
	var nickDupe = function(){
		$.ajax({
			url: "nickcheck",
			type: "post",
			dataType: "json",
			data: {"nickname" : $("#nickname").val()},
			success: function(data){
				if(data == 1){
					$(".nickCh").text("이미 사용 중인 닉네임입니다.");
					checkND = false;
				} else {
					checkND = true;
				}
			}
		})
	}
	$("#nickname").on("keyup", nickDupe);


	// 입력, 형식 체크
		var checkER = false;
		var emailReg = function() {
			var email = $("input[name=email]").val()
			var reg = /^[A-Za-z0-9]([-_.]?[0-9a-zA-Z])+@[A-Za-z0-9]+\.[A-Za-z0-9]+$/g;
			if (email.length != 0) {
				if (email.match(reg) == null) {
					$(".emailReg").text("영어 대 소문자, 숫자와 특수문자(-_.@)만 사용할 수 있습니다.");
					console.log("이메일 양식X");
				} else {
					$(".emailReg").html("&nbsp;");
					console.log("이메일 양식O");
					checkER = true;
				}
			} else {
				$(".emailReg").html("&nbsp;");
				$(".emailICh").text("필수 입력 항목입니다.");
				console.log("이메일 입력X");
				
			}
		};
		var checkNN = false;
		var nicknameReg = function() {

			var nickname = $("input[name=nickname]").val()
			var reg = /^[가-힣A-Za-z0-9]{2,8}$/g;
			if (nickname.length != 0) {
				if (nickname.match(reg) != null) {
					$(".nickReg").html("&nbsp;");
					console.log("닉네임 양식O");
					checkNN = true;
				} else {
					$(".nickReg").text("2~8자의 한글, 영어 대 소문자, 숫자만 사용할 수 있습니다.");
					console.log("닉네임 양식X");
				}
			} else {
				$(".nickReg").text("필수 입력 항목입니다.");
				console.log("닉네임 입력X");
				
			}
		};
		
		var checkPR = false;
		var pwReg = function() {
			var password = $("input[name=pw]").val()
			var reg = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;
			if (password.length != 0) {
				if (password.match(reg) != null) {
					$(".pwReg").html("&nbsp;");
					console.log("비밀번호 양식O");
					checkPR = true;
				} else {
					$(".pwReg").text(
							"8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
					console.log("비밀번호 양식X");
				}
			} else {
				$(".pwReg").html("&nbsp;");
				$(".pwICh").text("필수 입력 항목입니다.");
				console.log("비밀번호 입력X");
			}
		};
		
		var checkPCR = false;
		var pwChReg = function() {
			var password1 = $("input[name=pw]").val()
			var password2 = $("input[name=pwCh]").val()
			var reg = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;
			if (password2.length != 0 && password2.match(reg) != null) {
				$(".pwCh").html("&nbsp;");
				console.log("비밀번호 확인 입력O")
				checkPCR = true;
			} else if (password2.length != 0 && password2.match(reg) == null) {
				$(".pwCh")
						.text("8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
				console.log("비밀번호 확인 양식X");
			} else {
				$(".pwCh").text("필수 입력 항목입니다.");
				console.log("비밀번호 확인 입력X");
			}
		};
		
		var checkPN = true;
		var phoneReg = function(){
			var phone = $("#phone").val()
			var reg = /^01([0|1|6|7|8|9]?)+([0-9]{3,4})+([0-9]{4})$/;
			if(phone.length != 0 && phone.match(reg) == null){
				checkPN = false;
				console.log("연락처 양식X")
				$(".phoneReg").text("휴대폰 번호 양식이 맞지 않습니다.")
			} else {
				checkPN = true;
				console.log("연락처 양식O")
				$(".phoneReg").html("&nbsp;")
			}
		}
		
		var checkPE = false;
		var passEqual = function() {
			var pass1 = $("input[name=pw]").val();
			var pass2 = $("input[name=pwCh]").val();
				if (pass1 == pass2) {
					$(".pwCh").text("비밀번호가 일치합니다.");
					$(".pwCh").css("color", "blue");
					console.log("일치");
					checkPE=true;
				} else {
					$(".pwCh").text("비밀번호가 일치하지 않습니다.");
					console.log("일치X");
				}
		};
		
		var checkBday = false;
		var isAdult = function(){
			var bDay = $("#birthdate").val(); //input date의 값
			console.log(bDay);
			var dateSplit = bDay.split("-"); //input date의 값을 -로 쪼갠거야
			var bYear = dateSplit[0]; //input date 첫조각 연도
			var bMonth = dateSplit[1]; //input date 두번째조각 월
			var bDate = dateSplit[2]; //input date 마지막조각 일
			var yMod = year - bYear;
			var mMod = month - bMonth;
			var dMod = date - bDate;
			console.log("나이: " + yMod);
			console.log("월 차이: " + mMod);
			console.log("일 차이: " + dMod);
			console.log("오늘 날짜: " + SYSDATE);
			console.log("오늘 연도: " + year);
			console.log("오늘 월: " + month);
			console.log("오늘 일: " + date);
			console.log("탄생 날짜: " + bDay);
			console.log("탄생 연도: " + bYear);
			console.log("탄생 월: " + bMonth);
			console.log("탄생 일: " + bDate);
			if (bDay != null && bDay != "" && bDay != undefined) {
				if (yMod < 19) {
					checkBday = false;
					console.log("미성년자" + checkBday);
					$("#bdlabel").css("color", "red");
				} else if (yMod > 19) {
					checkBday = true;
					console.log("성인" + checkBday);
				} else {
					if (mMod < 0) {
						checkBday = false;
						console.log(month + "월보다 늦게 태어난 만 19살" + checkBday);
					} else if (mMod > 0) {
						checkBday = true;
						console.log(month + "월보다 빨리 태어난 만 19살" + checkBday);
					} else {
						if(dMod => 0){
							checkBday = true;
							console.log(month + "월 에 태어난 만 19살" + checkBday);
						} else {
							checkBday = false;
							console.log("곧 19살" +checkBday);
						}
					};
				};
			} else {
				checkBday = true;
				console.log("선택사항이니까: " + checkBday);
			};
		};
		$(function(){
		$("#birthdate").attr("max", year+"-12-31");
		});
		
		//이벤트 등록
		$("#birthdate").on("change", isAdult);
		$("#pw").on("keyup", pwReg);
		$("#pw").on("blur", pwReg);
		$("#pwCh").on("keyup", pwChReg);
		$("#pwCh").on("blur", pwChReg);
		$("#pwCh").on("keyup", passEqual);
		$("#email").on("keyup", emailReg);
		$("#nickname").on("keyup", nicknameReg);
		$("#phone").on("keyup", phoneReg);
})
