<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>


<script>
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
			body : form.body.value,
			redirectUri : form.redirectUri.value
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
</script>





<style>
.other-show-box {
	display: flex;
	margin: 50px auto;
	max-width: 1080px;
	justify-content: space-between;
	align-items: center;
}

.other-text-box {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	margin-left: 50px;
	width: 400px;
}

.other-follow-box {
	display: flex;
}

.other-img {
	width: 200px;
	height: 200px;
	border-radius: 50%;
}

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
	.articles-box
	>
	ul
	>
	li
	:not
	 
	(
	:nth-child(3n)
	 
	)
	{
	margin-right
	:
	 
	20
	px
	;
	
	
}

}
.articles-box>ul {
	display: flex;
	flex-flow: row wrap;
	justify-content: center;
}

.other-articleImg {
	width: 300px;
	height: 300px;
}

.other-articleVideo {
	width: 300px;
	height: 300px;
}

.img-wrap {
	text-align: center;
	display: flex;
	flex-direction: column;
}

.img-wrap2 {
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: center;
	height: 500px;
}

.other-nick {
	font-size: 1.5rem;
}

.other-img-box {
	display: flex;
}

.other-followBox {
	display: flex;
	justify-content: space-between;
}

.other-followBox>span {
	padding-top: 10px;
}

.other-info-box {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.level10 {
	color: #ffb300;
}

.level5 {
	color: #3949ab;
}

.submit-item, .msgSubmit {
	padding: 10px;
	background: #0095f6;
	border: none;
	cursor: pointer;
	color: white;
}

.other-recomend-box {
	display: flex;
	height: 200px;
	width: 300px;
	justify-content: space-around;
	align-items: center;
	flex-direction: column;
}

.other-recomend-box>p {
	padding: 10px;
}

html, body {
	width: 100%;
}

html {
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

body {
	width: 100%;
	background: #fff;
	min-width: 320px;
	-webkit-text-size-adjust: none;
	word-wrap: break-word;
	word-break: break-all;
}

ul, ol, li {
	list-style: none;
}

table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

img, fieldset {
	border: 0;
}

address, caption, cite, code, em {
	font-style: normal;
	font-weight: normal;
}

label, img, input, select, textarea, button {
	vertical-align: middle;
}

caption, legend {
	line-height: 0;
	font-size: 1px;
	overflow: hidden;
}

hr {
	display: none;
}

main, header, section, nav, footer, aside, article, figure {
	display: block;
}

a {
	color: #000;
	text-decoration: none;
}

* {
	outline: 0 !important;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0) !important;
	tap-highlight-color: rgba(0, 0, 0, 0) !important;
}

a:link, a:hover, a:active {
	text-decoration: none;
}

footer {
	text-align: center;
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

.empty-img {
	font-size: 4rem;
}

.img-wrap2>p {
	font-size: 1.5rem;
}

.img-wrap2>span {
	color: #bdbdbd;
}
</style>


<nav class="other-show-box">
	<div class="other-img-box">
		<img class="other-img" src="${member.extra.writerAvatarImgUrl}" alt="" />
		<div class="other-text-box">
			<div class="other-info-box">
				<div class="other-nick">${member.nickname}</div>
				<c:if test="${member.level == 10 }">
					<i class="fas fa-crown level10"></i>
				</c:if>
				<c:if test="${member.level == 5 }">
					<i class="fas fa-certificate level5"></i>
				</c:if>
				<c:if test="${member.level < 5 }">
					<i class="fas fa-user-alt level"></i>
				</c:if>

				<c:if test="${loginedMemberId != member.id }">
					<a href="#" class="msgSubmit">메시지 보내기</a>

					<input type="submit" value="팔로우" class="submit-item" />
				</c:if>

				<i class="fas fa-ellipsis-h"></i>

			</div>
			<div class="other-followBox">
				<span class="article-count">게시글 ${articleCount}</span> <span
					class="">팔로우 2</span> <span> 팔로워 2</span>
			</div>
			<div class="other-introduce">
				<p>${member.introduce}</p>
			</div>
		</div>
	</div>


	<div class="other-recomend-box">
		<h3>The Weeknd - I Fell it Coming</h3>
		<audio controls autoplay loop>
			<source src="dancing.mp3" type="audio/mp3" />
		</audio>
	</div>

</nav>

<!--  메시지 팝업  -->
<div class="popup">
	<h2>Meet In Direct</h2>
	<form class="con" action=""
		onsubmit="WriteMessage__submitForm(this); return false;">
		<input type="hidden" value="${loginedMemberId}" name="fromId">
		<input type="hidden" value="${member.id}" name="toId" />
		<input type="hidden" value="../message/list" name="redirectUri" />
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



<div class="articles-box">
	<ul>
		<c:forEach items="${articles}" var="article">
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
			<!--  이미지  	 -->
			<c:if test="${article.extra.file__common__attachment['3'] != null}">
				<li>
					<div class="img-wrap">
						<a href="../article/detail?id=${article.id}"> <img
							class="other-articleImg"
							src="/file/showImg?id=${article.extra.file__common__attachment['3'].id}&updateDate=${article.extra.file__common__attachment['3'].updateDate}"
							alt="" /></a>
					</div>
				</li>
			</c:if>
		</c:forEach>

		<!-- 	<c:if test="${article.extra.file__common__attachment['3'] == null }">
			<li>
				<div class="img-wrap2">
				<a href="../article/register" class="empty-img"><i class="fas fa-camera-retro"></i></a>
				<p>소중한 순간을 공유해보세요.</p>
				<span>${member.nickname}님의 첫 사진을 기다리고 있습니다.</span>
				</div>
				</li>
			</c:if>
			 -->
	</ul>
</div>





<%@ include file="../part/foot.jspf"%>