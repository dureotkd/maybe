<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<style>

html, body {

    margin: 0;

    height: 100%;

}

.reply-body {
	width: 100%;
	line-break: anywhere;
	margin-left: 5%;
}

.total-wrap {
	width: 100%;
	background: #fafafa;
}

.reply-img-Avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
}

.article-writer-Avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
}

.reply-writer {
	margin-left: 15px;
	color: #262626;
	font-weight: 600;
	width: 30%;
}

.article-user-box {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 15px;
	border-bottom: 1px solid #eee;
	font-size: 14px;
	color: #262626;
}

.writer-center {
	display: flex;
	align-items: center;
}

.writer {
	color: #262626;
	font-weight: 600;
	margin-left: 15px;
}

.fa-certificate {
	color: #3f51b5;
}

.reply-item {
	padding: 15px;
}

.article-body::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera*/
}

.article-body {
	overflow: scroll;
	height: 380px;
}


.abody {
	line-height: 25px;
	padding: 15px;
}

.reply-write-box {
	padding: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.textarea {
	padding: 10px;
	background: none;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 1px solid #ccc;
	width: 500px;
	outline: none;
}

.articleReplies {
	display: flex;
	jusitfy-content: space-between;
	align-items: center;
	margin-bottom: 15px;
	font-size: 14px;
}

/* Slideshow container */
.slideshow-container {
	position: relative;
	display: flex;
	justify-content: space-between;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: #bdbdbd;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}

.prev:hover, .next:hover {
	color: #d81b60;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
.mySlides {
	margin: 0 auto;
	overflow: hidden;
}
/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}

/* 800px 이하면 안보이게 ( 모바일 버전 ) */
@media ( max-width :799px ) {
	.visible-on-sm-up {
		display: none !important;
	}
	.detail-box {
		display: flex;
		width: 100%;
		justify-content: center;
		flex-direction: column;
		align-items: center;
	}
	.reply-list-box {
		width: 100%;
	}
	.slideshow-container {
		width: 100%;
	}
	.reply-write-box {
		border-top:1px solid #eee;
	}
	.article-video {
		height:270px;
	}
	
	.article-img {
	height: 500px;
	margin-top:20px;
	}
	
}


/* 800px 이상이면 안보이게 ( pc 버전 ) */
@media ( min-width :800px ) {
	.visible-on-sm-down {
		display: none !important;
	}
	.reply-list-box {
		border: 1px solid #eee;
	}
	.total-wrap {
		height: 100vh;
		padding-top: 20px;
	
	}
	.total-wrap {
		padding-top: 20px;
	}
	.detail-box {
		display: flex;
		max-width: 1080px;
		border: 1px solid #eee;
		border-radius: 20px;
		box-shadow: 3px 3px 3px #ccc;
		align-items: center;
		padding: 20px;
		justify-content: center;
		margin: 0 auto;
		margin-bottom: 50px;
		overflow: scroll;
	}
	.detail-box::-webkit-scrollbar {
		display: none; /* Chrome, Safari, Opera*/
	}
	.reply-list-box {
		width: 350px;
	}
	.mySlides {
		display: flex;
	}
	.slideshow-container {
		width: 50%;
	}
	
	.article-video {
		height:525px;
	}
	.article-img {
	height: 525px;
}
	
}

.reply-btn {
	padding: 10px;
	border: none;
	background: none;
	color: #d81b60;
	font-size: 1.3rem;
}

button, submit {
	cursor: pointer;
}

.recomend-box {
	display: none;
	width: 100%;
	justify-content: space-around;
	height: 569px;
}

.re-text {
	color: #8e8e8e;
}

.like-wrap {
	display: flex;
	padding-left: 15px;
	align-items: baseline;
	width: 50px;
	margin-bottom: 15px;
}

.like-point {
	margin-left: 15px;
}

.like {
	color: #d81b60;
}

.level10 {
	color: #ffb300;
}

.level5 {
	color: #3949ab;
}

.tag {
	color: #00376b;
	padding: 15px;
}

.article-video {
	outline: none;
	border: 1px solid #eee;
}

.regDate {
	color: #bdbdbd;
	font-size: 13px;
	padding: 15px;
}

.fa-smile {
	color: #212121;
	font-size: 20px;
	padding: 10px;
}

.dot {
	cursor: pointer;
	height: 7px;
	width: 7px;
	margin: 0 2px;
	background-color: white;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.dot-box {
	position:absolute;
	bottom:0;
	left:50%;
	transform:translate(-50%,-50%);
}

.active, .dot:hover {
  background-color: #d81b60;
}

/* 800px 이하면 안보이게 ( 모바일 버전 ) */
@media ( max-width :799px ) {
	.visible-on-sm-up {
		display: none !important;
	}
	.article-video {
		width: 100%;
	}
}

/* 800px 이하면 안보이게 ( 모바일 버전 ) */

/* 800px 이상이면 안보이게 ( pc 버전 ) */
@media ( min-width :800px ) {
	.visible-on-sm-down {
		display: none !important;
	}
	.article-video {
		max-width: 700px;
	}
}
</style>

<script>
	var id = parseInt('${article.id}');
</script>

<script>
	function ViewArticle1__updateLikePoint(newLikePoint) {
		$('.like-point').empty().append(newLikePoint);
	}

	function WriteReply__submitForm(form) {
		form.body.value = form.body.value.trim();
		if (form.body.value.length == 0) {
			alert('댓글을 입력해주세요.');
			form.body.focus();
			return;
		}
		$.post('../reply/doWriteReplyAjax', {
			articleId : form.articleId.value,
			body : form.body.value
		}, function(data) {
			if (data.msg) {
				alert(data.msg);
			}
			if (data.resultCode.substr(0, 2) == 'S-') {
				location.reload(); // 임시
			}
		}, 'json');
		form.body.value = '';
	}

	var slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	}
	
	function callDoLike() {
		$.post('./doLike', {
			id : id
		}, function(data) {
			if (data.msg) {
				alert(data.msg);
			}

			if (data.resultCode.substr(0, 2) == "S-") {
				ViewArticle1__updateLikePoint(data.likePoint);
			}
		}, 'json');

	}




	function doFollowSubmit__form() {
		$.post('../frined/doFollowAjax', {
			followId : form.followId.value,
			followerId : form.followerId.value
		}, function(data) {
			if (data.msg) {
				alert(data.msg);
			}
		}, 'json');

	}
</script>
<div class="total-wrap">
	<div class="detail-box">
		<c:if test="${article.extra.file__common__attachment['1'] == null}">

			<div class="slideshow-container">

				<c:if test="${article.extra.file__common__attachment['3'] != null}">
					<div class="mySlides fade">
						<img class="article-img"
							src="/file/showImg?id=${article.extra.file__common__attachment['3'].id}&updateDate=${article.extra.file__common__attachment['3'].updateDate}"
							alt="" />
					</div>
				</c:if>


				<c:if test="${article.extra.file__common__attachment['4'] != null}">
					<div class="mySlides fade" style="display: none;">
						<img class="article-img"
							src="/file/showImg?id=${article.extra.file__common__attachment['4'].id}&updateDate=${article.extra.file__common__attachment['4'].updateDate}" />
					</div>

					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					<a class="next" onclick="plusSlides(1)">&#10095;</a>

				</c:if>

				<c:if test="${article.extra.file__common__attachment['5'] != null}">
					<div class="mySlides fade" style="display: none;">
						<img class="article-img"
							src="/file/showImg?id=${article.extra.file__common__attachment['5'].id}&updateDate=${article.extra.file__common__attachment['5'].updateDate}" />
					</div>
					
					
				</c:if>
				
				<c:if test="${article.extra.file__common__attachment['4'] != null}">
				
				
				<div class="dot-box">
					
				<span class="dot active"  onclick="currentSlide(1)"></span>
				<c:if test="${article.extra.file__common__attachment['4'] != null}">
						<span class="dot" onclick="currentSlide(2)"></span> 
					</c:if>
				<c:if test="${article.extra.file__common__attachment['5'] != null}">
				<span class="dot" onclick="currentSlide(3)"></span>
				</c:if>		
				</div>
				
				</c:if>

			</div>

		</c:if>



		<c:if test="${article.extra.file__common__attachment['1'] != null}">
			<video controls
				src="/file/streamVideo?id=${article.extra.file__common__attachment['1'].id}&updateDate=${article.extra.file__common__attachment['1'].updateDate}"
				class="article-video"></video>
		</c:if>


		<div class="table-box reply-list-box">
			<div class="article-user-box">
				<a href="../member/showOther?id=${article.memberId}"
					class="writer-center"> <img class="article-writer-Avatar"
					src="${article.extra.writerAvatarImgUrl}"> <span
					class="writer">${article.extra.writer}</span></a>
				<c:if test="${member.level == 10 }">
					<i class="fas fa-crown level10"></i>
				</c:if>
				<c:if test="${member.level == 5 }">
					<i class="fas fa-certificate level5"></i>
				</c:if>
				<c:if test="${member.level < 5 }">
					<i class="fas fa-user-alt level"></i>
				</c:if>

				<form action="" onsubmit="doFollowSubmit__form(this); return false;">
				<input type="hidden" name="followerId" value="${member.id}" />
				<input type="hidden" name="followId" value="${loginedMemberId}" />
				<input type="submit" value="팔로우" />
				</form>
				<i class="fas fa-ellipsis-h"></i>
			</div>
			<div class="article-body">
				<p class="abody">${article.body}</p>
				<p class="tag">#${article.tag}</p>
				<div class="like-wrap">
					<a href="#" onclick="callDoLike();"> <i
						class="fas fa-heart like"></i>
					</a>
					<p class="like-point">${article.extra.likePoint}</p>
					개
				</div>
				<div class="reply-item"></div>
			</div>


			<c:if test="${isLogined}">
				<form action=""
					onsubmit="WriteReply__submitForm(this); return false;">
					<div class="reply-write-box">
						<input type="hidden" name="articleId" value="${article.id}" /> <i
							class="far fa-smile"></i>
						<textarea class="textarea" name="body" cols="30" rows="1"
							placeholder="댓글 달기 " autofocus></textarea>
						<button class="reply-btn">
							<i class="far fa-paper-plane"></i>
						</button>
					</div>
				</form>
			</c:if>
		</div>

		<div class="recomend-box visible-on-sm-up">
			<p class="re-text">회원님을 위한 추천</p>
			<a href="#">모두 보기</a>
		</div>




		<script>
			var ReplyList__$box = $('.reply-list-box');
			var ReplyList__$tbody = ReplyList__$box.find('.reply-item');
			var ReplyList__lastLodedId = 0;

			// 1초댓글불러오기
			ReplyList__loadMoreInterval = 1 * 1000

			function ReplyList__loadMoreCallback(data) {
				if (data.body.articleReplies
						&& data.body.articleReplies.length > 0) {
					ReplyList__lastLodedId = data.body.articleReplies[data.body.articleReplies.length - 1].id;
					ReplyList__drawReplies(data.body.articleReplies);

				}

				setTimeout(ReplyList__loadMore, ReplyList__loadMoreInterval);
			}

			function ReplyList__loadMore() {

				$.get('../reply/getForPrintRepliesAjax', {
					articleId : param.id,
					from : ReplyList__lastLodedId + 1
				}, ReplyList__loadMoreCallback, 'json');
			}

			function ReplyList__drawReplies(articleReplies) {
				for (var i = 0; i < articleReplies.length; i++) {
					var articleReply = articleReplies[i];
					ReplyList__drawReply(articleReply);
				}
			}

			function ReplyList__drawReply(articleReply) {
				var html = '';
				html += '<tr class="articleReplies" data-id="' + articleReply.id + '">';
				//	html += '<td>' + articleReply.id + '</td>';
				//	html += '<td>' + articleReply.regDate + '</td>';

				html += '<td>';
				// 회원가입시 
				html += '<a href="../member/showOther?id='
						+ articleReply.memberId
						+ '"><img class="reply-img-Avatar" src="' + articleReply.extra.writerAvatarImgUrl + '"></a>';
				html += '</td>';

				html += '<td class="reply-writer">' + articleReply.extra.writer
						+ '</td>';

			

				html += '<td>';
				html += '<div class="reply-body">' + articleReply.body
						+ '</div>';
				//	html += '<button type="button" onclick="ReplyList__delete(this);">삭제</button>';

				//	html += '<button type="button" onclick="ReplyList__showModifyFormModal(this);">수정</button>';
				html += '</td>';
				html += '</tr>';
				var $tr = $(html);
				ReplyList__$tbody.prepend($tr);
			}

			ReplyList__loadMore();
		</script>



	</div>
</div>






<%@ include file="../part/foot.jspf"%>