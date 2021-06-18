function newsContent() {
	$.ajax({
		url : 'https://www.cryptohub.or.kr/api/v1/news',
		type : "POST",
		cache : false,
		data : {
			token : "$2y$10$hUvFjpPSDU5Gx6vp20vhGOg6Nuib3IZBzZk4cR5f.uGbRtMKN.S2m",
			page : 1,
			limit : 100
		},
		success : function(data) {
			$('.title').append(data.data[0].title);
			$('.byline_pubdate').append(data.data[0].byline+'<br>송고&nbsp;'+data.data[0].pubdate+'<span class="update">최종수정&nbsp;'+data.data[0].updated_at+'</span>');
			$('.content').append(data.data[0].content);
		} //TODO 에러페이지
	});
};

newsContent();