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
}


.delete-btn {
	position:absolute;
	border:none;
	background:none;
	color:#bdbdbd;
}

.reply-img-Avatar {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 50%;
}

.article-writer-Avatar-wrap {
	width: 40px;
	height: 40px;
	overflow: hidden;
	border-radius: 50%;
}

.article-writer-Avatar {
	width: 100%;
	height: 100%;
	object-fit: cover;
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
	position:relative;
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
		margin-top: 60px;
	}
	.reply-list-box {
		width: 100%;
	}
	.slideshow-container {
		width: 100%;
	}
	.reply-write-box {
		border-top: 1px solid #eee;
	}
	.article-video {
		height: 270px;
	}
	.article-img {
		height: 500px;
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
		padding-top: 20px;
	}
	.detail-box {
		display: flex;
		max-width: 940px;
		border: 1px solid #eee;
		border-radius: 20px;
		box-shadow: 3px 3px 3px #ccc;
		box-sizing:border-box;
		align-items: center;
		padding: 20px;
		justify-content: center;
		margin: 100px auto;
		margin-bottom: 50px;
		overflow: scroll;
	}
	.detail-box::-webkit-scrollbar {
		display: none; /* Chrome, Safari, Opera*/
	}
	.reply-list-box {
		width: 400px;
	}
	.mySlides {
		display: flex;
	}
	.slideshow-container {
		width: 50%;
	}
	.article-video {
		height: 525px;
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
	font-size: 17px;
}

.level5 {
	color: #d81b60;
	font-size: 17px;
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

.replyRegDate {
	color: #bdbdbd;
	font-size:13px;
	left:55px;
	position:absolute;
	
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
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translate(-50%, -50%);
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
		margin-right: 13px;
	}
	.total-wrap {
		background: #fafafa;
	}
}

/* 800px 이하면 안보이게 ( 모바일 버전 ) */

/* 800px 이상이면 안보이게 ( pc 버전 ) */
@media ( min-width :800px ) {
	.visible-on-sm-down {
		display: none !important;
	}
	.article-video {
		max-width: 500px;
	}
	.total-wrap {
		width: 100%;
		background: #fafafa;
	}
}

.follow-btn {
	background: none;
	border: none;
	color: #0d47a1;
	cursor: pointer;
}

/* Form */
.popup {
	display: none;
	position: fixed;
	border-radius: 2px;
	left: 50%;
	top: 50%;
	z-index: 100;
	padding: 25px 60px 60px;
	width: 600px;
	height: 500px;
	transform: translate(-50%, -50%);
	box-sizing: border-box;
	background: #fff;
}

.popup h2 {
	padding: 0 0 42px;
	font-weight: normal;
	font-size: 30px;
	font-family: 'Courgette', cursive;
	color: #d81b60;
	text-align: center;
	line-height: 100%;
}

.popup .close {
	position: absolute;
	right: 30px;
	top: 30px;
	width: 41px;
	height: 41px;
	color: black;
	text-align: center;
}

.popup .con {
	padding: 35px 50px;
	border: 1px solid #e8e8e8;
}

.agree {
	position: relative;
	margin: 28px 0 0;
	padding: 0 30px;
	height: 60px;
	border: 1px solid #e8e8e8;
	line-height: 60px;
}

.agree label span {
	color: #de4f41;
}

.agree a.view {
	position: absolute;
	right: 30px;
	top: 15px;
	width: 93px;
	height: 30px;
	border: 1px solid #ddd;
	text-align: center;
	line-height: 30px;
	border-radius: 3px;
}

.dim {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 99;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}

table.type1 th, table.type1 td {
	padding: 0 0 20px;
}

table.type1 th {
	padding-top: 15px;
	font-size: 14px;
	color: #222;
	text-align: left;
	font-weight: normal;
	vertical-align: top;
}

table.type1 th span {
	color: #de4f41;
}

table.type1 th em {
	color: #999;
}

table.type1 textarea {
	height: 116px;
}

table.type1 tr:last-child th, table.type1 tr:last-child td {
	padding: 0 0 30px;
}

input[type="checkbox"] {
	position: absolute;
	left: -3000%;
}

input[type="checkbox"]+label {
	font-size: 14px;
	color: #666;
}

input[type="checkbox"]+label:before {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 1px solid #ddd;
	margin: 0 10px 0 0;
	background: #f4f4f4;
	vertical-align: middle;
	box-sizing: border-box;
	transition: all 0.3s;
}

