$(function(){
	var seePw = function(){
		if($("#pw").attr("type", "password")){
			$("#pw").attr("type", "text");
		} else {
			$("#pw").attr("type", "password");
		}
	}
	$("#seePw").on("click", seePw);
})