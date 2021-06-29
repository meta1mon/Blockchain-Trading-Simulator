<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
#icon {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	position: fixed;
	top: 70px;
	right: 5px;
}
.before{
	border: 1px solid rgb(140, 102, 200);
	background: white;
	color: rgb(140, 102, 200);
}
.after{
	background-color: rgb(140, 102, 200);
	color: white;
}

#icon:hover {
	background-color: rgb(140, 102, 200);
	color: white;
}

.chat {
	position: fixed;
	top: 120px;
	right: 5px;
	border: 1px solid rgb(140, 102, 200);
	border-radius: 5px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
<input type="button" id="icon" value="HI" class="before">
<iframe src="Chatting" width="500px" height="700px" class="chat"></iframe>
<script>
	$(function() {
		/* $(".chat").css("display", "none") */
		var show = function() {
			$(".chat").toggle();
		}
		$("#icon").on("click", show);

	})
</script>
</body>
</html>