input[type="checkbox"]:checked+label:before {
	border: 7px solid #666;
}

.txt_center {
	text-align: center;
	padding: 30px 0 0;
}

.btn_type1 {
	display: inline-block;
	width: 170px;
	height: 50px;
	background: #0095f6;
	line-height: 50px;
	color: #fff;
	text-align: center;
	border-radius: 3px;
	border: none;
	outline: none;
}

textarea {
	border: 1px solid #dbdbdb;
}

select {
	height: 32px;
	font-size: 13px;
	color: #373737;
	border: 1px solid #e9e9e9;
	background: #fff;
}

input[type=tel], input[type=time], input[type=text], input[type=password],
	input[type=email], input[type=file], input[type=url], input[type=number],
	input[type=date], textarea {
	width: 100%;
	height: 48px;
	font-size: 14px;
	color: #999;
	border: 1px solid #e8e8e8;
	background: #fff;
	text-decoration: none;
	text-indent: 20px;
	transition: all 0.5s;
	vertical-align: middle;
	border-radius: 3px;
}

textarea::-webkit-input-placeholder, input::-webkit-input-placeholder {
	color: #999;
	font-size: 13px;
}

textarea {
	padding: 5px 20px;
	text-indent: 0;
	box-sizing: border-box;
}

select:focus, textarea:focus, input:focus {
	border: 1px solid #727272;
}

input[type=tel][readonly], input[type=text][readonly], input[type=password][readonly],
	input[type=email][readonly], input[type=tel][disabled], input[type=text][disabled],
	input[type=password][disabled], input[type=email][disabled] {
	background: #eaeaea !important;
	border-color: #c0c0c0 !important;
	color: #666 !important;
	-webkit-appearance: none;
	font-size: 12px;
}

textarea[readonly], textarea[disabled] {
	padding: 11px;
	font-size: 16px;
	color: #666 !important;
	font-weight: normal;
	line-height: 140%;
	height: 78px;
	background: #eaeaea;
	border: 1px solid #c0c0c0;
}

.clear {
	zoom: 1;
	clear: both;
}

.clear:after {
	content: "";
	display: block;
	clear: both;
}

.hide {
	position: absolute;
	left: -5000px;
}

.skip {
	position: absolute;
	left: 0;
	top: -100px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	background: #000;
	color: #fff;
	text-align: center;
	font-size: 14px;
	transition: all 0.5s;
}
</style>

<script>
	var id = parseInt('${article.id}');
	var followId = parseInt('${member.id}');
	var followerId = parseInt('${loginedMemberId}');
</script>

