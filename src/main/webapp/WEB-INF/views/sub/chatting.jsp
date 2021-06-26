<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<title>TalkPlus Sample App</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.5.3/css/bulma.css">
	
	<%--  <script
	src="${pageContext.request.contextPath}/resources/json/composer.json"></script>
	<script
	src="${pageContext.request.contextPath}/resources/php/index.php"></script>  --%>
<style>
html, body {
	height: 100%;
}

#main {
	height: inherit;
	margin: 0 auto;
	display: flex;
	flex-direction: row;
	align-items: center;
	-webkit-align-items: center;
	justify-content: center;
	-webkit-justify-content: center;
}

.messages-section {
	width: 500px;
}

.columns {
	width: 100%;
}

.users, .messages, .timestamps {
	padding: 5px 0px;
}

.message-count {
	margin-top: 48px;
}
</style>
</head>
<body>

	<div id="username-window" class="container">
		<div class="field">
			<label class="label"> <Username></Username>
			</label>
			<div class="control">
				<input id="username-input" placeholder="Enter username"
					class="input is-small" type="text" />
			</div>
		</div>
		<button id="login-button" class="button is-primary is-active">Login</button>
	</div>

	<div id="main" style="display: none;">
		<div class="messages-section">
			<div class="columns">
				<div class="column has-text-left">
					<strong>User</strong>
					<div id="users" class="users"></div>
				</div>
				<div class="column has-text-centered">
					<strong>Message</strong>
					<div id="messages" class="messages"></div>
				</div>
				<div class="column has-text-centered">
					<strong>Datetime</strong>
					<div id="timestamps" class="timestamps"></div>
				</div>
			</div>
			<input id="enter" placeholder="Enter text" class="input is-small"
				type="text" />
		</div>
		<note-count-component></note-count-component>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"
		integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
		crossorigin="anonymous"></script>
	<script src="https://asset.talkplus.io/talkplus-js-0.1.5.js"></script>

	<script
	src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</body>
</html>