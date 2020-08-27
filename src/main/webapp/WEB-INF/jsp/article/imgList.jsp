<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../part/head.jspf"%>

<script>
	// article.id를 어떻게줘여하나..

</script>


<script>
	function callDoLike(el) {
		var $li = $(el).closest('li');
		// 가장 가까운 li를 찾아라
		var id = parseInt($li.attr('data-id'));
		// 정수화 -> data-id
		
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

</script>


<style>
.articles-box {
	max-width: 1080px;
	margin: 0 auto;
	border: 1px solid #ccc;
	box-shadow: 3px 3px 3px #ccc;
}

@media ( min-width :901px ) {
	.articles-box>ul>li {
		margin-top: 20px;
		width: calc(100%/ 3 - ( 20px * ( 3 - 1)/3));
	}
	.articles-box>ul>li:not (:nth-child(3n) ) {
		
	}
}

.total-wrap {
	background: #fafafa;
	width: 100%;
	height: 100%;
}

.articles-box>ul {
	display: flex;
	flex-flow: row wrap;
	justify-content: center;
}

.other-articleImg {
	width: 300px;
	transition: all.3s;
}

.img-wrap:hover .good-item {
	opacity: 1;
}

.img-wrap:hover .fa-comment-dots {
	opacity: 1;
}

.img-wrap:hover .other-articleImg {
	opacity: 0.8;
}

.other-articleVideo {
	height: 300px;
}

.img-wrap {
	text-align: center;
	position: relative;
	transition: all.3s;
}

.board-bar {
	display: flex;
	justify-content: center;
	align-items: center;
}

.board {
	font-size: 1.5rem;
	padding: 15px;
	margin-top: 20px;
	border: 1px solid #eee;
	border-radius: 50%;
	margin: 20px;
	box-shadow: 0 10px 10px -12px rgba(0, 0, 0, 0.56), 0 4px 10px 0px
		rgba(0, 0, 0, 0.12), 0 8px 10px -5px rgba(0, 0, 0, 0.2);
}

.good-item {
	position: absolute;
	color: #d81b60;
	top: 10px;
	left: 40px;
	font-size: 25px;
	transition: all.3s;
	opacity: 0;
	cursor:pointer;
}

.fa-comment-dots {
	position: absolute;
	color: white;
	top: 10px;
	left: 100px;
	font-size: 25px;
	transition: all.3s;
	opacity: 0;
	cursor:pointer;
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
		<a class="board action" href="list"><i class="fas fa-image"></i></a> <a
			class="board" href="videoList"><i class="fas fa-video"></i></a> <a
			class="board" href="#"><i class="fas fa-quote-left"></i></a>
	</div>
	<div class="articles-box">
		<ul>
			<c:forEach items="${articles}" var="article">
				<c:if test="${article.extra.file__common__attachment['3'] != null}">
					<li data-id="${article.id}">
						<div class="img-wrap">
							<a class="cursor1" href="../article/detail?id=${article.id}"> <img
								class="other-articleImg"
								src="/file/showImg?id=${article.extra.file__common__attachment['3'].id}&updateDate=${article.extra.file__common__attachment['3'].updateDate}"
								alt="" /></a> <a onclick="callDoLike(this);"><i
								class="fas fa-heart good-item "></i></a> <i
								class="fas fa-comment-dots " ></i>
								<img src="#" alt="" usemap="#map" />
							<c:set var="articleReplyCount" value="0" />
							<c:forEach var="articleReply" items="${articleReply}">
								<c:if test="${articleReply.articleId == article.id}">
								</c:if>
							</c:forEach>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<map name="map">
<area shape="rect" coords="267,321,362,346" href="#" onclick="javascript:window.open('/article/detail','','width=900,height=900,scrollbars=yes,resizable=no');return false" onfocus='this.blur()'>
</map>
	<!--  
		<c:if test="${article.extra.file__common__attachment['1'] != null}">
		<li>
		<div class="img-wrap">
		<video controls class="other-articleVideo"
			src="/file/streamVideo?id=${article.extra.file__common__attachment['1'].id}&updateDate=${article.extra.file__common__attachment['1'].updateDate}">video
			not supported
		</video>
		</div>
		</li>
	</c:if>
	<c:if test="${article.extra.file__common__attachment['2'] != null}">
		<li>
		<div class="img-wrap">
		<video controls class="other-articleVideo"
			src="/file/streamVideo?id=${article.extra.file__common__attachment['2'].id}&updateDate=${article.extra.file__common__attachment['2'].updateDate}">video
			not supported
		</video>
		</div>
		</li>
	</c:if>
	 -->
	<!--  이미지  		<c:if test="${article.extra.file__common__attachment['3'] != null}">
		<li>
		<div class="img-wrap">
		<a href="../article/detail?id=${article.id}">
		<img class="other-articleImg"
			src="/file/showImg?id=${article.extra.file__common__attachment['3'].id}&updateDate=${article.extra.file__common__attachment['3'].updateDate}"
			alt="" /></a>
		</div>
		</li>
	</c:if>
	<c:if test="${article.extra.file__common__attachment['4'] != null}">
		<li>
		<div class="img-wrap">
		<a href="../article/detail?id=${article.id}">
		<img class="other-articleImg"
			src="/file/showImg?id=${article.extra.file__common__attachment['4'].id}&updateDate=${article.extra.file__common__attachment['4'].updateDate}" />
		</a>
		</div>
		</li>
	</c:if>
	 -->
</div>
<%@ include file="../part/foot.jspf"%>
