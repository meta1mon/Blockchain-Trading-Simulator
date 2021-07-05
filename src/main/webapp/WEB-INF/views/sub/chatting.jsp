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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.5.3/css/bulma.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>BTS</title>
<style>
* {
	-ms-overflow-style: none;
}

*::-webkit-scrollbar {
	display: none;
}

html, body {
	height: 100%;
}

#main {
	height: inherit;
	margin: 0 auto;
	display: flex;
	flex-direction: row;
	/* align-items: center;
	-webkit-align-items: center;
	justify-content: center;
	-webkit-justify-content: center; */
	left: 0px;
}

.messages-section {
	width: 400px;
	padding: 20px !important;
}

.columns {
	width: 400px;
}

.column {
	
}
/* .timestamps{
	width: 80px;
} */
/* .users, .messages, .timestamps {
	padding: 5px 0px;
}
 */
.message-count {
	margin-top: 48px;
}

#username-window {
	margin-left: calc(50% - 150px);
	margin-top: calc(250px - 40px);
	padding: 100px;
}

#username-input, #login-button {
	width: 300px;
	padding: 10px !important;
}

#username-input {
	height: 40px;
}

#enter {
	width: 500px;
	height: 40px;
	padding: 10px !important;
}

#username-input:focus, #enter:focus {
	outline: 1px solid rgb(140, 102, 200);
}

#enter {
	position: sticky;
	bottom: 0px;
	margin-left: -20px;
}

* {
	font-size: small;
	padding: 0px !important;
}

p {
	height: 40px;
}

.users p, .timestamps p {
	padding-top: 7.785px !important;
}
</style>
</head>
<body>

	<div id="username-window" class="container">
		<div class="field">
			<label class="label"> <Username></Username>
			</label>
			<div class="control">
				<input id="username-input" placeholder="영어와 숫자만 사용하실 수 있습니다."
					class="is-small" type="text" />
			</div>
		</div>
		<button id="login-button" class="btn1">Enter</button>
	</div>

	<div id="main" style="display: none;">
		<div class="messages-section">
			<div class="columns">
				<div class="column has-text-left users"
					style="float: left; width: 100px;">
					<!-- <strong>User</strong> -->
					<div id="users" class="users"></div>
				</div>
				<div class="column has-text-left">
					<!-- <strong>Message</strong> -->
					<div id="messages" class="messages"
						style="float: left; width: 250px;"></div>
				</div>

			</div>
			<input id="enter" class="is-small" type="text"
				style="margin-top: 10px;" />
		</div>
		<note-count-component></note-count-component>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"
		integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
		crossorigin="anonymous"></script>
	<script src="https://asset.talkplus.io/talkplus-js-0.1.5.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</body>
</html>