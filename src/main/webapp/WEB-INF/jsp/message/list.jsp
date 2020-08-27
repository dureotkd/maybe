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
</script>



<style>
.msg-con {
	max-width: 1080px;
	background: #fff;
	border: 1px solid #eee;
	display: flex;
	max-width: 1080px;
	border: 1px solid #eee;
	border-radius: 2px;
	box-shadow: 3px 3px 3px #ccc;
	align-items: center;
	justify-content: center;
	margin: 0 auto;
	margin-bottom: 50px;
}

.msg-box {
	display: flex;
	height: 500px;
	border-right: 1px solid #eee;
	flex-direction: column;
}

.msg-title {
	width: 350px;
	justify-content: space-between;
	display: flex;
	height: 50px;
	align-items: center;
	border-bottom: 1px solid #eee;
	padding: 15px;
	font-size: 1.2rem;
}

.total-wrap {
	background: #fafafa;
	width: 100%;
	height: 100%;
	padding-top: 50px;
}

.msg-send {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
}

.circle {
	width: 100px;
	height: 100px;
	border: 1px solid;
	border-radius: 50%;
	position: relative;
}

.msgSubmit {
	color: white;
	border: none;
	outline: none;
	background: #0095f6;
	padding: 10px;
	cursor: pointer;
	display: flex;
	justify-content: center;
	width: 100px;
}

.msg-text {
	display: flex;
	flex-direction: column;
	margin-top: 10px;
	align-items: center;
	justify-content: center;
}

.msg-text>p {
	font-size: 2rem;
}

.msg-text>span {
	color: #bdbdbd;
	margin-bottom: 30px;
}

.fa-paper-plane {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 2rem;
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

.message-list-box {s
	height: 100%;
	overflow: scroll;
}

.data {
	vertical-align: middle;
	padding-bottom: 23px;
	padding-top:23px;
	padding-left:15px;
	height: 60px;
	align-items:center;
	transition:all.4s;
	cursor:pointer;
}

.data:hover {
	background:#eee;
}

.-writer {
	width: 20%;
}

.-avatar {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right:15px;
}
.message-item {
	display:flex;
	flex-direction:column;
}

.message-list-box::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera*/
}

.skip:focus {
	top: 0;
}
.-body {
	margin-left:15px;
}
.info-con {
	width:50px;
}
</style>
<div class="total-wrap">
	<div class="msg-con">
		<div class="msg-box">
			<div class="msg-title">
				<i class="fas fa-ellipsis-h"></i>
				<p>Direct</p>
				<i class="far fa-edit"></i>
			</div>

			<div class="table-box message-list-box">
				<div class="message-item"></div>

			</div>

			<script>
				var loginedMemberId = parseInt('${loginedMemberId}');
			</script>

			<script>
				var MessageList__$box = $('.message-list-box');
				var MessageList__$tbody = MessageList__$box
						.find('.message-item');
				var MessageList__lastLodedId = 0;

				// 1초 메시지 불러오기
				MessageList__loadMoreInterval = 1 * 1000

				function MessageList__loadMoreCallback(data) {
					if (data.body.messages && data.body.messages.length > 0) {
						MessageList__lastLodedId = data.body.messages[data.body.messages.length - 1].id;
						MessageList__drawMessages(data.body.messages);

					}

					setTimeout(MessageList__loadMore,
							MessageList__loadMoreInterval);
				}

				function MessageList__loadMore() {

					$.get('../message/getForPrintMessagesAjax', {
						// 일단 냅둬보자.
						toId : loginedMemberId,
						from : MessageList__lastLodedId + 1
					}, MessageList__loadMoreCallback, 'json');
				}

				function MessageList__drawMessages(messages) {
					for (var i = 0; i < messages.length; i++) {
						var message = messages[i];
						MessageList__drawMessage(message);
					}
				}

				function MessageList__drawMessage(message) {
					var html = '';
					html += '<tr class="data" data-id="' + message.id + '">';
					//	html += '<td>' + articleReply.id + '</td>';
					//	html += '<td>' + articleReply.regDate + '</td>';

					html += '<td class="info-con">';
					// 회원가입시 
					html += '<a href="#" class="message-open"><img class="-avatar" src="' + message.extra.writerAvatarImgUrl + '"></a>';
					html += '</td>';

					html += '<td class="-writer">' + message.extra.writer
							+ '</td>';

					html += '<td>';
					html += '<div class="-body">' + message.body + '</div>';
					//	html += '<button type="button" onclick="ReplyList__delete(this);">삭제</button>';

					//	html += '<button type="button" onclick="ReplyList__showModifyFormModal(this);">수정</button>';
					html += '</td>';
					html += '</tr>';
					var $tr = $(html);
					MessageList__$tbody.prepend($tr);
				}

				MessageList__loadMore();
			</script>


		</div>
		<div class="msg-send">
		<!--  -->
			<div class="circle">
				<i class="far fa-paper-plane"></i>
			</div>
					<div class="msg-text">
						<p>내 메시지</p>
						<span>친구나 그룹에 메시지를 보내보세요.</span> <a href="#" class="msgSubmit">메시지
							보내기</a>
					</div>

		</div>
	</div>


	<div class="popup">
		<h2>Meet In Direct</h2>
		<form class="con" action=""
			onsubmit="WriteMessage__submitForm(this); return false;">
			<input type="hidden" value="${loginedMemberId}" name="fromId">
			<table class="type1">
				<colgroup>
					<col style="width: 111px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th><label for="txt2">받는사람</label><span>*<em
								class="hide">필수입력</em></span></th>
						<td><input type="text" id="txt2" placeholder="" value="1"
							name="toId"></td>
					</tr>
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
</div>
<%@ include file="../part/foot.jspf"%>
