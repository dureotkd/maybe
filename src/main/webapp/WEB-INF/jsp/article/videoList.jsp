<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../part/head.jspf"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="../resource/css/" />
<script>
	function callDoLike(el) {
		var $li = $(el).closest('li');

		var id = parseInt($li.attr('data-id'));

		$.post('./doLike',{
			id : id
		}, function(data){
			if (data.msg){
				alert(data.msg);
				}
			

		if (data.resultCode.substr(0, 2) == "S-" ){
				ViewArticle1__updateLikePoint(data.likePoint);
				}
			}, 'json');
		}




	function btnToggleVideo__init(){
		var $btnToggleVideo = $('.video');

		$btnToggleVideo.hover(function() {
			if ($(this).hasClass('autoplay')){
			} else {
				$(this).addClass('autoplay');
				}
		});
	}

	$(function() {
		btnToggleVideo__init();
	});
		

	
</script>

<style>
  video[controls]::-webkit-media-controls-panel {
        display:flex!important;
        opacity:1!important;
    }
.articles-box {
	max-width: 940px;
	margin:0 auto;
	border:1px solid #ccc;
	box-shadow:3px 3px 3px #ccc;
}

.fa-compass {
	color:#484848;
}

@media ( min-width:901px ) {
  .articles-box > ul > li {
    margin-top:20px;
    width:calc(100% / 2 - (20px * (2 - 1) / 2));
  }
  
  .total-wrap {
		height:100vh;
	}
}

@media ( max-width:900px ){
	.total-wrap {
	height:100%;
	}
}




.total-wrap {
	background:#fafafa;
	width:100%;
}

.articles-box > ul {
	display:flex;
	flex-flow:row wrap;
	justify-content:center;
}
.other-articleImg {
	transition:all.3s;
}
.img-wrap:hover .good-item{
	opacity:1;
}
.img-wrap:hover .fa-comment-dots{
	opacity:1;
}
.img-wrap:hover .other-articleImg{
	opacity:0.8;
}

.other-articleVideo{
	height:300px;
}
.img-wrap {
	text-align:center;
	position:relative;
	transition:all.3s;
}

.board-bar {
	display:flex;
	justify-content:center;
	align-items:center;
	margin-top:60px;
}
.board {
	font-size:1.5rem;
	padding:15px;
	margin-top:20px;
	border:1px solid #eee;
	border-radius:50%;
	margin:20px;
	box-shadow:
	0 10px 10px -12px rgba(0, 0, 0, 0.56), 0 4px 10px 0px rgba(0, 0, 0, 0.12), 0 8px 10px -5px rgba(0, 0, 0, 0.2);
	
}
.good-item {
	position:absolute;
	color:#d81b60;
	top:10px;
	left:40px;
	font-size:25px;
	transition:all.3s;
	opacity:0;
	cursor:pointer;
}
.fa-comment-dots {
	position:absolute;
	color:white;
	top:10px;
	left:100px;
	font-size:25px;
	transition:all.3s;
	opacity:0;
	cursor:pointer;
}
.video {
	width:450px;
	outline:none;
}
.action {
	color:#d81b60;
}
.cursor1 {
	cursor:zoom-in;
}
</style>
<div class="total-wrap">
	<div class="board-bar">
	<a class="board" href="imgList"><i class="fas fa-image"></i></a>
	<a class="board action " href="videoList"><i class="fas fa-video"></i></a>
	<a class="board" href="#"><i class="fas fa-quote-left"></i></a>
	</div>
<div class="articles-box">
	<ul>
	<c:forEach items="${articles}" var="article">
		<c:if test="${article.extra.file__common__attachment['1'] != null}">
		<li data-id="${article.id}">
		<div class="img-wrap">
		<a class="cursor1"  href="../article/detail?id=${article.id}">
		<video class="video"  controls
				src="/file/streamVideo?id=${article.extra.file__common__attachment['1'].id}&updateDate=${article.extra.file__common__attachment['1'].updateDate}"></video>
		</a>
		<a onclick="callDoLike(this);">
		<i class="fas fa-heart good-item "></i>
		</a>
		<i class="fas fa-comment-dots"></i>
		</div>
		</li>
		<!--<c:set var="articleReplyCount" value="0"/>
		<c:forEach var="articleReply" items="${articleReply}" >
		<c:if test="${articleReply.articleId == article.id}">	
		</c:if>
		</c:forEach>
		</div>
		</li> !-->
	</c:if>
	</c:forEach>
	</ul>
	</div>


</div>
<%@ include file="../part/foot.jspf"%>