<script>
	function doFollow() {
		$.post('../member/doActionFollow', {
			followId : followId,
			followerId : followerId
		}, 'json');
		location.reload();
	}

	$(document).ready(function() {

		$(".msgSubmit").on('click', function() {
			$(".popup").show();
			$(".dim").show();
		});
		$(".popup .close").on('click', function() {
			$(this).parent().hide();
			$(".dim").hide();
		});
	});

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
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
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

	function WriteMessage__submitForm(form) {
		form.body.value = form.body.value.trim();
		if (form.body.value.length == 0) {
			alert('메세지를 입력해주세요.');
			form.body.focus();
			return;
		}
		$.post('../message/doWriteMessageAjax', {
			fromId : form.fromId.value,
			toId : form.toId.value,
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



	function doDeleteFollow(el) 	{
		if ( confirm ("팔로우를 취소하시겠습니까 ?") == true ){
		var $div = $(el).closest('.detail-box');
		// 가장 가까운 li를 찾아라
		var followId = parseInt($div.attr('data-id'));
		// 정수화 -> data-id
		
		$.post('../member/doDeleteFollow', {
			followId : followId,
			followerId : followerId
		},'json');
		location.reload();
		} else {
			return;
		}
	}

	function ArticleReply__delete(obj) 	{
		if ( confirm ("댓글을 삭제하시겠습니까 ?") == true ){
			var $clickedBtn = $(obj);
			var $tr = $clickedBtn.closest('tr');
			var id = parseInt($tr.attr('data-id'));
			$tr.remove();
		$.post('../article/doDeleteReplyAjax', {
			id : id
		}, 'json');
		} else {
			return;
		}
	}

</script>
<div class="total-wrap">
	<div class="detail-box" data-id="${article.memberId}">
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

						<span class="dot active" onclick="currentSlide(1)"></span>
						<c:if
							test="${article.extra.file__common__attachment['4'] != null}">
							<span class="dot" onclick="currentSlide(2)"></span>
						</c:if>
						<c:if
							test="${article.extra.file__common__attachment['5'] != null}">
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
					class="writer-center"><div class="article-writer-Avatar-wrap">
						<img class="article-writer-Avatar"
							src="${article.extra.writerAvatarImgUrl}">
					</div> <span class="writer">${article.extra.writer}</span></a>
				<c:if test="${member.level == 10 }">
					<i class="fas fa-crown level10"></i>
				</c:if>
				<c:if test="${member.level == 5 }">
					<i class="far fa-gem level5"></i>
				</c:if>
				<c:if test="${member.level < 5 }">
					<i class="fas fa-user-alt level"></i>
				</c:if>
				
				<c:if test="${following == 0}">
				<c:if test="${followCross == 0 }">
				<c:if test="${loginedMemberId != member.id }">
				<a href="#" class="follow-btn" onclick="doFollow(this);">팔로우</a>
				</c:if>
				</c:if>
				</c:if>
				
				<c:if test="${following == 0 }">
				<c:if test="${followCross == 1 }">
				<c:if test="${loginedMemberId != member.id }">
						<a href="#" class="follow-btn" onclick="doFollow(this);">맞팔로우</a>
						</c:if>
					</c:if>
					</c:if>
					
					
				<c:if test="${following == 1}">
				<a href="#" class="follow-btn" onclick="doDeleteFollow(this);">언팔로우</a>
				</c:if>		
				
					<ul class="setting-box">
						<li><i class="fas fa-ellipsis-h"></i></li>
						<c:if test="${loginedMemberId != article.memberId }">
						<ul class="setting-items">
							<li><a href="#" class="red">사용자 차단</a></li>
							<li><a href="#" class="msgSubmit">메시지 보내기</a></li>
							<li><a href="#">공유하기</a></li>
						</ul>
						</c:if>
						<c:if test="${loginedMemberId == article.memberId }">
						<ul class="setting-items">
							<li><a href="#" class="red">게시글 삭제</a></li>
							<li><a href="#" class="msgSubmit">게시글 수정</a></li>
						</ul>
						</c:if>
					</ul>
			</div>
			<div class="article-body">
				<p class="abody">${article.body}</p>
				<p class="tag">#${article.tag}</p>
				<p class="regDate">${article.regDateFormat}</p>
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

		<!--  메시지 팝업  -->
		<div class="popup">
			<h2>Meet In Direct</h2>
			<form class="con" action=""
				onsubmit="WriteMessage__submitForm(this); return false;">
				<input type="hidden" value="${loginedMemberId}" name="fromId">
				<input type="hidden" value="${member.id}" name="toId" />
				<table class="type1">
					<colgroup>
						<col style="width: 111px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th><label for="txt3">내용</label><em>(0/300 byte)</em></th>
							<td><textarea id="txt3" name="body"></textarea></td>
						</tr>
						<tr>
							<td><input type="submit" class="btn_type1" value="메시지 보내기" /></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="txt_center"></div>
			<a href="#a" class="close"><i class="fas fa-times"></i></a>
		</div>
		<div class="dim"></div>






		<script>
			
			var id = parseInt('${loginedMemberId}');
			var ReplyList__$box = $('.reply-list-box');
			var ReplyList__$tbody = ReplyList__$box.find('.reply-item');
			var ReplyList__lastLodedId = 0;

			// 6초댓글불러오기
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
						+ '"><div class="article-writer-Avatar-wrap"><img class="reply-img-Avatar" src="' + articleReply.extra.writerAvatarImgUrl + '">';
				html += '</div>';
				html += '</td>';

				html += '<td>';
				html += '</td>';

				html += '<td class="reply-writer">' + articleReply.extra.writer
						+ '</td></a>';						

				html += '<td>';
				html += '<div class="reply-body">' + articleReply.body +  '</div>';

				html += '<p class="replyRegDate">' + articleReply.regDateFormat + '</p>';

				if ( id == articleReply.memberId ){
				html += '<button class="delete-btn" type="button" onclick="ArticleReply__delete(this);">삭제</button>';
				}
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