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

function newsHeadLine() {
	console.log("newsHeadLine 실행")
	$.ajax({
				url : 'https://www.cryptohub.or.kr/api/v1/news',
				type : "POST",
				cache : false,
				data : {
					token : "$2y$10$hUvFjpPSDU5Gx6vp20vhGOg6Nuib3IZBzZk4cR5f.uGbRtMKN.S2m"
				},
				success : function(data) {
					// 헤드라인 : 최신 기사 10개만 출력
					for (var i = 0; i < 10; i++) {
						var newsTime = dateDiffer(data.data[i].pubdate);
						$(".scroll").append('<span class="headList" id="headTime">&#128344;'+newsTime+'&nbsp;&nbsp;</span><span class="headList">'+data.data[i].title+'</span>&nbsp;&nbsp;&nbsp;&nbsp;');
					}
					
				}
			});
};

function newsList(p) {
	console.log("newsList 실행")
	$.ajax({
				url : 'https://www.cryptohub.or.kr/api/v1/news',
				type : "POST",
				cache : false,
				data : {
					token : "$2y$10$hUvFjpPSDU5Gx6vp20vhGOg6Nuib3IZBzZk4cR5f.uGbRtMKN.S2m"
				},
				success : function(data) {
					// 뉴스목록 
					for (var i = p; i < p+3; i++) {
						var newsTime = dateDiffer(data.data[i].pubdate);
						$("#raw1").append('<div class="newsLabel"><img class="newsThumbnail" src="'+data.data[i].thumbnail+'"><div id="newsTitle">'+data.data[i].title+'</div><div id="newsTime">&#128344;'+newsTime+'</div></div>');
					}
					for (var i = p+3; i < p+6; i++) {
						var newsTime = dateDiffer(data.data[i].pubdate);
						$("#raw2").append('<div class="newsLabel"><img class="newsThumbnail" src="'+data.data[i].thumbnail+'"><div id="newsTitle">'+data.data[i].title+'</div><div id="newsTime">&#128344;'+newsTime+'</div></div>');
					}
					console.log("pubdate"+data.data[10].pubdate);  // pubdate 문제 해결해야함(temp 영상보고 다시해보기)
				}
			});
};

$('.newsPage a').click(function(){
	// 버튼 색 바꿔주기
	if($('.newsPage a').hasClass("pageActive")) {
		$('.newsPage a').removeClass();
		$('.newsPage a').addClass("inactive");
		$(this).addClass("pageActive");
	} 
	
	// 페이징
	p = $(this).html();
	p = parseInt(p)-1;// 현재 페이지 읽어온 뒤 1 빼주기
	p *= 6;				// 6을 곱하면 상단 첫 기사 index
	$("#raw1").empty(); // 각 클래스 내용 비워주기
	$("#raw2").empty();
	newsList(p);
});

newsHeadLine();

var p = 0;

newsList(p);
