function dateDiffer(pubDate){
	// 현재 시각과 뉴스 송고일자 차이 반환 함수
	var cur = new Date();
	var pub = new Date(pubDate);
	var diff = cur - pub;
	var currDay = 24*60*60*1000;	
	var currHour = 60*60*1000;
	var currMin = 60*1000;
	var newsTime;
	if (parseInt(diff/currDay) > 0) {
		newsTime= parseInt(diff/currDay)+"일 전";
	} else if(parseInt(diff/currHour) > 0) {
		newsTime= parseInt(diff/currHour)+"시간 전";
	} else {
		newsTime= parseInt(diff/currMin)+"분 전";
	}
	
	return newsTime;
};

function newsAPI() {
	console.log("newsAPI함수 실행")
	$.ajax({
				url : 'https://www.cryptohub.or.kr/api/v1/news',
				type : "POST",
				cache : false,
				data : {
					token : "$2y$10$hUvFjpPSDU5Gx6vp20vhGOg6Nuib3IZBzZk4cR5f.uGbRtMKN.S2m"
				},
				success : function(data) {
					
					for (var i = 0; i < 5; i++) {
						var newsTime = dateDiffer(data.data[i].pubdate);
						$(".headList").append('<li class="headli"><span>['+newsTime+']</span><span>'+data.data[i].title+'</span></li>');
					}
					

				}
			});
};

newsAPI();