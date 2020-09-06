<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>


<style>

.total-wrap {
	width:100%;
	height:100vh;
	background:#fafafa;
	padding-top:50px;
	over-flow:hidden;
}
.write-wrap {
	display:flex;
	flex-direction:column;
	max-width:940px;
	outline:none;
	background:#fff;
	margin:100px auto;
	box-sizing:border-box;
	box-shadow:rgba(0, 0, 0, 0.1) 0px 1px 20px 0px;
}
.statBox {
	width:230px;
	height:130px;
	display:flex;
	flex-direction:column;
	margin-bottom:20px;
	justify-content:center;
	padding:25px;
	margin-right:20px;
}
.beforeFollowBox {
  	background:#eef5ff;
}
.replyBox {
	background:#b9f6ca;
}
.likeBox {
	background:#fff3e0;
}
.border50 {
	width:50px;
	height:50px;
	border-radius:50%;
	background:#3f50f6;
	position:relative;
}
.icons{
	position:absolute;
	transform:translate(-50%,-50%);
	left:50%;
	top:50%;
	color:#fff;
}
.icons2 {
	position:absolute;
	color:#fff;
	top:20%;
	left:60%;
	font-size:8px;
}
.silver {
	color:#8392a5;
	font-size:15px;
}
.font04 {
	color:#3e5569;
	font-size:1.8rem;
	margin-top:8px;
}
.redB {
	background:#ff3ca6;
}
.greenB {
	background:#02cccd;
}
.row-box {
	display:flex;
	justify-content:center;
	flex-wrap:wrap;
}
.user-box {
	padding:25px;
}
.user-box > p {
	color:#bdbdbd;
	font-size:15px;
}
.padding25 {
	padding:25px;
}
.img-box {
	overflow:hidden;
	width:400px;
	height:400px;
}
.kingImg {
	width:100%;
	height:100%;
	object-fit:cover;
}
.kingtitle {
	padding-bottom:25px;
}
.articlestatBox {
	background:#ede7f6;
}
.greenC {
	background:#8bc34a;
}
</style>

<div class="total-wrap">
<div class="write-wrap">
	
	<div class="user-box">
	<h2>Hello ${member.nickname}!</h2>
	<p>DashBoard</p>
	</div>
	
	<div class="row-box">
	
	<ul class="likeBox statBox">
		<li class="border50 redB"><i class="fas fa-heart icons"></i></li>
		<li class="font04"> ${totalLikeCount}</li>
		<li class="silver">전체 좋아요 +</li>
	</ul>
	
	<ul class="replyBox statBox">
		<li class="border50 greenB"><i class="fas fa-comment-dots icons"></i></li>
		<li class="font04">${totalReplyCount}</li>
		<li class="silver">전체 댓글 +</li>
	</ul>
	
	<ul class="beforeFollowBox statBox">
		<li class="border50"><i class="fas fa-user icons"></i><i class="fas fa-plus icons2"></i></li>
		<li class="font04">${beforeFollowCount}</li>
		<li class="silver">이전 게시글 후  팔로우 +</li>
	</ul>
	
	
	<ul class="articlestatBox statBox">
		<li class="border50 greenC"><i class="fas fa-sticky-note icons"></i><i class="fas fa-plus icons2"></i></li>
		<li class="font04">${articleCountBeforeDay}</li>
		<li class="silver">오늘 게시글 +</li>
	</ul>
	
	<ul class="articlestatBox statBox">
		<li class="border50 greenC"><i class="fas fa-sticky-note icons"></i><i class="fas fa-plus icons2"></i></li>
		<li class="font04">${articleCountBeforeWeek}</li>
		<li class="silver">이번주 게시글 +</li>
	</ul>
	
	<ul class="articlestatBox statBox">
		<li class="border50 greenC"><i class="fas fa-sticky-note icons"></i><i class="fas fa-plus icons2"></i></li>
		<li class="font04 ">${articleCountBeforeMonth}</li>
		<li class="silver">이번달 게시글 +</li>
	</ul>	
	
	
	</div>
	
	<ul class="padding25">
		<c:forEach items="${articles}" var="article">
		<p class="kingtitle">가장 좋아요를 많이 받은 게시글 ${articleLike.point}</p>
		<div class="img-box">
		<img class="kingImg" src="/file/showImg?id=${article.extra.file__common__attachment['3'].id}&updateDate=${article.extra.file__common__attachment['3'].updateDate}" alt="" />
		</div>	
		</c:forEach>
		
	</ul>
</div>
</div>
<%@ include file="../part/foot.jspf"%>

