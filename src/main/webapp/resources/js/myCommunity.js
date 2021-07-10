//탭메뉴 jQuery
$('.tablinks').click(function() {

	for (var i = 0; i < $('.tabcontent').length; i++) {
		$('.tabcontent').hide();
		if($('.tablinks').hasClass("tablinksActive")) {
			$('.tablinks').removeClass('tablinksActive');
		}
	}

	$(".tabcontent").eq($(this).index()).show();
	$(this).addClass('tablinksActive');

});

$(function() {
	$(".tabcontent").eq(0).show(); // 나의 게시글 탭 기본값 : show()
	$('.tablinks').eq(0).addClass('tablinksActive');
	
	for (var i = 0; i < $('#ccontentSize').val(); i++) {
		var text = $('.ccontentHidden').eq(i).val();
		var replaceText = text.replace(/<(\/img|img)([^>]*)>/gi,"[이미지]");
		replaceText = replaceText.replace(/(<([^>]+)>)/ig,"");
		$('.ccontentSpan').eq(i).html(replaceText);
	}
	
	for (var i = 0; i < $('#rcontentSize').val(); i++) {
		var replyText = $('.rcontentHidden').eq(i).val();
		replaceReplyText = replyText.replace(/(<([^>]+)>)/ig,"");
		$('.rcontentSpan').eq(i).html(replaceReplyText);
	}
	
});

var myCommunityExpandBool = Boolean(false);

$('#myCommunityExpand').click(function() {
	if(myCommunityExpandBool == false) {
		$('.myCommunityList').show();
		myCommunityExpandBool= true;
		$('#myCommunityExpand').val("접기");
	} else if(myCommunityExpandBool == true) {
		$('.myCommunityList').hide();
		myCommunityExpandBool= false;
		$('#myCommunityExpand').val("더 보기");
	}
});

var myReplyCommunityExpandBool = Boolean(false);

$('#myReplyCommunityExpand').click(function() {
	if(myReplyCommunityExpandBool == false) {
		$('.myReplyCommunityList').show();
		myReplyCommunityExpandBool= true;
		$('#myReplyCommunityExpand').val("접기");
	} else if(myReplyCommunityExpandBool == true) {
		$('.myReplyCommunityList').hide();
		myReplyCommunityExpandBool= false;
		$('#myReplyCommunityExpand').val("더 보기");
	}
});



