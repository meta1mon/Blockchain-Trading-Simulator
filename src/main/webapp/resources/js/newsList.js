var page = 1;
var search = '';

$('#searchBtn').click(function(){
	
//	console.log($('#search').val());
	search = $('#search').val();
	newsList(page, search);
});

$('#search').on("keyup",function(key){
    if(key.keyCode==13) {
    	search = $('#search').val();
    	newsList(page, search);
    }
});


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
//	console.log("newsHeadLine 실행")
	$.ajax({
				url : 'https://www.cryptohub.or.kr/api/v1/news',
				type : "POST",
				cache : false,
				data : {
					token : "$2y$10$hUvFjpPSDU5Gx6vp20vhGOg6Nuib3IZBzZk4cR5f.uGbRtMKN.S2m"
				},
				success : function(data) {
					console.log(typeof(data));
					// 헤드라인 : 최신 기사 10개만 출력
					for (var i = 0; i < 10; i++) {
						var newsTime = dateDiffer(data.data[i].pubdate);
						$(".scroll").append('<a class="atitle" href="ncontent?news_id='+data.data[i].id+'"><span class="headList" id="headTime">&#128344;'+newsTime+'&nbsp;&nbsp;</span><span class="headList">'+data.data[i].title+'</span></a>&nbsp;&nbsp;&nbsp;&nbsp;');
						$(".atitle").css("color","black");
					}
				}
			});
};

function newsList(page, search) {
	var p = (page-1)*6; //(현재 페이지-1) 곱하기 6	
	
//	console.log("newsList 실행")
	$.ajax({
				url : 'https://www.cryptohub.or.kr/api/v1/news',
				type : "POST",
				cache : false,
				data : {
					token : "$2y$10$hUvFjpPSDU5Gx6vp20vhGOg6Nuib3IZBzZk4cR5f.uGbRtMKN.S2m",
					page : 1,
					limit : 100,
					keyword : search
				},
				success : function(data) {
					
					$("#raw1").empty(); // 각 클래스 내용 비워주기
					$("#raw2").empty();
					// 뉴스목록 
					for (var i = p; i < p+3; i++) {
						var newsTime = dateDiffer(data.data[i].pubdate);
						$("#raw1").append('<a class="alist1" href="ncontent?news_id='+data.data[i].id+'"><div class="newsLabel"><img class="newsThumbnail" src="'+data.data[i].thumbnail+'"><div id="newsTitle">'+data.data[i].title+'</div><div id="newsTime">&#128344;'+newsTime+'</div></div></a>');
						$(".alist1").css("color","black");
					}
					for (var i = p+3; i < p+6; i++) {
						var newsTime = dateDiffer(data.data[i].pubdate);
						$("#raw2").append('<a class="alist2" href="ncontent?news_id='+data.data[i].id+'"><div class="newsLabel"><img class="newsThumbnail" src="'+data.data[i].thumbnail+'"><div id="newsTitle">'+data.data[i].title+'</div><div id="newsTime">&#128344;'+newsTime+'</div></div></a>');
						$(".alist2").css("color","black");
					}
//					console.log("console total : "+data.total);  
//					console.log("console : "+data.current_page);
//					console.log("current page : " + page);
					genPage(page, data.total);

					//페이지별 함수
					$('.newsPage a').click(function(){
//						console.log("클릭펑션");
						// 버튼 색 바꿔주기 CSS
						if($('.newsPage a').hasClass("pageActive")) {
							$('.newsPage a').removeClass();
							$('.newsPage a').addClass("inactive");
							$(this).addClass("pageActive");
						} 
						
						// 페이징 함수
						page = parseInt($(this).html());
						newsList(page, search);
					});

					// 이전 버튼 함수
					$('#pageBefore').click(function(){
						if(page>3) {
							page -= 3;
						}
						newsList(page, search);
						
						// 버튼 색 빼주기 CSS
						if($('.newsPage a').hasClass("pageActive")) {
							$('.newsPage a').removeClass();
							$('.newsPage a').addClass("inactive");
						} 
						
						// 이전 페이지 버튼색 넣어주기 CSS
						$('.newsPage a').each(function(index){
							var targetPage = parseInt($(this).html());
							
							if(targetPage == page){
//								console.log(index + ": " +targetPage);
								$(this).addClass("pageActive");
							}
						});
					});

					// 다음 버튼 함수
					$('#pageNext').click(function(){
						var totalLast;
						if(data.total%6>0){
							totalLast = parseInt(data.total/6)+1;
						} else {
							totalLast = parseInt(data.total/6);
						}
						
						if( !search ){
							totalLast = 17;
						} 
						
						if (totalLast >17) {
							totalLast = 17;
						}
						
						if(page < totalLast-2) {
							page += 3;
						}
						newsList(page, search);
						
						// 버튼 색 빼주기 CSS
						if($('.newsPage a').hasClass("pageActive")) {
							$('.newsPage a').removeClass();
							$('.newsPage a').addClass("inactive");
						} 
						
						// 이전 페이지 버튼색 넣어주기 CSS
						$('.newsPage a').each(function( index){
							var targetPage = parseInt($(this).html());
							
							if(targetPage == page){
//								console.log(index + ": " +targetPage);
								$(this).addClass("pageActive");
							}
						});
					});
					
				} //TODO 에러페이지
			});
};

function genPage(page, total) {
	var totalLast;
	if(total%6>0){
		totalLast = parseInt(total/6)+1;
	} else {
		totalLast = parseInt(total/6);
	}
	
	if( !search ){
		totalLast = 17;
	}
	
	if (totalLast >17) {
		totalLast = 17;
	}
	
//	console.log("totalLast : " + totalLast);
//	console.log("current page : " + page);
	
	var startPage;
	if(page < 4) {
		startPage = 1;
	}else if (page>totalLast-3){
		startPage = totalLast-4;
	}else{	
		startPage = page - 2;
	}
	
	var lastPage;
	if(totalLast < 5) {
		lastPage = totalLast;
	}else if ((totalLast-startPage) < 5){
		lastPage = totalLast;
	}else {
		lastPage = startPage+4;
	}
	
//	console.log("lastPage : " +  lastPage);
	
	$(".newsPage").empty();
	$(".newsPage").append('<button class="pageBtn" id="pageBefore">이전</button>');
	for (var i = startPage; i < lastPage+1; i++) {
		if(i==page){
			$(".newsPage").append('<a id="page" class="pageActive">'+i+'</a>');
		}else{
			$(".newsPage").append('<a id="page" class="inactive">'+i+'</a>');
		}
	}
	$(".newsPage").append('<button class="pageBtn" id="pageNext">다음</button>');
};


newsHeadLine();

newsList(page, search);

