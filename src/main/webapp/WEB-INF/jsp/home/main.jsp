<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<script>
	var followId = parseInt('${article.memberId}');
	var followerId = parseInt('${loginedMemberId}');

	alert(data-id);
</script>


<script>
$(document).ready(function() {
	$(".direct").on('click', function() {
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


function doDeleteFollow(el) {
	if ( confirm ("팔로우를 취소하시겠습니까 ?") == true ){
	var $div = $(el).closest('.articles-item');
	// 가장 가까운 li를 찾아라
	var followId = parseInt($div.attr('data-id'));
	// 정수화 -> data-id
	
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
}

$(document).ready(function() {
	$('.slider').bxSlider({
		mode : 'fade'
	});
});

</script>

<style>
.fa-home {
	color:#484848;
}


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
.total-box {
	display: flex;
	max-width: 940px;
	align-items: center;
	justify-content: center;
	margin: 100px auto;
}
.article-img {
	width:300px;
}

.articles-box {
	width:100%;
}
.article-img {
	object-fit:cover;
	width:100%;
	height:100%;
}
.article-writer-Avatar {
	width:100%;
	height:100%;
	object-fit:cover;
}
.article-info-box {
	display:flex;
	justify-content:space-between;
	align-items:center;
	padding:15px;
}
.writer-wrap{
	width:50px;
	height:50px;
	border-radius:50%;
	overflow:hidden;
}
.article-info-wrap {
	display:flex;
	flex-direction:column;
}
.writer-center > span {
	margin-left:15px;
}
.writer-center {
	display:flex;
	align-items:center;
}
.article-body-box {
	padding:20px;
	overflow:scroll;
	height:200px;
}
.article-body-box::-webkit-scrollbar {
	display:none;
}

.article-body {
	line-height:25px;
}
.article-sub {
	font-size:24px;
	padding:20px;
}
.like {
	color:#d81b60;
}
.gogo {
	padding: 20px;
    text-align: center;
    border: 1px solid #d81b60;
    width: 200px;
    height: 20px;
    display: flex;
    /* text-align: center; */
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    color: #d81b60;
}
.direct {
	width:30px;
	border-radius:50%;
	cursor:pointer;
}

@media ( max-width:800px ){
	.articles-item {
		display:flex;
		flex-direction:column;
		border-radius:10px;
		align-items:center;
		width:100%;
		margin-bottom:50px;
	}
	.article-info-wrap {
		width:100%;
		height:300px;
	}
	.article-img-box {
	height:400px;
	overflow:hidden;
	}
}

@media ( min-width:801px ){
	.articles-item {
	display:flex;
	border-radius: 10px;
	box-shadow:rgba(0, 0, 0, 0.1) 0px 1px 20px 0px;
	align-items: center;
	width: 100%;
	margin-bottom:50px;
	}
	
	.article-info-wrap {
		width:50%;
		height:500px;
	}
	
	.article-img-box {
	width:500px;
	height:500px;
	overflow:hidden;
	}
}
</style>

<nav class="total-box">
	<div class="articles-box">
		<c:forEach items="${articles}" var="article">
			<div class="articles-item" data-id="${article.memberId}">
				<div class="article-img-box">
					<img class="article-img"
						src="/file/showImg?id=${article.extra.file__common__attachment['3'].id}&updateDate=${article.extra.file__common__attachment['3'].updateDate}"
						alt="" />
				</div>
				<nav class="article-info-wrap">
				<div class="article-info-box">
				<a href="../member/showOther?id=${article.memberId}"
					class="writer-center">
					<div class="writer-wrap">
						<img class="article-writer-Avatar"
							src="${article.extra.writerAvatarImgUrl}">
							</div>
						<span>${article.extra.writer}</span>
				</a>
				<a href="#" onclick="doDeleteFollow(this);" >언팔로우</a>
				<img class="direct" src="https://i.pinimg.com/originals/7b/66/ac/7b66ac2787335ebcb565960d482f0846.png" alt="" />
				<ul class="setting-box">
					<li><i class="fas fa-ellipsis-h"></i></li>
					<ul class="setting-items">
						<li><a href="#" class="red">사용자 차단</a></li>
						<li><a href="../article/detail?id=${article.id}" class="msgSubmit">게시물로 이동하기</a></li>
						<li><a href="#">공유하기</a></li>
					</ul>
				</ul>
				</div>
				<div class="article-body-box">
				<p class="article-body">${article.body}</p>
				</div>
				
				<div class="article-sub">
				<i class="fas fa-heart like"></i>	
				<i class="far fa-comment-dots"></i>
				</div>
				</nav>
			</div>
		</c:forEach>
	</div>
</nav>


<!--  메시지 팝업  -->
<div class="popup">
	<h2>Meet In Direct</h2>
	<form class="con" action=""
		onsubmit="WriteMessage__submitForm(this); return false;">
		<input type="hidden" value="${loginedMemberId}" name="fromId">
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

<%@ include file="../part/foot.jspf"%>