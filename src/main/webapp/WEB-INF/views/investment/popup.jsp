<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>BTS</title>
</head>
<style>
#icon {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	position: fixed;
	top: 70px;
	right: 55px;
}

.before {
	border: 1px solid rgb(140, 102, 200);
	background: white;
	color: rgb(140, 102, 200);
}

.after {
	background-color: rgb(140, 102, 200);
	color: white;
}

#icon:hover {
	background-color: rgb(140, 102, 200);
	color: white;
}

.chat {
	position : fixed;
	top: 120px;
	right: 5px;
	border: 1px solid rgb(140, 102, 200);
	border-radius: 5px;
	position: fixed;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<input type="button" id="icon" value="코인지갑" class="before">
	<iframe src="mpopup" width="700px" height="450px" class="chat"></iframe>
	<script>
		$(function() {
			
			
			$("#icon").css("display", "none");
			$(".chat").css("display", "none");
			var show = function() {
				$(".chat").toggle();
			}
			$("#icon").on("click", show);

		})
	</script>
</body>
</html>