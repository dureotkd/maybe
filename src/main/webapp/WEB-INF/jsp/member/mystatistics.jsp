<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<script>
// 정수화 -> data-id
var followerId = parseInt('${loginedMemberId}');
</script>

<script>
function doFollow(el) {
	var $ul = $(el).closest('ul');
	var followId = parseInt($ul.attr('data-id'));
	alert(followId);
	
	$.post('../member/doActionFollow', {
		followId : followId,
		followerId : followerId
	}, 'json');
	location.reload();
}

function doDeleteFollow(el) {
	if (confirm("팔로우를 취소하시겠습니까 ?") == true) {

		var $ul = $(el).closest('ul');
		var followerId = parseInt($ul.attr('data-id'));
		var followId = parseInt('${loginedMemberId}');
		
		$.post('../member/doDeleteFollow', {
			followId : followId,
			followerId : followerId
		}, function(data) {
			if (data.msg) {
				alert(data.msg);
			}

		}, 'json');
	} else {
		return;
	}

	location.reload();
}

</script>

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
.border100 {
	width:100px;
	height:100px;
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
.margin25 {
	margin:25px;
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

.border-radius5px {
	border-radius:5px;
}

.padding25 {
	padding:25px;
}
.articlestatBox {
	background:#ede7f6;
}
.greenC {
	background:#8bc34a;
}
.king-box {
	display:flex;
}
.width400 {
	width:400px;
	height:400px;
	box-sizing:border-box;
	text-align:center;
}
.kingborder {
	border:1px solid #eee;
}
.yellow  {
	background:#ffb300;
	margin:0px auto;
	margin-top:60px;
}
.fa-crown {
	font-size:1.8rem;
}
.column {
	display:flex;
	flex-direction:column;
}
.row {
	display:flex;
	align-items:center;
	margin-bottom:20px;
}
.img-hidden {
	border-radius:50%;
	width:50px;
	height:50px;
	overflow:hidden;
}
.oldMemberProfile {
	object-fit:cover;
	width:100%;
	height:100%;
}
.width50{
	width:50%;
}
.justi-sb {
	justify-content:space-between;
}
.oldfont {
	margin-bottom:15px;
	font-size:1.3rem;
}
.direct {
	width: 30px;
	border-radius: 50%;
	cursor: pointer;
}

.follow-btn {
	background: none;
	border: none;
	color: #0d47a1;
	cursor: pointer;
}
.nick {
	width:150px;
	margin-left:15px;
}

</style>

<div class="total-wrap">
<div class="write-wrap">
	
	<div class="user-box">
	<h2>Hello ${member.nickname}!</h2>
	<p>DashBoard</p>
	</div>
	
	<div class="row-box">
	
	<ul class="likeBox statBox border-radius5px">
		<li class="border50 redB"><i class="fas fa-heart icons"></i></li>
		<li class="font04"> ${totalLikeCount}</li>
		<li class="silver">전체 좋아요 +</li>
	</ul>
	
	<ul class="replyBox statBox border-radius5px">
		<li class="border50 greenB"><i class="fas fa-comment-dots icons"></i></li>
		<li class="font04">${totalReplyCount}</li>
		<li class="silver">전체 댓글 +</li>
	</ul>
	
	<ul class="beforeFollowBox statBox border-radius5px">
		<li class="border50"><i class="fas fa-user icons"></i><i class="fas fa-plus icons2"></i></li>
		<li class="font04">${beforeFollowCount}</li>
		<li class="silver">이전 게시글 후  팔로우 +</li>
	</ul>
	
	
	<ul class="articlestatBox statBox border-radius5px">
		<li class="border50 greenC"><i class="fas fa-sticky-note icons"></i><i class="fas fa-plus icons2"></i></li>
		<li class="font04">${articleCountBeforeDay}</li>
		<li class="silver">오늘 게시글 +</li>
	</ul>
	
	<ul class="articlestatBox statBox border-radius5px">
		<li class="border50 greenC"><i class="fas fa-sticky-note icons"></i><i class="fas fa-plus icons2"></i></li>
		<li class="font04">${articleCountBeforeWeek}</li>
		<li class="silver">이번주 게시글 +</li>
	</ul>
	
	<ul class="articlestatBox statBox border-radius5px">
		<li class="border50 greenC"><i class="fas fa-sticky-note icons"></i><i class="fas fa-plus icons2"></i></li>
		<li class="font04 ">${articleCountBeforeMonth}</li>
		<li class="silver">이번달 게시글 +</li>
	</ul>	
	
	
	</div>
	
	<div class="king-box">
	<ul class="margin25">
		<c:forEach items="${articles}" var="article">
		<div class="img-box">
		<img class="kingImg border-radius5px"   src="/file/showImg?id=${article.extra.file__common__attachment['3'].id}&updateDate=${article.extra.file__common__attachment['3'].updateDate}" alt="" />
		</div>	
		</c:forEach>
	</ul>
	
	<ul class="margin25 width400 kingborder border-radius5px">
		<li class="border100 yellow"><i class="fas fa-crown icons"></i></li>
		<li><p class="point padding25 font04">${articleLike.point}</p></li>
		<li><p class="kingtitle padding25 silver">가장 좋아요를 많이 받은 사진 +</p></li>
	</ul>
	</div>
	
	<div class="old-box">
	<ul class="margin25 column width50">
		<li class="silver oldfont">가장 오래된 팔로우</li>
		<c:forEach items="${friends}" var="oldFriend">
		<c:if test="${oldFriend.followerId != loginedMemberId }">
		<a href="../member/showOther?id=${oldFriend.followerId}" class="link row">
		<ul class="row justi-sb" data-id="${oldFriend.id}">
		<li class="img-hidden"><img class="oldMemberProfile" src="${oldFriend.extra.writerAvatarImgUrl}" alt="" /></li>
		<li class="nick">${oldFriend.extra.writer}</li>
		<li>${oldFriend.regDateFormat}</li>
		</a>
		</ul>
		</c:if>
		</c:forEach>
	
	</ul>
	
	</div>
	
</div>
</div>
<%@ include file="../part/foot.jspf"%>

