$(document).ready(function(){
			console.log("로딩바 안보여요");
		   $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
		})
		.ajaxStart(function(){
			console.log("보여준다");
			$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
		})
		.ajaxStop(function(){
			console.log("숨긴다");
			$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
		});	