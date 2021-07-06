<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		checkTime();
	})

	function getTimeOut() {
		return timeOut;
	}

	function getTime() {
		var now = new Date();
		var day = now.getDay(); // 요일 : 0(일) 1(월) ~~
		var date = now.getDate(); // 일 : 1 ~
		var hour = now.getHours(); // 시 : 0 ~ 23
		var minute = now.getMinutes(); // 분 0 ~ 59
		var second = now.getSeconds(); // 초 0 ~ 59
		console.log(now);
		/* 		누적 1시간 (정각)
		 일단 1일 (오전 9시)
		 주단 1주 (월 9시)
		 월단 1월 (1일 9시) */

		// 누적 : 1시간, 정각
		if (minute == 0 && second == 0) {
			alert("누적, 정각, 1시간 단위!");
		}

		// 하루 단위(오전 9시 기준)
		if (hour == 9 && minute == 0 && second == 0) {
			alert("Daily, 오전 9시, 1일 단위!");
		}

		// 주 단위(월 9시 기준)
		if (day == 1 && hour == 9 && minute == 0 && second == 0) {
			alert("Weekly, 월요일 9시, 1주 단위!");
		}

		// 월 단위(1일 9시 기준)
		if (day == 1 && hour == 9 && minute == 0 && second == 0) {
			alert("Monthly, 1일 9시, 1월 단위!");
		}

	}

	function checkTime() {
		setInterval("getTime()", 1000);
	}
</script>
</head>
<body>

</body>
</html>