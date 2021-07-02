const commentInput = document.getElementsByClassName('input-comment')[0];
const commentBtn = document.getElementsByClassName('submit-comment')[0];
const commentList = document.getElementsByClassName('comments')[0];

// 댓글 달기

function addComment() {
    var newComment = document.createElement('li')
    newComment.innerHTML = `<span><span class="point-span userID">thisisyourhyung</span>` + commentInput.value + `</span>`;

    // 코멘트에 더해지는 버튼 생성
    let commentBtns = document.createElement('div');

    let deleteBtn = document.createElement('img');
    deleteBtn.classList.add("comment-more");
    deleteBtn.src = "https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png";
    deleteBtn.alt = "more";

    let likeBtn = document.createElement('img');
    likeBtn.classList.add("comment-heart");
    likeBtn.src = "https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/heart.png";
    likeBtn.alt = "하트";

    let likedBtn = document.createElement('img');
    likedBtn.classList.add("comment-heart-liked");
    likedBtn.src = "img/liked.png";
    likedBtn.alt = "좋아요된하트";

    let commentLike = document.createElement('div');
    commentLike.classList.add("comment-like");

    // 버튼에 함수 선언
    deleteBtn.addEventListener('click', function() {
        this.parentNode.parentNode.remove();
    })

    commentLike.addEventListener('click', () => {
        if (likeBtn.style.display === 'none') {
            likeBtn.style.display = 'inline-block';
            likedBtn.style.display = 'none';
        } else {
            likeBtn.style.display = 'none';
            likedBtn.style.display = 'inline-block';
        }
    })

    // 코멘트에 버튼 추가
    commentLike.appendChild(likeBtn);
    commentLike.appendChild(likedBtn);
    commentBtns.appendChild(deleteBtn);
    commentBtns.appendChild(commentLike);
    newComment.appendChild(commentBtns);
    commentList.appendChild(newComment);
    commentInput.value = "";
    commentBtn.disabled = true;
}

commentBtn.addEventListener('click', function(){
    if (commentInput.value) {
        addComment();
    }
})

commentInput.addEventListener('keyup', function(e){
    if (commentInput.value) {
        commentBtn.disabled = false;
        if (e.which === 13) {
            addComment();
        }
    }
    else {
    commentBtn.disabled = true;
    }
})

// 댓글 지우기

let deleteBtn = document.querySelectorAll('.comment-more');
deleteBtn.forEach(function(event) {
    event.addEventListener('click', function() {
        this.parentNode.parentNode.remove();
    });
})

// 추천

let commentLike = document.querySelectorAll('.icons-left');
commentLike.forEach(function(event) {
    event.addEventListener('click', function() {
        var likeBtn = this.querySelector('.thumbsup');
        var likedBtn = this.querySelector('.thumbsup-liked');

        if (likeBtn.style.display === 'none') {
            likeBtn.style.display = 'inline-block';
            likedBtn.style.display = 'none';
        } else {
            likeBtn.style.display = 'none';
            likedBtn.style.display = 'inline-block';
        }
    })
})

// 비추천

let commentDislike = document.querySelectorAll('.icons-left');
commentDislike.forEach(function(event) {
	event.addEventListener('click', function() {
		var likeBtn = this.querySelector('.thumbsdown');
		var likedBtn = this.querySelector('.thumbsdown-disliked');
		
		if (likeBtn.style.display === 'none') {
			likeBtn.style.display = 'inline-block';
			likedBtn.style.display = 'none';
		} else {
			likeBtn.style.display = 'none';
			likedBtn.style.display = 'inline-block';
		}
	})
})


//   // 비추천
//   function dislike() {
//      if(${loginMember == null}) {
//         alert("로그인이 필요합니다");         
//      } else {
//         $.ajax({
//            url : "${pageContext.request.contextPath}/cdislike",
//            type : "post",
//            data : {
//               cno : "${community.cno}"
//            },
//            datatype : "json",
//            success : function(data) {
//               window.location.reload();
//            }
//         });
//      }
//   }
//   
//   // 추천
//   function clike() {
//      if(${loginMember == null}) {
//         alert("로그인이 필요합니다");         
//      } else {
//         $.ajax({
//            url : "${pageContext.request.contextPath}/clike",
//            type : "post",
//            data : {
//               "cno" : "${community.cno}"
//            },
//            success : function(data) {
//               window.location.reload();
//            }
//         });
//      }
//   }
   
   
// 댓글 모달창
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
            backgroundColor: 'rgba(0,0,0,0.8)'
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
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.6), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

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

    document.getElementById('popup_open').addEventListener('click', function() {
        // 모달창 띄우기
        modalFn('my_modal_reply');
    })
