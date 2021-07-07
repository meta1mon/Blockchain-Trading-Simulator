// 모달창 실행시키는 함수
	var cno = 0;
	var rno = 0;

	function report(nowCno) {
	      cno = nowCno;
	      console.log(cno);
	       modalFn('modal_report');
	}
	function rreport(nowRno) {
	      rno = nowRno;
	      console.log(rno);
	      modalReportReplyFn('modal_report_reply');
	}

	function reply(nowRno) {
	      rno = nowRno;
	      console.log(rno);
	      modalReplyFn('modal_reply');
	}

// 게시글, 댓글 드랍다운 메뉴 클릭 시 열기/닫기
$('.dropdown').click(function() {
	console.log("클릭함");
	console.log("클릭dropdown 상위 article idx: " + $(this).parents('article').index());
	$('.dropdown-content').eq($(this).parents('article').index()).show();
	});

$('.replyDropdown').click(function() {
	console.log("클릭함");
	console.log("클릭dropdown 상위 article idx: " + $(this).parents('article').index());
	$('.dropdown-content').eq($(this).parents('article').index()).show();
	$(".replyDropdown").mouseleave(function(){$(this).css("display", "block");});
	});

$(document).mouseup(function (e){
    var dropdown = $('.dropdown-content');
    var replyDropdownBtn = $('.replyDropdown');
    var containerReply = $('#modal_reply'); // 댓글 모달창
    var containerReport = $('#modal_report'); // 게시글 신고 모달창
    var containerReportReply = $('#modal_report_reply'); //댓글 신고 모달창
    
    if( dropdown.has(e.target).length === 0){
    	dropdown.css('display','none');
//    	replyDropdownBtn.css('display','none');
    }
    if( containerReport.has(e.target).length === 0){
    	containerReport.css('display','none');
    	bg.remove();
    	modal.style.display = 'none';
    }
    if( containerReportReply.has(e.target).length === 0){ 
    	containerReportReply.css('display','none');
    	bgReportReply.remove();
    	modalReportReply.style.display = 'none';
    }
//    if( containerReply.has(e.target).length === 0){ 
//    	containerReply.css('display','none');
//    	bgReply.remove();
//    	modalReply.style.display = 'none';
//    }
  });

   // 게시글 신고 부분
      <!-- 게시글 신고 전송 ajax -->
      $("#btnreport").on("click", function() {
         var dataList = $("#frmC").serialize();
         $.ajax({
            url : "${pageContext.request.contextPath}/admin/reportCommunity",
            type : "post",
            data : dataList,
            success : function(data) {
               if(data > 0) {
                  alert("신고 접수 되었습니다!");
               } else {
                  alert("신고 접수 실패! 관리자에게 문의하세요!");                  
               }
               bg.remove();
               modal.style.display = 'none';
               
            }
         });
      })
    
    
    
   // 댓글 신고 부분
    $("#btnrply").on("click", function() {
       var rreport = $("input[name='rreport']:checked").val();
       $.ajax({
          url : "${pageContext.request.contextPath}/admin/reportRcommunity",
          type : "post",
          data : {"rrreason" : rreport,
             "rno" : rno},
          success : function(data) {
             if(data > 0) {
                alert("신고 접수 되었습니다!");
             } else {
                alert("신고 접수 실패! 관리자에게 문의하세요!");                  
             }
             bg.remove();
             modal.style.display = 'none';
             
          }
       });
    })

      // 댓글 삽입
   function rplyInsert() {
	   var rInsertData = $("#writeRcommunity").serialize();
      $.ajax({
          url : "${pageContext.request.contextPath}/rcInsert",
          type : "post",
          data : rInsertData,
          success : function(data) {
        	  alert("댓글 작성 완료");
         	 window.location.reload();
          }
   	})
   }
   // 댓글 수정 버튼 생성
   function makeUpdateBtn(index) {

      $(".comment_content").eq(index).hide();
      $(".makeBtn").eq(index).hide();
      $(".newRcontent").eq(index).show();
      $(".submitRUpdate").eq(index).show();
      $(".cancleRUpdate").eq(index).show();
   }
   
   // 댓글 수정 취소 버튼 클릭 시
   function updateRCancle(index) {
      $(".comment_content").eq(index).show();
      $(".makeBtn").eq(index).show();
      $(".newRcontent").eq(index).hide();
      $(".newRcontent").eq(index).text("");
      $(".submitRUpdate").eq(index).hide();
      $(".cancleRUpdate").eq(index).hide();
   }
   
   // 댓글 수정완료 버튼 클릭 시
   function replyUpdate(rno, idx) {
      var newOne = $(".newRcontent").eq(idx).val();
      $.ajax({
         url : "${pageContext.request.contextPath}/rcUpdate",
         type : "post",
         data : {
            "rno" : rno,
            "rcontent": newOne
         },
         success : function(data) {
        	 alert("댓글 수정완료")
        	 window.location.reload();
         }
      })
   }
   
   // 댓글 삭제   -- 새로고침을 사용 중인데 추후 수정해야 할듯
   function replyDelete(deleteRno, deleteCno) {
      $.ajax({
         url : "${pageContext.request.contextPath}/rcDelete",
         type : "post",
         data : {
            "rno" : deleteRno,
            "cno" : deleteCno
         },
         success : function(data) {
        	 alert("댓글 삭제 완료");
        	 window.location.reload();
         }
      });
   }
   
   /*게시글 신고 모달*/
   var bg = null;
   var modal = null;
   function modalFn(id) {
        var zIndex = 9999;
        modal = document.getElementById(id);

        // 모달 div 뒤에 희끄무레한 레이어
        bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.3)'
        });
        document.body.append(bg);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    }
    
    /*댓글 신고 모달*/
    var bgReportReply = null;
    var modalReportReply = null;
    function modalReportReplyFn(id) {
    	var zIndex = 9999;
    	modalReportReply = document.getElementById(id);
    	
    	// 모달 div 뒤에 희끄무레한 레이어
    	bgReportReply = document.createElement('div');
    	bgReportReply.setStyle({
    		position: 'fixed',
    		zIndex: zIndex,
    		left: '0px',
    		top: '0px',
    		width: '100%',
    		height: '100%',
    		overflow: 'auto',
    		// 레이어 색갈은 여기서 바꾸면 됨
    		backgroundColor: 'rgba(0,0,0,0.3)'
    	});
    	document.body.append(bgReportReply);
    	
    	// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    	modalReportReply.querySelector('.modal_close_btn').addEventListener('click', function() {
    		bgReportReply.remove();
    		modalReportReply.style.display = 'none';
    	});
    	
    	modalReportReply.setStyle({
    		position: 'fixed',
    		display: 'block',
    		boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
    		
    		// 시꺼먼 레이어 보다 한칸 위에 보이기
    		zIndex: zIndex + 1,
    		
    		// div center 정렬
    		top: '50%',
    		left: '50%',
    		transform: 'translate(-50%, -50%)',
    		msTransform: 'translate(-50%, -50%)',
    		webkitTransform: 'translate(-50%, -50%)'
    	});
    }
    
    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
    	for (var k in styles) this.style[k] = styles[k];
    	return this;
    }
    
    
    /* 댓글 모달*/
    var bgReply = null;
   var modalReply = null;
   function modalReplyFn(id) {
        var zIndex = 9999;
        modalReply = document.getElementById(id);

        // 모달 div 뒤에 희끄무레한 레이어
        bgReply = document.createElement('div');
        bgReply.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.1)'
        });
        document.body.append(bgReply);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modalReply.querySelector('.modal_reply_close_btn').addEventListener('click', function() {
        	bgReply.remove();
        	modalReply.style.display = 'none';
        });

        modalReply.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    }
