<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.19/lodash.min.js"></script>
<style>
h1 {
	text-align: center;
}
.total-wrap {
	background:#fafafa;
	width:100%;
	height:100%;
	padding-top:50px;
}
</style>

<script>
var MemberJoinForm__submitDone = false;
function MemberJoinForm__submit(form) {
	if ( MemberJoinForm__submitDone ) {
		alert('처리중입니다.');
		return;
	}

	form.email.value = form.email.value.trim();

	if (form.email.value.length == 0) {
		form.email.focus();
		alert('이메일을 입력해주세요.');
		return;
	}

	form.name.value = form.name.value.trim();

	if (form.name.value.length == 0) {
		form.name.focus();
		alert('이름을 입력해주세요.');
		return;
	}

	form.nickname.value = form.nickname.value.trim();

	if (form.nickname.value.length == 0) {
		form.nickname.focus();
		alert('활동명을 입력해주세요.');
		return;
	}

	form.loginPw.value = form.loginPw.value.trim();

	if (form.loginPw.value.length == 0) {
		form.loginPw.focus();
		alert('비밀번호를 입력해주세요.');
		return;
	}

	var maxSizeMb = 50;
	var maxSize = maxSizeMb * 1024 * 1024 //50MB


	if (form.file__member__0__common__attachment__1.value) {
		if ( form.file__member__0__common__attachment__1.files[0].size > maxSize ) {
			alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
			return;
		} 
	}

	var startUploadFiles = function(onSuccess) {
		if ( form.file__member__0__common__attachment__1.value.length == 0	) {
			onSuccess();
			return;
		}

		var fileUploadFormData = new FormData(form); 

		$.ajax({
			url : './../file/doUploadAjax',
			data : fileUploadFormData,
			processData : false,
			contentType : false,
			dataType:"json",
			type : 'POST',
			success : onSuccess
		});
	}

	form.loginPwReal.value = sha256(form.loginPw.value);
	form.loginPw.value = '';
	

	MemberJoinForm__submitDone = true;
	startUploadFiles(function(data) {
		var fileIdsStr = '';

		if ( data && data.body && data.body.fileIdsStr ) {
			fileIdsStr = data.body.fileIdsStr;
		}

		form.fileIdsStr.value = fileIdsStr;
		form.file__member__0__common__attachment__1.value = '';
		form.submit();

	});
}

function JoinForm__checkEmailDup(input) {
	
	var form = input.form;
	form.email.value = form.email.value.trim();

	if (form.email.value.length == 0) {
		return;
	}

	$.get('getEmailDup', {
		email : form.email.value
	}, function(data) {
		var $message = $(form.email).next();

		if (data.resultCode.substr(0, 2) == 'S-') {
			$message.empty().append(
					'<div style="color:green;">' + data.msg + '</div>');
			JoinForm__validEmail = data.email;
		} else {
			$message.empty().append(
					'<div style="color:red;">' + data.msg + '</div>');
			JoinForm__validEmail = '';
		}
	}, 'json');
}

function JoinForm__checkNicknameDup(input) {

	var form = input.form;
	
	form.nickname.value = form.nickname.value.trim();

	if (form.nickname.value.length == 0) {
		return;
	}
	$.get('getNicknameDup', {
		nickname : form.nickname.value
	}, function(data) {
		var $message = $(form.nickname).next();

		if (data.resultCode.substr(0, 2) == 'S-') {
			$message.empty().append(
					'<div style="color:green;">' + data.msg + '</div>');
			JoinForm__validNickname = data.nickname;
		} else {
			$message.empty().append(
					'<div style="color:red;">' + data.msg + '</div>');
			JoinForm__validNickname = '';
		}
	}, 'json');
}

var JoinForm__checkNicknameDup__debounce = _.debounce(JoinForm__checkNicknameDup, 1000);
var JoinForm__checkEmailDup__debounce = _.debounce(JoinForm__checkEmailDup, 1000);

</script>
<div class="total-wrap">
<div class="login-form-box">
	<form action="doJoin" methofd="POST" class="login-form"
		onsubmit="MemberJoinForm__submit(this); return false;">
		<input type="hidden" name="redirectUri" value="login" />
		<input type="hidden" name="fileIdsStr">
		<input type="hidden" name="loginPwReal" /> 
		<input type="file" class="login-input-box" placeholder="프로필" accept="image/*" name="file__member__0__common__attachment__1">
		<input onkeyup="JoinForm__checkEmailDup__debounce(this);" type="text" name="email" class="login-input-box" placeholder="이메일" /> 
		<div class="message-msg"></div>
		<input type="text" name="name" class="login-input-box" placeholder="성명" />
		<input onkeyup="JoinForm__checkNicknameDup__debounce(this);" type="text" name="nickname" class="login-input-box" placeholder="활동명" />
		<div class="message-msg"></div>
		<input type="password" name="loginPw" class="login-input-box"
			placeholder="비밀번호" /> <input type="submit" class="submit" value="Go" />
	</form>
</div>
</div>




	<%@ include file="../part/foot.jspf"%>