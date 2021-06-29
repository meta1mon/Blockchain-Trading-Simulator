<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 로딩 바 -->
<div id="Progress_Loading"
	style="width: 100%; height: 100%; z-index: 10000000; position: absolute; top: 0px; left: 0px">
	<div style="width: 100%; height: 100%; background-color: rgba(225, 225, 225, 0.5)">
		<div style="width: 500px; height: 500px; position: absolute; top: calc(50% - 50px); left: calc(50% - 50px);">
			<img src="<%=request.getContextPath()%>/resources/assets/img/Progress_Loading.gif" />
		</div>
	</div>
</div>