$(function(){
	$("#seePw").click(function() {
		if ($("#pw").attr('type') == "password") {
			$("#pw").attr('type', 'text');
			$("#seePw").removeClass("fas fa-lock");
			$("#seePw").addClass("fas fa-lock-open");
		} else {
			$("#pw").attr('type', 'password');
			$("#seePw").removeClass("fas fa-lock-open");
			$("#seePw").addClass("fas fa-lock");
		}
	
	})
});